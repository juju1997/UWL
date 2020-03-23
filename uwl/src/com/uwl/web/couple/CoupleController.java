package com.uwl.web.couple;

import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.uwl.common.Search;
import com.uwl.service.couple.CoupleService;
import com.uwl.service.domain.Commentt;
import com.uwl.service.domain.Couple;
import com.uwl.service.domain.Matching;
import com.uwl.service.domain.Post;
import com.uwl.service.domain.User;
import com.uwl.service.matching.MatchingService;



@Controller
@RequestMapping("/couple/*")
public class CoupleController {
	
	@Autowired
	@Qualifier("coupleServiceImpl")
	private CoupleService coupleService;
	
	@Autowired
	@Qualifier("matchingServiceImpl")
	private MatchingService matchingService;
	
	public CoupleController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value = "login2")
	public String getMatching(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("/couple/login2");
		
		model.addAttribute("userId", userId);
		System.out.println("userId : " + userId);
		
		return "forward:/couple/login2.jsp";
	}
	
	@RequestMapping(value = "getCoupleTimelinePostList")
	public String getCoupleTimelinePostList(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("/couple/getCoupleTimelinePostList");
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(100);
		Map<String, Object> map = coupleService.getCoupleTimelinePostList(search, userId);
		
		
		
		
		model.addAttribute("userId", userId);
		model.addAttribute("list", map.get("list"));
		
		return "forward:/couple/listCoupleTimelinePost.jsp";
	}
	
	@RequestMapping(value = "addCoupleTimelinePost")
	public String addCoupleTimelinePost(Model model, HttpServletRequest request) throws Exception {
		System.out.println("/couple/addCoupleTimelinePost");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		model.addAttribute("userId", userId);
		return "forward:/couple/addCoupleTimelinePost.jsp";
	}
	
	@RequestMapping(value = "addCoupleTimelinePost2")
	public String addCoupleTimelinePost(@ModelAttribute("post") Post post) throws Exception {
		System.out.println("/couple/addCoupleTimelinePost2");
		
		
		coupleService.addCoupleTimelinePost(post);
		
		return "forward:/couple/addCoupleTimelinePost2.jsp";
	}
	
	@RequestMapping(value = "getCoupleTimelinePost")
	public String getCoupleTimelinePost(@RequestParam("userId") String userId, Model model, @RequestParam("postNo") int postNo) throws Exception {
		System.out.println("/couple/getCoupleTimelinePost");
		
		model.addAttribute("userId", userId);
		
		Post post = coupleService.getCoupleTimelinePost(postNo);
		
		model.addAttribute("post", post);
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(100);
		Map<String, Object> map = coupleService.getCoupleTimelineCommentList(search, postNo);
		
		model.addAttribute("list", map.get("list"));
		
		return "forward:/couple/ajaxGetCoupleTimelinePost.jsp";
	}
	
	@RequestMapping(value = "updateCoupleTimelinePost")
	public String updateCoupleTimelinePost(@RequestParam("userId") String userId, @RequestParam("postNo") int postNo, Model model) throws Exception {
		System.out.println("/couple/updateCoupleTimelinePost");
		
		model.addAttribute("userId", userId);
		
		Post post = coupleService.getCoupleTimelinePost(postNo);
		model.addAttribute("post", post);
		
		return "forward:/couple/updateCoupleTimelinePost.jsp";
	}
	
	@RequestMapping(value = "updateCoupleTimelinePost2")
	public String updateCoupleTimelinePost2(@RequestParam("userId") String userId, @RequestParam("postNo") int postNo, @ModelAttribute("post") Post post, Model model) throws Exception {
		System.out.println("/couple/updateCoupleTimelinePost2");
		
		
		model.addAttribute("userId", userId);
		model.addAttribute("postNo", postNo);
		
		coupleService.updateCoupleTimelinePost(post);
		
		
		return "forward:/couple/getCoupleTimelinePost";
	}
	
	@RequestMapping(value = "deleteCoupleTimelinePost")
	public String deleteCoupleTimelinePost(@RequestParam("postNo") int postNo, @RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("/couple/deleteCoupleTimelinePost");
		model.addAttribute("userId", userId);
		model.addAttribute("postNo", postNo);
		return "forward:/couple/deleteCoupleTimelinePost.jsp";
	}
	
	@RequestMapping(value = "deleteCoupleTimelinePost2")
	public String deleteCoupleTimelinePost2(@RequestParam("userId") String userId, @RequestParam("postNo") int postNo) throws Exception {
		System.out.println("/couple/deleteCoupleTImelinePost2");
		Post post = coupleService.getCoupleTimelinePost(postNo);
		coupleService.deleteCoupleTimelinePost(post);
		return "forward:/couple/getCoupleTimelinePostList";
	}
	
	@RequestMapping(value = "addCoupleTimelineComment2")
	public String addCoupleTimelineComment2(@ModelAttribute("comment") Commentt comment) throws Exception {
		System.out.println("/couple/addCoupleTimelineComment2");
		coupleService.addCoupleTimelineComment(comment);
		return "forward:/couple/addCoupleTimelineComment2.jsp";
	}
	
	@RequestMapping(value = "addCoupleTimelineComment")
	public String addCoupleTimelineComment(@RequestParam("userId") String userId, @RequestParam("postNo") int postNo, Model model) throws Exception {
		System.out.println("/couple/addCoupleTimelineComment");
		
		model.addAttribute("userId", userId);
		model.addAttribute("postNo", postNo);
		
		return "forward:/couple/addCoupleTimelineComment.jsp";
	}
	
	@RequestMapping(value = "deleteCoupleTimelineComment")
	public String deleteCoupleTimelineComment(@RequestParam("userId") String userId, @RequestParam("commentNo") int commentNo, Model model) throws Exception {
		System.out.println("/couple/deleteCoupleTimelineComment");
		model.addAttribute("userId", userId);
		model.addAttribute("commentNo", commentNo);
		return "forward:/couple/deleteCoupleTimelineComment.jsp";
	}
	
	@RequestMapping(value = "deleteCoupleTimelineComment2")
	public String deleteCoupleTimelineComment2(@RequestParam("userId") String userId, @RequestParam("commentNo") int commentNo) throws Exception {
		System.out.println("/couple/deleteCoupleTimelineComment2");
		Commentt comment = coupleService.getCoupleTimelineComment(commentNo);
		coupleService.deleteCoupleTimelineComment(comment);
		return "forward:/couple/deleteCoupleTimelineComment2.jsp";
	}
	
