package com.spring.tutorial.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface ChatService {

	// 채팅방 개설
	public int create(HttpServletRequest req, Model model);
	
	// 채팅방 멤버 추가
	public void inviteMember(HttpServletRequest req, Model model);
	
	// 채팅방 목록
	public void list(HttpServletRequest req, Model model);
	
	// 채팅방 입장
	public void enter(HttpServletRequest req, Model model);
	
	
	
	
}
