package com.spring.tutorial.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.tutorial.dao.CommonDAO;
import com.spring.tutorial.dto.CommonDTO;
import com.spring.tutorial.util.EmailChkHandler;


@Service
public class CommonServiceImpl implements CommonService {
	
	@Autowired
    CommonDAO dao;
	
	// 비밀번호 암호화 클래스
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
		
	// 사원 등록 시큐리티 (암호화된 비밀번호 추가, 이메일 인증키 추가, 가입성공 시 이메일 인증 추가)
	@Override
	public void signInAction(HttpServletRequest req, Model model) {
		System.out.println("service : 사원 등록 처리");
				
		CommonDTO dto = new CommonDTO();
		dto.setName(req.getParameter("name"));
		
		// 비밀번호 암호화 - 시큐리티
	    String pwd = req.getParameter("pwd");
	    System.out.println("암호화 전의 비밀번호 : " + pwd);
	   
	    // BCryptPasswordEncoder.encode() : 비밀번호 암호화 메서드
	    String encryptPassword = passwordEncoder.encode(pwd);
	    System.out.println("암호화 후의 비밀번호 : " + encryptPassword);
	      
	    dto.setPwd(encryptPassword);   // setPwd(암호화된 비밀번호); 
		dto.setRepwd(req.getParameter("repwd"));
		dto.setName(req.getParameter("name"));
		dto.setEng_name(req.getParameter("eng_name"));
		dto.setJumin1(req.getParameter("jumin1"));
		dto.setJumin2(req.getParameter("jumin2"));
		dto.setGender(req.getParameter("gender"));
		dto.setMarry(req.getParameter("marry"));
		dto.setFrgn(req.getParameter("frgn"));
		dto.setNation(req.getParameter("nation"));
		// 년-월-일 형식		
		// dto.setHireday(Date.valueOf(req.getParameter("hireday")));	
		String phone = "";
		String strPhone1 = req.getParameter("tel1"); // 010 처음
		String strPhone2 = req.getParameter("tel2"); // 1111 중간
		String strPhone3 = req.getParameter("tel3"); // 2222 끝		
		if(!strPhone1.equals("") && !strPhone2.equals("") && !strPhone3.equals("")) {
			phone = strPhone1 + "-" + strPhone2 + "-" + strPhone3; // 010-1111-2222
		}
		dto.setTel(phone); // 휴대전화
		
		String in_tel = "";
		String in_tel1 = req.getParameter("in_tel1"); //
		String in_tel2 = req.getParameter("in_tel2"); //
		String in_tel3 = req.getParameter("in_tel3"); //		
		if(!in_tel1.equals("") && !in_tel2.equals("") && !in_tel3.equals("")) {
			in_tel = in_tel1 + "-" + in_tel2 + "-" + in_tel3; // 010-1111-2222
		}
		dto.setIn_tel(in_tel); // 내선번호
		
		// 회사 이메일
		String c_email1 = req.getParameter("c_email1"); 
		String c_email2 = req.getParameter("c_email2"); 
		String c_email = c_email1 + "@" + c_email2; // 아이디@도메인	
		dto.setEmail_in(c_email);
		
		// 외부 이메일
		String email1 = req.getParameter("email1"); 
		String email2 = req.getParameter("email2"); 
		String email = email1 + "@" + email2;	
		dto.setEmail_out(email);
		
		dto.setAddress(req.getParameter("address")); // 주소
		dto.setRank(req.getParameter("rank")); // 직책
		dto.setDepart_name(req.getParameter("depart_name")); // 부서명
		// 시큐리티
	    String key = EmailChkHandler.getKey();
	    dto.setKey(key);		
		
	    System.out.println(req.getParameter("name"));
	    System.out.println(req.getParameter("eng_name"));
	    System.out.println(req.getParameter("repwd"));
	    System.out.println(req.getParameter("jumin1"));
	    System.out.println(req.getParameter("jumin2"));
	    System.out.println(req.getParameter("gender"));
	    System.out.println(req.getParameter("marry"));
	    System.out.println(req.getParameter("frgn"));
	    System.out.println(req.getParameter("nation"));
	    System.out.println(req.getParameter("address"));
	    System.out.println(req.getParameter("depart_name"));
	    System.out.println(req.getParameter("rank"));
	    System.out.println(phone + ", " + in_tel + ", " + c_email + ", " + email + ", " + key);
	    
		//회원가입 처리 (DAO에서 DB 처리)
		int insertCnt = dao.insertMember(dto);
		System.out.println("service insertCnt : " + insertCnt);
		// 시큐리티 - 가입성공시 이메일인증을 위해 이메일 전송
	    if(insertCnt == 1) {
	       dao.sendEmail(email, key);   // email은 네이버 이메일   
	    }
		model.addAttribute("insertCnt", insertCnt);	
	}
	
