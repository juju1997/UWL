package com.uwl.service.reward;

import java.util.List;
import java.util.Map;

import com.uwl.common.Search;
import com.uwl.service.domain.Purchase;
import com.uwl.service.domain.Reward;

public interface RewardDAO {
	
	//////////////////////2개의 메소드를 이용하여 이용내역과 차감내역을 만들거임//////////////////////
	
	//user의 포인트내역, 활동점수를 조회한다
	public Map<String, Object> getUserBothPointList(Search search,Reward reward) throws Exception;
	
	//user의 포인트내역을 조회한다 = 구매 시 차감내역만 조회가능
	public Map<String, Object> getUserPurchaseList(Search search, Reward reward) throws Exception;
	
	////////////////////////////////////////////////////////////////////////////////////////
	
	//토탈 포인트를 조회하는 method
	public Reward getTotalPoint(String userId) throws Exception;
	
	//incerse 전 마지막 적립된 토탈포인트(reward 컬럼상 totalPoint)를 조회하는 method
	public Reward getTheLatestTotalPoint(String userId) throws Exception;
		
	
	//획득 포인트, 활동점수 
	public void increasePoint(Reward reward) throws Exception;
	
	//purchase해서 감소되는 포인트를 나타내는 로직
	public void decreasePoint(Purchase purchase) throws Exception;
	
	public int getTotalCountOne(Reward reward) throws Exception;
	
	
}
