package com.spring.tutorial.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.tutorial.dao.ChatDAOImpl;
import com.spring.tutorial.dto.ChatMessageDTO;
import com.spring.tutorial.dto.ChatRoomDTO;
import com.spring.tutorial.dto.WorkerDTO;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	ChatDAOImpl dao;

	// 채팅방 개설
	@Override
	public int create(HttpServletRequest req, Model model) {
		System.out.println("ChatService => create()");
		
		// 화면에서 입력한 채팅방 이름, 개설자 map에 담기
		String chatroom_name = req.getParameter("chatroom_name"); 
		String id = (String)req.getSession().getAttribute("memberID");
		
		System.out.println("채팅방 이름 : " + chatroom_name + ", 개설자 : " + id);
		
		Map<String, Object> map = new HashMap<>();
		map.put("chatroom_name", chatroom_name);
		map.put("id", id);
		
		return dao.create(map);
		
	}
	
	
	// 채팅방 멤버 추가
	@Override
	public void inviteMember(HttpServletRequest req, Model model) {
		System.out.println("ChatService => inviteMember()");
		
		Map<String, Object> map = new HashMap<>();
		
		// 추가할 채팅방
		String chatroom_num = req.getParameter("chatroom_num");
		map.put("chatroom_num", chatroom_num);
		
		// 추가할 멤버의 id 
		String[] id_arr = req.getParameterValues("chkList");
		if(id_arr != null) {
			for(int i=0; i<id_arr.length; i++) {
				String id = id_arr[i];
				map.put("id", id);
				if(dao.checkMember(map) == 0) { // 채팅방에 없는 경우에만
					dao.inviteMember(map);
				}
			}
		}
		
	}

	// 채팅방 목록
	@Override
	public void list(HttpServletRequest req, Model model) {
		System.out.println("ChatService => list()");
		
		// 세션아이디
		String id = (String)req.getSession().getAttribute("memberID");
		System.out.println("세션아이디 : " + id);
		
		// 로그인 한 아이디가 참여중인 채팅방 목록 불러오기
		List<ChatRoomDTO> list = dao.list(id);
		
		model.addAttribute("list", list);
	}

	// 채팅방 입장
	@Override
	public void enter(HttpServletRequest req, Model model) {
		System.out.println("ChatService => enter()");
		
		String chatroom_num = req.getParameter("chatroom_num");
		
		ChatRoomDTO room = dao.enter(chatroom_num);
		List<WorkerDTO> workerList = dao.workerList(chatroom_num);
		List<WorkerDTO> chatMemberList = dao.chatMemberList(chatroom_num);
		List<ChatMessageDTO> msgList = dao.selectMsg(chatroom_num);
		
		model.addAttribute("room", room);
		model.addAttribute("workerList", workerList);
		model.addAttribute("chatMemberList", chatMemberList);
		model.addAttribute("msgList",msgList);
	}
	
	// 채팅방 나가기
	public void exit(HttpServletRequest req, Model model) {
		System.out.println("ChatService => enter()");
		
		String chatroom_num = req.getParameter("chatroom_num");
		String id = req.getParameter("id");
		
		Map<String, Object> map = new HashMap<>();
		map.put("chatroom_num", chatroom_num);
		map.put("id", id);
		
		System.out.println("나가는 사람 : " + id + ", 채팅방 : " + chatroom_num);
		
		dao.exit(map);
	}
}
