package com.uwl.web.purchase;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.uwl.service.domain.Item;
import com.uwl.service.domain.Purchase;
import com.uwl.service.domain.Reward;
import com.uwl.service.imp.ImpService;
import com.uwl.service.imp.impl.ImpServiceImpl;
import com.uwl.service.matching.MatchingService;
import com.uwl.service.purchase.PurchaseService;
import com.uwl.service.reward.RewardService;

@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {

	@Autowired
	private ImpService impService;

	@Autowired
	private PurchaseService purchaseService;

	@Autowired
	@Qualifier("rewardServiceImpl")
	private RewardService rewardService;

	@Autowired
	private MatchingService matchingService;

	@RequestMapping(value = "rest/impInfo", method = RequestMethod.POST)
	public Map impInfo(@RequestParam String importId) throws Exception {
		return impService.impInfo(importId);
	}

	@RequestMapping(value = "rest/addPurchase", method = RequestMethod.POST)
	public Map addPurchase(@RequestBody Purchase purchase) throws Exception {
		System.out.println(purchase);

		Item item = new Item();
		item.setFirstUserId(purchase.getUserId());
		item.setItemCategory(purchase.getItemCategory());

		matchingService.addItem(item); // 아이템 추가
		purchaseService.addPurchase(purchase);

		// point로 구매시 REWARD TABLE에 INSERT
		if (purchase.getPaymentOption().equals("2")) {
			rewardService.decreasePoint(purchase);
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", true);
		return map;
	}

	@RequestMapping(value = "rest/cancelPurchase", method = RequestMethod.POST)
	public Map cancelPuchase(@RequestBody Purchase purchase) throws Exception {
		System.out.println("restController purchase : " + purchase);
		Map<String, Object> map = new HashMap<String, Object>();
		if (purchase.getPaymentOption().equals("1")) {
			map = impService.impCancel(purchase.getImportId()); 	// 아임포트 결제취소
		} else if(purchase.getPaymentOption().equals("2")) {
			purchaseService.deletePoint(purchase.getPurchaseNo());		//	포인트내역 삭제
			map.put("code", "0");
		}

		purchaseService.updateRefundOptionByPurchaseNo(purchase.getPurchaseNo());	// 환불여부 업데이트
		purchaseService.deleteItem(purchase.getItemNo());	//	아이템 삭제
		
		return map;
	}
}
