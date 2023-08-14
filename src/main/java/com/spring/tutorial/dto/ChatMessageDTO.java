package com.spring.tutorial.dto;

public class ChatMessageDTO {
	
	private String roomId;	// 채팅방 번호
    private String writer;	// 작성자 사번
    private String message;	// 메세지
    private String name;	// 작성자 이름
    private String regdate;	// 작성일
    private String invite;	// 초대받은사람
    
	public String getInvite() {
		return invite;
	}
	public void setInvite(String invite) {
		this.invite = invite;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	@Override
	public String toString() {
		return "ChatMessage [roomId=" + roomId + ", writer=" + writer + ", message=" + message + "]";
	}

    
}