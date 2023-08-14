package com.spring.tutorial.dao;

import java.util.List;
import java.util.Map;

import com.spring.tutorial.dto.BoardCommentDTO;
import com.spring.tutorial.dto.BoardDTO;


public interface BoardDAO {

	// 게시글 목록
	public List<BoardDTO> boardList(Map<String, Object> map);
	
	// 게시글 갯수 구하기
	public int boardCnt(Map<String, Object> map);
	
	// 게시글 상세페이지
	public BoardDTO boardDetail(int num);
	
	// 조회수 증가
	public void plusReadCnt(int num);
	
	// 게시글 작성 처리
	public int boardInsert(BoardDTO dto);
	
	// 게시글 수정처리
	public void updateBoard(BoardDTO dto);
	
	// 게시글 삭제처리
	public void boardDelete(String num);

	// 게시글 영구삭제
	public void boardDelete2(String num);
	
	// 댓글목록 처리
	public List<BoardCommentDTO> comment(int board_num);

	// 댓글 추가처리
	public void commentAdd(BoardCommentDTO dto);

	// 댓글 삭제처리
	public void commentDelete(int comment_num);

}
