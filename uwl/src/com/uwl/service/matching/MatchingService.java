package com.uwl.service.matching;

import java.util.Map;

import com.uwl.common.Search;
import com.uwl.service.domain.Item;
import com.uwl.service.domain.Matching;

public interface MatchingService {

	public void addMatching(Matching matching) throws Exception;
	
	public Matching getMatching(String userId) throws Exception;
	
	public Matching getMatchingByUserId(String userId) throws Exception;
	
	public void updateMatching(Matching matching) throws Exception;
	
	public void deleteMatching(Matching matching) throws Exception;
	
	public Map<String, Object> getMatchingList(Search search, String userId) throws Exception;
	
	public Map<String, Object> getAllMatchingList(Search search) throws Exception;
	
	public int getTotalMatching(Search search, String userId) throws Exception;
	
	public void updateCoupleRole(String userId) throws Exception;
	
	public void updateCoupleRoleOther(String userId) throws Exception;
	
	public void updateRoleFrom3To1(String userId) throws Exception;
	
	
	
	
	public void addItem(Item item) throws Exception;
	
	public Item getItem(String userId, String itemCategory) throws Exception;
	
	public void updateItem(Item item) throws Exception;
	
	public Map<String, Object> getItemList(Search search, String userId, String itemCategory) throws Exception;
	
	public Map<String, Object> getAllItemList(Search search) throws Exception;
	
	public int getTotalItem(Search search, String userId, String itemCategory) throws Exception;
	
	
	
	
}
