package com.spring.tutorial.dao;

import java.util.List;
import java.util.Map;

import com.spring.tutorial.dto.ChatMessageDTO;
import com.spring.tutorial.dto.ChatRoomDTO;
import com.spring.tutorial.dto.WorkerDTO;

public interface ChatDAO {

	// 채팅방 개설 -- 개설자, 방이름
	public int create(Map<String, Object> map);
	
	// 채팅방 멤버 추가
	public void inviteMember(Map<String, Object> map);
	
	// 채팅방 목록
	public List<ChatRoomDTO> list(String id);
	
	// 채팅방 입장
	public ChatRoomDTO enter(String chatroom_num);

	// 채팅방에 없는 사원 목록
	public List<WorkerDTO> workerList(String chatroom_num);
	
	// 채팅방에 있는 사원 목록
	public List<WorkerDTO> chatMemberList(String chatroom_num);

	// 채팅방 나가기
	public void exit(Map<String, Object> map);
}
