package com.uwl.web.friend;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.couple.CoupleService;
import com.uwl.service.domain.Couple;
import com.uwl.service.domain.Friend;
import com.uwl.service.domain.Matching;
import com.uwl.service.domain.User;
import com.uwl.service.friend.FriendService;
import com.uwl.service.matching.MatchingService;
import com.uwl.service.user.UserService;

@RestController
@RequestMapping("/friend/*")
public class FriendRestController {

	@Autowired
	private FriendService friendService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CoupleService coupleService;
	
	@Autowired
	private MatchingService matchingService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value = "rest/requestFriend", method = RequestMethod.POST)
	public Map requestFriend(@RequestBody Friend friend) throws Exception {
		System.out.println("FriendRestController requestFriend Run===========");
		Map<String, Object> map = new HashMap<String, Object>();
		
		Friend inputFriend = new Friend();
		inputFriend.setFirstUserId(friend.getSecondUserId());
		inputFriend.setSecondUserId(friend.getFirstUserId());
		
		Friend check = friendService.checkRequest(inputFriend);
		System.out.println("check : " + check);
		if (check == null) {
			friendService.requestFriend(friend);
			map.put("success", true);
		} else {
			friendService.acceptFriend(friend);
			map.put("success", true);
		}
		return map;
	}

	@RequestMapping(value = "rest/acceptFriend", method = RequestMethod.POST)
	public Map acceptFriend(@RequestBody Friend friend) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		friendService.acceptFriend(friend);
		map.put("success", true);
		return map;
	}

	@RequestMapping(value = "rest/deleteFriend", method = RequestMethod.POST)
	public Map deleteFriend(@RequestBody Friend friend, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		friendService.deleteFriend(friend);
		
		System.out.println("deleteFriend => deleteCouple run");
		Couple couple = coupleService.getCouple(friend.getFirstUserId());
		Matching matching1 =  matchingService.getMatching(friend.getFirstUserId());
		Matching matching2 = matchingService.getMatching(friend.getSecondUserId());
		System.out.println("couple : " + couple);
		
		if (matching1 != null && matching2 != null && couple != null) {
			matchingService.deleteMatching(matching1);
			matchingService.deleteMatching(matching2);
			coupleService.deleteCouple(couple);
			coupleService.deleteCoupleTimeline(friend.getFirstUserId(), friend.getSecondUserId());
			matchingService.updateRoleFrom3To1(friend.getFirstUserId());
			matchingService.updateRoleFrom3To1(friend.getSecondUserId());
			
			
			
		}
		
		System.out.println("deleteFriend => deleteCouple end");
		
		map.put("success", true);

		return map;
	}

	@RequestMapping(value = "rest/getAskedList", method = RequestMethod.POST)
	public Map getAskedList(@RequestBody Search search, HttpSession session) throws Exception {
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", friendService.getAskedList(((User)session.getAttribute("user")).getUserId()));

		return map;
	}
	
	@RequestMapping(value = "rest/getRequestList", method = RequestMethod.POST)
	public Map getRequestList(@RequestBody User user) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", friendService.getRequestList(user.getUserId()));
		
		return map;
	}
	
	@RequestMapping(value = "rest/getFriendList", method = RequestMethod.POST)
	public Map getFriendList(@RequestBody Search search, HttpSession session) throws Exception{
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		User user = (User)session.getAttribute("user");
		Map<String, Object> map = friendService.getFriendList(user.getUserId(), search);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		map.put("resultPage", resultPage);
		map.put("search", search);
		
		return map;
	}
	
	@RequestMapping(value = "rest/getFriendListForSearch", method = RequestMethod.POST)
	public Map getFriendListForSearch(@RequestBody User user) throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(10000);
		
		return friendService.getFriendList(user.getUserId(), search);
	}
	
	
	@RequestMapping(value = "rest/getSearchFriendList", method = RequestMethod.POST)
	public Map getSearchFriendList(@RequestBody Search search, HttpSession session) throws Exception{
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		User user = (User)session.getAttribute("user");
		
		
		Map<String, Object> map = friendService.getSearchFriendList(search, user.getUserId());
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		map.put("resultPage", resultPage);
		map.put("search", search);
		return null;
	}
	
	@RequestMapping(value = "rest/getFriendListByName", method = RequestMethod.POST)
	public Map getFriendListByName(@RequestBody User user, HttpSession session) throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(10000);
		
		User sessionUser = (User)session.getAttribute("user");
		List<User> list =(List<User>)friendService.getFriendList(sessionUser.getUserId(), search).get("list");
		List<User> returnList = new ArrayList<User>();
		String name = user.getName();
		for(User findUser : list) {
			if (findUser.getName().equals(name)) {
				returnList.add(findUser);
			}
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", returnList);
		return returnMap;
	}
	
	
}
