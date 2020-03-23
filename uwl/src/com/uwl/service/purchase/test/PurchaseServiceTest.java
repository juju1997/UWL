package com.uwl.service.purchase.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.uwl.common.Search;
import com.uwl.service.domain.Purchase;
import com.uwl.service.purchase.PurchaseService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml", "classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml", "classpath:config/context-transaction.xml" })
public class PurchaseServiceTest {

	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	public void setPurchaseService(PurchaseService purchaseService) {
		this.purchaseService = purchaseService;
	}

//	@Test
	public void addPurchase() throws Exception {
		Purchase purchase = new Purchase();
		purchase.setUserId("user01");
		purchase.setPaymentOption("3");
		purchase.setImportId("impUid_123123");
		purchase.setItemCategory("1");

		purchaseService.addPurchase(purchase);
	}

//	@Test
	public void getPurchase() throws Exception {
		int purchaseNo = 10029;

		System.out.println(purchaseService.getPurchase(purchaseNo));
	}

	@Test
	public void getPurchaseList() throws Exception {
		String userId = "user01";
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(10);
		search.setSearchCondition("1");
		search.setSearchKeyword("2");

		Map<String, Object> map = purchaseService.getPurchaseList(userId, search);
		System.out.println(map);
	}

//	@Test
	public void refundPurchase() throws Exception {
		int purchaseNo = 10029;

		purchaseService.updateRefundOptionByPurchaseNo(purchaseNo);

	}

}