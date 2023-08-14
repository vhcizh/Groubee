package com.spring.tutorial.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.tutorial.service.ApprovalServiceImpl;


@Controller
public class FormController {
	@Autowired
	ApprovalServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(FormController.class);
	
	//결재양식1
	@RequestMapping("form1.fo")
	public String form1(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("ApprovalController -> form1.fo");
		service.updateFormAction(req, model);
		service.selectLineViewAction(req, model);
		return "approval/approval/forms/form_1";
	}
	
	//기안 => 진행중 문서 세부페이지
	@RequestMapping("ondoc_detailAction.fo")
	public String ondoc_detailAction(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("ApprovalController -> ondoc_detailAction.fo");
		service.doc_detailAction(req, model);
		return "approval/approval/confirmedForm/onloaddoc";
	}
	
//	//회람 => 문서 세부페이지  ==> 만들어야함
//	@RequestMapping("doc_detailAction.fo")
//	public String doc_detailAction(HttpServletRequest req, HttpServletResponse res, Model model) 
//			throws ServletException, IOException{
//		logger.info("ApprovalController -> ondoc_detailAction.fo");
//		service.doc_detailAction(req, model);
//		return "approval/approval/confirmedForm/onloaddoc";
//	}
	
	//결대대기함 문서 세부페이지
	@RequestMapping("checkoutDoc_detail.fo")
	public String checkoutDoc_detail(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("ApprovalController -> checkoutDoc_detail.fo");
		
		return "approval/approval/confirmedForm/onloaddoc";
	}
	
	//회수하기
	@RequestMapping("rollbackApproval.fo")
	public void rollbackbtnApproval(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("ApprovalController -> rollbackApproval.fo");
		service.rollbackbtnApproval(req, model);
	}
	
	//문서수정하기세부페이지
	@RequestMapping("modifydocAction.fo")
	public String modifydoc(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("ApprovalController -> modifydoc.fo");
		service.modifydocAction(req, model);
		return "approval/approval/confirmedForm/form_modify";
	}
	
	//임시보관 => 임시보관
	@RequestMapping("tempSavetep.fo")
	public String tempSavetep(MultipartHttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("ApprovalController -> tempSavetep.fo");
		service.tempSavetepAction(req, model);
		return "approval/approval/action/draftInsertAction";
	}
	
	//임시보관 => 기안
	@RequestMapping("approvereqtep.fo")
	public String approvereqtep(MultipartHttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("ApprovalController -> approvereqtep.fo");
		service.approvereqtepAction(req, model);
		return "approval/approval/action/draftInsertAction";
	}
	
	//결재대기문서 상세페이지
	@RequestMapping("checkoutdocDetail.fo")
	public String checkoutdoc(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("ApprovalController -> checkoutdocDetail.ap");
		service.checkoutdocAction(req, model);
		return "approval/approval/confirmedForm/checkoutdoc";
	}
	
	
	//결재하기
	@RequestMapping("checkoutAction.fo")
	public String checkoutAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("ApprovalController -> checkoutAction.ap");
		service.checkoutAction(req, model);
		return "approval/approval/action/draftInsertAction";
	}
	
	
	//반려하기
	@RequestMapping("rejectdocAction.fo")
	public String rejectdocAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("ApprovalController -> rejectdocAction.ap");
		service.rejectdocAction(req, model);
		return "approval/approval/action/draftInsertAction";
	}
	
	////////////////////1016
	//완료문서 상세페이지(결재완료함, 결재예정함, 부서문서함, 회람문서함) > 전체 다 결재되었을 경우 회람하기 버튼 생김
	@RequestMapping("comcheckoutDetail.fo")
	public String comcheckoutDetail(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("ApprovalController -> comcheckoutDetail.ap");
		service.confirmedDraft(req, model);
		return "approval/approval/confirmedForm/comcheckoutdoc";
	}
	
	
	
}
