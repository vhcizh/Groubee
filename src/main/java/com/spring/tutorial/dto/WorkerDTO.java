package com.spring.tutorial.dto;

public class WorkerDTO {

	private String id;			// 사번
	private String name;		// 이름
	private String depart_name;	// 부서명
	private String rank;		// 직급
	
	
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
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	@Override
	public String toString() {
		return "WorkerDTO [id=" + id + ", name=" + name + ", depart_name=" + depart_name + ", rank=" + rank + "]";
	}
	
	
}
