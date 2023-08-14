package com.spring.tutorial.dao;

import java.util.List;

import com.spring.tutorial.dto.MessageDTO;

public interface MessageDAO {
	
	// 메세지쓰기 - 받는사람
	public List<MessageDTO> recipientList_depart();
	
	// 메세지 보내기
	public int messageSend(MessageDTO dto);
	
	// 메세지 보내기 - 임시보관
	public int messageSend_tempo(MessageDTO dto);
	
	// 받은메세지 리스트
	public List<MessageDTO> getMsgList(String getter_id);
	
	// 보낸메세지 리스트
	public List<MessageDTO> sendMsgList(String id);
		
	// 임시보관함 리스트
	public List<MessageDTO> tempoMsgList(String id);
	
	// 휴지통 리스트 => 보낸메세지
	public List<MessageDTO> trashMsgList(String getter_id);
	
	// 휴지통 리스트 => 받은메세지
	public List<MessageDTO> trashMsgList_get(String getter_id);
	
	// 메세지 읽기
	public List<MessageDTO> readMsgDetail(int message_num);
	
	// 메세지 읽기 - 임시보관함
	public List<MessageDTO> readTempoDetail(int message_num);
	
	// 메세지 읽음 상태변경
	public int updateState_read(int message_num);
	
	// 메세지 안읽음 상태변경
	public int updateState_unread(int message_num);
	
	// 메세지 휴지통으로 이동
	public int deleteMessage(int message_num);
	
	// 메세지 복원
	public int returnMessage(int message_num);
	
	// 메세지 완전삭제
	public int completeDeleteMessage(int message_num);
	
	// 메세지 발신취소 가능여부 확인
	public int cancleMsgChk(int message_num);
	
	// 메세지 읽은시간 입력
	public int updateReadDate(int message_num);
	
	// 메세지 읽은날짜 확인
	public int checkReadDate(int message_num);
	
	// 메세지 임시저장
	public int sendTempoMsg(MessageDTO dto);
	
	// 메세지 임시저장 불러오기
	public List<MessageDTO> getTempoMsg(int message_num);
	
	// 임시보관함 메세지 전송 후 상태 변경
	public int updateHolding(int message_num);
	
	// 받은 사람 이름 가져오기 - 상세페이지
	public List<MessageDTO> getter_info(int message_num);
	
}
