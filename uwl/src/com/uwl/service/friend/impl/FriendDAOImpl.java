package com.uwl.service.friend.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.uwl.common.Search;
import com.uwl.service.domain.Friend;
import com.uwl.service.domain.User;
import com.uwl.service.friend.FriendDAO;

@Repository("friendDAOImpl")
public class FriendDAOImpl implements FriendDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void requestFriend(Friend friend) {
		sqlSession.insert("FriendMapper.requestFriend", friend);
	}

	@Override
	public void acceptFriend(Friend friend) {
		sqlSession.insert("FriendMapper.acceptFriend", friend);
		sqlSession.update("FriendMapper.updateFriendStatus", friend);
	}

	@Override
	public void updateFriendStatus(Friend friend) {
		sqlSession.update("FriendMapper.updateFriendStatus", friend);
	}

	@Override
	public void updateFriendStatusByNo(int friendNo) {
		sqlSession.update("FriendMapper.updateFriendStatusByNo", friendNo);
	}

	@Override
	public void deleteFriend(Friend friend) {
		sqlSession.delete("FriendMapper.deleteFriend", friend);
	}

	@Override
	public List<User> getFriendList(String userId, Search search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("search", search);
		return sqlSession.selectList("FriendMapper.getFriendList", map);
	}
	
	@Override
	public int getFriendTotalColunt(String userId) {
		return sqlSession.selectOne("FriendMapper.getFriendTotalCount", userId);
	}
	@Override
	public List<User> getRequestList(String userId) {
		return sqlSession.selectList("FriendMapper.getRequestList", userId);
	}

	@Override
	public List<User> getAskedList(String userId) {
		return sqlSession.selectList("FriendMapper.getAskedList", userId);
	}

	@Override
	public List<User> getBirthFriendList(String userId) {
		return sqlSession.selectList("FriendMapper.getBirthFriendList", userId);
	}

	@Override
	public List<User> getSearchFriendList(Search search, String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userId", userId);
		
		return sqlSession.selectList("FriendMapper.getSearchFriendList", map);
	}
	
	@Override
	public int getSearchTotalCount(Search search, String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userId", userId);
		return sqlSession.selectOne("FriendMapper.getSearchTotalCount", map);
	}
	
	@Override
	public int checkFriend(Friend friend) {
		return sqlSession.selectOne("FriendMapper.checkFriend", friend);
	}
	
	@Override
	public Friend checkRequest(Friend friend) {
		return sqlSession.selectOne("FriendMapper.checkRequest", friend);
	}

}
