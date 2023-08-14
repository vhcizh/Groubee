package com.spring.tutorial.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.tutorial.dto.MessageDTO;

@Repository
public class AdminMessageDAOImpl implements AdminMessageDAO {

	@Autowired
	SqlSession sqlSession;

	// 메세지 전체 리스트 - 초기화면
	@Override
	public List<MessageDTO> everyMsgList() {
		System.out.println("dao => everyMsgList");
		
		List<MessageDTO> list = sqlSession.selectList("com.spring.tutorial.dao.AdminMessageDAO.everyMsgList");
		
		return list;
	}

	// 메세지 세부내용 보기
	@Override
	public List<MessageDTO> DetailMsg(int message_num) {
		System.out.println("dao => DetailMsg");
		
		List<MessageDTO> list = sqlSession.selectList("com.spring.tutorial.dao.AdminMessageDAO.DetailMsg", message_num);
		
		return list;
	}

}
