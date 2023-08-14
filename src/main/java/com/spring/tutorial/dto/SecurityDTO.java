package com.spring.tutorial.dto;

import java.sql.Date;

public class SecurityDTO {

	private String id;	//사번
	private String name;	//이름
	private String email_in; //이메일
	private String depart_name; //부서
	private String in_tel;	//내선번호
	private Date hireday;	//입사일
	private String state;	//재직상태
	
	
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
	public String getEmail_in() {
		return email_in;
	}
	public void setEmail_in(String email_in) {
		this.email_in = email_in;
	}
	public String getDepart_name() {
		return depart_name;
	}
	public void setDepart_name(String depart_name) {
		this.depart_name = depart_name;
	}
	public String getIn_tel() {
		return in_tel;
	}
	public void setIn_tel(String in_tel) {
		this.in_tel = in_tel;
	}
	public Date getHireday() {
		return hireday;
	}
	public void setHireday(Date hireday) {
		this.hireday = hireday;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "SecurityDTO [id=" + id + ", name=" + name + ", email_in=" + email_in + ", depart_name=" + depart_name
				+ ", in_tel=" + in_tel + ", hireday=" + hireday + ", state=" + state + "]";
	}
	
	
}
