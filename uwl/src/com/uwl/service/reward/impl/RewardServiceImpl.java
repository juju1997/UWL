package com.uwl.service.reward.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.uwl.common.Search;
import com.uwl.service.challenge.ChallengeDAO;
import com.uwl.service.domain.Purchase;
import com.uwl.service.domain.Reward;
import com.uwl.service.reward.RewardDAO;
import com.uwl.service.reward.RewardService;

@Service("rewardServiceImpl")
public class RewardServiceImpl implements RewardService{
	
	//Field
	@Autowired
	@Qualifier("rewardDAOImpl")
	private RewardDAO rewardDAO;
	
//	@Autowired
//	@Qualifier("ChallengeDAOImpl")
//	private ChallengeDAO challengeDAO;
	
	
	//setter
	public void setRewardDAO(RewardDAO rewardDAO) {
		this.rewardDAO = rewardDAO;
	}
	
	
//	public void setChallengeDAO(ChallengeDAO challengeDAO) {
//		this.challengeDAO = challengeDAO;
//	}


	//Constructor
	public RewardServiceImpl() {
		System.out.println(this.getClass());
	}

	//Method
	@Override
	public Map<String,Object> getUserBothPointList(Search search, Reward reward) throws Exception {
		
		System.out.println("RewardServiceImple getUserBothPointList() 작동 중");
		Purchase purchaseItem = new Purchase();
		
		reward.setPurchaseItem(purchaseItem);
		
		int totalCount = rewardDAO.getTotalCountOne(reward);
		
		System.out.println("ServiceImpl getUserBothPointList() 넘어온 reward값 : " + reward);
		
		System.out.println("ServiceImpl getUserBothPointList() totalcount : " + totalCount);
		
		Map<String, Object> map = rewardDAO.getUserBothPointList(search, reward);
		System.out.println("ServiceImpl getUserBothPointList() list : " + map.get("list"));
		map.put("totalCount", new Integer(totalCount));
		map.put("list", map.get("list"));
		
		return map;
	}
	
	@Override
	public Map<String, Object> getUserPurchaseList(Search search, Reward reward) throws Exception {
		
		System.out.println("RewardServiceImple getUserPurchaseList() 작동 중");
		
		System.out.println("RewardServiceImple getUserPurchaseList() reward : " + reward);
		
		int totalCount = rewardDAO.getTotalCountOne(reward);
		
		Map<String, Object> map = rewardDAO.getUserPurchaseList(search, reward);
		
		map.put("totalCount", new Integer(totalCount));
		map.put("list", map.get("list"));
		System.out.println("======>>>><<>>RewardServiceImple 끝");
		return map;
		
	}
	
	@Override
	public Reward getTotalPoint(String userId) throws Exception {
		return rewardDAO.getTotalPoint(userId);
	}
	
	@Override
	public Reward getTheLatestTotalPoint(String userId) throws Exception {
		return rewardDAO.getTheLatestTotalPoint(userId);
	}


	@Override
	public void increasePoint(Reward reward) throws Exception {
		rewardDAO.increasePoint(reward);
	}


	@Override
	public void decreasePoint(Purchase purchase) throws Exception {
		rewardDAO.decreasePoint(purchase);
	}


	

	





}
