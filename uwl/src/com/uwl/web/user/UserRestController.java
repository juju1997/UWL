package com.uwl.web.user;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.uwl.common.MailUtils;
import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.domain.Ask;
import com.uwl.service.domain.Couple;
import com.uwl.service.domain.Post;
import com.uwl.service.domain.Report;
import com.uwl.service.domain.User;
import com.uwl.service.domain.Weather;
import com.uwl.service.fcm.FcmService;
import com.uwl.service.report.ReportService;
import com.uwl.service.user.UserService;
import com.uwl.service.weather.WeatherService;

@RestController
@RequestMapping("/user/*")
public class UserRestController {

	/// Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	private ReportService reportService;
	
	// 메일 인증
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private WeatherService weatherService;
	
	@Autowired
	private FcmService fcmService;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	@Value("#{apiProperties['blueApiid']}")
	String apiId;
	@Value("#{apiProperties['blueApiKey']}")
	String apiKey;
	@Value("#{apiProperties['blueSender']}")
	String sender;

	public UserRestController() {
		System.out.println(this.getClass());
	}

	// 회원가입
	@RequestMapping(value = "rest/addUser", method = RequestMethod.POST)
	public void addUser(@RequestBody User user) throws Exception {
		System.out.println("/user/rest/addUser : POST");

		userService.addUser(user);
		System.out.println("[addUser end...]");
	}

	// 회원정보 , id 중복체크
	@RequestMapping(value = "rest/getUser/{userId}", method = RequestMethod.GET)
	public User getUser(@PathVariable String userId) throws Exception {

		System.out.println("/user/rest/getUser : GET");

		// Business Logic
		return userService.getUser(userId);
	}

	// nickname 중복체크
	@RequestMapping(value = "rest/getUserByNick/{userId}", method = RequestMethod.GET)
	public User getUserByNickname(@PathVariable String nickname) throws Exception {

		System.out.println("/user/rest/getUser : GET");

		// Business Logic
		return userService.getUserByNickname(nickname);
	}

	// 회원정보 수정
	@RequestMapping(value = "rest/updateUser/{userId}", method = RequestMethod.GET)
	public User updateUser(@PathVariable String userId) throws Exception {

		System.out.println("/user/rest/updateUser : GET");

		User user = userService.getUser(userId);

		return user;
	}

	// 회원정보 수정
	@RequestMapping(value = "rest/updateUser", method = RequestMethod.POST)
	public void updateUser(@RequestBody User user, HttpSession session) throws Exception {

		System.out.println("/user/rest/updateUser : POST");
		userService.updateUser(user);
	}

	// 로그인
	@RequestMapping(value = "rest/login", method = RequestMethod.POST)
	public User login(@RequestBody User user, HttpSession session) throws Exception {

		System.out.println("/user/rest/login : POST");
		// Business Logic
		System.out.println("::" + user);
		User dbUser = userService.getUser(user.getUserId());

		if (user.getPassword().equals(dbUser.getPassword())) {
			session.setAttribute("user", dbUser);
		}

		return dbUser;
	}

	// 회원전체 목록
	@RequestMapping(value = "rest/getUserlist", method = RequestMethod.GET)
	public Map listUser() throws Exception {
		Search search = new Search();

		System.out.println("/user/rest/getUserList : GET ");
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = userService.getUserList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		map.put("search", search);
		map.put("resultPage", resultPage);
		return map;
	}

	// 회원전체 목록
	@RequestMapping(value = "rest/getUserList", method = RequestMethod.POST)
	public Map listUser(@RequestBody Search search) throws Exception {

		System.out.println("/user/rest/getUserList : POST ");
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = userService.getUserList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		search.setPageSize((Integer) map.get("totalCount"));

		List<String> listUserId = new ArrayList<String>();
		List<String> listUserName = new ArrayList<String>();
//		List<User> list = (List<User>) userService.getUserList(search).get("list");
		List<User> list = (List<User>) map.get("list");

		for (int i = 0; i < list.size(); i++) {
			listUserId.add(list.get(i).getUserId());
		}

		for (int i = 0; i < list.size(); i++) {
			if (!listUserName.contains(list.get(i).getName())) {
				listUserName.add(list.get(i).getName());
			}
		}

		map.put("listUserId", listUserId);
		map.put("listUserName", listUserName);
		map.put("search", search);
		map.put("resultPage", resultPage);
		return map;
	}


