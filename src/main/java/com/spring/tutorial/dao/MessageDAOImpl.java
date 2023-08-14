package com.spring.tutorial.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.tutorial.dto.MessageDTO;

@Repository
public class MessageDAOImpl implements MessageDAO {
	
	@Autowired
	SqlSession sqlSession;

	// 메세지쓰기 - 받는사람
	@Override
	public List<MessageDTO> recipientList_depart() {
		System.out.println("dao => 메세지쓰기 - 받는사람");
		
		List<MessageDTO> list = sqlSession.selectList("com.spring.tutorial.dao.MessageDAO.recipientList_depart");
		
		return list;
	}

	// 메세지 보내기
	@Override
	public int messageSend(MessageDTO dto) {
		System.out.println("dao => 메세지 보내기");
		
		int insertState = sqlSession.insert("com.spring.tutorial.dao.MessageDAO.messageSend", dto);
		
		return insertState;
	}
	
	// 메세지 보내기 - 임시보관
	@Override
	public int messageSend_tempo(MessageDTO dto) {
		System.out.println("dao => 메세지 보내기 - 임시보관");
		
		int updateState = sqlSession.update("com.spring.tutorial.dao.MessageDAO.messageSend_tempo", dto);
		
		return updateState;
	}

	// 받은메세지 리스트
	@Override
	public List<MessageDTO> getMsgList(String getter_id) {
		System.out.println("dao => 받은메세지 리스트");
		
		List<MessageDTO> list = sqlSession.selectList("com.spring.tutorial.dao.MessageDAO.getMsgList", getter_id);
		
		return list;
	}

	// 보낸메세지 리스트
	@Override
	public List<MessageDTO> sendMsgList(String id) {
		System.out.println("dao - 보낸메세지 리스트");
		
		List<MessageDTO> list = sqlSession.selectList("com.spring.tutorial.dao.MessageDAO.sendMsgList", id);
		
		return list;
	}

	// 임시보관함 리스트
	@Override
	public List<MessageDTO> tempoMsgList(String id) {
		System.out.println("dao - 임시보관함 리스트");
		
		List<MessageDTO> list = sqlSession.selectList("com.spring.tutorial.dao.MessageDAO.tempoMsgList", id);
		
		return list;
	}

	// 휴지통 리스트 => 보낸메세지
	@Override
	public List<MessageDTO> trashMsgList(String getter_id) {
		System.out.println("dao - 휴지통 리스트 => 보낸메세지");
		
		List<MessageDTO> list = sqlSession.selectList("com.spring.tutorial.dao.MessageDAO.trashMsgList", getter_id);
		
		return list;
	}
	
	// 휴지통 리스트 => 받은메세지
	@Override
	public List<MessageDTO> trashMsgList_get(String getter_id) {
		System.out.println("dao - 휴지통 리스트 => 받은메세지");
		
		List<MessageDTO> list = sqlSession.selectList("com.spring.tutorial.dao.MessageDAO.trashMsgList_get", getter_id);
		
		return list;
	}
	
	// 메세지 읽기
	@Override
	public List<MessageDTO> readMsgDetail(int message_num) {
		System.out.println("dao - 메세지 읽기");
		
		List<MessageDTO> list = sqlSession.selectList("com.spring.tutorial.dao.MessageDAO.readMsgDetail", message_num);
		
		return list;
	}

	// 메세지 읽음 상태변경
	@Override
	public int updateState_read(int message_num) {
		System.out.println("dao - 메세지 읽음 상태변경");
		
		int updateState = sqlSession.update("com.spring.tutorial.dao.MessageDAO.updateState_read", message_num);
		
		return updateState;
	}
	
	// 메세지 안읽음 상태변경
	@Override
	public int updateState_unread(int message_num) {
		System.out.println("dao - 메세지 안읽음 상태변경");
		
		int updateState = sqlSession.update("com.spring.tutorial.dao.MessageDAO.updateState_unread", message_num);
		
		return updateState;
	}
	
	// 메세지 휴지통으로 이동
	@Override
	public int deleteMessage(int message_num) {
		System.out.println("dao - 메세지 휴지통으로 이동");
		
		int updateState = sqlSession.update("com.spring.tutorial.dao.MessageDAO.deleteMessage", message_num);
		
		return updateState;
	}

	// 메세지 복원
	@Override
	public int returnMessage(int message_num) {
		System.out.println("dao - 메세지 복원");
		
		int updateState = sqlSession.update("com.spring.tutorial.dao.MessageDAO.returnMessage", message_num);
		
		return updateState;
	}

	// 메세지 완전삭제
	@Override
	public int completeDeleteMessage(int message_num) {
		System.out.println("dao - 메세지 완전삭제");
		
		int deleteState = sqlSession.delete("com.spring.tutorial.dao.MessageDAO.completeDeleteMessage", message_num);
		
		return deleteState;
	}

	// 메세지 발신취소 가능여부 확인
	@Override
	public int cancleMsgChk(int message_num) {
		System.out.println("dao - 메세지 발신취소 가능여부 확인");
		
		int cancleChk = sqlSession.selectOne("com.spring.tutorial.dao.MessageDAO.cancleMsgChk", message_num);
		
		return cancleChk;
	}
	
	// 메세지 읽은시간 입력
	@Override
	public int updateReadDate(int message_num) {
		System.out.println("dao - 메세지 읽은시간 입력");
		
		int updateRead = sqlSession.update("com.spring.tutorial.dao.MessageDAO.updateReadDate", message_num);
		
		return updateRead;
	}

	// 메세지 읽은날짜 확인
	@Override
	public int checkReadDate(int message_num) {
		System.out.println("dao - 메세지 읽은날짜 확인");
		
		int chkReadDate = sqlSession.selectOne("com.spring.tutorial.dao.MessageDAO.checkReadDate", message_num);
		
		return chkReadDate;
	}
	
	// 메세지 임시보관
	@Override
	public int sendTempoMsg(MessageDTO dto) {
		System.out.println("dao - 메세지 임시보관");
		
		int InsertState = sqlSession.insert("com.spring.tutorial.dao.MessageDAO.sendTempoMsg", dto);
			
		return InsertState;
	}
	
	// 메세지 임시저장 불러오기
	@Override
	public List<MessageDTO> getTempoMsg(int message_num) {
		System.out.println("dao - 메세지 임시저장 불러오기");
		
		List<MessageDTO> list = sqlSession.selectList("com.spring.tutorial.dao.MessageDAO.getTempoMsg", message_num);
		
		return list;
	}

	// 임시보관함 메세지 읽기 
	@Override
	public List<MessageDTO> readTempoDetail(int message_num) {
		System.out.println("dao - 임시보관함 메세지 읽기");
		
		List<MessageDTO> list = sqlSession.selectList("com.spring.tutorial.dao.MessageDAO.readTempoDetail", message_num);
		
		return list;
	}
	
	// 임시보관함 메세지 전송 후 상태 변경
	@Override
	public int updateHolding(int message_num) {
		System.out.println("dao - 임시보관함 메세지 전송 후 상태 변경");
		
		int updateState = sqlSession.update("com.spring.tutorial.dao.MessageDAO.updateHolding", message_num);
		
		return updateState;
	}

	// 받은 사람 이름 가져오기 - 상세페이지
	@Override
	public List<MessageDTO> getter_info(int message_num) {
		System.out.println("dao - 받은 사람 이름 가져오기 - 상세페이지");
		
		List<MessageDTO> getter_list = sqlSession.selectList("com.spring.tutorial.dao.MessageDAO.getter_info", message_num);
		
		return getter_list;
	}

	
	
	
	
	
	

	
}
