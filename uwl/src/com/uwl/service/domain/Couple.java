package com.uwl.service.domain;

import java.sql.Date;

public class Couple {

	private int	coupleNo;
	private String firstUserId;
	private String secondUserId;
	private Date matchingDate;
	private String deleteStatus;
	
	public Couple() {
		
	}

	public int getCoupleNo() {
		return coupleNo;
	}

	public void setCoupleNo(int coupleNo) {
		this.coupleNo = coupleNo;
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

	public Date getMatchingDate() {
		return matchingDate;
	}

	public void setMatchingDate(Date matchingDate) {
		this.matchingDate = matchingDate;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	@Override
	public String toString() {
		return "Couple [coupleNo=" + coupleNo + ", firstUserId=" + firstUserId + ", secondUserId=" + secondUserId
				+ ", matchingDate=" + matchingDate + ", deleteStatus=" + deleteStatus + "]";
	}
	
	
}
