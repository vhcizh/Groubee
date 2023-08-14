package com.spring.tutorial.service;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sun.net.httpserver.HttpServer;


public interface ApprovalService {
	
	//결재정보 리스트
	public void selectFormList(HttpServletRequest req, Model model);
	
	//결재정보 리스트(모든부서노출)
	public void selectAllFormList(HttpServletRequest req, Model model);
	
	//결재정보 저장
	public void approvalInfoInsertAction(HttpServletRequest req, Model model);
	
	//결재라인정보뿌리기
	public void selectLineViewAction(HttpServletRequest req, Model model);
	
	//결재, 협조 수정하기
	public void changecoApproveAction(HttpServletRequest req, Model model);
	
	//결재라인 개별삭제
	public void deleteco_approveAction(HttpServletRequest req, Model model);
	
	//결재문서선택
	public void updateFormAction(HttpServletRequest req, Model model);
	
	//임시보관하기
	public void tempSaveAction(MultipartHttpServletRequest req, Model model) throws ServletException, IOException ;

	//기안하기
	public void approvereqAction(MultipartHttpServletRequest req, Model model) throws ServletException, IOException;
	
	//기안-진행문서함리스트
	public void onapprovalAction(HttpServletRequest req, Model model);
	
	//기안-완료문서함리스트
	public void comapprovalAction(HttpServletRequest req, Model model);
	
	//기안-반려문서함리스트
	public void rejapprovalAction(HttpServletRequest req, Model model);
	
	//임시보관함리스트
	public void templistAction(HttpServletRequest req, Model model);
	
	//임시보관함삭제
	public void deleteTemp(HttpServletRequest req, Model model);
	
	//임시보관선택삭제
	public void deleteTempchkAction(HttpServletRequest req, Model model);

	//임시보관함 글 확인
	public void doc_detailAction(HttpServletRequest req, Model model);
	
	//회수하기
	public void rollbackbtnApproval(HttpServletRequest req, Model model);
	
	//수정하기 상세페이지
	public void modifydocAction(HttpServletRequest req, Model model);
	
	//임시보관 -> 기안
	public void tempSavetepAction(MultipartHttpServletRequest req, Model model)  throws ServletException, IOException ;

	//임시보관 -> 임시보관
	public void approvereqtepAction(MultipartHttpServletRequest req, Model model)  throws ServletException, IOException ;
	
	//결재대기함 리스트
	public void checkoutlistAction(HttpServletRequest req, Model model);
	
	//결재 대기문서 상세페이지
	public void checkoutdocAction(HttpServletRequest req, Model model);
	
	//결재하기 
	public void checkoutAction(HttpServletRequest req, Model model);
	
	//반려하기
	public void rejectdocAction(HttpServletRequest req, Model model);
	
	//결재예정함 리스트
	public void prechecklistAction(HttpServletRequest req, Model model);
	
	//결재완료문서 상세페이지
	public void confirmedDraft(HttpServletRequest req, Model model);
	
	//부서문서함 리스트
	public void departdoclist(HttpServletRequest req, Model model);
	
	//결재완료함(결재자시점)
	public void confirmedDraftlistActionGetter(HttpServletRequest req, Model model);
	
	//결재대기함 뱃지
	public void checkoutBadgeAction(HttpServletRequest req, Model model);
	
	//회람하기
	public void referAction(HttpServletRequest req, Model model);
	
	//회람문서함
	public void referlist(HttpServletRequest req, Model model);
	
	//회람리스트
	public void refermemberlist(HttpServletRequest req, Model model);
	
	//결재정보수정
	public void selectupdateFormList(HttpServletRequest req, Model model);
	
	//결재정보수정정보 뿌리기
	public void reselectLineViewAction(HttpServletRequest req, Model model);
	
	//관리자 통합문서함
	public void adminApprovallistAction(HttpServletRequest req, Model model);
	
	//관리자통합문서함 전체보기
	public void adminApprovallistAllAction(HttpServletRequest req, Model model);
	
	
}
