package com.spring.tutorial.dto;

import java.sql.Date;

public class BoardCommentDTO {
	private int comment_num;	// pk 댓글번호
	private int board_num;		// fk 글번호
	private String writer;		// 작성자(id 사번)
	private String name;		// 작성자(이름)
	private String content;		// 글내용
	private Date reg_date;		// 작성일
	
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "BoardCommentDTO [comment_num=" + comment_num + ", board_num=" + board_num + ", writer=" + writer
				+ ", name=" + name + ", content=" + content + ", reg_date=" + reg_date + "]";
	}
	
	
}
