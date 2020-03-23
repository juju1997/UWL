package com.uwl.service.friend.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.uwl.common.Search;
import com.uwl.service.domain.Friend;
import com.uwl.service.domain.User;
import com.uwl.service.friend.FriendDAO;
import com.uwl.service.friend.FriendService;

@Service("friendServiceImpl")
public class FriendServiceImpl implements FriendService{

	@Autowired
	@Qualifier("friendDAOImpl")
	private FriendDAO friendDAO;
	public void setFriendDAO(FriendDAO friendDAO) {
		this.friendDAO = friendDAO;
	}
	
	@Override
	public void requestFriend(Friend friend) {
		friendDAO.requestFriend(friend);
	}

	@Override
	public void acceptFriend(Friend friend) {
		friendDAO.acceptFriend(friend);
	}

	@Override
	public void updateFriendStatus(Friend friend) {
		friendDAO.updateFriendStatus(friend);
	}

	@Override
	public void updateFriendStatusByNo(int friendNo) {
		friendDAO.updateFriendStatusByNo(friendNo);
	}

	@Override
	public void rejectFriend(Friend friend) {
		friendDAO.deleteFriend(friend);
	}

	@Override
	public void deleteFriend(Friend friend) {
		friendDAO.deleteFriend(friend);
	}

	@Override
	public Map<String, Object> getFriendList(String userId, Search search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", friendDAO.getFriendList(userId, search));
		map.put("totalCount", friendDAO.getFriendTotalColunt(userId));
		return map;
	}

	@Override
	public List<User> getRequestList(String userId) {
		return friendDAO.getRequestList(userId);
	}

	@Override
	public List<User> getAskedList(String userId) {
		return friendDAO.getAskedList(userId);
	}

	@Override
	public List<User> getBirthFriendList(String userId) {
		return friendDAO.getBirthFriendList(userId);
	}

	@Override
	public Map<String, Object> getSearchFriendList(Search search, String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", friendDAO.getSearchFriendList(search, userId));
		map.put("totalCount", friendDAO.getSearchTotalCount(search, userId));
		
		return map;
	}
	
	// firstUserId, secondUserId 넣어주면 됨  => return 1 : 친구   0 : 친구 아님
	@Override
	public int checkFriend(Friend friend) {
		return friendDAO.checkFriend(friend);
	}

	// firstUserId, secondUserId 넣어주면 됨
	@Override
	public Friend checkRequest(Friend friend) {
		return friendDAO.checkRequest(friend);
	}
	
}
