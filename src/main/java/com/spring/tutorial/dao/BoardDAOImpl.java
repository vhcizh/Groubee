package com.spring.tutorial.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.tutorial.dto.BoardCommentDTO;
import com.spring.tutorial.dto.BoardDTO;


@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	SqlSession sqlSession;

	//게시글 목록
	@Override
	public List<BoardDTO> boardList(Map<String, Object> map) {
		System.out.println("DAO - boardList");
		return sqlSession.selectList("com.spring.tutorial.dao.BoardDAO.boardList", map);
	}
	
	// 게시글 갯수 구하기
	@Override
	public int boardCnt(Map<String, Object> map) {
		System.out.println("DAO - boardCnt");
		return sqlSession.selectOne("com.spring.tutorial.dao.BoardDAO.boardCnt", map);
	}
	
	// 게시글 상세페이지
	@Override
	public BoardDTO boardDetail(int num) {
		System.out.println("DAO - boardDetail");
		return sqlSession.selectOne("com.spring.tutorial.dao.BoardDAO.boardDetail",num);
	}
	
	// 조회수 증가
	@Override
	public void plusReadCnt(int num) {
		System.out.println("DAO - plusReadCnt");
		sqlSession.selectOne("com.spring.tutorial.dao.BoardDAO.plusReadCnt",num);
	}
	
	// 게시글 작성 처리
	@Override
	public int boardInsert(BoardDTO dto) {
		System.out.println("DAO - boardInsert");
		return sqlSession.insert("com.spring.tutorial.dao.BoardDAO.boardInsert", dto);
	}
	
	// 게시글 수정처리
	@Override
	public void updateBoard(BoardDTO dto) {
		System.out.println("DAO - updateBoard");
		sqlSession.update("com.spring.tutorial.dao.BoardDAO.updateBoard",dto);
	}

	// 게시글 삭제처리
	@Override
	public void boardDelete(String num) {
		System.out.println("DAO - delete");
		sqlSession.update("com.spring.tutorial.dao.BoardDAO.boardDelete",num);
	}

	// 게시글 영구삭제
	@Override
	public void boardDelete2(String num) {
		System.out.println("DAO - delete2");
		sqlSession.update("com.spring.tutorial.dao.BoardDAO.boardDelete2",num);
	}
	
	// 댓글목록
	@Override
	public List<BoardCommentDTO> comment(int board_num) {
		System.out.println("dao - comment");
		return sqlSession.selectList("com.spring.tutorial.dao.BoardDAO.comment",board_num);
	}

	// 댓글 추가처리
	@Override
	public void commentAdd(BoardCommentDTO dto) {
		System.out.println("DAO - commentAdd");
		sqlSession.insert("com.spring.tutorial.dao.BoardDAO.commentAdd", dto);
	}

	// 댓글 삭제처리
	@Override
	public void commentDelete(int comment_num) {
		System.out.println("DAO - commentDelete");
		sqlSession.delete("com.spring.tutorial.dao.BoardDAO.commentDelete",comment_num);
	}

}
