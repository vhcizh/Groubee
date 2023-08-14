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

import com.spring.tutorial.dao.BoardDAOImpl;
import com.spring.tutorial.dto.BoardDTO;
import com.spring.tutorial.service.BoardServiceImpl;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardServiceImpl service;
	
	@Autowired
	BoardDAOImpl dao;
	
	// 게시판 목록
	@RequestMapping("board.bo")
	public String board(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		logger.info("BoardController -> board.bo");
		
		service.boardList(req, model);
		
		return "board/board";
	}
	
	// 상세페이지
	@RequestMapping("detail.bo")
	public String board_detailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		logger.info("url => detail.bo");
		
		service.detail(req, model);
		
		return "board/detail";
	}
	
	// 게시글 쓰기 화면
	@RequestMapping("insert.bo")
	public String board_insert(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		logger.info("url => insert.bo");
		
		return "board/insert";
	}
	
	// 게시글 쓰기 처리
	@RequestMapping("insertAction.bo")
	public void board_insertAction(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("url => insertAction.bo");
		
		service.insertAction(req, model);
		
		String viewPage = req.getContextPath() + "/board.bo";
        res.sendRedirect(viewPage);
	}
	
	// 수정페이지
	@RequestMapping("boardEdit.bo")
	public String board_edit(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		logger.info("url => edit.bo");
		
		int num = Integer.parseInt(req.getParameter("num"));

		BoardDTO dto = dao.boardDetail(num);
		
		req.setAttribute("dto", dto);
		
		return "board/edit";
	}
	
	// 게시판 수정 처리
	@RequestMapping("boardEditAction.bo")
	public void board_updateAction(HttpServletRequest req,HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("[url => /boardEditAction.bo]");
		
		service.boardUpdateAction(req, model);
		
        String viewPage = req.getContextPath() + "/board.bo";
        res.sendRedirect(viewPage);
	}
	
	
	// 게시판 삭제처리
	@RequestMapping("boardDelete.bo")
	public void board_deleteAction(HttpServletRequest req, HttpServletResponse res,  Model model)
			throws ServletException, IOException {
		logger.info("[url => /delete.bo]");
		service.boardDelete(req, model);
		
		String viewPage = req.getContextPath() + "/board.bo";
        res.sendRedirect(viewPage);
	}
	
	// --------------------------------- 댓글 -------------------------------
	// 댓글목록
	@RequestMapping("comment.bo")
	public String commentList(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		logger.info("[url => /comment.bo]");
		service.comment(req, model);
		
		return "board/comment";
	}	
	
	// 댓글작성
	@RequestMapping("commentAdd.bo")
	public String commentAdd(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		logger.info("[url => /commentAdd.bo]");
		service.commentAdd(req, model);
		
		return "board/comment";
	}
	
	// 댓글 삭제
	@RequestMapping("commentDelete.bo")
	public String commentDelete(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		logger.info("[url => /commentDelete.bo]");
		service.commentDelete(req, model);
		
		return "board/comment";
	}
	

}
