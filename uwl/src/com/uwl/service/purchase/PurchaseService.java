package com.uwl.service.purchase;

import java.util.Map;

import com.uwl.common.Search;
import com.uwl.service.domain.Purchase;

public interface PurchaseService {
	
	public void addPurchase(Purchase purchase) throws Exception;
	
	public Purchase getPurchase(int purchaseNo) throws Exception;
	
	public Map<String, Object> getPurchaseList(String userId, Search search) throws Exception;
	
	public void updateRefundOptionByPurchaseNo(int purchaseNo) throws Exception;
	
	public void updateRefundOptionByItemNo(int itemNo) throws Exception;
	
	public void deletePoint(int purchaseNo) throws Exception;
	
	public void deleteItem(int itemNo) throws Exception;
}
