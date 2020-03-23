package com.uwl.web.matching;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.uwl.common.Search;
import com.uwl.service.domain.Item;
import com.uwl.service.domain.Matching;
import com.uwl.service.domain.User;
import com.uwl.service.matching.MatchingService;

@Controller
@RequestMapping("/matching/*")
public class MatchingController {

	@Autowired
	@Qualifier("matchingServiceImpl")
	private MatchingService matchingService;

	public MatchingController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	//사람들 프로필에서 꽃 보내기
	@RequestMapping(value = "addMatching2")
	public String addMatching2(@RequestParam("userId") String userId, @RequestParam("secondUserId") String secondUserId, Model model) throws Exception {
		System.out.println("/matching/addMatching");
		
		//회원이 꽃을 보낸 사람이 있는지 확인
		//꽃을 보낸 사람이 없다면
		if(matchingService.getMatching(userId) == null) {
			model.addAttribute("userId", userId);
			model.addAttribute("secondUserId", secondUserId);
			
			//꽃 보내는거 확인으로 이동
			return "forward:/matching/addMatching2.jsp";
		} else {
			//꽃을 보낸 사람이 있다면
			model.addAttribute("userId", userId);
			
			Matching matching = matchingService.getMatching(userId);
			secondUserId = matching.getSecondUserId();
			
			model.addAttribute("secondUserId", secondUserId);
			//꽃 보내기 취소 확인으로 이동
			return "forward:/matching/deleteMatching.jsp";
		}
		
	}
	
	//사람들 프로필에서 꽃 보내기 취소
	@RequestMapping(value = "deleteMatching")
	public String deleteMatching(@RequestParam("userId") String userId, @RequestParam("secondUserId") String secondUserId, Model model) throws Exception {
		System.out.println("/matching/deleteMatching");
		
		model.addAttribute("userId", userId);
		model.addAttribute("secondUserId", secondUserId);
		
		//꽃 보내기 취소 확인으로 이동
		return "forward:/matching/deleteMatching.jsp";
	}
	
	//사람들 프로필에서 찔러보기
	@RequestMapping(value = "updateItem")
	public String updateItem(@RequestParam("userId") String userId, @RequestParam("secondUserId") String secondUserId, Model model) throws Exception {
		System.out.println("/matching/updateItem");
		
		//회원이 창을 갖고 있는지 확인
		//창이 있다면
		if(matchingService.getItem(userId, "1") != null) {
			model.addAttribute("userId", userId);
			model.addAttribute("secondUserId", secondUserId);
			
			
			
			//창 사용 확인으로 이동
			return "forward:/matching/updateItem.jsp";
		} else {
			//없다면
			//창 없음으로 이동
			return "forward:/matching/updateItem2.jsp";
		}
		
	}
	
	//꽃 보내는거 확인에서 확인
	@RequestMapping(value = "addMatching3")
	public String addMatching3(@RequestParam("userId") String userId, @RequestParam("secondUserId") String secondUserId, Model model) throws Exception {
		System.out.println("/matching/addMatching3");
		
		Matching matching = new Matching();
		
		matching.setFirstUserId(userId);
		matching.setSecondUserId(secondUserId);
		
		//매칭 테이블에 인서트
		matchingService.addMatching(matching);
		
		//서로에게 꽃을 보냈는지 확인
		
		if(matchingService.getMatching(secondUserId) != null) {
			matching = matchingService.getMatching(userId);
			Matching matching2 = matchingService.getMatching(secondUserId);
			
			
			//서로에게 꽃을 보냈다면
			if(matching2.getSecondUserId().equals(userId)) {
				
				matching.setMatchingStatus("2");
				matching2.setMatchingStatus("2");
				
				//매칭 상태 업데이트
				matchingService.updateMatching(matching);
				matchingService.updateMatching(matching2);
			}
		}
		
		
		//꽃 보냄으로 이동
		return "forward:/matching/addMatching3.jsp";
	}
	
