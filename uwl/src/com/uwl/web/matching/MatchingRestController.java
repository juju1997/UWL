package com.uwl.web.matching;

import java.math.MathContext;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.uwl.common.Search;
import com.uwl.service.couple.CoupleService;
import com.uwl.service.domain.Couple;
import com.uwl.service.domain.Item;
import com.uwl.service.domain.Matching;
import com.uwl.service.domain.User;
import com.uwl.service.matching.MatchingService;
import com.uwl.service.user.UserService;
import com.uwl.web.user.UserRestController;

@RestController
@RequestMapping("/matching/*")
public class MatchingRestController {
	@Autowired
	@Qualifier("matchingServiceImpl")
	private MatchingService matchingService;
	
	public MatchingRestController() {
		
	}
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("coupleServiceImpl")
	private CoupleService coupleService;
	
	
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value = "rest/addMatching2/{userId}/{secondUserId}")
	public Map addMatching2(@PathVariable String userId, @PathVariable String secondUserId) throws Exception {
		System.out.println("rest/addMatching2/{userId}/{secondUserId} 시작");
		User user = userService.getUser(secondUserId);
		String secondUserName = user.getName();
		Map<String, Object> map = new HashMap();
		if(matchingService.getMatching(userId) == null) {
			map.put("userId", userId);
			map.put("secondUserId", secondUserId);
			map.put("secondUserName", secondUserName);
		} else {
			map.put("userId", userId);
			Matching matching = matchingService.getMatching(userId);
			String secondUserId2 = matching.getSecondUserId();
			User user2 = userService.getUser(secondUserId2);
			String secondUserName2 = user2.getName();
			map.put("secondUserId", secondUserId2);
			map.put("secondUserName", secondUserName2);
			
		}
		System.out.println("rest/addMatching2/{userId}/{secondUserId} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/deleteMatching/{userId}/{secondUserId}")
	public Map deleteMatching(@PathVariable String userId, @PathVariable String secondUserId) throws Exception {
		System.out.println("rest/deleteMatching/{userId}/{secondUserId} 시작");
		User user = userService.getUser(secondUserId);
		String secondUserName = user.getName();
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("secondUserId", secondUserId);
		map.put("secondUserName", secondUserName);
		System.out.println("rest/deleteMatching/{userId}/{secondUserId} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/updateItem/{userId}/{secondUserId}")
	public Map updateItem(@PathVariable String userId, @PathVariable String secondUserId) throws Exception {
		System.out.println("rest/updateItem/{userId}/{secondUserId} 시작");
		User user = userService.getUser(secondUserId);
		String secondUserName = user.getName();
		Map<String, Object> map = new HashMap();
		if(matchingService.getItem(userId, "1") != null) {
			map.put("userId", userId);
			map.put("secondUserId", secondUserId);
			
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		map.put("secondUserName", secondUserName);
		System.out.println("rest/updateItem/{userId}/{secondUserId} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/addMatching3/{userId}/{secondUserId}")
	public int addMatching3(@PathVariable String userId, @PathVariable String secondUserId) throws Exception {
		System.out.println("rest/addMatching3/{userId}/{secondUserId} 시작");
		Matching matching = new Matching();
		matching.setFirstUserId(userId);
		matching.setSecondUserId(secondUserId);
		matchingService.addMatching(matching);
		if(matchingService.getMatching(secondUserId) != null) {
			matching = matchingService.getMatching(userId);
			Matching matching2 = matchingService.getMatching(secondUserId);
			if(matching2.getSecondUserId().equals(userId)) {
				matching.setMatchingStatus("2");
				matching2.setMatchingStatus("2");
				matchingService.updateMatching(matching);
				matchingService.updateMatching(matching2);
				Couple couple = new Couple();
				couple.setFirstUserId(userId);
				couple.setSecondUserId(secondUserId);
				matchingService.updateCoupleRoleOther(secondUserId);
				matchingService.updateCoupleRoleOther(userId);
				coupleService.addCouple(couple);
			}
		}
		Search search = new Search();
		int totalMatching = matchingService.getTotalMatching(search, secondUserId);
		System.out.println("rest/addMatching3/{userId}/{secondUserId} 끝");
		return totalMatching;
	}
	
	
	
	
	
	@RequestMapping(value = "rest/updateCoupleRole/{userId}")		//둘 다 수락을 눌러서 진짜 커플 매칭
	public void updateCoupleRole(@PathVariable String userId, HttpSession session) throws Exception{
		System.out.println("coupleMatching 시작");
		matchingService.updateCoupleRole(userId);
		
		User user = (User)session.getAttribute("user");
		user.setRole("3");
		session.setAttribute("user", user);
	}
	
	
	
	@RequestMapping(value = "rest/deleteMatching2/{userId}/{secondUserId}")
	public Map deleteMatching2(@PathVariable String userId, @PathVariable String secondUserId) throws Exception {
		System.out.println("rest/deleteMatching/{userId}/{secondUserId} 시작");
		Matching matching = matchingService.getMatching(userId);
		String sendDate = matching.getSendDate().toString();
		System.out.println("sendDate : " + sendDate);
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		String time1 = format1.format(time);
		System.out.println("time1 : " + time1);
		Date firstDate = format1.parse(sendDate);
		Date secondDate = format1.parse(time1);
		long calDate = firstDate.getTime() - secondDate.getTime();
		long calDateDays = calDate / (24 * 60 * 60 * 1000);
		calDateDays = Math.abs(calDateDays);
		System.out.println("두 날짜의 날짜 차이(calDateDays) : " + calDateDays);
		Search search = new Search();
		
		Map<String, Object> map = new HashMap();
		
		if(calDateDays <= 30) {
			map.put("result", false);
		} else {
			matchingService.deleteMatching(matching);
			
			
			map.put("result", true);
		}
		int totalMatching = matchingService.getTotalMatching(search, secondUserId);
		map.put("totalMatching", totalMatching);
		System.out.println("rest/deleteMatching/{userId}/{secondUserId} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/addMatching/{userId}/{secondUserId}")
	public Map addMatching(@PathVariable String userId, @PathVariable String secondUserId) throws Exception {
		System.out.println("rest/addMatching/{userId}/{secondUserId} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("secondUserId", secondUserId);
		System.out.println("userId : " + userId);
		System.out.println("secondUserId : " + secondUserId);
		Search search = new Search();
		int totalMatching = matchingService.getTotalMatching(search, secondUserId);
		map.put("totalMatching", totalMatching);
		if(userId.equals(secondUserId)) {
			int totalItem = matchingService.getTotalItem(search, userId, "1");
			int totalItem2 = matchingService.getTotalItem(search, userId, "2");
			map.put("totalItem", totalItem);
			map.put("totalItem2", totalItem2);
		} else {
			if(matchingService.getMatching(userId) != null) {
				Matching matching = matchingService.getMatching(userId);
				map.put("matching", matching);
				System.out.println("matching.getSecondUserId : " + matching.getSecondUserId());
				System.out.println("secondUserId : " + secondUserId);
			}
		}
		System.out.println("rest/addMatching/{userId}/{secondUserId} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/updateItem3/{userId}/{secondUserId}")
	public Map updateItem3(@PathVariable String userId, @PathVariable String secondUserId) throws Exception {
		System.out.println("rest/updateItem3/{userId}/{secondUserId} 시작");
		User user = userService.getUser(secondUserId);
		String secondUserName = user.getName();
		
		
		
		Matching matching = matchingService.getMatching(secondUserId);
		Map<String, Object> map = new HashMap();
		
		Item item = matchingService.getItem(userId, "1");
		item.setSecondUserId(secondUserId);
		
		if(matchingService.getItem(secondUserId, "2") == null) {
			System.out.println("0000");
			if(matching != null) {
				if(matching.getSecondUserId() != null) {
					System.out.println("1111");
					if(matching.getSecondUserId().equals(userId)) {
						System.out.println("2222");
						item.setUseResult("1");
						matchingService.updateItem(item);
						map.put("useResult", "1");
					} else {
						System.out.println("3333");
						item.setUseResult("2");
						matchingService.updateItem(item);
						map.put("useResult", "2");
					}
					
				} else {
					System.out.println("4444");
					item.setUseResult("2");
					matchingService.updateItem(item);
					map.put("useResult", "2");
				}
			} else {
				System.out.println("6666");
				item.setUseResult("2");
				matchingService.updateItem(item);
				map.put("useResult", "2");
			}
			
			
		} else {
			System.out.println("5555");
			item.setUseResult("3");
			matchingService.updateItem(item);
			Item item2 = matchingService.getItem(secondUserId, "2");
			item2.setSecondUserId(userId);
			matchingService.updateItem(item2);
			map.put("useResult", "3");
		}
		map.put("secondUserName", secondUserName);
		System.out.println("rest/updateItem3/{userId}/{secondUserId} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/updateMatching2/{userId}")
	public void updateMatching2(@PathVariable String userId) throws Exception {
		System.out.println("rest/updateMatching2/{userId} 시작");
		if(matchingService.getMatching(userId) != null) {
			Matching matching = matchingService.getMatching(userId);
			String secondUserId = matching.getSecondUserId();
			Matching matching2 = matchingService.getMatching(secondUserId);
			matching.setMatchingStatus("3");
			matchingService.updateMatching(matching);
			if(matching2.getMatchingStatus().equals("2")) {
				
			} else {
				
			}
		} else {
			
		}
		System.out.println("rest/updateMatching2/{userId} 끝");
	}
	
	@RequestMapping(value = "rest/updateMatching3/{userId}")
	public void updateMatching3(@PathVariable String userId) throws Exception {
		System.out.println("rest/updateMatchig3/{userId} 시작");
		if(matchingService.getMatching(userId) != null) {
			Matching matching = matchingService.getMatching(userId);
			matchingService.deleteMatching(matching);
			Matching matching2 = matchingService.getMatching(matching.getSecondUserId());
			matchingService.deleteMatching(matching2);
		}
		System.out.println("rest/updateMatchig3/{userId} 끝");
	}
	
	@RequestMapping(value = "rest/getMatching/{userId}")
	public Matching getMatching(@PathVariable String userId) throws Exception {
		System.out.println("rest/getMatching/{userId} 시작");
		System.out.println("userId : " + userId);
		Matching matching = matchingService.getMatching(userId);
		return matching;
	}
	
	@RequestMapping(value = "rest/updateMatching/{userId}")
	public String updateMatching(@PathVariable String userId) throws Exception {
		System.out.println("rest/updateMatching/{userId} 시작");
		System.out.println("userId : " + userId);
		System.out.println("rest/updateMatching/{userId} 끝");
		return userId;
	}
	
	@RequestMapping(value = "rest/getAllMatchingList")
	public List<Matching> getAllMatchingList(HttpServletRequest request) throws Exception {
		System.out.println("rest/getAllMatchingList 시작");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(100);
		Map<String, Object> map = matchingService.getAllMatchingList(search);
		List<Matching> list = (List<Matching>)map.get("list");
		System.out.println("rest/getAllMatchingList 끝");
		return list;
	}
	
	@RequestMapping(value = "rest/getMatchingByUserId")
	public Matching getMatchingByUserId(HttpServletRequest request) throws Exception {
		System.out.println("rest/getMatchingByUserId 시작");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		Matching matching = matchingService.getMatchingByUserId(userId);
		System.out.println("rest/getMatchingByUserId 끝");
		return matching;
	}
}