//	@RequestMapping(value = "getScheduleList")
//	public String getScheduleList(@RequestParam("userId") String userId, Model model) throws Exception {
//		System.out.println("/couple/getScheduleList");
//		
//		model.addAttribute("userId", userId);
//		
//		Search search = new Search();
//		search.setCurrentPage(1);
//		search.setPageSize(100);
//		Map<String, Object> map = coupleService.getScheduleList2(search, userId);
//		
//		model.addAttribute("list", map.get("list"));
//		
//		return "forward:/couple/listSchedule.jsp";
//	}
	
	@RequestMapping(value = "getScheduleList")
	public String getScheduleList(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("/couple/getScheduleList");
		model.addAttribute("userId", userId);
		
		return "forward:/couple/listSchedule3.jsp";
	}
	
	@RequestMapping(value = "getScheduleList2")
	public String getScheduleList2(@RequestParam("userId") String userId, @RequestParam("postDate") String postDate, Model model) throws Exception {
		System.out.println("/couple/getScheduleListPostDate2");
		model.addAttribute("userId", userId);
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(100);
		Map<String, Object> map = coupleService.getScheduleList(search, userId, postDate);
		model.addAttribute("list", map.get("list"));
		return "forward:/couple/getScheduleListPostDate2.jsp";
	}
	
	@RequestMapping(value = "addSchedule")
	public String addSchedule(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("/couple/addSchedule");
		
		model.addAttribute("userId", userId);
		
		
		return "forward:/couple/addSchedule.jsp";
	}
	
	@RequestMapping(value = "addSchedule2")
	public String addSchedule2(@ModelAttribute("post") Post post) throws Exception {
		System.out.println("/couple/addSchedule2");
		
		
		System.out.println(post.getUserId());
		coupleService.addSchedule(post);
		
		return "forward:/couple/getScheduleList";
	}
	
	@RequestMapping(value = "getSchedule")
	public String getSchedule(@RequestParam("userId") String userId, @RequestParam("postNo") int postNo, Model model) throws Exception {
		System.out.println("/couple/getSchedule");
		
		Post post = coupleService.getSchedule(postNo);
		
		model.addAttribute("userId", userId);
		System.out.println("userId : " + userId);
		model.addAttribute("post", post);
		
		return "forward:/couple/getSchedule.jsp";
	}
	
	@RequestMapping(value = "updateSchedule")
	public String updateSchedule(@RequestParam("userId") String userId, @RequestParam("postNo") int postNo, Model model) throws Exception {
		System.out.println("/couple/updateSchedule");
		
		model.addAttribute("userId", userId);
		model.addAttribute("postNo", postNo);
		
		
		Post post = coupleService.getSchedule(postNo);
		
		model.addAttribute("post", post);
		
		return "forward:/couple/updateSchedule.jsp";
	}
	
	@RequestMapping(value = "updateSchedule2")
	public String updateSchedule2(@RequestParam("userId") String userId, @RequestParam("postNo") int postNo, @ModelAttribute("post") Post post) throws Exception {
		System.out.println("/couple/updateSchedule2");
		
		
		
		coupleService.updateSchedule(post);
		System.out.println("userId : " + userId);
		return "forward:/couple/getSchedule?postNo=" + postNo;
	}
	
	@RequestMapping(value = "deleteSchedule")
	public String deleteSchedule(@RequestParam("userId") String userId, @RequestParam("postNo") int postNo, Model model) throws Exception {
		System.out.println("/couple/deleteSchedule");
		model.addAttribute("userId", userId);
		model.addAttribute("postNo", postNo);
		return "forward:/couple/deleteSchedule.jsp";
	}
	
	@RequestMapping(value = "deleteSchedule2")
	public String deleteSchedule2(@RequestParam("userId") String userId, @RequestParam("postNo") int postNo) throws Exception {
		System.out.println("/couple/deleteSchedule2");
		Post post = coupleService.getSchedule(postNo);
		coupleService.deleteSchedule(post);
		return "forward:/couple/getScheduleList";
	}
	
	@RequestMapping(value = "deleteCouple")
	public String deleteCouple(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("/couple/deleteCouple");
		
		model.addAttribute("userId", userId);
		
		if(coupleService.getCouple(userId) != null) {
			Couple couple = coupleService.getCouple(userId);
			model.addAttribute("couple", couple);
		}
		
		return "forward:/couple/deleteCouple.jsp";
	}
	
	@RequestMapping(value = "deleteCouple2")
	public String deleteCouple2(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("/couple/deleteCouple2");
		
		model.addAttribute("userId", userId);
		
		Couple couple = coupleService.getCouple(userId);
		String secondUserId = couple.getSecondUserId();
		
		model.addAttribute("secondUserId", secondUserId);
		return "forward:/couple/deleteCouple2.jsp";
	}
	
	@RequestMapping(value = "deleteCouple3")
	public String deleteCouple3(@RequestParam("userId") String userId, @RequestParam("secondUserId") String secondUserId) throws Exception {
		System.out.println("/couple/deleteCouple3");
		
		Couple couple = coupleService.getCouple(userId);
		coupleService.deleteCouple(couple);
		
		Matching matching = matchingService.getMatching(userId);
		Matching matching2 = matchingService.getMatching(secondUserId);
		
		matchingService.deleteMatching(matching);
		matchingService.deleteMatching(matching2);
		
		coupleService.deleteCoupleTimeline(userId, secondUserId);
		
		return "forward:/couple/deleteCouple3.jsp";
	}
	
	
	
	
	
	
	
	

}
