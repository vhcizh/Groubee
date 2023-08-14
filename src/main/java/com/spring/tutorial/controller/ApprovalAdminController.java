package com.spring.tutorial.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.tutorial.service.ApprovalServiceImpl;


@Controller
public class ApprovalAdminController {
	@Autowired
	ApprovalServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	//관리자통합문서함
	@RequestMapping("approvalad.apad")
	public String approvallistAdmin(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("AdminController -> approvallistAdmin.apad");
		service.adminApprovallistAction(req, model);
		return "admin/adapproval/adminapproval";
	}
	
	//관리자통합문서함 - 전체보기
	@RequestMapping("approvalAllad.apad")
	public String approvalAllad(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("AdminController -> approvallistAdmin.apad");
		service.adminApprovallistAllAction(req, model);
		return "admin/adapproval/adminapprovalNoselect";
	}
}
