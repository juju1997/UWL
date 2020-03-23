package com.uwl.service.domain;

import java.sql.Date;

public class Purchase {

	// Field
	private String userId;
	private int purchaseNo;
	private String itemCategory; // 1 : 창  2 : 방패
	private int price;
	private String paymentOption; // 1 : 카드 2 : 포인트
	private String importId;
	private Date purchaseDate;
	private String refundOption; // 1 : 구매 2 : 환불
	private int itemNo;
	private Item item;

	// 추가된 변수명
	// itemCategory, importId
	// purchaseNumber => No로 수정 (table과 매칭)

	// Constructor
	public Purchase() {
		// TODO Auto-generated constructor stub
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getPurchaseNo() {
		return purchaseNo;
	}

	public void setPurchaseNo(int purchaseNo) {
		this.purchaseNo = purchaseNo;
	}

	public String getItemCategory() {
		return itemCategory;
	}

	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPaymentOption() {
		return paymentOption;
	}

	public void setPaymentOption(String paymentOption) {
		this.paymentOption = paymentOption;
	}

	public String getImportId() {
		return importId;
	}

	public void setImportId(String importId) {
		this.importId = importId;
	}

	public Date getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public String getRefundOption() {
		return refundOption;
	}

	public void setRefundOption(String refundOption) {
		this.refundOption = refundOption;
	}
	
	public int getItemNo() {
		return itemNo;
	}
	
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	
	public Item getItem() {
		return item;
	}
	
	public void setItem(Item item) {
		this.item = item;
	}

	@Override
	public String toString() {
		return "Purchase [userId=" + userId + ", purchaseNo=" + purchaseNo + ", itemCategory=" + itemCategory
				+ ", price=" + price + ", paymentOption=" + paymentOption + ", importId=" + importId + ", purchaseDate="
				+ purchaseDate + ", refundOption=" + refundOption + ", itemNo=" + itemNo + ", item=" + item + "]";
	}

}
