package com.spring.tutorial.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface AdminMessageService {
	
	// 메세지 전체 리스트 - 초기화면
	public void everyMsgListAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 메세지 세부내용 보기
	public void adminMsgDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;

}