	// id 중복체크
	@RequestMapping(value = "rest/checkDuplicationUserId", method = RequestMethod.GET)
	public boolean checkDuplicationUserId(@RequestParam String userId) throws Exception {
		System.out.println("/user/rest/checkDuplicationUserId : GET");
		boolean result = userService.checkDuplicationUserId(userId);

//		Map map = new HashMap();
//		map.put("result", new Boolean(result));
//		return map;
		return result;
	}

	// id 중복체크
	@RequestMapping(value = "rest/checkDuplicationUserId", method = RequestMethod.POST)
	public Map checkDuplicationUserId(@RequestBody User user) throws Exception {
		System.out.println("/user/rest/checkDuplicationUserId : POST");
		boolean result = userService.checkDuplicationUserId(user.getUserId());

		Map map = new HashMap();
		map.put("result", new Boolean(result));
		return map;
	}

	// nickname 중복체크
	@RequestMapping(value = "rest/checkDuplicationNickname", method = RequestMethod.GET)
	public boolean checkDuplicationNickname(@RequestParam String nickname) throws Exception {
		System.out.println("/user/rest/checkDuplicationNickname : GET");
		boolean result = userService.checkDuplicationNickname(nickname);

//		Map map = new HashMap();
//		map.put("result", new Boolean(result));
//		return map;
		return result;
	}

	// nickname 중복체크
	@RequestMapping(value = "rest/checkDuplicationNickname", method = RequestMethod.POST)
	public Map checkDuplicationNickname(@RequestBody User user) throws Exception {
		System.out.println("/user/rest/checkDuplicationNickname : POST");
		boolean result = userService.checkDuplicationNickname(user.getNickname());

		Map map = new HashMap();
		map.put("result", new Boolean(result));
		return map;
	}

	// mail 중복체크
	@RequestMapping(value = "rest/checkDuplicationMail", method = RequestMethod.GET)
	public boolean checkDuplicationMail(@RequestParam String mail) throws Exception {
		System.out.println("/user/rest/checkDuplicationMail : GET");
		boolean result = userService.checkDuplicationMail(mail);

//		Map map = new HashMap();
//		map.put("result", new Boolean(result));
//		return map;
		return result;
	}

	// 나의 문의사항 내역
	@RequestMapping(value = "rest/getUserQuestions", method = RequestMethod.GET)
	public Map getUserQuestions(@ModelAttribute Search search, HttpSession httpSession) throws Exception {
//		Search search = new Search();

		System.out.println("/user/rest/getUserQuestions : GET ");

		User user = (User) httpSession.getAttribute("user");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = userService.getUserQuestions(search, user.getUserId());

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		map.put("list", map.get("list"));
		map.put("search", search);
		map.put("resultPage", resultPage);
		return map;
	}


	// id 찾기
	@RequestMapping(value = "rest/findId", method = RequestMethod.POST)
	public User findId(@RequestBody User user) throws Exception {

		System.out.println("/user/rest/findId : POST");
		// Business Logic
		User dbUser = userService.getUser(user.getMail());

		if (user.getMail().equals(dbUser.getMail())) {
			return dbUser;
		}
		return null;

	}

	// pw 찾기
	@RequestMapping(value = "rest/findPw", method = RequestMethod.POST)
	public User findPw(@RequestBody User user) throws Exception {

		System.out.println("/user/rest/findPw : POST");
		// Business Logic
		User dbUser = userService.getUser(user.getUserId());

		if (user.getUserId().equals(dbUser.getUserId())) {
		}

		return userService.getUser(user.getPassword());
	}

