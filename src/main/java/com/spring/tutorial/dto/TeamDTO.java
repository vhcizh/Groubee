package com.spring.tutorial.dto;

import java.util.Date;

public class TeamDTO {
	
	private String team_name;  //팀이름
	private String depart_name; //부서명
	private String id;  	   //사번
	private String jobs;       //업무	
	private Date ap_day;       //발령이
	private String contents;   //담당내용
	private String rank;       //직책
	private String name;	  //이름
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public String getDepart_name() {
		return depart_name;
	}
	public void setDepart_name(String depart_name) {
		this.depart_name = depart_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
	public String getJobs() {
		return jobs;
	}
	public void setJobs(String jobs) {
		this.jobs = jobs;
	}
	public Date getAp_day() {
		return ap_day;
	}
	public void setAp_day(Date ap_day) {
		this.ap_day = ap_day;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	@Override
	public String toString() {
		return "TeamDTO [team_name=" + team_name + ", depart_name=" + depart_name + ", id=" + id + ", jobs=" + jobs
				+ ", ap_day=" + ap_day + ", contents=" + contents + ", rank=" + rank + ", name=" + name + "]";
	}
	
	
	

}
