package com.uwl.web.friend;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.domain.User;
import com.uwl.service.friend.FriendService;

@Controller
@RequestMapping("/friend/*")
public class FriendController {

	@Autowired
	private FriendService friendService;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value = "getAskedList", method = RequestMethod.POST)
	public String getAskedList(@RequestParam("userId") String userId, Model model) throws Exception {
		List<User> list = friendService.getAskedList(userId);
		model.addAttribute("list", list);

		return "forward:/friend/listAskedFriend.jsp";
	}

	@RequestMapping(value = "getRequestList", method = RequestMethod.POST)
	public String getRequestList(@RequestParam("userId") String userId, Model model) throws Exception {
		List<User> list = friendService.getRequestList(userId);
		model.addAttribute("list", list);

		return "forward:/friend/listRequestFriend.jsp";
	}

	@RequestMapping(value = "getFriendList", method = RequestMethod.POST)
	public String getFriendList(@RequestParam("userId") String userId, @ModelAttribute Search search, Model model)
			throws Exception {
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = friendService.getFriendList(userId, search);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		map.put("resultPage", resultPage);
		map.put("search", search);
		model.addAttribute("map", map);

		return "forward:/friend/listFriend.jsp";
	}

	@RequestMapping(value = "getBirthFriendList", method = RequestMethod.POST)
	public String getBirthFriendList(@RequestParam("userId") String userId, Model model) throws Exception {
		model.addAttribute("list", friendService.getBirthFriendList(userId));

		return "forward:/friend/listBirthFriend.jsp";
	}

	@RequestMapping(value = "getSearchFriendList", method = RequestMethod.POST)
	public String getSearchFriendList(@ModelAttribute Search search, @RequestParam String userId, Model model)
			throws Exception {
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(1000);
		Map<String, Object> map = friendService.getSearchFriendList(search, userId);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		map.put("resultPage", resultPage);
		map.put("search", search);
		model.addAttribute("map", map);

		return "forward:/friend/toolbarListSearchFriend.jsp";
	}
	
}
