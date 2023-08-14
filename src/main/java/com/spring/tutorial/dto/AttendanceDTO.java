package com.spring.tutorial.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class AttendanceDTO {

	private String attend_id; // 근태 로그
	private String id; // 사번
	private String name; // 이름
	private String depart_name; // 부서명
	private Date today; // 근태로그 
	private Date hireday; // 입사일
	private Timestamp attendin; // 출근
	private Timestamp attendout; // 퇴근
	private int result; // 업무 여부 (0 업무종료 1 업무)
	private String worktime; // 근무시간 (퇴근시간 - 출근시간)
	private String overtime; // 연장시간 (오후 18:00 이후 연장 처리)
	private String latetime; // 지각시간 (오전 9:30 이후 지각 처리)
	private String departuretime; // 조퇴시간
	private String state; // 근무 상태 (업무, 업무종료, 반차, 연차, 외근, 연장)
	private String year; // 연
	private String month; // 월
	private String day; // 일
	private String dy; // 요일
	
	public AttendanceDTO() {}

	public String getAttend_id() {
		return attend_id;
	}

	public void setAttend_id(String attend_id) {
		this.attend_id = attend_id;
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

	public String getDepart_name() {
		return depart_name;
	}

	public void setDepart_name(String depart_name) {
		this.depart_name = depart_name;
	}

	public Date getToday() {
		return today;
	}

	public void setToday(Date today) {
		this.today = today;
	}

	public Timestamp getAttendin() {
		return attendin;
	}

	public void setAttendin(Timestamp attendin) {
		this.attendin = attendin;
	}

	public Timestamp getAttendout() {
		return attendout;
	}

	public void setAttendout(Timestamp attendout) {
		this.attendout = attendout;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public String getWorktime() {
		return worktime;
	}

	public void setWorktime(String worktime) {
		this.worktime = worktime;
	}

	public String getOvertime() {
		return overtime;
	}

	public void setOvertime(String overtime) {
		this.overtime = overtime;
	}

	public String getLatetime() {
		return latetime;
	}

	public void setLatetime(String latetime) {
		this.latetime = latetime;
	}

	public String getDeparturetime() {
		return departuretime;
	}

	public void setDeparturetime(String departuretime) {
		this.departuretime = departuretime;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getDy() {
		return dy;
	}

	public void setDy(String dy) {
		this.dy = dy;
	}

	public Date getHireday() {
		return hireday;
	}

	public void setHireday(Date hireday) {
		this.hireday = hireday;
	}

	@Override
	public String toString() {
		return "AttendanceDTO [attend_id=" + attend_id + ", id=" + id + ", name=" + name + ", depart_name="
				+ depart_name + ", today=" + today + ", hireday=" + hireday + ", attendin=" + attendin + ", attendout="
				+ attendout + ", result=" + result + ", worktime=" + worktime + ", overtime=" + overtime + ", latetime="
				+ latetime + ", departuretime=" + departuretime + ", state=" + state + ", year=" + year + ", month="
				+ month + ", day=" + day + ", dy=" + dy + "]";
	}

	
}
