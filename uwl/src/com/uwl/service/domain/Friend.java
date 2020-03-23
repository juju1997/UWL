package com.uwl.service.domain;

public class Friend {

	private int friendNo;
	private String firstUserId;  // 친구신청한 사람 
	private String secondUserId;  // 친구신청받은 사람
	private String friendStatus;  // 1.친구신청 2. 친구수락
	//  Friend searchCondition  0: userId  1: name  2: schoolNo
	
	public Friend() {
	}

	public int getFriendNo() {
		return friendNo;
	}

	public void setFriendNo(int friendNo) {
		this.friendNo = friendNo;
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

	public String getFriendStatus() {
		return friendStatus;
	}

	public void setFriendStatus(String friendStatus) {
		this.friendStatus = friendStatus;
	}

	@Override
	public String toString() {
		return "Friend [friendNo=" + friendNo + ", firstUserId=" + firstUserId + ", secondUserId=" + secondUserId
				+ ", friendStatus=" + friendStatus + "]";
	}
	
}
