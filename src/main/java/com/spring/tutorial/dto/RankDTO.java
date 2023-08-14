package com.spring.tutorial.dto;

//직책
public class RankDTO {
	
	private String rank; 	//직책명
	private String company_id; //회사명
	private int ranking; 	   //직급순위
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getCompany_id() {
		return company_id;
	}
	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}
	public int getRanking() {
		return ranking;
	}
	public void setRanking(int ranking) {
		this.ranking = ranking;
	}
	@Override
	public String toString() {
		return "RankDTO [rank=" + rank + ", company_id=" + company_id + ", ranking=" + ranking + "]";
	}
	
	

}
