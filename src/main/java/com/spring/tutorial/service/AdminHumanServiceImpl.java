package com.spring.tutorial.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.tutorial.dao.AdminHumanDAOImpl;
import com.spring.tutorial.dto.CommonDTO;
import com.spring.tutorial.dto.DepartDTO;
import com.spring.tutorial.dto.PersonnelDTO;
import com.spring.tutorial.dto.TeamDTO;

@Service
public class AdminHumanServiceImpl implements AdminHumanService{
	
	@Autowired
	AdminHumanDAOImpl dao;
	
	//관리자 전체 정보 
	@Override
	public void memberInfoAction(HttpServletRequest req, Model model) {
		System.out.println("관리자 서비스 -> memberInfoAction");
		
		List<CommonDTO> list = dao.membersInfo();
		List<TeamDTO> list2 = dao.teamSelectbyDepart();
		model.addAttribute("list2", list2);
		model.addAttribute("list", list);
		
	}

	//개인정보 상세페이지
	@Override
	public void usersDetailAction(HttpServletRequest req, Model model) {
		System.out.println("관리자서비스 -> 개인정보 상세페이지");
		
		String id = (String)req.getParameter("id");
		System.out.println(id);
		CommonDTO dto = dao.usersDetail(id);
		
		model.addAttribute("dto", dto);
	}

	//개인정보 수정
	@Override
	public void usersUpdateAction(HttpServletRequest req, Model model) {
		System.out.println("관리자 서비스 -> 개인정보 수정");
		
		
		CommonDTO dto = new CommonDTO();
		dto.setId(req.getParameter("id"));
		dto.setPwd(req.getParameter("pwd"));
		dto.setRepwd(req.getParameter("repwd"));
		dto.setName(req.getParameter("name"));
		dto.setEng_name(req.getParameter("eng_name"));
		dto.setJumin1(req.getParameter("jumin1"));
		dto.setJumin2(req.getParameter("jumin2"));
		dto.setContract(req.getParameter("contract"));
		dto.setHireday(Date.valueOf(req.getParameter("hireday")));
		dto.setEtc(req.getParameter("etc"));
		
		//내부 이메일 
		String email_in1 = req.getParameter("email_in1");
		String email_in2 = req.getParameter("email_in2");
		String email_in = email_in1 + "@" + email_in2 ;
		dto.setEmail_in(email_in);
		dto.setAddress(req.getParameter("address"));
		dto.setGender(req.getParameter("gender"));
		dto.setMarry(req.getParameter("marry"));
		dto.setFrgn(req.getParameter("frgn"));
		dto.setNation(req.getParameter("nation"));
		
		//휴대폰
		String tel = "";
		String tel1 = req.getParameter("tel1");
		String tel2 = req.getParameter("tel2");
		String tel3 = req.getParameter("tel3");
		System.out.println(tel1 + tel2 + tel3);
		if(!tel1.equals("") && !tel2.equals("") && !tel3.equals("")) {
			tel = tel1 + "-" + tel2 + "-" + tel3; // 010-1111-2222
		}
		dto.setTel(tel);
		
		//회사 내선번호
		String in_tel = "";
		String in_tel1 = req.getParameter("in_tel1");
		String in_tel2 = req.getParameter("in_tel2");
		String in_tel3 = req.getParameter("in_tel3");
		System.out.println(in_tel1 + in_tel2 + in_tel3);
		if(!in_tel1.equals("") && !in_tel2.equals("") && !in_tel3.equals("")) {
			in_tel = in_tel1 + "-" + in_tel3 + "-" + in_tel3; // 010-1111-2222
		}
		dto.setIn_tel(in_tel);
		
		//외부 이메일
		String email_out1 = req.getParameter("email_out1");
		String email_out2= req.getParameter("email_out2");
		String email_out = email_out1 + "@" + email_out2 ;
		dto.setEmail_out(email_out);
		dto.setDepart_name(req.getParameter("depart_name"));
		dto.setRank(req.getParameter("rank"));
		
		System.out.println("dto : " + dto);
		int updateCnt = dao.usersUpdate(dto);
		
		model.addAttribute("updateCnt", updateCnt);
		
	}

