package com.uwl.service.domain;

public class SchoolRank {
	
	//field
	private int rankNo;
	private String userId;
	//private User user;
	
	//학교 정보를 가져오는 변수
	private int schoolNo;
	private String schoolName;
	private String schoolAddress;
	
	//학교랭킹을 가져올 수
	private int ranking;
	
	//재학중인 총 학생인원 수, 재학중인 총 활동점수
	private int totalUser;
	private int totalActivityPoint;
	
	//개인랭킹
	private int recentlyTotalActivityPoint;
	
	
	//Constructor
	public SchoolRank() {
		// TODO Auto-generated constructor stub
	}

	//getter, setter
	public int getRankNo() {
		return rankNo;
	}


	public void setRankNo(int rankNo) {
		this.rankNo = rankNo;
	}






	public int getSchoolNo() {
		return schoolNo;
	}


	public void setSchoolNo(int schoolNo) {
		this.schoolNo = schoolNo;
	}


	public String getSchoolName() {
		return schoolName;
	}


	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}


	public String getSchoolAddress() {
		return schoolAddress;
	}


	public void setSchoolAddress(String schoolAddress) {
		this.schoolAddress = schoolAddress;
	}


	public int getTotalUser() {
		return totalUser;
	}


	public void setTotalUser(int totalUser) {
		this.totalUser = totalUser;
	}


	public int getTotalActivityPoint() {
		return totalActivityPoint;
	}


	public void setTotalActivityPoint(int totalActivityPoint) {
		this.totalActivityPoint = totalActivityPoint;
	}


	public int getRanking() {
		return ranking;
	}

	public void setRanking(int ranking) {
		this.ranking = ranking;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getRecentlyTotalActivityPoint() {
		return recentlyTotalActivityPoint;
	}

	public void setRecentlyTotalActivityPoint(int recentlyTotalActivityPoint) {
		this.recentlyTotalActivityPoint = recentlyTotalActivityPoint;
	}

	@Override
	public String toString() {
		return "SchoolRank [rankNo=" + rankNo + ", userId=" + userId + ", schoolNo=" + schoolNo
				+ ", schoolName=" + schoolName + ", schoolAddress=" + schoolAddress + ", ranking=" + ranking
				+ ", totalUser=" + totalUser + ", totalActivityPoint=" + totalActivityPoint
				+ ", recentlyTotalActivityPoint=" + recentlyTotalActivityPoint + "]";
	}



	
	
	
}