	@RequestMapping(value = "/rest/sendSms")
	public String sendSms(String receiver, HttpSession session) {
		System.out.println(receiver);
		// 6자리 인증 코드 생성
		int rand = (int) (Math.random() * 899999) + 100000;
		System.out.println("인증 코드 : " + rand);

		session.setAttribute("rand", rand);

		// 인증 코드를 데이터베이스에 저장하는 코드는 생략했습니다.

		// 문자 보내기
		String hostname = "api.bluehouselab.com";
		String url = "https://" + hostname + "/smscenter/v1.0/sendsms";

		CredentialsProvider credsProvider = new BasicCredentialsProvider();
		credsProvider.setCredentials(new AuthScope(hostname, 443, AuthScope.ANY_REALM),
				new UsernamePasswordCredentials(apiId, apiKey));

		// Create AuthCache instance
		AuthCache authCache = new BasicAuthCache();
		authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());

		// Add AuthCache to the execution context
		HttpClientContext context = HttpClientContext.create();
		context.setCredentialsProvider(credsProvider);
		context.setAuthCache(authCache);

		DefaultHttpClient client = new DefaultHttpClient();

		try {
			HttpPost httpPost = new HttpPost(url);
			httpPost.setHeader("Content-type", "application/json; charset=utf-8");

			String json = "{\"sender\":\"" + sender + "\",\"receivers\":[\"" + receiver + "\"],\"content\":\"" + rand
					+ "\"}";

			StringEntity se = new StringEntity(json, "UTF-8");
			httpPost.setEntity(se);

			HttpResponse httpResponse = client.execute(httpPost, context);

			InputStream inputStream = httpResponse.getEntity().getContent();
			if (inputStream != null) {
				BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
				String line = "";
				while ((line = bufferedReader.readLine()) != null)
					inputStream.close();
			}
			System.out.println("send SMS success");
		} catch (Exception e) {
			System.err.println("Error: " + e.getLocalizedMessage());
		} finally {
			client.getConnectionManager().shutdown();
		}
		return "true";
	}

	@RequestMapping(value = "/rest/smsCheck")
	public boolean smsCheck(@RequestParam(value = "code") String code, HttpSession session) {
		String saveCode = (session.getAttribute("rand").toString());
		System.out.println(saveCode);
		System.out.println(code);
		System.out.println("발행한 인증 코드 :" + saveCode);
		if (code.equals(saveCode)) {
			return true;
		} else {
			return false;
		}
	}

