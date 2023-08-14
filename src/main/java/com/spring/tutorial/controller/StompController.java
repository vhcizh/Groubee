package com.spring.tutorial.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.spring.tutorial.dao.ChatDAOImpl;
import com.spring.tutorial.dto.ChatMessageDTO;
import com.spring.tutorial.dto.WorkerDTO;

@Controller
public class StompController {

	@Autowired
	private SimpMessagingTemplate template; // 특정 Broker로 메시지 전달
	
	@Autowired
	ChatDAOImpl dao;
	
    @MessageMapping("/chat/invite")
    public void enter(ChatMessageDTO message){
    	System.out.println("=====================================================");
    	System.out.println(message);
    	String id = message.getWriter();
    	String name = dao.idToName(id);
    	message.setName(name);
    	String str = message.getInvite();
    	System.out.println("초대된 id " + str);
    	String str2 = str.substring(2, str.length()-2);
    	System.out.println(str2);
    	
    	String[] invitedId = str2.split("\",\"");
    	String invitedName = "";
    	for(int i=0; i < invitedId.length; i++) { 
    		invitedName += dao.idToName(invitedId[i])+"님 ";
    	}
    	
    	System.out.println("invitedId : " + invitedId);
    	System.out.println("=====================================================");
        message.setMessage("채팅방에 " + invitedName +"을 초대하였습니다.");
        dao.insertMsg(message);
        
        // 채팅방에 메세지 뿌리기
        template.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
        
        // 초대된 사원에게 알림 보내기
        for(int i=0; i < invitedId.length; i++) {
        	System.out.println("invitedId[i] : " + invitedId[i] + " //// message : " + message);
        	template.convertAndSend("/sub/alarm/" + invitedId[i], message);
        }
    }
    
    @MessageMapping("/chat/message")
    public void message(ChatMessageDTO message){
    	
    	// 메세지 보낸 사람 사번으로 이름 구하기
    	String id = message.getWriter();
    	String name = dao.idToName(id);
    	message.setName(name);
    	
    	dao.insertMsg(message);
    	
    	// 채팅방으로 메세지 보내기
        template.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
        
        // 해당 채팅방에 참여한 사람 목록
    	List<WorkerDTO> members = dao.chatMemberList(message.getRoomId());
    	
        // 참여한 사람들 모두에게 알림 보내기
        for(int i=0; i < members.size(); i++) {
        	template.convertAndSend("/sub/alarm/" + members.get(i).getId(), message);
        }
    }
    
    @MessageMapping("/chat/close")
    public void close(ChatMessageDTO message){
    	
    	String id = message.getWriter();
    	String name = dao.idToName(id);
        message.setMessage(name + "님이 채팅방을 나갔습니다.");
        message.setName("");
        
        template.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
    }
    
}
