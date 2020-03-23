package com.uwl.service.friend;

import java.util.List;
import java.util.Map;

import com.uwl.common.Search;
import com.uwl.service.domain.Friend;
import com.uwl.service.domain.User;

public interface FriendService {
	
	public void requestFriend(Friend friend);
	
	public void acceptFriend(Friend friend);
	
	public void updateFriendStatus(Friend friend);
	
	public void updateFriendStatusByNo(int friendNo);
	
	public void rejectFriend(Friend friend);

	public void deleteFriend(Friend friend);
	
	public Map<String, Object> getFriendList(String userId, Search search);
	
	public List<User> getRequestList(String userId);
	
	public List<User> getAskedList(String userId);
	
	public List<User> getBirthFriendList(String userId);
	
	public Map<String, Object> getSearchFriendList(Search search, String userId);
	
	public int checkFriend(Friend friend);
	
	public Friend checkRequest(Friend friend);
}
