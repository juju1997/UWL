package com.uwl.web.user;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.couple.CoupleService;
import com.uwl.service.domain.Ask;
import com.uwl.service.domain.Couple;
import com.uwl.service.domain.Friend;
import com.uwl.service.domain.Item;
import com.uwl.service.domain.Matching;
import com.uwl.service.domain.Post;
import com.uwl.service.domain.Report;
import com.uwl.service.domain.Reward;
import com.uwl.service.domain.SchoolRank;
import com.uwl.service.domain.User;
import com.uwl.service.friend.FriendService;
import com.uwl.service.matching.MatchingService;
import com.uwl.service.post.PostService;
import com.uwl.service.purchase.PurchaseService;
import com.uwl.service.report.ReportService;
import com.uwl.service.reward.RewardService;
import com.uwl.service.schoolRank.SchoolRankService;
import com.uwl.service.social.SocialService;
import com.uwl.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	/// Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Autowired
	@Qualifier("schoolRankServiceImpl")
	private SchoolRankService schoolRankService;

	@Autowired
	private SocialService socialService;

	@Autowired
	private CoupleService coupleService;

	@Autowired
	private MatchingService matchingService;

	@Autowired
	private PostService postService;

	@Autowired
	private FriendService friendService;

	@Autowired
	private RewardService rewardService;

	@Autowired
	private PurchaseService purchaseService;

	@Autowired
	private ReportService reportService;

	public UserController() {
		System.out.println(this.getClass());
		System.out.println("UserController() 객체 생성");
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	// 회원가입
	@RequestMapping(value = "addUser", method = RequestMethod.GET)
	public String addUser() throws Exception {
		System.out.println("UserController : addUser() 호출");

		System.out.println("/user/addUser : GET");

		return "forward:/user/addUserView.jsp";
	}

	// 회원가입
	@RequestMapping(value = "addUser", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user, @RequestParam("file") MultipartFile file,
			@ModelAttribute SchoolRank schoolRank) throws Exception {
		System.out.println("UserController : addUser() 호출");
		System.out.println(user);
		System.out.println("/user/addUser : POST");
		System.out.println("UserController : addUser() schoolRank  : " + schoolRank);

		// Business Logic
		String path = "C:\\Users\\User\\git\\UWL\\uwl\\WebContent\\resources\\images\\";
//		String path = "C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\uwl\\resources\\images";
		String name = "";

		if (!file.getOriginalFilename().isEmpty()) {
			name = UUID.randomUUID() + file.getOriginalFilename();
			file.transferTo(new File(path, name));
			user.setProfileName(name);

		} else {
			user.setProfileName("empty.jpg");

		}

		userService.addUser(user);
		System.out.println("유저 뭐나오냐 @(#*)(#$ :: " + user);
		System.out.println("userController의  addUser완료");

		// db안 학교정보가 있는지 확인
		SchoolRank schoolNoCheck = schoolRankService.getSearchRank(user.getSchoolNo());
		System.out.println("schoolNoCheck : " + schoolNoCheck);

		// if (user.getSchoolNo() != schoolNoCheck.getSchoolNo() || schoolNoCheck ==
		// null) {
		if (schoolNoCheck == null) {
			// 학교정보가 없다면 새로이 add
			schoolRankService.addSchoolRank(schoolRank);
			System.out.println("userController의 addUser()에 기존에 학교가 없다면 addSchoolRank() 실행");
		} else if (user.getSchoolNo() == schoolNoCheck.getSchoolNo()) {
			schoolRankService.updateSchoolTotalUser(schoolRank);
			System.out.println("userController의 addUser()에 기존에 학교가있다면 updateSchoolTotalUser() 실행");
		}

		// Default Item Insert
		Item item = new Item();
		item.setFirstUserId(user.getUserId());
		item.setItemCategory("1");
		socialService.addDefaultItem(item);
		item.setItemCategory("2");
		socialService.addDefaultItem(item);

		return "forward:/login.jsp";
	}

	// 실명인증여부
	@RequestMapping(value = "addRealname", method = RequestMethod.POST)
	public String addRealname(@ModelAttribute("user") User user) throws Exception {
		System.out.println("UserController : addRealname() 호출");

		System.out.println("/user/addRealname : POST");
		// Business Logic
		userService.addRealname(user);

		return "forward:/user/loginView.jsp";
	}

	// 회원정보 보기
	@RequestMapping(value = "getUser", method = RequestMethod.GET)
	public String getUser(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("UserController : getUser() GET 호출");

		System.out.println("/user/getUser : GET");
//		 Business Logic

		User user = userService.getUser(userId);
		model.addAttribute("user", user);

		return "forward:/user/getUser.jsp";
	}

	// 회원정보 보기
	@RequestMapping(value = "getUser", method = RequestMethod.POST)
	public String getUser(@ModelAttribute("user") User user) throws Exception {
		System.out.println("UserController : getUser() POST 호출");

		System.out.println("/user/getUser : POST");
		// Business Logic
//			userService.getUser(userId);

		return "forward:/user/getUser?userId=" + user.getUserId();
	}

	// 회원정보 수정
	@RequestMapping(value = "updateUser", method = RequestMethod.GET)
	public String updateUser(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("UserController : updateUser() GET 호출");

		System.out.println("/user/updateUser : GET");
		// Business Logic
		User user = userService.getUser(userId);
		// Model 과 View 연결
		model.addAttribute("user", user);

		return "forward:/user/updateUser.jsp";
	}

	// 회원정보 수정
	@RequestMapping(value = "updateUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user, HttpSession session,
			@RequestParam("file") MultipartFile file) throws Exception {
		System.out.println("UserController : updateUser() POST 호출");

		String path = "C:\\Users\\User\\git\\UWL\\uwl\\WebContent\\resources\\images\\";
		String name = "";

		if (!file.getOriginalFilename().isEmpty()) {
			name = UUID.randomUUID() + file.getOriginalFilename();
			file.transferTo(new File(path, name));
			user.setProfileName(name);
			userService.updateUser(user);
			session.setAttribute("user", user);
			return "forward:/user/getUser.jsp";
		} else {
			User originalUser = (User) session.getAttribute("user");
			user.setProfileName(originalUser.getProfileName());
			userService.updateUser(user);
			session.setAttribute("user", user);
			return "forward:/user/getUser.jsp";
		}
	}

	// 프로필 보기
	@RequestMapping(value = "getProfile/{targetUserId}", method = RequestMethod.GET)
	public String getProfile(@PathVariable String targetUserId, HttpSession session, Model model) throws Exception {
		System.out.println("UserController : getProfile() 호출");
		User sessionUser = (User) session.getAttribute("user");

		System.out.println("sessionUserId : " + sessionUser.getUserId() + "\t\t targetUserId : " + targetUserId);
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);

		// 활동점수, 포인트
		Reward reward = rewardService.getTotalPoint(targetUserId);
		model.addAttribute("reward", reward);
		//session reward
		Reward sessionReward = rewardService.getTotalPoint(sessionUser.getUserId());
		model.addAttribute("sessionReward", sessionReward);

		// targetUserId : 프로필 주인
		User user = userService.getUser(targetUserId);
		model.addAttribute("targetUser", user);
		// getItemList에 search 아무렇게 넣어도 됨
		Map<String, Object> mapOfSpear = matchingService.getItemList(search, targetUserId, "1");
		Map<String, Object> mapOfShield = matchingService.getItemList(search, targetUserId, "2");

		// 창 개수, 방패 개수
		int totalSpear = (Integer) mapOfSpear.get("totalItem");
		int totalShield = (Integer) mapOfShield.get("totalItem");
		model.addAttribute("totalSpear", totalSpear);
		model.addAttribute("totalShield", totalShield);

		// session의 유저와 프로필의 유저가 친구인지 확인
		// Friend에 fristUserId, secondUserId만 넣어주면 됨
		// checkFriend() => return 1: 친구 0: 친구아님
		Friend friend = new Friend();
		friend.setFirstUserId(sessionUser.getUserId());
		friend.setSecondUserId(targetUserId);
		int isFriend = friendService.checkFriend(friend);
		model.addAttribute("isFriend", isFriend);

		// 친구신청관계 확인
		// 1 : 친구신청, 2 : 친구, null : 신청안함
		Friend checkFriend1 = friendService.checkRequest(friend);
		model.addAttribute("checkFriend1", checkFriend1); // return 1 => 신청취소 버튼 만들기 2 => 친구끊기 버튼 만들기
		// 반대확인
		friend.setFirstUserId(targetUserId);
		friend.setSecondUserId(sessionUser.getUserId());
		Friend checkFriend2 = friendService.checkRequest(friend);
		model.addAttribute("checkFriend2", checkFriend2); // return 1 => 친구신청버튼(로직은 수락) 만들기

		// Matching
		Matching matching = matchingService.getMatching(sessionUser.getUserId());
		model.addAttribute("matching", matching);
		int totalMatching = matchingService.getTotalMatching(search, targetUserId);
		model.addAttribute("totalMatching", totalMatching);

		// Timeline
		Search timelineSearch = new Search();
		if (timelineSearch.getCurrentPage() == 0) {
			timelineSearch.setCurrentPage(1);
		}
		timelineSearch.setPageSize(pageSize);

		if (sessionUser.getUserId().equals(targetUserId)) {
			timelineSearch.setSearchCondition("1");
		} else
			timelineSearch.setSearchCondition("0");

		Map<String, Object> timelineMap = socialService.getTimelineList(targetUserId, timelineSearch);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) timelineMap.get("totalCount")).intValue(),
				pageUnit, pageSize);
		timelineMap.put("search", search);
		timelineMap.put("resultPage", resultPage);
		model.addAttribute("timelineMap", timelineMap);

		// AskQuestion
		Map<String, Object> askQuestionMap = socialService.getAskQuestionList(sessionUser.getUserId(), search, "1");
		resultPage = new Page(search.getCurrentPage(), ((Integer) askQuestionMap.get("totalCount")).intValue(),
				pageUnit, pageSize);
		askQuestionMap.put("resultPage", resultPage);
		// Ask
		Map<String, Object> askMap = socialService.getAskList(targetUserId, search, "2");
		resultPage = new Page(search.getCurrentPage(), ((Integer) askMap.get("totalCount")).intValue(), pageUnit,
				pageSize);

		User targetUser = userService.getUser(targetUserId);

		askMap.put("targetUser", targetUser);
		askMap.put("resultPage", resultPage);

		model.addAttribute("askMap", askMap);
		model.addAttribute("askQuestionMap", askQuestionMap);
		model.addAttribute("askMap", askMap);
		
		//Couple회원인지 판별
		
			
		Couple couple = coupleService.getCouple(targetUserId);
		model.addAttribute("couple", couple);
			
		

		return "forward:/user/toolbarProfile.jsp";
	}

	// 프로필 수정
	@RequestMapping(value = "updateProfileView", method = RequestMethod.POST)
	public String updateProfileView(@RequestParam String userId, Model model) throws Exception {
		System.out.println("UserController : updateProfileView() 호출");

		User user = userService.getUser(userId);
		model.addAttribute("user", user);

		return "forward:/user/updateUser2.jsp";
	}

	// 프로필 수정
	@RequestMapping(value = "updateProfile", method = RequestMethod.POST)
	public String updateProfile(@ModelAttribute("user") User user, @RequestParam MultipartFile file, Model model,
			HttpSession session) throws Exception {
		System.out.println("UserController : updateProfile() 호출");

//		String path = "C:\\Users\\User\\git\\UWL\\uwl\\WebContent\\resources\\images\\";
		String path = "C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\uwl\\resources\\images";
		String name = "";

		if (!file.getOriginalFilename().isEmpty()) {
			name = UUID.randomUUID() + file.getOriginalFilename();
			file.transferTo(new File(path, name));
			user.setProfileName(name);
			userService.updateProfile(user);
			
			User dbUser = userService.getUser(user.getUserId());
			session.setAttribute("user", dbUser);
			
			return "redirect:/user/getProfile/" + user.getUserId();
		} else {
			User originalUser = (User) session.getAttribute("user");
			user.setProfileName(originalUser.getProfileName());
			userService.updateProfile(user);
			User dbUser = userService.getUser(user.getUserId());
			session.setAttribute("user", dbUser);
		}

		return "redirect:/user/getProfile/" + user.getUserId();
	}

	// 문의사항 등록
	@RequestMapping(value = "addQuestions", method = RequestMethod.GET)
	public String addQuestions() throws Exception {
		System.out.println("UserController : addQuestions() GET 호출");
		System.out.println("/user/addQuestion : GET");
		System.out.println("/user/addQuestion : GET22");

		return "forward:/user/toolbarAddQuestions.jsp";

	}

	// 문의사항 등록
	@RequestMapping(value = "addQuestions", method = RequestMethod.POST)
	public String addQuestions(@ModelAttribute("post") Post post) throws Exception {
		System.out.println("UserController : addQuestions() POST 호출");

		System.out.println("/user/addQuestions : POST" + post);
		// Business Logic
		post.setPostContent(post.getPostContent().replace("\r\n", "<br>"));
		userService.addQuestions(post);
		return "forward:/user/toolbarGetQuestions.jsp";
	}

	// 문의사항 수정
	@RequestMapping(value = "updateQuestions", method = RequestMethod.GET)
	public String updateQuestions(@ModelAttribute("postNo") int postNo, Model model) throws Exception {
		System.out.println("UserController : updateQuestions() 호출");
		System.out.println("/user/updateQuestions : GET");

		// Business Logic
		Post post = userService.getQuestions(postNo);
		post.setPostContent(post.getPostContent().replace("<br>", "\r\n"));
		model.addAttribute("post", post);

		return "forward:/user/toolbarUpdateQuestions.jsp";
//		return "forward:/user/updateQuestions?postNo=" + post.getPostNo();
	}

	// 문의사항 수정
	@RequestMapping(value = "updateQuestions", method = RequestMethod.POST)
	public String updateQuestions(@ModelAttribute("post") Post post, HttpSession session) throws Exception {
		System.out.println("UserController : updateQuestions() 호출");
		System.out.println("/user/updateQuestions : POST");

		// Business Logic
		post.setPostContent(post.getPostContent().replace("\r\n", "<br>"));
		userService.updateQuestions(post);

		return "redirect:/user/getQuestions?postNo=" + post.getPostNo();
	}

	// 문의사항 내용
	@RequestMapping(value = "getQuestions", method = RequestMethod.GET)
	public String getQuestions(@RequestParam("postNo") int postNo, Model model) throws Exception {
		System.out.println("UserController : getQuestions() GET 호출");

		System.out.println("/user/getQuestions : GET");
		// Business Logic
		Post post = userService.getQuestions(postNo);
		System.out.println("post : " + post);
		// Model 과 View 연결
		model.addAttribute("post", post);

		return "forward:/user/toolbarGetQuestions.jsp";
//			return "forward:/user/getQuestions?postNo"+post.getPostNo();
	}

	// 문의사항 내용
	@RequestMapping(value = "getQuestions", method = RequestMethod.POST)
	public String getQuestions(@RequestParam("post") Post post) throws Exception {
		System.out.println("UserController : getQuestions() POST 호출");

		System.out.println("/user/getQuestions : POST");
		// Business Logic
//				userService.getQuestions(post);

		return "redirect:/user/getQuestions?postNo=" + post.getPostNo();
	}

	// 나의 문의사항 내역
	@RequestMapping(value = "getUserQuestions", method = RequestMethod.GET)
	public String getUserQuestions(@ModelAttribute("search") Search search, Model model, HttpSession httpSession)
			throws Exception {
		System.out.println("UserController : getUserQuestions() 호출");

		System.out.println("/user/getUserQuestions : GET");

		User user = (User) httpSession.getAttribute("user");
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		// Business logic 수행
		Map<String, Object> map = userService.getUserQuestions(search, user.getUserId());

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		System.out.println("@##@#@#@맵 @#@#@#@#" + map);
		return "forward:/user/toolbarGetUserQuestions.jsp";
	}

	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() throws Exception {
		System.out.println("UserController : login() GET 호출");

		System.out.println("/user/logon : GET");

		return "forward:/login.jsp";
	}

	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") User user, HttpSession session, Model model) throws Exception {
		System.out.println("UserController : login() POST 호출");

		System.out.println("/user/login : POST");
		// Business Logic
		User dbUser = userService.getUser(user.getUserId());

		System.out.println("dbUser : \t\t\t" + dbUser);
		if (dbUser == null) {
			model.addAttribute("wrongId", true);
			return "forward:/index.jsp";
		}
		
		List reportList = new ArrayList<Report>();
		reportList = reportService.getReportById(user.getUserId());
		if (reportList != null) {
			for (int i = 0; i < reportList.size(); i++) {
				Report reportUser = (Report) reportList.get(i);
				if (reportUser.getUserId02().equals(user.getUserId())) {
					Date stopDate = reportUser.getStopDate();
					Date today = new Date();
					int result = stopDate.compareTo(today);
					if (result >= 1) {
						model.addAttribute("stopStatus", true);
						model.addAttribute("stopDate", stopDate);
						return "forward:/index.jsp";
					} else {
						session.setAttribute("user", dbUser); // 형진이말대로 추가함 ㅋㅋ;;
						return "forward:/user/main";
					}
				}
			}
		}
		
		
		if (user.getPassword().equals(dbUser.getPassword())) {
			session.setAttribute("user", dbUser);
			session.setMaxInactiveInterval(-1);
			System.out.println(dbUser);
			System.out.println("session scope 저장");
			return "forward:/user/main";
		} else {
			model.addAttribute("wrongPw", true);
			return "forward:/index.jsp";
		}
		
		
	}

	@RequestMapping("main")
	public String main(Model model, HttpSession session) throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(pageSize);
		//스쿨랭킹 순위를 위해 추가한 정보
		User user = (User)session.getAttribute("user");
		
		//학교랭킹
		Map<String, Object> schoolMap = schoolRankService.getSchoolRankingList(search);
		
		//개인랭킹
		Map<String, Object> individualMap = schoolRankService.getIndividualRankingList(search);
		
		model.addAttribute("schoolList", schoolMap.get("list"));
		model.addAttribute("individualRank", individualMap.get("list"));
		//////////////////
		
		//메인에 게시글 가져오기 위해 추가된 것
		String gatherCategoryNo = "";
		Map<String, Object> map = postService.getBoardList(search, gatherCategoryNo);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("gatherCategoryNo", gatherCategoryNo);
		//메인에 게시글 가져오기 위해 추가된 것
		
		//메인에 공지사항 가져오기 위해 추가된 것
		Map<String , Object> noticeList = postService.getNoticeList(search);
		model.addAttribute("noticeList", noticeList.get("list"));
		//메인에 공지사항 가져오기 위해 추가된 것
		
		return "forward:/toolbarMain.jsp";
	}

	// 로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		System.out.println("UserController : logout() 호출");

		System.out.println("/user/logout : GET");

		session.invalidate();

		return "redirect:/";
	}

	// 아이디 중복체크
	@RequestMapping(value = "checkDuplicationUserId", method = RequestMethod.GET)
	public String checkDuplicationUserId(@RequestParam("userId") String userId) throws Exception {
		System.out.println("UserController : checkDuplicationUserId() 호출");

		System.out.println("/user/checkDuplicationUserId : GET");
		// Business Logic
		userService.checkDuplicationUserId(userId);

		return "forward:/user/addUserView.jsp";
	}

	// 아이디 중복체크
	@RequestMapping(value = "checkDuplicationUserId", method = RequestMethod.POST)
	public String checkDuplicationUserId(@RequestParam("userId") String userId, Model model) throws Exception {
		System.out.println("UserController : checkDuplicationUserId() 호출");

		System.out.println("/user/checkDuplicationUserId : POST");
		// Business Logic
		boolean result = userService.checkDuplicationUserId(userId);
		// Model 과 View 연결
		model.addAttribute("result", new Boolean(result));
		model.addAttribute("userId", userId);

		return "forward:/user/checkDuplicationUserId.jsp";
	}

	// 닉네임 중복체크
	@RequestMapping(value = "checkDuplicationNickname", method = RequestMethod.GET)
	public String checkDuplicationNickname(@RequestParam("nickname") String nickname) throws Exception {
		System.out.println("UserController : checkDuplicationNickname() 호출");

		System.out.println("/user/checkDuplicationNickname : GET");
		// Business Logic
		userService.checkDuplicationNickname(nickname);

		return "forward:/user/addUserView.jsp";
	}

	// 닉네임 중복체크
	@RequestMapping(value = "checkDuplicationNickname", method = RequestMethod.POST)
	public String checkDuplicationNickname(@RequestParam("nickname") String nickname, Model model) throws Exception {
		System.out.println("UserController : checkDuplicationNickname() 호출");

		System.out.println("/user/checkDuplicationNickname : POST");
		// Business Logic
		boolean result = userService.checkDuplicationNickname(nickname);
		// Model 과 View 연결
		model.addAttribute("result", new Boolean(result));
		model.addAttribute("nickname", nickname);

		return "forward:/user/checkDuplicationNickname.jsp";
	}

	// 메일 중복체크
	@RequestMapping(value = "checkDuplicationMail", method = RequestMethod.POST)
	public String checkDuplicationMail(@RequestParam("mail") String mail, Model model) throws Exception {
		System.out.println("UserController : checkDuplicationMail() 호출");

		System.out.println("/user/checkDuplicationMail : POST");
		// Business Logic

		boolean result = userService.checkDuplicationMail(mail);
		// Model 과 View 연결
		model.addAttribute("result", new Boolean(result));
		model.addAttribute("mail", mail);

		return "forward:/user/checkDuplicationMail.jsp";
	}

	// 전체 회원목록
	@RequestMapping(value = "getUserList")
	public String listUser(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
			throws Exception {
		System.out.println("UserController : getUserList() 호출");

		System.out.println("/user/getUserList : GET / POST");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		// Business logic 수행
		Map<String, Object> map = userService.getUserList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/user/getUserList.jsp";
	}

	// 전체 문의사항 목록
	@RequestMapping(value = "getUserQuestionsList")
	public String listQuestions(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
			throws Exception {
		System.out.println("UserController : getUserQuestionsList() 호출");

		System.out.println("/user/getUserQuestionsList : GET / POST");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		// Business logic 수행
		Map<String, Object> map = userService.getUserQuestionsList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);

		return "forward:/user/toolbarGetUserQuestionsList.jsp";
	}

	// 회원탈퇴
	@RequestMapping(value = "deleteUser", method = RequestMethod.POST)
	public String deleteUser(@ModelAttribute("user") User user, HttpSession session) throws Exception {
		System.out.println("UserController : deleteUser() 호출");

		System.out.println("/user/deleteUser : POST");
		// Business Logic
		userService.deleteUser(user);
		String sessionId = ((User) session.getAttribute("user")).getUserId();
		if (sessionId.equals(user.getUserId())) {
			session.setAttribute("user", user);
		}

		return "forward:/index.jsp";
	}

	// 네이버로그인
	@RequestMapping(value = "naverLoginLogic")
	// http://{encoding한
	// http://192.168.0.76:8080/user/naverLoginLogic}/redirect?code={code값}&state={state값}
	// 에서 주어지는 code와 state를 @RequestParam("code") / @RequestParam("state") 로 가져왔다.

	public String naverLoginLogic(@RequestParam("code") String code, @RequestParam("state") String state,
			HttpSession session) throws Exception {
		// 접근 토큰을 발생받고 접근 토큰을 이용해 네이버 회원 프로필 조회하는 구간
		// developers.naver.com 에서 상단 Documents => 네이버 아이디로 로그인 => API 명세 => 로그인 API 명세
		// => 3.2 접근 토큰 발급/갱신/삭제 요청 참조

		// 상단 메뉴 => Application => 내 어플리케이션에서 발급받은 Client ID
		// 상단 메뉴 => Application => 내 어플리케이션에서 발급받은 Client Secret
		String clientId = "Ih70sHbbwjRRLdIRzxMP";
		String clientSecret = "d6KDKhVRci";

		// https://nid.naver.com/oauth2.0/token :: 접근 토큰 발급요청
		// GET방식으로 url을 연결할 예정이므로 query String 형식으로 URL 작성

		// grant_type :: 접근 토큰 발급시 authorization_code 고정
		// client id :: 상단 메뉴 => Application => 내 어플리케이션에서 발급받은 Client ID
		// client_secret :: 상단 메뉴 => Application => 내 어플리케이션에서 발급받은 Client Secret
		// code :: redirect URL query string code={code값} => @RequestParam("code")로 받아온
		// 값
		// state :: redirect URL query string state={state값} => @RequestParam("state")로
		// 받아온 값
		String tokenUrl = "https://nid.naver.com/oauth2.0/token?" + "grant_type=authorization_code" + "&client_id="
				+ clientId + "&client_secret=" + clientSecret + "&code=" + code + "&state=" + state;

		// 생성한 URL로 URL을 추상화 / 캡슐화한 Java Class URL 객체 생성
		URL tokenURL = new URL(tokenUrl);

		// 생성한 URL 객체를 HttpURLConnection.openConnection()으로 연결
		// HttpURLConnection :: java.net class에서 제공하는 URL 요청(Request)를 위한 클래스
		HttpURLConnection tokenCon = (HttpURLConnection) tokenURL.openConnection();

		// 사용 method 선언
		tokenCon.setRequestMethod("GET");

		// tokenCon.getResponseCode()로 URL을 Request하고 그 응답 결과를 int형으로 반환
		int tokenResponseCode = tokenCon.getResponseCode();

		// BufferedReader를 정상응답일때와 에러일때로 구분하기 위해 null로 선언
		BufferedReader tokenBr = null;

		if (tokenResponseCode == 200) { // Http 200 OK일 때 tokenCon.getInputStream() UTF-8 인코딩해서 읽음
			tokenBr = new BufferedReader(new InputStreamReader(tokenCon.getInputStream(), "UTF-8"));
		} else { // 에러 발생시 tokenCon.getErrorStream()을 읽음
			tokenBr = new BufferedReader(new InputStreamReader(tokenCon.getErrorStream()));
		}

		// BufferedReader를 한 줄씩 읽기 위한 변수
		String tokenJsonData = "";
		// 실제 response를 출력하는 변수
		StringBuffer tokenResponse = new StringBuffer();

		// readLine()의 경우 한 줄을 읽은 뒤 무조건 다음 줄로 개행되기 때문에
		// readLine() != null이 아닌 ( ( tokenJsonData = tokenBr.readLine() ) != null로 설정했다

		while ((tokenJsonData = tokenBr.readLine()) != null) {
			// BufferedReader에서 한 줄씩 읽어 tokenResponse에 추가
			tokenResponse.append(tokenJsonData);
		}

		// buffered close
		tokenBr.close();

		// response 확인
		System.out.println("----------response ? : " + tokenResponse.toString());

		// 접근 토큰 요청의 반환값은 모두 String이므로 Map<String, String>으로 형변환
		// developers.naver.com 에서 상단 Documents => 네이버 아이디로 로그인 => API 명세 => 로그인 API 명세
		// => 6.2.2 접근 토큰 발급 요청 참조
		JSONObject jsonObject = (JSONObject) JSONValue.parse(tokenResponse.toString());
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, String> tokenMap = objectMapper.readValue(jsonObject.toString(),
				new TypeReference<Map<String, String>>() {
				});

		// 접근 토큰, 갱신 토큰, 토큰 타입, 토큰 유효기간을 모두 출력
		System.out.println("-----------------------tokenMap : " + tokenMap);

		// 접근 토큰 access_token을 가져와서 accessToken에 저장
		String accessToken = tokenMap.get("access_token");

		// 이후 구간은 네이버 회원 프로필 조회를 위한 구간
		// developers.naver.com 에서 상단 Documents => 네이버 아이디로 로그인 => API 명세 => 회원 프로필 조회
		// API 명세 => 2. API 기본 정보 확인

		Map<String, String> profileMap = new HashMap<String, String>();

		try {
			// https://openapi.naver.com/v1/nid/me :: 네이버 회원 프로필 조회 요청 url
			String naverLoginUrl = "https://openapi.naver.com/v1/nid/me";

			URL naverLoginURL = new URL(naverLoginUrl);

			HttpURLConnection naverLoginCon = (HttpURLConnection) naverLoginURL.openConnection();

			// 해당 API는 GET 방식만 가능
			naverLoginCon.setRequestMethod("GET");

			// 접근 토큰을 전달하는 Header 설정
			// Bearer뒤에 꼭 공백이 존재해야 한다
			// 예시 : Authorization: Bearer AAAAOLtP40eH6P5S4Z4FpFl77n3FD5I
			String header = "Bearer " + accessToken;

			// HttpURLConnection.setRequestProperty로 각 Attribute를 설정 가능
			// 접근 토큰을 전달하는 Header 설정
			naverLoginCon.setRequestProperty("Authorization", header);

			int naverLoginResponseCode = naverLoginCon.getResponseCode();

			BufferedReader naverLoginBr;

			if (naverLoginResponseCode == 200) {
				naverLoginBr = new BufferedReader(new InputStreamReader(naverLoginCon.getInputStream(), "UTF-8"));
			} else {
				naverLoginBr = new BufferedReader(new InputStreamReader(naverLoginCon.getErrorStream()));
			}

			String inputLine;

			StringBuffer naverLoginResponse = new StringBuffer();

			while ((inputLine = naverLoginBr.readLine()) != null) {
				naverLoginResponse.append(inputLine);
			}

			naverLoginBr.close();

			System.out.println(naverLoginResponse.toString());

			// 응답 예시에 따라 JSONData 형변환
			// developers.naver.com 에서 상단 Documents => 네이버 아이디로 로그인 => API 명세 => 회원 프로필 조회
			// API 명세 => 7. 요청 예시에서 응답 예시 참조
			jsonObject = (JSONObject) JSONValue.parse(naverLoginResponse.toString());
			profileMap = objectMapper.readValue(jsonObject.get("response").toString(),
					new TypeReference<Map<String, String>>() {
					});

		} catch (Exception e) {
			System.out.println(e);
		}

		System.out.println("------------------profileMap" + profileMap);

		// id : 네이버 아이디의 고유한 식별성. 이메일과는 다름.
		String id = profileMap.get("id");
		System.out.println("-------------------profileMap.get(id) : " + id);

		String name = profileMap.get("name");
		String email = profileMap.get("email");
		String gender = profileMap.get("gender");
		System.out.println("성별 뜸? " + gender);
		if (gender.equals("M")) {
			gender = "2";
		} else {
			gender = "1";
		}
		System.out.println(gender + "젠더 나와라 ;;");

		// 이메일 ~~~@naver.com에서 @의 인덱스를 가져옴
		int index = email.indexOf("@");

		// ~~~@naver.com에서 ~~~를 파싱해서 userId로 설정
		String userId = email.substring(0, index);
		System.out.println("-----------------userId ? : " + userId);

		// checkDuplication return true :: 없는 아이디 => userService.addUser
		if (userService.checkDuplicationUserId(userId)) {
			User user = new User();
			user.setUserId(userId);
			user.setMail(email);
			user.setName(name);
			user.setPassword(id);
			user.setGender(gender);
			user.setBirth("1111-11-11");
			user.setRole("1");
			user.setNickname("마태");
			user.setSchoolNo(1716);

			// userService.addUser(user);
			System.out.println("유저는 ? : " + user);

			User dbUser = userService.getUser(userId);

			// 로그인 처리
			session.setAttribute("naver", user);
		}
		// checkDuplication return false :: 존재하는 아이디 => userService.getUser
		else {
			User dbUser = userService.getUser(userId);

			// 로그인 처리
			session.setAttribute("user", dbUser);
		}

		// 모든 네이버 로그인(회원가입) Business Logic이 끝난 타이밍을 알기 위해 전혀 의미 없는 jsp로 연결
		return "forward:/naver/pathLoginImfo.jsp";
	}

	@RequestMapping(value = "replyQuestion", method = RequestMethod.POST)
	public String replyQuestion(@ModelAttribute Ask ask) throws Exception {
		userService.replyQuestion(ask);
		System.out.println("컨트롤러 탄다");
		return "forward:/user/toolbarGetQuestionsList";

	}

}
