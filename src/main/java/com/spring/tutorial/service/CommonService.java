package com.spring.tutorial.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface CommonService {	
	
	// 사원 등록 처리
	public void signInAction(HttpServletRequest req, Model model);
	
	// 로그인 처리
	public void loginAction(HttpServletRequest req, Model model);
	
	// 퇴사 처리
	public void deleteMemberAction(HttpServletRequest req, Model model);
	
	// 사원 상세 페이지
	public void modifyDetailAction(HttpServletRequest req, Model model);
	
	// 사원 수정 처리
	public void modifyMemberAction(HttpServletRequest req, Model model);
	
	// 이메일 인증
	public void emailChkAction(HttpServletRequest req, Model model);
}
