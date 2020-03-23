package com.uwl.service.domain;

import java.sql.Date;

public class Ask {

	private int questionPostNo;
	private String userId;	//	ASK 주인 TargetUserId임. 등록한 사람의 userId가 아님
	private User user;
	private String questionTitle;
	private String questionContent;
	private Date questionDate;
	private String questionStatus;
	private int answerPostNo;
	private String answerTitle;
	private String answerContent;
	private Date answerDate;
	
	public Ask() {
	}

	public int getQuestionPostNo() {
		return questionPostNo;
	}

	public void setQuestionPostNo(int questionPostNo) {
		this.questionPostNo = questionPostNo;
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

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public Date getQuestionDate() {
		return questionDate;
	}

	public void setQuestionDate(Date questionDate) {
		this.questionDate = questionDate;
	}

	public String getQuestionStatus() {
		return questionStatus;
	}

	public void setQuestionStatus(String questionStatus) {
		this.questionStatus = questionStatus;
	}

	public int getAnswerPostNo() {
		return answerPostNo;
	}

	public void setAnswerPostNo(int answerPostNo) {
		this.answerPostNo = answerPostNo;
	}

	public String getAnswerTitle() {
		return answerTitle;
	}

	public void setAnswerTitle(String answerTitle) {
		this.answerTitle = answerTitle;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public Date getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}

	@Override
	public String toString() {
		return "Ask [questionPostNo=" + questionPostNo + ", userId=" + userId + ", user=" + user + ", questionTitle="
				+ questionTitle + ", questionContent=" + questionContent + ", questionDate=" + questionDate
				+ ", questionStatus=" + questionStatus + ", answerPostNo=" + answerPostNo + ", answerTitle="
				+ answerTitle + ", answerContent=" + answerContent + ", answerDate=" + answerDate + "]";
	}

	
	
}
