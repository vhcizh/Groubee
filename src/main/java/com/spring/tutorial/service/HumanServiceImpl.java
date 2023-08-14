package com.spring.tutorial.service;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.tutorial.dao.HumanDAOImpl;
import com.spring.tutorial.dto.CommonDTO;
import com.spring.tutorial.dto.DepartDTO;
import com.spring.tutorial.dto.PersonnelDTO;
import com.spring.tutorial.dto.TeamDTO;

//인사관린
@Service
public class HumanServiceImpl implements HumanService{
	
	@Autowired
	HumanDAOImpl dao;
	
	
	//기본정보
	@Override
	public void memberInfo(HttpServletRequest req, Model model) {
		System.out.println("서비스 -> 기본정보");
		try {
		String id = (String) req.getSession().getAttribute("memberID");
		
		CommonDTO dto =  dao.selecthuman(id);
		
		model.addAttribute("dto", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		
	}
	
	
	//인사평가
	@Override
	public void memberAssessment(HttpServletRequest req, Model model) {
		System.out.println(" 서비스 -> 인사평가");
		
		String id = (String) req.getSession().getAttribute("memberID");
		
		PersonnelDTO dto2 = dao.assessment(id);
		
		model.addAttribute("dto2", dto2);
		
	}
	//직무&담당
	@Override
	public void jobsfao(HttpServletRequest req, Model model) {
		System.out.println("서비스 -> 직무&담당");
		
		String id = (String) req.getSession().getAttribute("memberID");
		
		TeamDTO dto3 = dao.jobsfao(id);
		
		model.addAttribute("dto3", dto3);
		
	}
	//개인프로필
	@Override
	public void myHumanInfo(HttpServletRequest req, Model model) {
		System.out.println("서비스 -> 개인프로필");
		
		String id = (String)req.getParameter("id");
		System.out.println(id);
		CommonDTO dto = dao.myHuman(id);
		
		model.addAttribute("dto", dto);
		
	}
	
	//개인정보 수정
	@Override
	public void memberUpdate(HttpServletRequest req, HttpServletResponse res  ,Model model) {
		System.out.println("서비스 -> 개인정보 재등록");
		
		String id = (String)req.getSession().getAttribute("memberID");
		CommonDTO dto = new CommonDTO();
		dto.setId(id);
		System.out.println(id);
		dto.setTel(req.getParameter("tel"));
		dto.setEmail_in(req.getParameter("email_in"));
		dto.setAddress(req.getParameter("address"));
		dto.setGender(req.getParameter("gender"));
		dto.setMarry(req.getParameter("marry"));
		
		dao.memberUpdate(dto);
		
	}

	//전체 인사정보 
	@Override
	public void usersHuman(HttpServletRequest req, Model model) {
		System.out.println("서비스 -> 전체인사정보 ");
		
		List<CommonDTO> list = dao.usersInfo();
		
		model.addAttribute("list", list);
		
	}



	//조직도 목록
	@Override
	public void groubInfo(HttpServletRequest req, Model model) {
		System.out.println("서비스 -> 조직도 목록");
		//사업부
		List<DepartDTO> b_list = dao.b_depart();
		List<TeamDTO> b_oneteam = dao.b_oneteam();
		List<TeamDTO> b_twoteam = dao.b_twoteam();
		
		//경영지원부
		List<DepartDTO> j_list = dao.j_depart();
		List<TeamDTO> j_oneteam = dao.j_oneteam();
		List<TeamDTO> j_twoteam = dao.j_twoteam();
		
		//개발부
		List<DepartDTO> i_list = dao.i_depart();
		List<TeamDTO> i_oneteam = dao.i_oneteam();
		List<TeamDTO> i_twoteam = dao.i_twoteam();
		List<TeamDTO> i_threeteam = dao.i_threeteam();
		
		//영업부
		List<DepartDTO> o_depart = dao.o_depart();
		List<TeamDTO> o_oneteam = dao.o_oneteam();
		List<TeamDTO> o_twoteam = dao.o_twoteam();
		
		//인사부
		List<DepartDTO> p_list = dao.p_depart();
		List<TeamDTO> p_oneteam = dao.p_oneteam();
		List<TeamDTO> p_twoteam = dao.p_twoteam();
		List<TeamDTO> p_threeteam = dao.p_threeteam();
		
		//총무부
		List<DepartDTO> c_depart = dao.c_depart();
		List<TeamDTO> c_oneteam = dao.c_oneteam();
		List<TeamDTO> c_twoteam = dao.c_twoteam();
		
		model.addAttribute("b_list", b_list);
		model.addAttribute("b_oneteam", b_oneteam);
		model.addAttribute("b_twoteam", b_twoteam);
		
		model.addAttribute("j_list", j_list);
		model.addAttribute("j_oneteam", j_oneteam);
		model.addAttribute("j_twoteam", j_twoteam);
		
		model.addAttribute("i_list", i_list);
		model.addAttribute("i_oneteam", i_oneteam);
		model.addAttribute("i_twoteam", i_twoteam);
		model.addAttribute("i_threeteam", i_threeteam);
		
		model.addAttribute("o_depart", o_depart);
		model.addAttribute("o_oneteam", o_oneteam);
		model.addAttribute("o_twoteam", o_twoteam);
		
		model.addAttribute("p_list", p_list);
		model.addAttribute("p_oneteam", p_oneteam);
		model.addAttribute("p_twoteam", p_twoteam);
		model.addAttribute("p_threeteam", p_threeteam);
		
		model.addAttribute("c_depart", c_depart);
		model.addAttribute("c_oneteam", c_oneteam);
		model.addAttribute("c_twoteam", c_twoteam);
		
	}


}
