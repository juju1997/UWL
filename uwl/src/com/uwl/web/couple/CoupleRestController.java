package com.uwl.web.couple;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.community.CommunityService;
import com.uwl.service.couple.CoupleService;
import com.uwl.service.domain.Commentt;
import com.uwl.service.domain.Couple;
import com.uwl.service.domain.Matching;
import com.uwl.service.domain.Post;
import com.uwl.service.domain.User;
import com.uwl.service.matching.MatchingService;
import com.uwl.service.user.UserService;

@RestController
@RequestMapping("/couple/*")
public class CoupleRestController {
	
	@Autowired
	@Qualifier("coupleServiceImpl")
	private CoupleService coupleService;
	
	@Autowired
	@Qualifier("matchingServiceImpl")
	private MatchingService matchingService;
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public CoupleRestController() {
		
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value = "rest/login2/{userId}")
	public String login2(@PathVariable String userId) throws Exception {
		System.out.println("rest/login2/{userId} 시작");
		System.out.println("rest/login2/{userId} 끝");
		return userId;
	}
	@RequestMapping(value = "rest/getCoupleTimelinePostList", method = RequestMethod.POST)
	public Map getCoupleTimelinePostList(@RequestBody Search search, HttpSession session) throws Exception {
		System.out.println("rest/getCoupleTimelinePostList/{userId} 시작");
		String userId = ((User)session.getAttribute("user")).getUserId();
		
		Couple couple = coupleService.getCouple(userId);
		
		
		String firstUserId = couple.getFirstUserId();
		String secondUserId = couple.getSecondUserId();
		
		
		User firstUser = userService.getUser(firstUserId);
		User secondUser = userService.getUser(secondUserId);
		
		String matchingDate = couple.getMatchingDate().toString();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-mm-dd");
		Date time = new Date();
		String time1 = format1.format(time);
		Date firstDate = format1.parse(matchingDate);
		Date secondDate = format1.parse(time1);
		long calDate = firstDate.getTime() - secondDate.getTime();
		long calDateDays = calDate / (24 * 60 * 60 * 1000);
		calDateDays = Math.abs(calDateDays);
		System.out.println("두 날짜의 날짜 차이(calDateDays) : " + calDateDays);
		
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(9);
		Map<String, Object> map = coupleService.getCoupleTimelinePostList(search, userId);
		System.out.println("totalCount : " + map.get("totalCoupleTimelinePost"));
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCoupleTimelinePost")).intValue(), pageUnit, 9);
		System.out.println("resultPage : " + resultPage);
		Map map2 = new HashMap();
		map2.put("list", map.get("list"));
		map2.put("resultPage", resultPage);
		map2.put("search", search);
		map2.put("userId", userId);
		map2.put("firstUser", firstUser);
		map2.put("secondUser", secondUser);
		map2.put("calDateDays", calDateDays + 1);
		System.out.println("list : " + map.get("list"));
		System.out.println("rest/getCoupleTimelinePostList/{userId} 끝");
		return map2;
	}
	
	@RequestMapping(value = "rest/addCoupleTimelinePost/{userId}")
	public String addCoupleTimelinePost(@PathVariable String userId) throws Exception {
		System.out.println("rest/addCoupleTimelinePost/{userId} 시작");
		System.out.println("rest/addCoupleTimelinePost/{userId} 끝");
		return userId;
	}
	
	//private static final String UPLOAD_PATH = "C:\\Users\\User\\git\\UWL\\uwl\\WebContent\\resources\\images";
	