	//개인정보 삭제
	@Override
	public void usersDeleteAction(HttpServletRequest req, HttpServletResponse res ,Model model) {
		System.out.println("관리자 서비스 -> usersDeleteAction");
		
		String id = req.getParameter("id");
		
		 int deleteCnt = dao.usersDelete(id);
		 
		 model.addAttribute("deleteCnt", deleteCnt);
	}

	//전체부서명
	@Override
	public void departsAction(HttpServletRequest req, Model model) {
		System.out.println("관리자서비스 -> 전체부서명");
		List<DepartDTO> list = dao.departsInfo();
		List<TeamDTO> teamlist= dao.teamSelectbyDepart();
		model.addAttribute("list", list);
		model.addAttribute("teamlist", teamlist);
		
	}

	//부서 삭제
	@Override
	public void departUpdateAction(HttpServletRequest req, HttpServletResponse res, Model model) {
		System.out.println("관리자 서비스 -> 부서삭제 ");
		
		String depart_name = req.getParameter("depart_name");
		
		int d_deleteCnt=  dao.departUpdate(depart_name);
		
		model.addAttribute("d_deleteCnt", d_deleteCnt);
	}

	//부서가입처리
	@Override
	public void departInsertAction(HttpServletRequest req, Model model) {
		System.out.println("관리자 서비스 -> 부서가입처리");
		
		DepartDTO dto = new DepartDTO();
		dto.setDepart_name(req.getParameter("depart_name"));
		dto.setCompany_id(Integer.parseInt(req.getParameter("company_id")));
		dto.setShow(req.getParameter("show"));
		
		int insertCnt = dao.deaprtInsert(dto);
		
		model.addAttribute("insertCnt", insertCnt);
		
	}

	//팀 생성
	@Override
	public void teamInsertAction(HttpServletRequest req, Model model) {
		System.out.println("관리자 서비스 -> 팀생성");
		
		TeamDTO dto = new TeamDTO();
		dto.setTeam_name(req.getParameter("team_name"));
		dto.setAp_day(Date.valueOf(req.getParameter("ap_day")));
		dto.setDepart_name(req.getParameter("depart_name"));
		dto.setContents(req.getParameter("contents"));
		
		int t_insertCnt = dao.teamInsert(dto);
		
		model.addAttribute("t_insertCnt", t_insertCnt);
		
	}


	//팀 배정
	@Override
	public void teamUpdateAction(HttpServletRequest req, Model model) {
		System.out.println("관리자서비스 -> 팀배정");
		TeamDTO dto = new TeamDTO();
		dto.setTeam_name(req.getParameter("team_name"));
		dto.setAp_day(Date.valueOf(req.getParameter("ap_day")));
		dto.setDepart_name(req.getParameter("depart_name"));
		dto.setContents(req.getParameter("contents"));
		dto.setId(req.getParameter("id"));
		
		Map<String, Object> map = new HashMap<>();
		map.put("id", req.getParameter("id"));
		map.put("depart_name", req.getParameter("depart_name"));
		dao.ht_update(map);
		
		int h_updateCnt = dao.humanUpdate(dto);
		
		
		model.addAttribute("h_updateCnt", h_updateCnt);
	}

	//인사평가
	@Override
	public void humanAppraisalAction(HttpServletRequest req ,Model model) {
		System.out.println("관리자 서비스 -> 인사평가");
		String ids = req.getParameter("id");
		String[] index = ids.split(" ");
		System.out.println(index);
		String id = index[0];
		String depart_name = index[1];
		String team_name = index[2];
		String name = index[3];
		String p_id = (String)req.getSession().getAttribute("memberID");
		
		Map<String, Object> map =  new HashMap<>();
		map.put("id", id);
		map.put("p_id", p_id);
		map.put("p_able", req.getParameter("p_able"));
		map.put("p_comment", req.getParameter("p_comment"));
		map.put("p_day", Date.valueOf(req.getParameter("p_day")));
		map.put("p_output",req.getParameter("p_output") );
		map.put("depart_name",depart_name );
		map.put("team_name",team_name );
		
		int a_selectCnt = dao.insertandupdate(map);
		
		model.addAttribute("a_selectCnt", a_selectCnt);
		
	}



}
