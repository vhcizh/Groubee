package com.spring.tutorial.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.tutorial.dto.ChatMessageDTO;
import com.spring.tutorial.dto.ChatRoomDTO;
import com.spring.tutorial.dto.WorkerDTO;

@Repository
public class ChatDAOImpl implements ChatDAO {

	@Autowired
	SqlSession sqlSession;

	// 채팅방 개설 -- 개설자, 방이름
	@Override
	public int create(Map<String, Object> map) {
		System.out.println("== ChatDAOImpl - create() ==");
		
		int createResult = sqlSession.insert("com.spring.tutorial.dao.ChatDAO.create", map);
		// 채팅방 개설 성공시 개설자를 멤버테이블에 넣기
		if (createResult == 1) {
			createResult = sqlSession.insert("com.spring.tutorial.dao.ChatDAO.addCreator", map);
		}
		return createResult;
	}
	
	// 사원 채팅방에 존재하는지 체크
	public int checkMember(Map<String, Object> map) {
		System.out.println("== ChatDAOImpl - checkMember() ==");
		
		return sqlSession.selectOne("com.spring.tutorial.dao.ChatDAO.checkMember", map);
	}
	
	// 채팅방 멤버 추가
	@Override
	public void inviteMember(Map<String, Object> map) {
		System.out.println("== ChatDAOImpl - inviteMember() ==");
		
		sqlSession.insert("com.spring.tutorial.dao.ChatDAO.inviteMember",map);
	}

	// 채팅방 목록
	@Override
	public List<ChatRoomDTO> list(String id) {
		System.out.println("== ChatDAOImpl - list() ==");
		
		return sqlSession.selectList("com.spring.tutorial.dao.ChatDAO.list", id);
	}

	// 입장한 채팅방 정보
	@Override
	public ChatRoomDTO enter(String chatroom_num) {
		System.out.println("== ChatDAOImpl - enter() ==");
		
		return sqlSession.selectOne("com.spring.tutorial.dao.ChatDAO.enter",chatroom_num);
	}
	
	// 채팅방 나가기
	@Override
	public void exit(Map<String, Object> map) {
		System.out.println("== ChatDAOImpl - exit() ==");
		
		sqlSession.delete("com.spring.tutorial.dao.ChatDAO.exit", map);
	}
	
	// 채팅방에 없는 사원 목록
	@Override
	public List<WorkerDTO> workerList(String chatroom_num) {
		System.out.println("== ChatDAOImpl - workerList() ==");
		return sqlSession.selectList("com.spring.tutorial.dao.ChatDAO.workerList",chatroom_num);
	}
	
	// 채팅방에 있는 사원 목록
	@Override
	public List<WorkerDTO> chatMemberList(String chatroom_num){
		System.out.println("== ChatDAOImpl - chatMemberList() ==");
		return sqlSession.selectList("com.spring.tutorial.dao.ChatDAO.chatMemberList",chatroom_num);
	}
	
	// 사번으로 이름 구하기
	public String idToName(String id) {
		return sqlSession.selectOne("com.spring.tutorial.dao.ChatDAO.idToName", id);
	}

	// 메세지 db에 저장
	public void insertMsg(ChatMessageDTO message) {
		sqlSession.insert("com.spring.tutorial.dao.ChatDAO.insertMsg", message);
	}
	
	// 메세지 select
	public List<ChatMessageDTO> selectMsg(String roomId) {
		return sqlSession.selectList("com.spring.tutorial.dao.ChatDAO.selectMsg", roomId);
	}

}
