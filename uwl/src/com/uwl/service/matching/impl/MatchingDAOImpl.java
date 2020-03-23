package com.uwl.service.matching.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.uwl.common.Search;
import com.uwl.service.domain.Item;
import com.uwl.service.domain.Matching;

import com.uwl.service.matching.MatchingDAO;

@Repository("matchingDAOImpl")
public class MatchingDAOImpl implements MatchingDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public MatchingDAOImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addMatching(Matching matching) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("MatchingMapper.addMatching", matching);
	}

	@Override
	public Matching getMatching(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MatchingMapper.getMatching", userId);
	}
	
	@Override
	public Matching getMatchingByUserId(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MatchingMapper.getMatchingByUserId", userId);
	}
	
	@Override
	public void updateMatching(Matching matching) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("MatchingMapper.updateMatching", matching);
	}

	

	@Override
	public void deleteMatching(Matching matching) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("MatchingMapper.deleteMatching", matching);
	}

	@Override
	public List<Matching> getMatchingList(Search search, String userId) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("userId", userId);
		
		return sqlSession.selectList("MatchingMapper.getMatchingList", map);
	}

	@Override
	public List<Matching> getAllMatchingList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("MatchingMapper.getAllMatchingList", search);
	}

	@Override
	public int getTotalMatchingCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MatchingMapper.getTotalMatchingCount", search);
	}

	@Override
	public int getTotalMatching(Search search, String userId) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("userId", userId);
		
		return sqlSession.selectOne("MatchingMapper.getTotalMatching", map);
	}
	
	@Override
	public void addItem(Item item) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("MatchingMapper.addItem", item);
	}

	@Override
	public Item getItem(String userId, String itemCategory) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", userId);
		map.put("itemCategory", itemCategory);
		
		return sqlSession.selectOne("MatchingMapper.getItem", map);
	}

	@Override
	public void updateItem(Item item) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("MatchingMapper.updateItem", item);
	}

	@Override
	public List<Item> getItemList(Search search, String userId, String itemCategory) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("userId", userId);
		map.put("itemCategory", itemCategory);
		
		return sqlSession.selectList("MatchingMapper.getItemList", map);
	}

	@Override
	public List<Item> getAllItemList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("MatchingMapper.getAllItemList", search);
	}

	@Override
	public int getTotalItemCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MatchingMapper.getTotalItemCount", search);
	}

	@Override
	public int getTotalItem(Search search, String userId, String itemCategory) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("userId", userId);
		map.put("itemCategory", itemCategory);
		
		return sqlSession.selectOne("MatchingMapper.getTotalItem", map);
	}

	
	
	
	@Override
	public void updateCoupleRole(String userId) throws Exception {	//
		// TODO Auto-generated method stub
		sqlSession.update("MatchingMapper.updateCoupleRole", userId);
	}

	@Override
	public void updateCoupleRoleOther(String userId) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("MatchingMapper.updateCoupleRoleOther", userId);
	}
	
	@Override
	public void updateRoleFrom3To1(String userId) throws Exception {
		sqlSession.update("MatchingMapper.updateRoleFrom3To1", userId);
	}
	

	

	

	

	

	

}
