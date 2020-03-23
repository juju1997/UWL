package com.uwl.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.uwl.common.Search;
import com.uwl.service.domain.Purchase;
import com.uwl.service.purchase.PurchaseDAO;

@Repository("purchaseDAOImpl")
public class PurchaseDAOImpl implements PurchaseDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void addPurchase(Purchase purchase) throws Exception {
		sqlSession.insert("PurchaseMapper.addPurchase", purchase);
	}

	@Override
	public Purchase getPurchase(int purchaseNo) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getPurchase", purchaseNo);
	}

	@Override
	public List<Purchase> getPurchaseList(String userId, Search search) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("search", search);
		return sqlSession.selectList("PurchaseMapper.getPurchaseList", map);
	}
	
	@Override
	public int getTotalCount(String userId, Search search) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("search", search);
		
		return sqlSession.selectOne("PurchaseMapper.getTotalCount", map);
	}

	@Override
	public void updateRefundOptionByPurchaseNo(int purchaseNo) throws Exception {
		sqlSession.update("PurchaseMapper.updateRefundOptionByPurchaseNo", purchaseNo);
	}
	
	@Override
	public void updateRefundOptionByItemNo(int itemNo) throws Exception {
		sqlSession.update("PurchaseMapper.updateRefundOptionByItemNo", itemNo);
	}
	
	@Override
	public void deletePoint(int purchaseNo) throws Exception {
		sqlSession.update("PurchaseMapper.deletePoint", purchaseNo);
	}
	
	@Override
	public void deleteItem(int itemNo) throws Exception {
		sqlSession.update("PurchaseMapper.deleteItem", itemNo);
	}
}
