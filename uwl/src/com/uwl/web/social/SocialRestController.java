package com.uwl.web.social;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.community.CommunityService;
import com.uwl.service.domain.Ask;
import com.uwl.service.domain.Notification;
import com.uwl.service.domain.Post;
import com.uwl.service.domain.User;
import com.uwl.service.fcm.FcmService;
import com.uwl.service.social.SocialService;
import com.uwl.service.user.UserService;

@RestController
@RequestMapping("/social/*")
public class SocialRestController {

	@Autowired
	private SocialService socialService;

	@Autowired
	private CommunityService communityService;

	@Autowired
	private FcmService fcmService;

	@Autowired
	private UserService userService;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value = "rest/addQuestion", method = RequestMethod.POST)
	public Map addQuestion(@RequestBody Ask ask) throws Exception {
		socialService.addQuestion(ask);
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(1);
		return socialService.getAskQuestionList(ask.getUserId(), search, "1");
	}

	@RequestMapping(value = "rest/getCommentList") // 페이지 넘기기 용?
	public Map<String, Object> getCommentList(@RequestBody HashMap<String, Object> dataMap) throws Exception {
		System.out.println("rest/getCommentList.POST or GET");
		Search search = new Search();
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}

		search.setPageSize(10000);
		search.setSearchCondition("1");
		search.setSearchKeyword((String) dataMap.get("searchKeyword"));

		System.out.println("dataMap" + dataMap);
		System.out.println(dataMap.get("postNo"));

		int postNo = Integer.parseInt((String) dataMap.get("postNo"));
		String userId = (String) dataMap.get("userId");

		Map<String, Object> map = communityService.getCommentList(search, postNo, userId);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);

		map.put("list", map.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);
		return map;
	}

	@RequestMapping(value = "rest/updateTimeline", method = RequestMethod.POST)
	public void updateTimeline(@RequestBody Post post) throws Exception {
		socialService.updateTimeline(post);
	}

	@RequestMapping(value = "rest/replyQuestion", method = RequestMethod.POST)
	public Map replyQuestion(@RequestBody Ask ask) throws Exception {
		socialService.replyQuestion(ask);
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(1);
		return socialService.getAskList(ask.getUserId(), search, "2");

	}

	@RequestMapping(value = "rest/rejectQuestion", method = RequestMethod.POST)
	public void rejectQuestion(@RequestBody Ask ask) throws Exception {
		socialService.rejectQuestion(ask.getQuestionPostNo());
	}

	@RequestMapping(value = "rest/getAskQuestionList", method = RequestMethod.POST)
	public Map getQuestionList(@RequestBody Search search, HttpSession session) throws Exception {
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		System.out.println("search : " + search);
		System.out.println("userId : " + ((User) (session.getAttribute("user"))).getUserId());
		search.setPageSize(pageSize);
		Map<String, Object> map = socialService.getAskQuestionList(((User) (session.getAttribute("user"))).getUserId(),
				search, "1");
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		map.put("resultPage", resultPage);
		return map;

	}

	@RequestMapping(value = "rest/getAskList", method = RequestMethod.POST)
	public Map getAskList(@RequestBody HashMap<String, Object> hashmap) throws Exception {
//		String currPage = (String)hashmap.get("currentPage");
		Search search = new Search();
//		search.setCurrentPage(Integer.parseInt(currPage));
		search.setCurrentPage((Integer) hashmap.get("currentPage"));
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = socialService.getAskList((String) hashmap.get("targetUserId"), search, "2");
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		map.put("resultPage", resultPage);
		return map;
	}

	@RequestMapping(value = "rest/getTimelineList", method = RequestMethod.POST)
	public Map getTimelineList(@RequestBody HashMap<String, Object> hashmap, HttpSession session) throws Exception {
		String targetUserId = (String) hashmap.get("targetUserId");

		Search search = new Search();
		search.setCurrentPage((Integer) hashmap.get("currentPage"));
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		String sessionId = ((User) session.getAttribute("user")).getUserId();

		if (sessionId.equals(targetUserId)) {
			search.setSearchCondition("1");
		} else {
			search.setSearchCondition("0");
		}

		Map<String, Object> map = socialService.getTimelineList((String) hashmap.get("targetUserId"), search);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		map.put("resultPage", resultPage);
		return map;
	}

	@RequestMapping(value = "rest/deleteTimeline", method = RequestMethod.POST)
	public void deleteTimeline(@RequestBody Post post) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		socialService.deleteTimeline(post.getPostNo());

	}

	///////////////////// NOTIFICATION //////////////////////

	@RequestMapping(value = "rest/addNoti", method = RequestMethod.POST)
	public void addNoti(@RequestBody Notification notification) throws Exception {
		User senderUser = userService.getUser(notification.getSenderId());
		String sender = senderUser.getName();
		String notiCode = "";

		if (!notification.getSenderId().equals(notification.getReceiverId())) {
			socialService.addNoti(notification);

			if (notification.getNotiOrigin().equals("1")) {
				sender = senderUser.getNickname();
				if (notification.getNotiCode().equals("1")) {
					notiCode = "post";
				}
			} else if (notification.getNotiOrigin().equals("2")) {
				if (notification.getNotiCode().equals("5")) {
					notiCode = "ask";
				}
			} else if (notification.getNotiOrigin().equals("3")) {
				if (notification.getNotiCode().equals("1")) {
					notiCode = "timeline";
				}
			} else if (notification.getNotiOrigin().equals("4")) {
				if (notification.getNotiCode().equals("3")) {
					notiCode = "requestFriend";
				} else
					notiCode = "acceptFriend";
			} else if (notification.getNotiOrigin().equals("5")) {
				if (notification.getNotiCode().equals("2")) {
					notiCode = "question";
				}
			} else if (notification.getNotiOrigin().equals("6")) {
				if (notification.getNotiCode().equals("5")) {
					notiCode = "matching";
				} else
					notiCode = "matching";
			}
			fcmService.createReceiveNotification(sender, notification.getReceiverId(), notiCode);
		}
	}

	@RequestMapping(value = "rest/deleteNoti", method = RequestMethod.POST)
	public void deleteNoti(@RequestBody Notification notification) throws Exception {
		socialService.deleteNoti(notification.getNotiNo());
	}

	@RequestMapping(value = "rest/deleteNotiAll", method = RequestMethod.POST)
	public void deleteNotiAll(@RequestBody User user) throws Exception {
		socialService.deleteNotiAll(user.getUserId());
	}

	@RequestMapping(value = "rest/getNotiList", method = RequestMethod.POST)
	public Map getNotiList(@RequestBody Search search, HttpSession session) throws Exception {
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(10);

		String userId = ((User) session.getAttribute("user")).getUserId();
		Map<String, Object> map = socialService.getNotiList(userId, search);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		map.put("search",search);
		map.put("resultPage", resultPage);
		
		return map;
	}

	///////////////////// NOTIFICATION //////////////////////
}
