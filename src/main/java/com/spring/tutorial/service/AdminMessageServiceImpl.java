package com.spring.tutorial.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.tutorial.dao.AdminMessageDAOImpl;
import com.spring.tutorial.dto.MessageDTO;

@Service
public class AdminMessageServiceImpl implements AdminMessageService {
	
	@Autowired
	AdminMessageDAOImpl dao;

	// 메세지 전체 리스트 - 초기화면
	@Override
	public void everyMsgListAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 => everyMsgList");
		
		List<MessageDTO> list = dao.everyMsgList();
		System.out.println("list => " + list);

		model.addAttribute("list", list);
	}

	// 메세지 세부내용 보기
	@Override
	public void adminMsgDetailAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 => adminMsgDetailAction");
		
		int message_num = Integer.parseInt(req.getParameter("message_num"));
		System.out.println("message_num => " + message_num);
		
		List<MessageDTO> list = dao.DetailMsg(message_num);
		System.out.println("list => " + list);

		model.addAttribute("list", list);
	}

}
