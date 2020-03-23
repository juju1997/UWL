package com.uwl.service.domain;

import java.sql.Date;

public class Chatting {
	
	private String master;	//개설자
	
	private String masterName;	//개설자 이름
	
	private String enterUser; //참가자
	
	private String enterUserName;	//참가자 이름
	
	private int roomNo;	//방 번호
	
	private String lastChat;
	
	private Date lastDate;
	

	public Chatting() {
		
	}
	
	public String getLastChat() {
		return lastChat;
	}
	
	public void setLastChat(String lastChat) {
		this.lastChat = lastChat;
	}
	
	public Date getLastDate() {
		return lastDate;
	}
	
	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}

	public String getMaster() {
		return master;
	}

	public void setMaster(String master) {
		this.master = master;
	}

	public String getMasterName() {
		return masterName;
	}

	public void setMasterName(String masterName) {
		this.masterName = masterName;
	}

	public String getEnterUser() {
		return enterUser;
	}

	public void setEnterUser(String enterUser) {
		this.enterUser = enterUser;
	}

	public String getEnterUserName() {
		return enterUserName;
	}

	public void setEnterUserName(String enterUserName) {
		this.enterUserName = enterUserName;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	@Override
	public String toString() {
		return "Chatting [master=" + master + ", masterName=" + masterName + ", enterUser=" + enterUser
				+ ", enterUserName=" + enterUserName + ", roomNo=" + roomNo + ", lastChat=" + lastChat + ", lastDate="
				+ lastDate + "]";
	}


}
