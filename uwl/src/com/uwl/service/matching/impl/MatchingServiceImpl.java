package com.uwl.service.matching.impl;

import java.math.MathContext;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.uwl.common.Search;
import com.uwl.service.domain.Item;
import com.uwl.service.domain.Matching;
import com.uwl.service.matching.MatchingDAO;
import com.uwl.service.matching.MatchingService;

@Service("matchingServiceImpl")
public class MatchingServiceImpl implements MatchingService{
	
	@Autowired
	@Qualifier("matchingDAOImpl")
	private MatchingDAO matchingDAO;
	public void setMatchingDAO(MatchingDAO matchingDAO) {
		this.matchingDAO = matchingDAO;
	}
	
	public MatchingServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addMatching(Matching matching) throws Exception {
		// TODO Auto-generated method stub
		matchingDAO.addMatching(matching);
	}

	@Override
	public Matching getMatching(String userId) throws Exception {
		// TODO Auto-generated method stub
		return matchingDAO.getMatching(userId);
	}
	
	@Override
	public Matching getMatchingByUserId(String userId) throws Exception {
		// TODO Auto-generated method stub
		return matchingDAO.getMatchingByUserId(userId);
	}
	
	@Override
	public void updateMatching(Matching matching) throws Exception {
		// TODO Auto-generated method stub
		matchingDAO.updateMatching(matching);
	}

	@Override
	public void deleteMatching(Matching matching) throws Exception {
		// TODO Auto-generated method stub
		matchingDAO.deleteMatching(matching);
	}

	@Override
	public Map<String, Object> getMatchingList(Search search, String userId) throws Exception {
		// TODO Auto-generated method stub
		List<Matching> list = matchingDAO.getMatchingList(search, userId);
		int totalMatching = matchingDAO.getTotalMatching(search, userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalMatching", new Integer(totalMatching));
		
		return map;
	}

	@Override
	public Map<String, Object> getAllMatchingList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<Matching> list = matchingDAO.getAllMatchingList(search);
		int totalMatchingCount = matchingDAO.getTotalMatchingCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalMatchingCount", new Integer(totalMatchingCount));
		
		return map;
	}

	@Override
	public int getTotalMatching(Search search, String userId) throws Exception {
		// TODO Auto-generated method stub
		return matchingDAO.getTotalMatching(search, userId);
	}
	
	@Override
	public void addItem(Item item) throws Exception {
		// TODO Auto-generated method stub
		matchingDAO.addItem(item);
	}

	@Override
	public Item getItem(String userId, String itemCategory) throws Exception {
		// TODO Auto-generated method stub
		return matchingDAO.getItem(userId, itemCategory);
	}

	@Override
	public void updateItem(Item item) throws Exception {
		// TODO Auto-generated method stub
		matchingDAO.updateItem(item);
	}

	@Override
	public Map<String, Object> getItemList(Search search, String userId, String itemCategory) throws Exception {
		// TODO Auto-generated method stub
		List<Item> list = matchingDAO.getItemList(search, userId, itemCategory);
		int totalItem = matchingDAO.getTotalItem(search, userId, itemCategory);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalItem", new Integer(totalItem));
		
		return map;
	}

	@Override
	public Map<String, Object> getAllItemList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<Item> list = matchingDAO.getAllItemList(search);
		int totalItemCount = matchingDAO.getTotalItemCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalItemCount", new Integer(totalItemCount));
		
		return map;
	}

	@Override
	public int getTotalItem(Search search, String userId, String itemCategory) throws Exception {
		// TODO Auto-generated method stub
		return matchingDAO.getTotalItem(search, userId, itemCategory);
	}

	
	
	
	@Override
	public void updateCoupleRole(String userId) throws Exception {
		// TODO Auto-generated method stub
		matchingDAO.updateCoupleRole(userId);
	}

	@Override
	public void updateCoupleRoleOther(String userId) throws Exception {
		// TODO Auto-generated method stub
		matchingDAO.updateCoupleRoleOther(userId);
	}

	@Override
	public void updateRoleFrom3To1(String userId) throws Exception {
		matchingDAO.updateRoleFrom3To1(userId);
	}

	

	

	

	

	

}
