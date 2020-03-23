package com.uwl.service.reward.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.uwl.common.Search;
import com.uwl.service.domain.Purchase;
import com.uwl.service.domain.Reward;
import com.uwl.service.reward.RewardDAO;

@Repository("rewardDAOImpl")
public class RewardDAOImpl implements RewardDAO{
	
	//field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	@Value("#{commonProperties['price']}")
	int price;
	
	//constructor
	public RewardDAOImpl() {
		// TODO Auto-generated constructor stub
	}
	
	//setSqlSession
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//포인트, 활동점수 둘 다 이 method를 이용함
	@Override
	public Map<String, Object> getUserBothPointList(Search search, Reward reward) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("RewardDAOImpl getUserBothPointList() 작동 중");
		System.out.println("RewardDAOImpl search : " + search);
		System.out.println("RewardDAOImpl reward : " + reward);
		
		//session전 임시 로그인 아이디
		//reward.setUserId("user01");
		
		map.put("search", search);
		map.put("reward", reward);
		
		List<Reward> list = sqlSession.selectList("RewardMapper.getUserBothPointList", map);
		
		map.put("totalCount", sqlSession.selectOne("RewardMapper.getTotalCountOne", reward));
		map.put("list", list);
		
		System.out.println("totalCount : " + map.get("totalCount"));
		System.out.println("list : " + map.get("list"));
		
		return map;
	}

	@Override
	public Map<String, Object> getUserPurchaseList(Search search, Reward reward) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("RewardDAOImpl getUserPurchaseList() 작동 중");
		System.out.println("RewardDAOImpl search : " + search);
		System.out.println("RewardDAOImpl userId : " + reward);
		
		//session전 임시 로그인 아이디
		//reward.setUserId("user01");
		
		map.put("search", search);
		map.put("reward", reward);
		System.out.println("RewardDAOImpl의 Map.get() : " + map.get("reward"));
		
		List<Reward> list = sqlSession.selectList("RewardMapper.getUserPurchaseList", map);
		System.out.println("RewardDAOImpl list : " + list);
		Reward purReward = new Reward();
		//list에 아무정보가 없다면
		if (list.size() == 0) {
			System.out.println("RewardDAOImpl에 list의 size가 0일때");
			System.out.println("purReward의 값 : " + purReward);
			//사이즈가 없다면 빈깡통을 넣어줌
			Purchase emptyPurchase = new Purchase();
			purReward.setPurchaseItem(emptyPurchase);
		}else {
			System.out.println("RewardDAOImpl에 list의 size가 0이 아닐때");
			purReward.setUserId(list.get(0).getUserId());
			System.out.println(list.get(0).getUserId());
			purReward.setPurchaseItem(list.get(0).getPurchaseItem());
			System.out.println(list.get(0).getPurchaseItem());
		}
		
		
		
		map.put("list", list);
		map.put("totalCount", sqlSession.selectOne("RewardMapper.getTotalCountOne",purReward));
		System.out.println("RewardDAOImpl의 Map의 정보 : " + map);
		
		System.out.println("RewardDAOImpl getUserPurchaseList() totalCount : " + map.get("totalCount"));
		System.out.println("RewardDAOImpl getUserPurchaseList() list : " + map.get("list"));
		
		return map;
	}
	
	@Override
	public Reward getTotalPoint(String userId) throws Exception {
		return sqlSession.selectOne("RewardMapper.getTotalPoint", userId);
	}
	
	@Override
	public Reward getTheLatestTotalPoint(String userId) throws Exception {
		return sqlSession.selectOne("RewardMapper.getTheLatestTotalPoint", userId);
	}
	
	@Override
	public void increasePoint(Reward reward) throws Exception {
		sqlSession.insert("RewardMapper.increasePoint", reward);
	}

	
	@Override
	public void decreasePoint(Purchase purchase) throws Exception {
		
		sqlSession.insert("RewardMapper.decreasePoint", purchase);
		
	}

	@Override
	public int getTotalCountOne(Reward reward) throws Exception {
		return sqlSession.selectOne("RewardMapper.getTotalCountOne", reward);
	}

	

	


	
	
	


}
