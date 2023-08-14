package com.spring.tutorial.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface SecurityService {
	
	//관리자 권한 추가 팝업창
	public void adminAddAction(HttpServletRequest req, Model model)
		throws ServletException, IOException;
	
	//관리자 권한 추가 insert
	public void adSecurityInsert(HttpServletRequest req, Model model)
		throws ServletException, IOException;
	
	public void securityAdminListAc(HttpServletRequest req, Model model)
		throws ServletException, IOException;
	
	public void adSecurityDelAction(HttpServletRequest req, Model model)
		throws ServletException, IOException;
	
	public void adminAuthorityAction(HttpServletRequest req, Model model)
		throws ServletException, IOException;

}
