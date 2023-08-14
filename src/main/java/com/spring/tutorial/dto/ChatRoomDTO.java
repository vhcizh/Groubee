package com.spring.tutorial.dto;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.WebSocketSession;

public class ChatRoomDTO {

    private String chatroom_num;
    private String chatroom_name;
    private String id;
    private String chatmem_total;
    
    public String getChatmem_total() {
		return chatmem_total;
	}
	public void setChatmem_total(String chatmem_total) {
		this.chatmem_total = chatmem_total;
	}
	//private Set<WebSocketSession> sessions = new HashSet<>();
    //WebSocketSession은 Spring에서 Websocket Connection이 맺어진 세션
	public String getChatroom_num() {
		return chatroom_num;
	}
	public void setChatroom_num(String chatroom_num) {
		this.chatroom_num = chatroom_num;
	}
	public String getChatroom_name() {
		return chatroom_name;
	}
	public void setChatroom_name(String chatroom_name) {
		this.chatroom_name = chatroom_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "ChatRoomDTO [chatroom_num=" + chatroom_num + ", chatroom_name=" + chatroom_name + ", id=" + id + "]";
	}
    
//  public static ChatRoomDTO create(String name){
//  ChatRoomDTO room = new ChatRoomDTO();
//
//  // room.roomId = UUID.randomUUID().toString();
//  room.roomId = name;
//  room.name = name;
//  return room;
//}


}