//	 mail 인증

	@RequestMapping(value = "rest/checkMail")
	public Map checkMailValue(@RequestBody Map jsonMap) throws Exception {
		System.out.println("user/rest/checkMail");

		String mail = (String) jsonMap.get("mail");
		System.out.println("mail : " + mail);
		// 메일 인증 시 입력할 값을 생성
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString(32);

		// Autowired된 JavaMailSender로 MailUtils 객체 생성
		MailUtils sendMail = new MailUtils(mailSender);

		// JavaMailSender.setSubject(title) :: 메일 제목 설정
		sendMail.setSubject("[어'울림] 이메일 인증");

		// JavaMailSender.setText(text) :: 메일 내용 설정
		// StringBuffer로 작성
		sendMail.setText(new StringBuffer()
				.append("<div style='text-align : center'><img src='http://optimal.inven.co.kr/upload/2020/02/13/bbs/i13419547136.png' style='width : 40%; height : 40%'>")
				.append("<h1>어'울림 이메일 인증</h1>").append("<h3>소셜 데이팅 서비스 어'울림입니다.</h3>")
				.append("<h3>인증번호를 입력하시면 이메일 인증이 완료됩니다.</h3>").append(" <h3>인증번호  :: ")
				// 본인인증을 위한 state를 메일로 발송
				.append(state + "</h3></div>").toString());

		// 파일 첨부
//		sendMail.addInline("img", new FileDataSource("c:\\bonobono.jpg"));

		// JavaMailSender.setFrom(senderEmail, senderName) :: 메일 작성자 설정
		sendMail.setFrom("admin@uwl.com", "어'울림");

		// JavaMailSender.setTo(receiverEmail) :: 메일 수신자 설정
		sendMail.setTo(mail);

		// JavaMailSender.send :: 설정한 내용을 바탕으로 메일 전송
		sendMail.send();

		Map<String, String> returnMap = new HashMap<String, String>();
		returnMap.put("result", "done");

		// 본인인증을 위한 state를 반환
		returnMap.put("mailCheck", state);
		System.out.println("end SendMail");
		return returnMap;
	}

	@RequestMapping(value = "rest/updatePassword", method = RequestMethod.POST)
	public Map updatePassword(@RequestBody HashMap<String, Object> reqMap, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		User sessionUser = (User) session.getAttribute("user");
		String exPassword = (String) reqMap.get("exPassword");
		String password = (String) reqMap.get("password");
		String sessionPassword = sessionUser.getPassword();

		System.out.println("ex : " + exPassword + "\t session : " + sessionPassword);
		System.out.println(sessionPassword.equals(exPassword));
		
		if (!exPassword.equals(password)) {
			if (sessionPassword.equals(exPassword)) {
				sessionUser.setPassword(password);
				userService.updatePassword(sessionUser);
				session.setAttribute("user", sessionUser);
				map.put("result", "1");
			} else {
				map.put("result", "2");
			}
		} else map.put("result", "3");
		
		
		System.out.println(map);
		return map;
	}
	
	//네이버로그인
		@RequestMapping( value = "rest/naverLoginUrlMake" )
		public Map naverLogin( HttpSession session ) throws Exception {
			System.out.println("들어왔다 ");
			// 네이버 아이디로 로그인(회원가입) 절차 
			// 네이버 아이디로 인증 요청 => 접근 토큰 발급 => 접근 토큰을 이용해 네이버 회원 프로필 조회
			// 해당 부분은 네이버 아이디로 인증 요청을 위한 URL 작성 구간
			
			// developers.naver.com 에서 상단 Documents => 네이버 아이디로 로그인 => API 명세 => 로그인 API 명세 => 3.1 네이버 아이디로 로그인 인증 요청 참조
			
			/////////////////////////////////////////////////////////
			// 사이트 간 요청 위조(cross-site request forgery) 공격을 방지하기 위한 상태 토큰 생성
			// developers.naver.com 에서 상단 Documents => 네이버 아이디로 로그인 => 튜토리얼 => Web 애플리케이션 => 1.1.2 Java로 구현한 상태 토큰 생성 코드 예 참조
			SecureRandom random = new SecureRandom();
			String state = new BigInteger(130, random).toString(32);
			
			// 상태 토큰의 경우 요청 URL과 web server의 sessionScope에 저장된 값이 같아야 하기 때문에 session에 저장 
			session.setAttribute("state", state); 
			
			// 상단 메뉴 => Application => 내 어플리케이션에서 발급받은 Client ID
			String clientId = "Ih70sHbbwjRRLdIRzxMP";
			
			// 네이버 로그인이 끝난 뒤 redirect로 연결할 url 주소 
			// 내 애플리케이션 => API 설정 => 사용 API => 로그인 오픈 API 서비스 환경에 등록한 
			// 네이버아이디로로그인 Callback URL (최대 5개)에 등록한 URL을 인코딩 
			String redirectUrl = URLEncoder.encode("http://192.168.0.21:8080/user/naverLoginLogic", "UTF-8");
			//http://192.168.0.19:8080/main.jsp
			//http://192.168.0.21:8080/main.jsp
			//http://192.168.0.19:8080/layout/default.jsp
			//http://192.168.0.21:8080/layout/default.jsp

			
			// https://nid.naver.com/oauth2.0/authorize :: 네이버 아이디로 로그인 인증 요청
			// GET방식으로 url을 연결할 예정이므로 query String 형식으로 URL 작성
			
			// client_id :: 상단 메뉴 => Application => 내 어플리케이션에서 발급받은 Client ID
			// redirect_url :: 애플리케이션을 등록 시 입력한 Callback URL 값으로 URL 인코딩을 적용한 값
			// state :: 애플리케이션에서 생성한 상태 토큰값, session에 저장되어 있는 값
			String naverLoginUrl = 	"https://nid.naver.com/oauth2.0/authorize?response_type=code" + 
									"&client_id=" + clientId + 
									"&redirect_uri=" + redirectUrl + 
									"&state="+(String)session.getAttribute("state");
			
			// json 형식은 key : value의 mapping된 형식이므로 Map을 새로 생성 
			Map<String, String> map = new HashMap<String, String>();
			
			// {"url" : "naverLoginUrl"} 로 저장 => $.ajax에서 JSONData.url로 접근 가능  
			map.put("url", naverLoginUrl);
			
			return map;
		}
		
		// 수정해야함...
		@RequestMapping(value = "rest/getWeather", method = RequestMethod.POST)
		public Map getWeather(@RequestBody Couple couple) throws Exception{
			
		
//			System.out.println("session: " + session);
			
			Weather weather = new Weather(); //test
		
			Map<String, String> map = weatherService.getWeather(weather);
			
			System.out.println("map: " + map);
			
			return map;
		}
		
