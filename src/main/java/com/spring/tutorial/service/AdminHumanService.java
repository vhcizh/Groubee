package com.spring.tutorial.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

//관리자 인사관리서비스
public interface AdminHumanService {
	
	//전체인사관리
	public void memberInfoAction(HttpServletRequest req, Model model);
	
	//개인정보 상세페이지
	public void usersDetailAction(HttpServletRequest req, Model model);
	
	//개인정보 수정
	public void usersUpdateAction(HttpServletRequest req,Model model);
	
	//개인정보 삭제
	public void usersDeleteAction(HttpServletRequest req, HttpServletResponse res  ,Model model);
	
	//전체부서정보
	public void departsAction(HttpServletRequest req,Model model);
	
	//부서정보 삭제
	public void departUpdateAction(HttpServletRequest req, HttpServletResponse res  ,Model model);
	
	//부서가입처리
	public void departInsertAction(HttpServletRequest req,Model model);
	
	//팀 생성
	public void teamInsertAction(HttpServletRequest req,Model model);
	
	//팀 배정
	public void teamUpdateAction(HttpServletRequest req,Model model);
	
	//인자 평가
	public void humanAppraisalAction(HttpServletRequest req ,Model model);

}