	//꽃 보내기 취소 확인에서 확인
	@RequestMapping(value = " deleteMatching2")
	public String deleteMatching2(@RequestParam("userId") String userId, @RequestParam("secondUserId") String secondUserId, Model model) throws Exception {
		System.out.println("/matching/deleteMatching2");
		
		Matching matching = matchingService.getMatching(userId);
		
		//꽃 보낸 시간
		String sendDate = matching.getSendDate().toString();
		System.out.println("sendDate : " + sendDate);
		
		//꽃 보내기 취소한 시간
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		
		Date time = new Date();
		
		String time1 = format1.format(time);
		
		System.out.println("time1 : " + time1);
		
		
		Date firstDate = format1.parse(sendDate);
		Date secondDate = format1.parse(time1);
		
		//날짜 계산
		long calDate = firstDate.getTime() - secondDate.getTime();
		
		long calDateDays = calDate / (24 * 60 * 60 * 1000);
		
		calDateDays = Math.abs(calDateDays);
		
		System.out.println("두 날짜의 날짜 차이(calDateDays) : " + calDateDays);
			
			
		
		//30일이 지나지 않았다면
		if(calDateDays <= 30) {
			
			//꽃 보내고 30일 안 지남으로 이동
			return "forward:/matching/deleteMatching3.jsp";
		} else {
			//30일이 지났다면
			
			matchingService.deleteMatching(matching);
			
			//꽃 보내기 취소함으로 이동
			return "forward:/matching/deleteMatching2.jsp";
		}
		
	}
	
	//사람들 프로필로 갈 수 있는 목록에서 사람
	@RequestMapping(value = "addMatching")
	public String addMatching(@RequestParam("userId") String userId, @RequestParam("secondUserId") String secondUserId, Model model) throws Exception {
		System.out.println("/matching/addMatching");
		
		model.addAttribute("userId", userId);
		model.addAttribute("secondUserId", secondUserId);
		
		System.out.println("userId : " + userId);
		System.out.println("secondUserId : " + secondUserId);
		
		Search search = new Search();
		//받은 꽃 개수 가져오기
		int totalMatching = matchingService.getTotalMatching(search, secondUserId);
		
		model.addAttribute("totalMatching", totalMatching);
		
		//내 프로필로 간 경우
		if(userId.equals(secondUserId)) {
			
			
			
			//가진 아이템 개수 가져오기
			int totalItem = matchingService.getTotalItem(search, userId, "1");
			int totalItem2 = matchingService.getTotalItem(search, userId, "2");
			
			model.addAttribute("totalItem", totalItem);
			model.addAttribute("totalItem2", totalItem2);
			
			//내 프로필로 이동
			
		} else {
			//나 말고 다른 사람 프로필로 간 경우
			//내가 꽃 보낸 사람인지 확인
			
			
			if(matchingService.getMatching(userId) != null) {
				Matching matching = matchingService.getMatching(userId);
				
				model.addAttribute("matching", matching);
				
				System.out.println("matching.getSecondUserId : " + matching.getSecondUserId());
				System.out.println("secondUserId : " + secondUserId);
			}
			
			
			
			//사람들 프로필로 이동
			
		}
		
		return "forward:/matching/ajaxAddMatching.jsp";
		
		
		
		
		
		
	}
	