//		@RequestMapping(value = "/rest/checkReport")
//		public String checkReport(@RequestBody User user) throws Exception {
//			List reportList = new ArrayList<Report>();
//			System.out.println(user.getUserId());
//			reportList = reportService.getReportById(user.getUserId());
//			if(reportList != null) {
//				for(int i=0; i<reportList.size(); i++) {
//					Report reportUser = (Report)reportList.get(i);
//					if(reportUser.getUserId02().equals(user.getUserId()) || (reportUser.getReportStatus().equals("2"))){
//						System.out.println("정보가 있다는 증거");
//						Date stopDate = reportUser.getStopDate();
//						Date today = new Date();
//						int result = stopDate.compareTo(today);
//						if(result >= 1) {
//							System.out.println("아직 정지중이라는 증거");
//							//신고상태가 있는 분
//							String date = stopDate.toString();
//							return date;
//						}else {
//							System.out.println("용서받았다는 증거");
//							return "false";
//						}
//					}
//				}
//			}
//			return "false";
//		}
		
		@RequestMapping(value = "rest/replyQuestion", method = RequestMethod.POST)
		public void replyQuestion(@RequestBody Ask ask) throws Exception{
			userService.replyQuestion(ask);
			System.out.println("레스트컨트롤러 탄다");
		}
		@RequestMapping(value = "rest/getAnswer")
		public Map getAnswer(@RequestBody Post  post) throws Exception {

			Map<String, Object> map = new HashMap<String, Object>();
			System.out.println("/user/rest/getUser : GET");
			Post returnPost =  userService.getAnswer(post.getPostNo());

			map.put("post", returnPost);
			return map;
		}
		
//		FCM Token register
		@RequestMapping(value = "rest/register", method =  RequestMethod.POST)
		public void register(@RequestBody String token, HttpSession httpSession) throws Exception{
			System.out.println("usercontroller register token : " + token);
			User user = ((User)(httpSession.getAttribute("user")));
			String userId = user.getUserId();	
			fcmService.register(userId, token);
		}
		
		@RequestMapping(value = "rest/updatePublicStatus", method = RequestMethod.POST)
		public void updatePublicStatus(@RequestBody User user) throws Exception{
			userService.updatePublicStatus(user);
		}

}
