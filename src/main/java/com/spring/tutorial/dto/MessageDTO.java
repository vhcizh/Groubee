package com.spring.tutorial.dto;

import java.sql.Date;

public class MessageDTO {

	private int message_num; // 메세지 번호
	private String id; // 작성자 아이디
	private String getter_id; // 수신자 아이디
	private String title; // 메세지 제목
	private String contents; // 메세지 내용
	private String files; // 첨부파일
	private String nonfiles; // 첨부파일이 없을때 사용
	private Date send_date; // 발송일시
	private int trash; // 노출0, 휴지통1
	private int holding; // 노출0, 임시보관1
	private int state; // 안읽음0, 읽음1
	private Date read_date; // 메세지 읽은 일시
	private String name; // 직원 이름
	private String depart_name; // 부서 이름

	public MessageDTO() {
	}

	public int getMessage_num() {
		return message_num;
	}

	public void setMessage_num(int message_num) {
		this.message_num = message_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGetter_id() {
		return getter_id;
	}

	public void setGetter_id(String getter_id) {
		this.getter_id = getter_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}

	public String getNonfiles() {
		return nonfiles;
	}

	public void setNonfiles(String nonfiles) {
		this.nonfiles = nonfiles;
	}

	public Date getSend_date() {
		return send_date;
	}

	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}

	public int getTrash() {
		return trash;
	}

	public void setTrash(int trash) {
		this.trash = trash;
	}

	public int getHolding() {
		return holding;
	}

	public void setHolding(int holding) {
		this.holding = holding;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Date getRead_date() {
		return read_date;
	}

	public void setRead_date(Date read_date) {
		this.read_date = read_date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepart_name() {
		return depart_name;
	}

	public void setDepart_name(String depart_name) {
		this.depart_name = depart_name;
	}

	@Override
	public String toString() {
		return "MessageDTO [message_num=" + message_num + ", id=" + id + ", getter_id=" + getter_id + ", title=" + title
				+ ", contents=" + contents + ", files=" + files + ", nonfiles=" + nonfiles + ", send_date=" + send_date
				+ ", trash=" + trash + ", holding=" + holding + ", state=" + state + ", read_date=" + read_date
				+ ", name=" + name + ", depart_name=" + depart_name + "]";
	}

}
