package com.spring.tutorial.dto;

import java.sql.Date;
//시/분/초까지 정보를 가져오기 위해서는 util.Date 를 사용해야한다

public class BoardDTO {

	private int num;
	private String category;
	private String id;
	private String name;
	private String title;
	private String content;
	private int read_cnt;
	private int comment_cnt;
	private Date reg_date; 
	private String board_file;
	private int show;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRead_cnt() {
		return read_cnt;
	}
	public void setRead_cnt(int read_cnt) {
		this.read_cnt = read_cnt;
	}
	public int getComment_cnt() {
		return comment_cnt;
	}
	public void setComment_cnt(int comment_cnt) {
		this.comment_cnt = comment_cnt;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getBoard_file() {
		return board_file;
	}
	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}
	public int getShow() {
		return show;
	}
	public void setShow(int show) {
		this.show = show;
	}
	@Override
	public String toString() {
		return "BoardDTO [num=" + num + ", category=" + category + ", id=" + id + ", name=" + name + ", title=" + title
				+ ", content=" + content + ", read_cnt=" + read_cnt + ", comment_cnt=" + comment_cnt + ", reg_date="
				+ reg_date + ", board_file=" + board_file + ", show=" + show + "]";
	}
	
	
	
}
