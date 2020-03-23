package com.uwl.service.domain;

import java.sql.Date;

public class Post {
	
	//Field
	//table과 매칭하기위해 많은 변수를 추가했음 나중에 보고 수정할 것 있으면 수정할것
	private int postNo;	//게시글 번호
	private String userId;
	private User user;	//게시자
	private String postTitle;	//게시글 제목
	private String postContent;	//게시글 내용
	private Date postDate;	//게시 날짜
	private String uploadFileName;	//업로드 파일 이름
	private int hitCount;	//조회수
	private int likeCount;	//좋아요 개수
	private int commentCount;	//댓글 개수
	private String viewStatus;	//출력 여부
		//	1 : 공개
		//	2 : 나만 보기
		//	3 : 비공개
	private String postCategoryNo; 	//게시글 종류
		//	1 : 공지사항
		//	2 : 게시판
		//	3 : ASK
		//	4 : 타임라인
		//	5 : 문의사항
		//	6 : 커플타임라인
		//	7 : 스케줄
	private String gatherCategoryNo; 	//게시글 등록 카테고리
		//	101 : 매칭
		//	102 : 아이템
		//	103 : 도전과제
		//	104 : 결제
		//	105 : 친구
		//	106 : 타임라인
		//	107 : ASK
		//	108 : 계정
		//	109 : 알림
		//	110 : 위치
		//	111 : 기타
		//	201 : 명예의전당
		//	202 : 진학상담
		//	203 : 사랑
		//	204 : 남자끼리
		//	205 : 여자끼리
		//	206 : 데이트
		//	207 : 대나무숲
	private String questionStatus; 	//답변 여부
		//	1 : 답변 미처리
		//	2 : 답변 처리
	private String place; 	//위치
	private int replyPostNo;	//답변 게시글 번호
	private int prePostNo;
	private String prePostTitle;
	private int nextPostNo;
	private String nextPostTitle;
	private String replyContent;
	
	
	//Constructor
	public Post() {
		// TODO Auto-generated constructor stub
	}


	public int getPostNo() {
		return postNo;
	}


	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public String getPostTitle() {
		return postTitle;
	}


	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}


	public String getPostContent() {
		return postContent;
	}


	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}


	public Date getPostDate() {
		return postDate;
	}


	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}


	public String getUploadFileName() {
		return uploadFileName;
	}


	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}


	public int getHitCount() {
		return hitCount;
	}


	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}


	public int getLikeCount() {
		return likeCount;
	}


	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}


	public int getCommentCount() {
		return commentCount;
	}


	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}


	public String getViewStatus() {
		return viewStatus;
	}


	public void setViewStatus(String viewStatus) {
		this.viewStatus = viewStatus;
	}


	public String getPostCategoryNo() {
		return postCategoryNo;
	}


	public void setPostCategoryNo(String postCategoryNo) {
		this.postCategoryNo = postCategoryNo;
	}


	public String getGatherCategoryNo() {
		return gatherCategoryNo;
	}


	public void setGatherCategoryNo(String gatherCategoryNo) {
		this.gatherCategoryNo = gatherCategoryNo;
	}


	public String getQuestionStatus() {
		return questionStatus;
	}


	public void setQuestionStatus(String questionStatus) {
		this.questionStatus = questionStatus;
	}


	public String getPlace() {
		return place;
	}


	public void setPlace(String place) {
		this.place = place;
	}


	public int getReplyPostNo() {
		return replyPostNo;
	}


	public void setReplyPostNo(int replyPostNo) {
		this.replyPostNo = replyPostNo;
	}


	public int getPrePostNo() {
		return prePostNo;
	}


	public void setPrePostNo(int prePostNo) {
		this.prePostNo = prePostNo;
	}


	public String getPrePostTitle() {
		return prePostTitle;
	}


	public void setPrePostTitle(String prePostTitle) {
		this.prePostTitle = prePostTitle;
	}


	public int getNextPostNo() {
		return nextPostNo;
	}


	public void setNextPostNo(int nextPostNo) {
		this.nextPostNo = nextPostNo;
	}


	public String getNextPostTitle() {
		return nextPostTitle;
	}


	public void setNextPostTitle(String nextPostTitle) {
		this.nextPostTitle = nextPostTitle;
	}


	public String getReplyContent() {
		return replyContent;
	}


	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}


	@Override
	public String toString() {
		return "Post [postNo=" + postNo + ", userId=" + userId + ", user=" + user + ", postTitle=" + postTitle
				+ ", postContent=" + postContent + ", postDate=" + postDate + ", uploadFileName=" + uploadFileName
				+ ", hitCount=" + hitCount + ", likeCount=" + likeCount + ", commentCount=" + commentCount
				+ ", viewStatus=" + viewStatus + ", postCategoryNo=" + postCategoryNo + ", gatherCategoryNo="
				+ gatherCategoryNo + ", questionStatus=" + questionStatus + ", place=" + place + ", replyPostNo="
				+ replyPostNo + ", prePostNo=" + prePostNo + ", prePostTitle=" + prePostTitle + ", nextPostNo="
				+ nextPostNo + ", nextPostTitle=" + nextPostTitle + ", replyContent=" + replyContent + "]";
	}


	

	

	
}