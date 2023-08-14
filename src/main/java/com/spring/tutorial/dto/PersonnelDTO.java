package com.spring.tutorial.dto;

import java.util.Date;

//인사평가
public class PersonnelDTO extends CommonDTO{
	
	private String id; 			//사번
	private String depart_name;
	private String team_name;
	private String p_id;		//평가자
	private Date p_day;		//평가년도
	private String p_able;		//역량
	private String p_output;	//성과
	private String p_comment;	//의견
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDepart_name() {
		return depart_name;
	}
	public void setDepart_name(String depart_name) {
		this.depart_name = depart_name;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public Date getP_day() {
		return p_day;
	}
	public void setP_day(Date p_day) {
		this.p_day = p_day;
	}
	public String getP_able() {
		return p_able;
	}
	public void setP_able(String p_able) {
		this.p_able = p_able;
	}
	public String getP_output() {
		return p_output;
	}
	public void setP_output(String p_output) {
		this.p_output = p_output;
	}
	public String getP_comment() {
		return p_comment;
	}
	public void setP_comment(String p_comment) {
		this.p_comment = p_comment;
	}
	
	@Override
	public String toString() {
		return "PersonnelDTO [id=" + id + ", depart_name=" + depart_name + ", team_name=" + team_name + ", p_id=" + p_id
				+", p_day=" + p_day + ", p_able=" + p_able + ", p_output=" + p_output
				+ ", p_comment=" + p_comment + "]";
	
	}

}
