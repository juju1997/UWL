package com.uwl.service.friend;

import java.util.List;

import com.uwl.common.Search;
import com.uwl.service.domain.Friend;
import com.uwl.service.domain.User;

public interface FriendDAO {
	
	public void requestFriend(Friend friend);

	public void acceptFriend(Friend friend);

	public void updateFriendStatus(Friend friend);

	public void updateFriendStatusByNo(int friendNo);

	public void deleteFriend(Friend friend);

	public List<User> getFriendList(String userId, Search search);
	
	public int getFriendTotalColunt(String userId);

	public List<User> getRequestList(String userId);

	public List<User> getAskedList(String userId);

	public List<User> getBirthFriendList(String userId);

	public List<User> getSearchFriendList(Search search, String userId);
	
	public int getSearchTotalCount(Search search, String userId);
	
	public int checkFriend(Friend friend);
	
	public Friend checkRequest(Friend friend);
}
