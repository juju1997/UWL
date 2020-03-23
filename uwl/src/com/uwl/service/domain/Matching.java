package com.uwl.service.domain;

import java.sql.Date;

public class Matching {

	private int matchingNo;
	private String firstUserId;
	private String secondUserId;
	private Date sendDate;
	private String matchingStatus;
	
	private Date deleteDate;
	
	public Matching() {
		
	}

	public int getMatchingNo() {
		return matchingNo;
	}

	public void setMatchingNo(int matchingNo) {
		this.matchingNo = matchingNo;
	}

	public String getFirstUserId() {
		return firstUserId;
	}

	public void setFirstUserId(String firstUserId) {
		this.firstUserId = firstUserId;
	}

	public String getSecondUserId() {
		return secondUserId;
	}

	public void setSecondUserId(String secondUserId) {
		this.secondUserId = secondUserId;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public String getMatchingStatus() {
		return matchingStatus;
	}

	public void setMatchingStatus(String matchingStatus) {
		this.matchingStatus = matchingStatus;
	}

	

	public Date getDeleteDate() {
		return deleteDate;
	}

	public void setDeleteDate(Date deleteDate) {
		this.deleteDate = deleteDate;
	}

	@Override
	public String toString() {
		return "Matching [matchingNo=" + matchingNo + ", firstUserId=" + firstUserId + ", secondUserId=" + secondUserId
				+ ", sendDate=" + sendDate + ", matchingStatus=" + matchingStatus + ", deleteDate=" + deleteDate + "]";
	}
	
	
	
	
}
