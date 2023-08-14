package com.spring.tutorial.dto;

import java.sql.Date;

public class AnnualDTO {

	private String annual_id; // 연차 신청 번호
	private String id; // 사번
	private String image; // 프로필 사진
	private String name; // 이름
	private String depart_name; // 부서명
	private Date hireday; // 입사일
	private Date today; // 신청일
	private String year; // 신청 연
	private String month; // 신청 월
	private Date annual_in; // 연차 시작일
	private Date annual_out; // 연차 종료일
	private String annual; // 연차  반차 
	private double annualtotal; // 총 연차(연 기본 15)
	private double annualuse; // 연차 사용량
	private double annualrest; // 잔여 연차	
	private String state; // 상태 (신청, 확인, 반려, 완료, 취소)	
	
	public AnnualDTO() {}

	public String getAnnual_id() {
		return annual_id;
	}

	public void setAnnual_id(String annual_id) {
		this.annual_id = annual_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public Date getAnnual_in() {
		return annual_in;
	}

	public void setAnnual_in(Date annual_in) {
		this.annual_in = annual_in;
	}

	public Date getAnnual_out() {
		return annual_out;
	}

	public void setAnnual_out(Date annual_out) {
		this.annual_out = annual_out;
	}

	public String getAnnual() {
		return annual;
	}

	public void setAnnual(String annual) {
		this.annual = annual;
	}

	public double getAnnualtotal() {
		return annualtotal;
	}

	public void setAnnualtotal(double annualtotal) {
		this.annualtotal = annualtotal;
	}

	public double getAnnualuse() {
		return annualuse;
	}

	public void setAnnualuse(double annualuse) {
		this.annualuse = annualuse;
	}

	public double getAnnualrest() {
		return annualrest;
	}

	public void setAnnualrest(double annualrest) {
		this.annualrest = annualrest;
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

	public Date getHireday() {
		return hireday;
	}

	public void setHireday(Date hireday) {
		this.hireday = hireday;
	}

	@Override
	public String toString() {
		return "AnnualDTO [annual_id=" + annual_id + ", id=" + id + ", image=" + image + ", name=" + name
				+ ", depart_name=" + depart_name + ", hireday=" + hireday + ", today=" + today + ", year=" + year
				+ ", month=" + month + ", annual_in=" + annual_in + ", annual_out=" + annual_out + ", annual=" + annual
				+ ", annualtotal=" + annualtotal + ", annualuse=" + annualuse + ", annualrest=" + annualrest
				+ ", state=" + state + "]";
	}

	
}
