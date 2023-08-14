package com.spring.tutorial.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.tutorial.service.ChatServiceImpl;


// @RequiredArgsConstructor : 초기화 되지않은 final 필드나, @NonNull 이 붙은 필드에 대해 생성자를 생성 => @Autowired를 사용하지 않고 의존성 주입
@Controller
public class ChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	public ChatServiceImpl service;
	
	
	
    // 첫화면
    @RequestMapping("chat.ch")
    public String chatting(HttpServletRequest req, Model model){
    	logger.info("# ChatController - chatting()");
    	
        return "chat/chatting";
    }
    
    //채팅방 목록
    @RequestMapping("/list.ch")
    public String list(HttpServletRequest req, Model model){
    	logger.info("# ChatController - list()");
    	
    	service.list(req, model);
    	
        return "chat/list";
    }
    
    // 채팅방 개설
    @RequestMapping("chat/create")
    public String create(HttpServletRequest req, Model model){
    	logger.info("# ChatController - create()");
    	
    	// 채팅방 insert
    	int createResult = service.create(req, model);
    	model.addAttribute("createResult",createResult);
    	
    	return "redirect:/chat.ch";
    }
    
    // 채팅방 들어가기 enter
    @RequestMapping("chat/room")
    public String enter(HttpServletRequest req, Model model){
    	logger.info("# ChatController - enter()");
    	// model.addAttribute("room", repository.findRoomById(roomId));
    	
    	service.enter(req, model);
    	
        return "chat/room";
    }
    
    // 사원 목록 불러오기
    @RequestMapping("organization")
    public String organization(HttpServletRequest req, Model model){
    	logger.info("# ChatController - organization()");
    	
        return "chat/organization";
    }
    
    // 초대하기
    @RequestMapping("chat/invite")
    public String invite(HttpServletRequest req, Model model){
    	logger.info("# ChatController - invite()");
    	
    	service.inviteMember(req, model);
    	service.enter(req, model);
        return "chat/room";
    }

    // 채팅방 나가기
    @RequestMapping("chat/exit")
    public void exit(HttpServletRequest req, Model model){
    	logger.info("# ChatController - enter()");
    	
    	service.exit(req, model);
    	
        // return "chat/room";
    }
}