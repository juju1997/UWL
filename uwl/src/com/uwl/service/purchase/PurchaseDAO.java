package com.uwl.service.purchase;

import java.util.List;

import com.uwl.common.Search;
import com.uwl.service.domain.Purchase;

public interface PurchaseDAO {
	
	public void addPurchase(Purchase purchase) throws Exception;
	
	public Purchase getPurchase(int purchaseNo) throws Exception;
	
	public List<Purchase> getPurchaseList(String userId, Search search) throws Exception;
	
	public int getTotalCount(String userId, Search search) throws Exception;
	
	public void updateRefundOptionByPurchaseNo(int purchaseNo) throws Exception;
	
	public void updateRefundOptionByItemNo(int itemNo) throws Exception;
	
	public void deletePoint(int purchaseNo) throws Exception;
	
	public void deleteItem(int itemNo) throws Exception;
}