	@RequestMapping(value = "rest/addCoupleTimelinePost2")
	public Map addCoupleTimelinePost2(HttpServletRequest request, @RequestParam(value="file", required=false) MultipartFile file, @RequestParam(value="place") String place, @RequestParam(value="postContent") String postContent) throws Exception {
		System.out.println("rest/addCoupleTimelinePost2/{userId} 시작");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		Post post = new Post();
		post.setUserId(userId);
		post.setPlace(place);
		post.setPostContent(postContent);
		
		
		String fileName = "";
		int startInt = file.getOriginalFilename().indexOf(".");
		if( file != null) {
//			String filePath ="C:\\Users\\User\\git\\UWL\\uwl\\WebContent\\resources\\images\\";
			String filePath ="C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\uwl\\resources\\images\\";
			fileName += UUID.randomUUID().toString().substring(0, 8)+System.currentTimeMillis()+file.getOriginalFilename().substring(startInt);
			System.out.println("\t\t저장 파일 이름 : "+fileName);
			File saveFile = new File(filePath+fileName);
			file.transferTo(saveFile);
			post.setUploadFileName(fileName);
		}
		
		
		coupleService.addCoupleTimelinePost(post);
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("post", post);
		System.out.println("rest/addCoupleTimelinePost2/{userId} 끝");
		return map;
	}
	
//	private String saveFile(MultipartFile file) {
//		
//		UUID uuid = UUID.randomUUID();
//		String saveName = uuid + "_" + file.getOriginalFilename();
//		
//		System.out.println("saveName : " + saveName);
//		
//		File saveFile = new File(UPLOAD_PATH, saveName);
//		
//		try {
//			file.transferTo(saveFile);
//		} catch(Exception e) {
//			e.printStackTrace();
//			return null;
//		}
//		
//		return saveName;
//	}
	
