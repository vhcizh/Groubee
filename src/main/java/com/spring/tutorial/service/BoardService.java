package com.spring.tutorial.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface BoardService {

	// 게시글 목록
	public void boardList(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 게시글 상세페이지
	public void detail(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 게시글 작성 처리
	public void insertAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;

	// 게시글 수정처리
	public void boardUpdateAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 게시글 삭제처리
	public void boardDelete(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 게시글 완전삭제
	public void boardDelete2(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 댓글목록 처리
	public void comment(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 댓글 추가처리
	public void commentAdd(HttpServletRequest req, Model model)
			throws ServletException, IOException;

	// 댓글 삭제처리
	public void commentDelete(HttpServletRequest req, Model model) 
			throws ServletException, IOException;

}
