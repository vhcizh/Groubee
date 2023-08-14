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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.tutorial.service.MessageServiceImpl;

@Controller
public class MessageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired
	MessageServiceImpl service;
	
	// 받은 쪽지함 리스트
	@RequestMapping("msgIndex.me")
	public String msgIndex(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("MessegeController -> msgIndex.me");
		
		service.inboxList(req, model);
		
		return "messenger/msgBox/msgIndex";
	}
	
	// 보낸 쪽지함 리스트
	@RequestMapping("msgSendbox.me")
	public String msgSendbox(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("MessegeController -> msgSendbox.me");
		
		service.sendboxList(req, model);
		
		return "messenger/msgBox/msgSendbox";
	}
	
	// 임시보관함 리스트
	@RequestMapping("msgTempbox.me")
	public String msgTempbox(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("MessegeController -> msgTempbox.me");
		
		service.tempoList(req, model);
		
		return "messenger/msgBox/msgTempbox";
	}
	
	// 휴지통 리스트
	@RequestMapping("msgTrash.me")
	public String msgTrash(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("MessegeController -> msgTrash.me");
		
		service.trashList(req, model);
		
		return "messenger/msgBox/msgTrash";
	}
	
	// 메세지보기 - 받은메세지함
	@RequestMapping("messageDetail.me")
	public String messageDetail(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("MessegeController -> messageDetail.me");
		
		service.chkDetail_get(req, model);
		
		return "messenger/messageDetail";
	}
	
	// 메세지보기 - 보낸메세지
	@RequestMapping("messageDetail_resend.me")
	public String messageDetail_resend(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("MessegeController -> messageDetail_resend.me");
		
		service.chkDetail(req, model);
		
		return "messenger/messageDetail_resend";
	}
	
	// 메세지보기 - 임시메세지
	@RequestMapping("messageDetail_tempo.me")
	public String messageDetail_tempo(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("MessegeController -> messageDetail_tempo.me");
		
		service.chkDetailTempo(req, model);
		
		return "messenger/messageDetail_tempo";
	}
	
	// 메세지보기 - 휴지통
	@RequestMapping("messageDetail_trash.me")
	public String messageDetail_trash(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("MessegeController -> messageDetail_trash.me");
		
		service.chkDetail_trash(req, model);
		
		return "messenger/messageDetail_trash";
	}
	
	// 재발송
	@RequestMapping("resendMsg.me")
	public String resendMsg(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("MessegeController -> resendMsg.me");
		
		service.resendMessage(req, model);
		
		return "messenger/resendMsg";
	}
	
	// 메세지 쓰기 - 받는사람
	@RequestMapping("msgWrite.me")
	public String msgWrite(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("MessegeController -> msgWrite.me");
		
		service.selectRecipient(req, model);
		
		return "messenger/msgWrite";
	}
	
	// 메세지 보내기
	@RequestMapping("sendMsg.me") // MultipartHttpServletRequest
	public String sendMsg(MultipartHttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("MessegeController -> sendMsg.me");
		
		service.sendMessage(req, model);
		
		return "messenger/sendMsg";
	}
	
	// 임시보관에서 메세지 보내기 
	@RequestMapping("sendMsg_tempo.me") // MultipartHttpServletRequest
	public String sendMsg_tempo(MultipartHttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("MessegeController -> sendMsg_tempo.me");
		
		service.sendMessage_tempo(req, model);
		
		return "messenger/sendMsg";
	}
	
	// 읽음 상태로 변경
	@RequestMapping("readState.me")
	public String readState(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("MessegeController -> readState.me");
		
		service.changeState_read(req, model);
		
		return "messenger/msgState";
	}
	
	// 안읽음 상태로 변경
	@RequestMapping("unreadState.me")
	public String unreadState(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("MessegeController -> unreadState.me");
		
		service.changeState_unread(req, model);
		
		return "messenger/msgState";
	}
	
	// 메세지 휴지통으로 이동
	@RequestMapping("goTrash.me")
	public String goTrash(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("MessegeController -> goTrash.me");
		
		service.deleteMsg(req, model);
		
		return "messenger/msgState";
	}
	
	// 메세지 복원
	@RequestMapping("returnTrash.me")
	public String returnTrash(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("MessegeController -> returnTrash.me");
		
		service.returnMsg(req, model);
		
		return "messenger/msgState";
	}
	
	// 메세지 완전삭제
	@RequestMapping("completeDeleteMsg.me")
	public String completeDeleteMsg(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("MessegeController -> completeDeleteMsg.me");
		
		service.completeDeleteMsg(req, model);
		
		return "messenger/msgState";
	}
	
	// 발신취소
	@RequestMapping("cancleMsg.me")
	public String cancleMsg(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("MessegeController -> cancleMsg.me");
		
		service.cancleMsg(req, model);
		
		return "messenger/cancleMsgDetail";
	}
	
	// 임시저장
	@RequestMapping("tempoMsg.me") // MultipartHttpServletRequest
	public String tempoMsg(MultipartHttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("MessegeController -> tempoMsg.me");
		
		service.tempoMessage(req, model);
		
		return "messenger/tempoMsgDetail";
	}
	
	// 답장
	@RequestMapping("replyMsg.me") // MultipartHttpServletRequest
	public String replyMsg(MultipartHttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("MessegeController -> replyMsg.me");
		
		service.replyMsgDetail(req, model); // 답장 받을 사람 가져오기
		service.selectRecipient(req, model); // 받을사람 리스트
		
		return "messenger/msgBox/replyMsgDetail";
	}
	
	
	
}
