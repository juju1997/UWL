package com.uwl.service.friend.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.uwl.common.Search;
import com.uwl.service.domain.Friend;
import com.uwl.service.domain.User;
import com.uwl.service.friend.FriendService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })
public class FriendServiceTest {
	
	@Autowired
	@Qualifier("friendServiceImpl")
	private FriendService friendService;
	
//	@Test
	public void requestFriend() throws Exception{
		Friend friend = new Friend();
		friend.setFirstUserId("user40");
		friend.setSecondUserId("user01");
		
		friendService.requestFriend(friend);
	}
	
//	@Test
	public void acceptFriend() throws Exception{
		Friend friend = new Friend();
		friend.setFirstUserId("user05");
		friend.setSecondUserId("user01");
		friend.setFriendStatus("2");
		
		friendService.acceptFriend(friend);
	}
	
//	@Test
	public void updateFriendStatus() throws Exception{
		Friend friend = new Friend();
		friend.setFirstUserId("user05");
		friend.setSecondUserId("user01");
		friend.setFriendStatus("2");
		
		friendService.updateFriendStatus(friend);
	}
	
//	@Test
	public void updateFriendStatusByNo() throws Exception{
		int friendNo = 10012;
		friendService.updateFriendStatusByNo(friendNo);
	}
	
//	@Test
	public void rejectFriend() throws Exception{
		Friend friend = new Friend();
		friend.setFirstUserId("user30");
		friend.setSecondUserId("user01");
		friendService.deleteFriend(friend);
	}
	
	
//	@Test
	public void getFriendList() throws Exception{
		String userId = "user01";
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		Map<String, Object> map = friendService.getFriendList(userId, search);
		System.out.println(map);
		
	}
	
//	@Test
	public void getRequestList() throws Exception{
		String userId = "user01";
		List<User> list = friendService.getRequestList(userId);
		System.out.println(list);
	}
	
//	@Test
	public void getAskedList() throws Exception{
		String userId = "user04";
		List<User> list = friendService.getAskedList(userId);
		System.out.println(list);
	}
	
//	@Test
	public void getBirthFriendList() throws Exception{
		String userId = "user01";
		List<User> list = friendService.getBirthFriendList(userId);
		System.out.println(list);
	}
	
//	@Test
	public void getSearchFriendList() throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("3");
		search.setSearchKeyword("17");
		String userId = "user01";
		Map<String, Object> map = friendService.getSearchFriendList(search,userId);
		System.out.println(map);
	}
	
//	@Test
	public void checkFriend() throws Exception{
		Friend friend = new Friend();
		friend.setFirstUserId("user01");
		friend.setSecondUserId("user37");
		
		System.out.println(friendService.checkFriend(friend));
	}
	
	@Test
	public void checkRequest() throws Exception{
		Friend friend = new Friend();
		friend.setFirstUserId("user01");
		friend.setSecondUserId("kkd17666");
		
		friendService.checkRequest(friend);
	}
	
//	@Test
	public void getFriendListByName() throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(10000);
		User user = new User();
		user.setName("name03");
		
		List<User> list =(List<User>)friendService.getFriendList("user01", search).get("list");
		List<User> returnList = new ArrayList<User>();
		String name = user.getName();
		for(User findUser : list) {
			if (findUser.getName().equals(name)) {
				returnList.add(findUser);
			}
		}
		System.out.println("returnList :::: \t"  +returnList);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", returnList);
		
		
		
	}
	
}
