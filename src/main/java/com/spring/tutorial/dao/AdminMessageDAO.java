package com.spring.tutorial.dao;

import java.util.List;

import com.spring.tutorial.dto.MessageDTO;

public interface AdminMessageDAO {
	
	// 메세지 전체 리스트 - 초기화면
	public List<MessageDTO> everyMsgList();
	
	// 메세지 세부내용 보기
	public List<MessageDTO> DetailMsg(int message_num);
	
	// 
	
	
}