	@RequestMapping(value = "rest/getCoupleTimelinePost/{userId}/{postNo}")
	public Map getCoupleTimelinePost(@PathVariable String userId, @PathVariable int postNo) throws Exception {
		System.out.println("rest/getCoupleTimelinePost/{userId} 시작");
		
		
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		Post post = coupleService.getCoupleTimelinePost(postNo);
		map.put("post", post);
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(100);
		Map<String, Object> map2 = coupleService.getCoupleTimelineCommentList(search, postNo);
		map.put("list", map2.get("list"));
		System.out.println("rest/getCoupleTimelinePost/{userId} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/updateCoupleTimelinePost/{userId}/{postNo}")
	public Map updateCoupleTimelinePost(@PathVariable String userId, @PathVariable int postNo) throws Exception {
		System.out.println("rest/updateCoupleTimelinePost/{userId}/{postNo} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		Post post = coupleService.getCoupleTimelinePost(postNo);
		map.put("post", post);
		System.out.println("rest/updateCoupleTimelinePost/{userId}/{postNo} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/updateCoupleTimelinePost2/{userId}/{postNo}")
	public Map updateCoupleTimelinePost2(@PathVariable String userId, @PathVariable int postNo, @RequestParam(value="file", required=false) MultipartFile file, @RequestParam(value="place") String place, @RequestParam(value="postContent") String postContent) throws Exception {
		System.out.println("rest/updateCoupleTimelinePost2/{userId}/{postNo} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("postNo", postNo);
		Post post = coupleService.getCoupleTimelinePost(postNo);
		
		System.out.println("postNo : " + postNo);
		
		post.setPlace(place);
		post.setPostContent(postContent);
		
		System.out.println("place : " + place);
		System.out.println("postContent : " + postContent);
		System.out.println("file : " + file);
		
		
		String fileName = "";
		
		if( file != null) {
			int startInt = file.getOriginalFilename().indexOf(".");
//			String filePath ="C:\\Users\\User\\git\\UWL\\uwl\\WebContent\\resources\\images\\";
			String filePath ="C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\uwl\\resources\\images\\";
			fileName += UUID.randomUUID().toString().substring(0, 8)+System.currentTimeMillis()+file.getOriginalFilename().substring(startInt);
			System.out.println("\t\t저장 파일 이름 : "+fileName);
			File saveFile = new File(filePath+fileName);
			file.transferTo(saveFile);
			post.setUploadFileName(fileName);
		}
		coupleService.updateCoupleTimelinePost(post);
		
		System.out.println("업데이트성공ㅋㅋ");
		Post post2 = coupleService.getCoupleTimelinePost(postNo);
		map.put("post", post2);
		System.out.println("rest/updateCoupleTimelinePost2/{userId}/{postNo} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/deleteCoupleTimelinePost/{userId}/{postNo}")
	public Map deleteCoupleTimelinePost(@PathVariable String userId, @PathVariable int postNo) throws Exception {
		System.out.println("rest/deleteCoupleTimelinePost/{userId}/{postNo} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("postNo", postNo);
		System.out.println("rest/deleteCoupleTimelinePost/{userId}/{postNo} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/deleteCoupleTimelinePost2/{postNo}")
	public void deleteCoupleTimelinePost(@PathVariable int postNo) throws Exception {
		System.out.println("rest/deleteCoupleTimelinePost2/{postNo} 시작");
		Post post = coupleService.getCoupleTimelinePost(postNo);
		coupleService.deleteCoupleTimelinePost(post);
		System.out.println("rest/deleteCoupleTimelinePost2/{postNo} 끝");
	}
	
	@RequestMapping(value = "rest/addCoupleTimelineComment2")
	public Commentt addCoupleTimelineComment2(@RequestBody Commentt comment) throws Exception {
		System.out.println("rest/addCoupleTimelineComment2 시작");
		coupleService.addCoupleTimelineComment(comment);
		Commentt comment2 = communityService.getComment(comment.getUserId(), comment.getPostNo());
		
		System.out.println("rest/addCoupleTimelineComment2 끝");
		return comment2;
	}
	
	@RequestMapping(value = "rest/addCoupleTimelineComment/{userId}/{postNo}")
	public Map addCoupleTimelineComment(@PathVariable String userId, @PathVariable int postNo) throws Exception {
		System.out.println("rest/addCoupleTimelineComment/{userId}/{postNo} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("postNo", postNo);
		System.out.println("rest/addCoupleTimelineComment/{userId}/{postNo} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/deleteCoupleTimelineComment/{userId}/{commentNo}")
	public Map deleteCoupleTimelineComment(@PathVariable String userId, @PathVariable int commentNo) throws Exception {
		System.out.println("rest/deleteCoupleTimelineComment/{userId}/{commentNo} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("commentNo", commentNo);
		System.out.println("rest/deleteCoupleTimelineComment/{userId}/{commentNo} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/deleteCoupleTimelineComment2/{userId}/{commentNo}")
	public Commentt deleteCoupleTimelineComment2(@PathVariable String userId, @PathVariable int commentNo) throws Exception {
		System.out.println("rest/deleteCoupleTimelineComment2/{userId}/{commentNo} 시작");
		Commentt comment = coupleService.getCoupleTimelineComment(commentNo);
		coupleService.deleteCoupleTimelineComment(comment);
		System.out.println("rest/deleteCoupleTimelineComment2/{userId}/{commentNo} 끝");
		return comment;
	}
	
//	@RequestMapping(value = "rest/getScheduleList/{userId}")
//	public Map getScheduleList(@PathVariable String userId) throws Exception {
//		System.out.println("rest/getScheduleList/{userId} 시작");
//		Map<String, Object> map = new HashMap();
//		map.put("userId", userId);
//		Search search = new Search();
//		search.setCurrentPage(1);
//		search.setPageSize(100);
//		Map<String, Object> map2 = coupleService.getScheduleList2(search, userId);
//		map.put("list", map2.get("list"));
//		System.out.println("rest/getScheduleList/{userId} 끝");
//		return map;
//	}
	
	@RequestMapping(value = "rest/getScheduleList/{userId}")
	public String getScheduleList(@PathVariable String userId) throws Exception {
		System.out.println("rest/getScheduleList/{userId} 시작");
		System.out.println("rest/getScheduleList/{userId} 끝");
		return userId;
	}
	
	@RequestMapping(value ="rest/getScheduleList2/{userId}/{postDate}")
	public Map getScheduleList2(@PathVariable String userId, @PathVariable String postDate) throws Exception {
		System.out.println("rest/getScheduleList2/{userId}/{postDate} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(100);
		Map<String, Object> map2 = coupleService.getScheduleList(search, userId, postDate);
		map.put("list", map2.get("list"));
		System.out.println("rest/getScheduleList2/{userId}/{postDate} 끝");
		return map;
	}
	
	
	
	@RequestMapping(value = "rest/addSchedule/{userId}")
	public String addSchedule(@PathVariable String userId) throws Exception {
		System.out.println("rest/addSchedule/{userId} 시작");
		System.out.println("rest/addSchedule/{userId} 끝");
		return userId;
	}
	
	@RequestMapping(value = "rest/addSchedule2")
	public Post addSchedule2(@RequestBody Post post) throws Exception {
		System.out.println("rest/addSchedule2 시작");
		coupleService.addSchedule(post);
		System.out.println("rest/addSchedule2 끝");
		return post;
	}
	
	@RequestMapping(value = "rest/getSchedule/{userId}/{postNo}")
	public Map getSchedule(@PathVariable String userId, @PathVariable int postNo) throws Exception {
		System.out.println("rest/getSchedule/{userId}/{postNo} 시작");
		Post post = coupleService.getSchedule(postNo);
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("post", post);
		System.out.println("rest/getSchedule/{userId}/{postNo} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/updateSchedule/{userId}/{postNo}")
	public Map updateSchedule(@PathVariable String userId, @PathVariable int postNo) throws Exception {
		System.out.println("rest/updateSchedule/{userId}/{postNo} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("postNo", postNo);
		Post post = coupleService.getSchedule(postNo);
		map.put("post", post);
		System.out.println("rest/updateSchedule/{userId}/{postNo} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/updateSchedule")
	public Post updateSchedule(@RequestBody Post post) throws Exception {
		System.out.println("rest/updateSchedule 시작");
		coupleService.updateSchedule(post);
		int postNo = post.getPostNo();
		Post post2 = coupleService.getSchedule(postNo);
		System.out.println("rest/updateSchedule 끝");
		return post2;
	}
	
	@RequestMapping(value = "rest/deleteSchedule/{userId}/{postNo}")
	public Map deleteSchedule(@PathVariable String userId, @PathVariable int postNo) throws Exception {
		System.out.println("rest/deleteSchedule/{userId}/{postNo} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		map.put("postNo", postNo);
		System.out.println("rest/deleteSchedule/{userId}/{postNo} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/deleteSchedule2/{postNo}")
	public void deleteSchedule2(@PathVariable int postNo) throws Exception {
		System.out.println("json/deleteSchedule2/{postNo} 시작");
		Post post = coupleService.getSchedule(postNo);
		coupleService.deleteSchedule(post);
		System.out.println("rest/deleteSchedule2/{postNo} 끝");
	}
	
	@RequestMapping(value = "rest/deleteCouple/{userId}")
	public Map deleteCouple(@PathVariable String userId) throws Exception {
		System.out.println("rest/deleteCouple/{userId} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		if(coupleService.getCouple(userId) != null) {
			Couple couple = coupleService.getCouple(userId);
			map.put("couple", couple);
		}
		System.out.println("rest/deleteCouple/{userId} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/deleteCouple2/{userId}")
	public Map deleteCouple2(@PathVariable String userId) throws Exception {
		System.out.println("rest/deleteCouple2/{userId} 시작");
		Map<String, Object> map = new HashMap();
		map.put("userId", userId);
		Couple couple = coupleService.getCouple(userId);
		String secondUserId = couple.getSecondUserId();
		map.put("secondUserId", secondUserId);
		System.out.println("rest/deleteCouple2/{userId} 끝");
		return map;
	}
	
	@RequestMapping(value = "rest/deleteCouple3/{userId}/{secondUserId}")
	public void deleteCouple3(@PathVariable String userId, @PathVariable String secondUserId) throws Exception {
		System.out.println("rest/deleteCouple3/{userId}/{secondUserId} 시작");
		Couple couple = coupleService.getCouple(userId);
		coupleService.deleteCouple(couple);
		Matching matching = matchingService.getMatching(userId);
		Matching matching2 = matchingService.getMatching(secondUserId);
		matchingService.deleteMatching(matching);
		matchingService.deleteMatching(matching2);
		coupleService.deleteCoupleTimeline(userId, secondUserId);
		System.out.println("rest/deleteCouple3/{userId}/{secondUserId} 끝");
	}
}
