package com.uwl.service.domain;

public class Likey {
	
	//Field
	private int likeNo;	//좋아요 번호
	private int refCommentNo;	//참조 번호 (댓글)
	private int refPostNo;	//참조 번호(게시글)
	private String userId;		//회원 아이디
	private String likeWhat;	//참조 플래그
		//	1:게시글
		//	2:댓글
	
	
	//Constructor
	public Likey() {
		// TODO Auto-generated constructor stub
	}


	public int getLikeNo() {
		return likeNo;
	}


	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}


	public int getRefCommentNo() {
		return refCommentNo;
	}


	public void setRefCommentNo(int refCommentNo) {
		this.refCommentNo = refCommentNo;
	}


	public int getRefPostNo() {
		return refPostNo;
	}


	public void setRefPostNo(int refPostNo) {
		this.refPostNo = refPostNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getLikeWhat() {
		return likeWhat;
	}


	public void setLikeWhat(String likeWhat) {
		this.likeWhat = likeWhat;
	}


	@Override
	public String toString() {
		return "Likey [likeNo=" + likeNo + ", refCommentNo=" + refCommentNo + ", refPostNo=" + refPostNo + ", userId="
				+ userId + ", likeWhat=" + likeWhat + "]";
	}
	
	
}
