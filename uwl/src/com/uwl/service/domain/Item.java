package com.uwl.service.domain;

import java.sql.Date;

public class Item {

	private int itemNo;
	private String firstUserId;
	private String secondUserId;
	private String itemCategory;
	private String useResult;
	private Date useDate;
	private String itemDefault;
	
	public Item() {
		
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
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

	public String getItemCategory() {
		return itemCategory;
	}

	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
	}

	public String getUseResult() {
		return useResult;
	}

	public void setUseResult(String useResult) {
		this.useResult = useResult;
	}

	public Date getUseDate() {
		return useDate;
	}

	public void setUseDate(Date useDate) {
		this.useDate = useDate;
	}

	public String getItemDefault() {
		return itemDefault;
	}

	public void setItemDefault(String itemDefault) {
		this.itemDefault = itemDefault;
	}

	@Override
	public String toString() {
		return "Item [itemNo=" + itemNo + ", firstUserId=" + firstUserId + ", secondUserId=" + secondUserId
				+ ", itemCategory=" + itemCategory + ", useResult=" + useResult + ", useDate=" + useDate
				+ ", itemDefault=" + itemDefault + "]";
	}
	
	
	
}
