package com.spring.tutorial.dto;

// 회사 정보 + 근태내규
public class CompanyDTO {
	
	private int company_id;   //회사번호
	private int c_attend_id; // 근무설정번호	
	private String attendin; //출근시간
	private String attendout; // 퇴근 시간
	private String rest_in;	// 쉬는 시간 시작
	private String rest_out; // 쉬는 시간 종료
	private String over_in; // 연장 근무 시작
	private String over_out; //연장 근무 종료	
	private String c_name;    //회사명
	private String c_address; //회사주소
	private int c_number;     //사업자등록번호
	private int show; 	//노출여부
	
	public int getCompany_id() {
		return company_id;
	}
	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_address() {
		return c_address;
	}
	public void setC_address(String c_address) {
		this.c_address = c_address;
	}
	public int getC_number() {
		return c_number;
	}
	public void setC_number(int c_number) {
		this.c_number = c_number;
	}
	public int getShow() {
		return show;
	}
	public void setShow(int show) {
		this.show = show;
	}
	public int getC_attend_id() {
		return c_attend_id;
	}
	public void setC_attend_id(int c_attend_id) {
		this.c_attend_id = c_attend_id;
	}
	public String getAttendin() {
		return attendin;
	}
	public void setAttendin(String attendin) {
		this.attendin = attendin;
	}
	public String getAttendout() {
		return attendout;
	}
	public void setAttendout(String attendout) {
		this.attendout = attendout;
	}
	public String getRest_in() {
		return rest_in;
	}
	public void setRest_in(String rest_in) {
		this.rest_in = rest_in;
	}
	public String getRest_out() {
		return rest_out;
	}
	public void setRest_out(String rest_out) {
		this.rest_out = rest_out;
	}
	public String getOver_in() {
		return over_in;
	}
	public void setOver_in(String over_in) {
		this.over_in = over_in;
	}
	public String getOver_out() {
		return over_out;
	}
	public void setOver_out(String over_out) {
		this.over_out = over_out;
	}
	
	@Override
	public String toString() {
		return "CompanyDTO [company_id=" + company_id + ", c_attend_id=" + c_attend_id + ", attendin=" + attendin
				+ ", attendout=" + attendout + ", rest_in=" + rest_in + ", rest_out=" + rest_out + ", over_in="
				+ over_in + ", over_out=" + over_out + ", c_name=" + c_name + ", c_address=" + c_address + ", c_number="
				+ c_number + ", show=" + show + "]";
	}	
	
	

}