	// --------------- [ 로그인  ]---------------
	@Override
	public void loginAction(HttpServletRequest req, Model model) {
		System.out.println("service : 로그인 처리");
		// 화면으로 부터 입력받은 값을 받는다
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		// Map<String, Object> value는 다형성을 위해 Object형으로 생성
		Map<String, Object> map = new HashMap<String, Object>();
		// map.put("key", value);
		map.put("id", id);
		map.put("pwd", pwd);
		
		// 아이디 비밀번호 확인
		int selectCnt = dao.idPasswordChk(map);
		
		// selectCnt 1 : 로그인 성공
		if(selectCnt == 1) { // session ID 설정
			HttpSession session = req.getSession();
			session.setAttribute("memberID", id);
		}		
		model.addAttribute("selectCnt", selectCnt);
	}
	
	// --------------- [ 퇴사  ]---------------
	@Override
	public void deleteMemberAction(HttpServletRequest req, Model model) {
		System.out.println("service : 퇴사 처리");		
//		String id = (String) req.getSession().getAttribute("memberID");
//		String pwd = req.getParameter("pwd");
//
//		String encryptPassword = dao.passwordCheck(id);
//		System.out.println("암호화 되어있는 비밀번호 : " + encryptPassword);
//
//		int selectCnt = 0;
//		int deleteCnt = 0;
//		if (passwordEncoder.matches(pwd, encryptPassword)) {
//			selectCnt = 1;
//			deleteCnt = dao.deleteMember(id);
//			System.out.println("deleteCnt : " + deleteCnt);
//		}
//
//		model.addAttribute("selectCnt", selectCnt);
//		model.addAttribute("deleteCnt", deleteCnt);
	}
	
	// --------------- [ 사원 수정 ]---------------	
	// 사원 상세페이지
	@Override
	public void modifyDetailAction(HttpServletRequest req, Model model) {
		System.out.println("service : 사원 정보 상세");
//		String id = (String)req.getSession().getAttribute("memberID");
//		
//		CommonDTO dto = dao.getMemberDetail(id);		
//		model.addAttribute("dto", dto);		

	}
	
	// 사원 수정 처리 - 시큐리티(비밀번호 암호화)
	@Override
	public void modifyMemberAction(HttpServletRequest req, Model model) {
		System.out.println("service : 회원정보 수정 처리");
		
//		CommonDTO dto = new CommonDTO();
//		// id는 세션(로그인한 id)으로부터 가져온다
//		dto.setId((String)req.getSession().getAttribute("memberID"));
//		
//		// 비밀번호 암호화 
//	    String password = req.getParameter("password");
//	    String encryptPassword = passwordEncoder.encode(password);
//	    System.out.println("암호화 전의 비밀번호 : " + password + ", 암호화 후의 비밀번호 : " + encryptPassword);
//	      
//	    // 암호화된 비밀번호를 setter로 담는다.
//	    dto.setPwd(encryptPassword);		
//		dto.setRepwd(encryptPassword);
//		dto.setName(req.getParameter("name"));
//		// 년-월-일 형식		
//		dto.setAddress(req.getParameter("address"));
//		// phone은 not null이 아니므로 값이 존재할 때만 처리한다
//		String phone = "";
//		String strPhone1 = req.getParameter("tel1"); // 010 처음
//		String strPhone2 = req.getParameter("tel2"); // 1111 중간
//		String strPhone3 = req.getParameter("tel3"); // 2222 끝		
//		if(!strPhone1.equals("") && !strPhone2.equals("") && !strPhone3.equals("")) {
//			phone = strPhone1 + "-" + strPhone2 + "-" + strPhone3; // 010-1111-2222
//		}
//		dto.setTel(phone);
//		
//		String strEmail1 = req.getParameter("email1"); // 아이디
//		String strEmail2 = req.getParameter("email2"); // 도메인
//		String email = strEmail1 + "@" + strEmail2; // 아이디@도메인		
//		dto.setEmail_out(email);
//				
//		// 사원 정보 수정 처리		
//		int updateCnt = dao.updateMember(dto);				
//		model.addAttribute("updateCnt", updateCnt);
	}
	
	// 이메일 인증 후 권한(enabled) update - 시큐리티
	@Override
	public void emailChkAction(HttpServletRequest req, Model model) {
		 String key = req.getParameter("key");
	      int selectCnt = dao.selectKey(key);
	      
	      if(selectCnt == 1) {
	         int insertCnt = dao.updateGrade(key);
	         model.addAttribute("insertCnt", insertCnt);
	      }		
	}

}
