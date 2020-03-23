package com.uwl.service.domain;

import java.sql.Date;

public class Challenge {
	
	//field
	//도전과제 시퀀스, 카테고리
	private int challNo;
	private String challCategory;
	//세부카테고리를 정의
	private String detailCategory;
	
	//CRUD 등록시 - 썸머노트 사용
	private String challTitle;
	private String challContent;
	private Date challDate;
	private Date weeklyStart;
	private Date weeklyEnd;
	
	//도전과제를 수행했을 경우 바인딩해주는 역할 
	private Post post;
	private Commentt commentt;
	private Reward reward;


	//도전과제 flag (1: 수행, 2: 미수행)
	private String challStatus;
	
	//reward가 필요하면 가져올려고 만들었지만 일단은 필요없어서 대기중
	//private Reward reward;
	
	//이전글 이후글로 
	private int preChallNo;
	private int nextChallNo;
	private String preChallTitle;
	private String nextChallTitle;
	
	//Map을 이용한 도전과제 수행 시 위치
	private String firstUser;
	private int firstUserLocation;  //위도, 경도
	private String secondUser;
	private int secondUserLocation;  //위도, 경도
	
	//보상  , 플래그 (1: point 2: activityPoint) table에 컬럼으로 존재 X
	private int challReward;
	private int postCommentComplete;
	//private String rewardCategory;
	
	//공개여부 flag
	private String viewStatus;
	
	



	public Reward getReward() {
		return reward;
	}
	
	
	
	public void setReward(Reward reward) {
		this.reward = reward;
	}
	public int getPreChallNo() {
		return preChallNo;
	}



	public void setPreChallNo(int preChallNo) {
		this.preChallNo = preChallNo;
	}



	public int getNextChallNo() {
		return nextChallNo;
	}



	public void setNextChallNo(int nextChallNo) {
		this.nextChallNo = nextChallNo;
	}



	//Constructor
	public Challenge() {
		// TODO Auto-generated constructor stub
	}



	//Getter, Setter
	public int getChallNo() {
		return challNo;
	}




	public void setChallNo(int challNo) {
		this.challNo = challNo;
	}




	public String getChallCategory() {
		return challCategory;
	}




	public void setChallCategory(String challCategory) {
		this.challCategory = challCategory;
	}




	public String getChallTitle() {
		return challTitle;
	}




	public void setChallTitle(String challTitle) {
		this.challTitle = challTitle;
	}




	public String getChallContent() {
		return challContent;
	}




	public void setChallContent(String challContent) {
		this.challContent = challContent;
	}




	public Date getChallDate() {
		return challDate;
	}




	public void setChallDate(Date challDate) {
		this.challDate = challDate;
	}




	public String getChallStatus() {
		return challStatus;
	}




	public void setChallStatus(String challStatus) {
		this.challStatus = challStatus;
	}




	public String getFirstUser() {
		return firstUser;
	}




	public void setFirstUser(String firstUser) {
		this.firstUser = firstUser;
	}




	public int getFirstUserLocation() {
		return firstUserLocation;
	}




	public void setFirstUserLocation(int firstUserLocation) {
		this.firstUserLocation = firstUserLocation;
	}




	public String getSecondUser() {
		return secondUser;
	}




	public void setSecondUser(String secondUser) {
		this.secondUser = secondUser;
	}




	public int getSecondUserLocation() {
		return secondUserLocation;
	}




	public void setSecondUserLocation(int secondUserLocation) {
		this.secondUserLocation = secondUserLocation;
	}




	public int getChallReward() {
		return challReward;
	}




	public void setChallReward(int challReward) {
		this.challReward = challReward;
	}



	public String getViewStatus() {
		return viewStatus;
	}



	public void setViewStatus(String viewStatus) {
		this.viewStatus = viewStatus;
	}



	public Date getWeeklyStart() {
		return weeklyStart;
	}



	public void setWeeklyStart(Date weeklyStart) {
		this.weeklyStart = weeklyStart;
	}



	public Commentt getCommentt() {
		return commentt;
	}



	public void setCommentt(Commentt commentt) {
		this.commentt = commentt;
	}



	public Post getPost() {
		return post;
	}



	public void setPost(Post post) {
		this.post = post;
	}



	public int getPostCommentComplete() {
		return postCommentComplete;
	}



	public void setPostCommentComplete(int postCommentComplete) {
		this.postCommentComplete = postCommentComplete;
	}






	public Date getWeeklyEnd() {
		return weeklyEnd;
	}



	public void setWeeklyEnd(Date weeklyEnd) {
		this.weeklyEnd = weeklyEnd;
	}



	public String getPreChallTitle() {
		return preChallTitle;
	}



	public void setPreChallTitle(String preChallTitle) {
		this.preChallTitle = preChallTitle;
	}



	public String getNextChallTitle() {
		return nextChallTitle;
	}



	public void setNextChallTitle(String nextChallTitle) {
		this.nextChallTitle = nextChallTitle;
	}



	public String getDetailCategory() {
		return detailCategory;
	}



	public void setDetailCategory(String detailCategory) {
		this.detailCategory = detailCategory;
	}






	@Override
	public String toString() {
		return "Challenge [challNo=" + challNo + ", challCategory=" + challCategory + ", detailCategory="
				+ detailCategory + ", challTitle=" + challTitle + ", challContent=" + challContent + ", challDate="
				+ challDate + ", weeklyStart=" + weeklyStart + ", weeklyEnd=" + weeklyEnd + ", post=" + post
				+ ", commentt=" + commentt + ", reward=" + reward + ", challStatus=" + challStatus + ", preChallNo="
				+ preChallNo + ", nextChallNo=" + nextChallNo + ", preChallTitle=" + preChallTitle + ", nextChallTitle="
				+ nextChallTitle + ", firstUser=" + firstUser + ", firstUserLocation=" + firstUserLocation
				+ ", secondUser=" + secondUser + ", secondUserLocation=" + secondUserLocation + ", challReward="
				+ challReward + ", postCommentComplete=" + postCommentComplete + ", viewStatus=" + viewStatus + "]";
	}
	
	


}