	//창 사용 확인에서 확인
	@RequestMapping(value = "updateItem3")
	public String updateItem3(@RequestParam("userId") String userId, @RequestParam("secondUserId") String secondUserId, Model model) throws Exception {
		System.out.println("/matching/updateItem3");
		
		Matching matching = matchingService.getMatching(secondUserId);
		
		
		
		model.addAttribute("userId", userId);
		model.addAttribute("secondUserId", secondUserId);
		
		Item item = matchingService.getItem(userId, "1");
		item.setSecondUserId(secondUserId);
		
		//회원이 방패를 가지고 있는지 확인
		//방패가 없고
		if(matchingService.getItem(secondUserId, "2") == null) {
			
			//꽃을 보냈으면
			if(matching.getSecondUserId().equals(userId)) {
				
				item.setUseResult("1");
				matchingService.updateItem(item);
				//창 사용 결과 : 꽃 보냄으로 이동
				return "forward:/matching/updateItem3.jsp";
			} else {
				//꽃을 안 보냈으면
				//창 사용 결과 : 꽃 안 보냄으로 이동
				
				item.setUseResult("2");
				matchingService.updateItem(item);
				return "forward:/matching/updateItem4.jsp";
			}
		} else {
			//방패가 있다면
			
			//창 사용 결과 : 방패 씀으로 이동
			
			item.setUseResult("3");
			matchingService.updateItem(item);
			
			Item item2 = matchingService.getItem(secondUserId, "2");
			item2.setSecondUserId(userId);
			matchingService.updateItem(item2);
			return "forward:/matching/updateItem5.jsp";
		}
		
		
		
		
		
	}
	
	//매칭 확인에서 수락
	@RequestMapping(value = "updateMatching2")
	public String updateMatching2(@RequestParam("userId") String userId) throws Exception {
		System.out.println("/matching/updateMatching2");
		
		
		
		
		if(matchingService.getMatching(userId) != null) {
			Matching matching = matchingService.getMatching(userId);
			String secondUserId = matching.getSecondUserId();
			
			
			Matching matching2 = matchingService.getMatching(secondUserId);
			
			matching.setMatchingStatus("3");
			matchingService.updateMatching(matching);
			
			if(matching2.getMatchingStatus().equals("2")) {
				
				return "forward:/matching/updateMatching4.jsp";
			} else {
				return "forward:/matching/updateMatching2.jsp";
			}
			
		} else {
			
			return "forward:/matching/updateMatching3.jsp";
		}
		
		
		
		
	}
	
	//매칭 확인에서 거절
	@RequestMapping(value = "updateMatching3")
	public String updateMatching3(@RequestParam("userId") String userId) throws Exception {
		System.out.println("/matching/updateMatching3");
		
		if(matchingService.getMatching(userId) != null) {
			Matching matching = matchingService.getMatching(userId);
			matchingService.deleteMatching(matching);
			
			Matching matching2 = matchingService.getMatching(matching.getSecondUserId());
			matchingService.deleteMatching(matching2);
		}
		
		return "forward:/matching/updateMatching3.jsp";
	}
	
	//로그인에서 로그인
	@RequestMapping(value = "getMatching")
	public String getMatching(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("/matching/getMatching");
		
		model.addAttribute("userId", userId);
		System.out.println("userId : " + userId);
		
		return "forward:/matching/getMatching.jsp";
	}
	
	//로그인2에서 로그인
	@RequestMapping(value = "updateMatching")
	public String updateMatching(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("/matching/updateMatching");
		
		model.addAttribute("userId", userId);
		System.out.println("userId : " + userId);
		
		return "forward:/matching/updateMatching.jsp";
	}
	
	@RequestMapping(value = "getAllMatchingList")
	public String getAllMatchingList(Model model) throws Exception {
		System.out.println("/matchig/getAllMatchingList");
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(100);
		Map<String, Object> map = matchingService.getAllMatchingList(search);
		model.addAttribute("list", map.get("list"));
		return "forward:/matching/listAllMatching.jsp";
	}
	
	@RequestMapping(value = "getMatchingByUserId")
	public String getMatchingByUserId(Model model, HttpServletRequest request) throws Exception {
		System.out.println("/matching/getMatchingByUserId");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		Matching matching = matchingService.getMatchingByUserId(userId);
		
		model.addAttribute("matching", matching);
		return "forward:/matching/getMatchingByUserId.jsp";
	}
}
