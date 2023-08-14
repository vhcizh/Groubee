package com.spring.tutorial.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface MessageService {
	
	// 메세지쓰기 - 받는사람
	public void selectRecipient(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 메세지 보내기
	public void sendMessage(MultipartHttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 메세지 개수
//	public void messageCnt(HttpServletRequest req, Model model)
//			throws ServletException, IOException;
	
	// 받은메세지함 리스트
	public void inboxList(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 보낸메세지함 리스트
	public void sendboxList(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 임시보관함 리스트
	public void tempoList(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 휴지통 리스트
	public void trashList(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 메세지 확인 - 받은메세지(읽음상태 변경)
	public void chkDetail_get(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 메세지 확인
	public void chkDetail(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 메세지 확인 - 휴지통
	public void chkDetail_trash(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 메세지 확인 - 임시보관함
	public void chkDetailTempo(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 메세지 읽음 상태로 변경
	public void changeState_read(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 메세지 안읽음 상태로 변경
	public void changeState_unread(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 메세지 휴지통으로 이동
	public void deleteMsg(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 메세지 복원
	public void returnMsg(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 메세지 완전삭제
	public void completeDeleteMsg(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 재발송
	public void resendMessage(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 발신취소
	public void cancleMsg(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 임시저장
	public void tempoMessage(MultipartHttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 임시저장 불러오기
	public void getTempoMessage(MultipartHttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 답장
	public void replyMsgDetail(MultipartHttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 임시보관함에서 발송하기
	public void sendMessage_tempo(MultipartHttpServletRequest req, Model model) 
			throws ServletException, IOException;
}
