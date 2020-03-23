package com.uwl.service.domain;

import java.sql.Date;

public class Notification {
	
	//Field
	private int notiNo;
	private User sender;
	private String senderId;
	private String receiverId;
	private int postNo;
	private String notiOrigin;
//	1:게시글
//	2.ask
//	3. 타임라인
//	4. 친구
//	5. 문의사항
	private String notiCode;
//	1:댓글
//	2:답변
//	3.친구신청
//	4.친구수락
//	5. (Ask)등록
	private String notiDate;
	//변수명과 table명을 일치시킴. 
	
	public Notification() {
		// TODO Auto-generated constructor stub
	}

	public int getNotiNo() {
		return notiNo;
	}

	public void setNotiNo(int notiNo) {
		this.notiNo = notiNo;
	}

	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getNotiOrigin() {
		return notiOrigin;
	}

	public void setNotiOrigin(String notiOrigin) {
		this.notiOrigin = notiOrigin;
	}

	public String getNotiCode() {
		return notiCode;
	}

	public void setNotiCode(String notiCode) {
		this.notiCode = notiCode;
	}

	public String getNotiDate() {
		return notiDate;
	}

	public void setNotiDate(String notiDate) {
		this.notiDate = notiDate;
	}

	@Override
	public String toString() {
		return "Notification [notiNo=" + notiNo + ", sender=" + sender + ", senderId=" + senderId + ", receiverId="
				+ receiverId + ", postNo=" + postNo + ", notiOrigin=" + notiOrigin + ", notiCode=" + notiCode
				+ ", notiDate=" + notiDate + "]";
	}
	
	
	
}	
