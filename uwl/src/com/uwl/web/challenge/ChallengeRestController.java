package com.uwl.web.challenge;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.uwl.common.Search;
import com.uwl.service.challenge.ChallengeService;
import com.uwl.service.community.CommunityService;
import com.uwl.service.domain.Challenge;
import com.uwl.service.domain.Commentt;
import com.uwl.service.domain.Post;
import com.uwl.service.domain.Purchase;
import com.uwl.service.domain.Reward;
import com.uwl.service.domain.User;
import com.uwl.service.post.PostService;
import com.uwl.service.reward.RewardService;
import com.uwl.service.schoolRank.SchoolRankService;

@RestController
@RequestMapping("/challenge/*")
public class ChallengeRestController {
	
	//Field ==> 더 필요하면 추가시킬것.
	@Autowired
	@Qualifier("challengeServiceImpl")
	private ChallengeService challengeService;
	
	//Field
	@Autowired
	@Qualifier("postServiceImpl")
	private PostService postService;
	
	//Field
	@Autowired
	@Qualifier("rewardServiceImpl")
	private RewardService rewardService;
	
	@Autowired
	@Qualifier("schoolRankServiceImpl")
	private SchoolRankService schoolRankService;
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	//Constructor
	public ChallengeRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="/rest/addSummerNoteFile", method=RequestMethod.POST)
	public String addSummerNoteFile(MultipartFile file) throws Exception{
		System.out.println("addSummerNoteFile.POST");
		//String path = "C:\\Users\\User\\git\\UWL\\uwl\\WebContent\\resources\\images\\";
		String path ="C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\uwl\\resources\\images\\";
		String name = "";
		file.transferTo(new File(path, file.getOriginalFilename()));
		name = file.getOriginalFilename();
		return name;
	}
	
	@RequestMapping(value="/rest/addWeeklyStart", method=RequestMethod.POST)
	public Challenge addWeeklyStart(@RequestBody Challenge challenge) throws Exception{
		System.out.println("/rest/addWeeklyStart");
		
		challengeService.addWeeklyStart(challenge);
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		String weeklyStart = transFormat.format(challenge.getWeeklyStart());

		System.out.println("/rest/addWeeklyStart 시간 : " + weeklyStart);
		
		return challenge;
	}
	
	@RequestMapping(value="/rest/getWeeklyStart", method=RequestMethod.POST)
	public Challenge getWeeklyStart() throws Exception{
		System.out.println("/rest/getWeeklyStart");
		
		Challenge challenge = challengeService.getWeeklyStart();
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		String weeklyStart = transFormat.format(challenge.getWeeklyStart());
		
		System.out.println("/rest/getWeeklyStart 시간 : " + weeklyStart);
		
		return challenge;
	}
	
	@RequestMapping(value="/rest/listDetailCetegory", method=RequestMethod.POST)
	public List<Challenge> getDetailCategoryList(@RequestBody Challenge challenge) throws Exception{
		System.out.println("/rest/listDetailCetegory : POST");
		
		System.out.println("detailCategory : " + challenge.getDetailCategory());
		List<Challenge> list = challengeService.getDetailCategoryList(challenge.getDetailCategory());
		
		System.out.println("/rest/listDetailCetegory의 List : " + list);
		
		return list;
	}
	
	@RequestMapping(value = "/rest/completeCommentChallenge", method = RequestMethod.POST)
	public Reward completeCommentChallenge(@RequestBody Post post, HttpSession session) throws Exception{
		
		Map<String, Object> map = challengeService.getChallengeList();
		
		List<Challenge> list = (List<Challenge>)(map.get("list"));
		
		boolean completeResult = false;
		
		
		System.out.println("/rest/completeChallenge completeChallenge() : POST");
		
		User user = (User) session.getAttribute("user");
		System.out.println("======================user.userId session으로 가져옴 : " + user.getUserId());
		System.out.println("======================user.userId 학교번호으로 가져옴 : " + user.getSchoolNo());
		
		//addBoard로 들어온게 아니라면
		post = postService.getBoard(post.getPostNo());
		post.setUser(user);
		Reward reward = new Reward();
		for (int i = 0; i < 1; i++) {
			
		System.out.println("rest컨트롤러 post의 정보 : " + post);
		
		//userId가 리퀘스트 바디로 겹쳐서 400에러가 발생해 여기다가 userId만 부여
		Commentt comment = new Commentt();
		comment.setUserId(user.getUserId());
		
		System.out.println("challengeRestController의 complete() 의 postNo : " + post.getPostNo());
		
		comment = communityService.getComment(user.getUserId(), post.getPostNo());
		
		System.out.println("challengeRestController의 complete() 의 comment : " + comment);
		
		Challenge challenge = new Challenge();
		challenge.setChallNo(list.get(i).getChallNo());
		challenge.setChallCategory(list.get(i).getChallCategory());
		challenge.setChallReward(list.get(i).getChallReward());
		challenge.setPostCommentComplete(list.get(i).getPostCommentComplete());
		//코멘트만 받아서 검증하므로 post.gatercategory만 받고 나머지는 껍데기만 씌워줌
		challenge.setPost(post);
		
		//listComment로 넘어온게 아니라면 userId가 set되지 않음.
		challenge.setCommentt(comment);
		
		//addPost를 해서 comment의 정보가 없다면
		
		System.out.println("/rest/completeChallenge challenge : " + challenge);
		System.out.println("/rest/completeChallenge challenge 보상 : " + challenge.getChallReward());
		
		//null제약으로 인한 빈껍데기 넣어주기
		Purchase purchaseItem = new Purchase();
		
		
		reward.setUserId(user.getUserId());
		
		//깡통만들어 넣어줌
		Search search = new Search();
		search.setPageSize(pageSize);
		
		//토탈포인트의 정보를 가져오기 위한 긁어옴..
		Map<String, Object> rewardMap = rewardService.getUserBothPointList(search, reward);
		
		List<Reward> totalList = (List<Reward>)(rewardMap.get("list"));
		
		reward.setChallenge(challenge);
		reward.setPurchaseItem(purchaseItem);
		reward.setVariablePoint(challenge.getChallReward());
		reward.setVariableActivityPoint(challenge.getChallReward());
		reward.setCompleteResult(completeResult);
		System.out.println("totlaList : " + totalList);
		if (totalList.size() == 0) {
			reward.setTotalActivityPoint(0);
		}else {
			reward.setTotalActivityPoint(totalList.get(0).getTotalActivityPoint());
		}
		
		System.out.println("/rest/completeChallenge completeChallenge() reward : " + reward + "chall : " + challenge);
		challengeService.completeConmentChallenge(reward, challenge, map, user);
		
		System.out.println("challengeReward : " + reward.getChallenge().getChallReward());
		}
		
		System.out.println("reward : " + reward);
		System.out.println("reward isboolean : " + reward.isCompleteResult());
		return reward;
	}
	
	
	
	@RequestMapping(value = "/rest/completePostChallenge", method = RequestMethod.POST)
	public Reward completePostChallenge(@RequestBody Post post, HttpSession session) throws Exception{
		
		Map<String, Object> map = challengeService.getChallengeList();
		
		List<Challenge> list = (List<Challenge>)(map.get("list"));
		
		boolean completeResult = false;
		
		
		System.out.println("/rest/completeChallenge completeChallenge() : POST");
		
		User user = (User) session.getAttribute("user");
		System.out.println("======================user.userId session으로 가져옴 : " + user.getUserId());
		System.out.println("======================user.userId session으로 가져옴 : " + user.getSchoolNo());
		
		System.out.println("ChallengeRestController Post : " + post);
		//post.setUser(user);
		Reward reward = new Reward();
		for (int i = 0; i < 1; i++) {
			
			System.out.println("rest컨트롤러 post의 정보 : " + post);
			
			//userId가 리퀘스트 바디로 겹쳐서 400에러가 발생해 여기다가 userId만 부여
			Commentt comment = new Commentt();
			comment.setUserId(user.getUserId());
			
			
			Challenge challenge = new Challenge();
			challenge.setChallNo(list.get(i).getChallNo());
			challenge.setChallCategory(list.get(i).getChallCategory());
			challenge.setChallReward(list.get(i).getChallReward());
			challenge.setPostCommentComplete(list.get(i).getPostCommentComplete());
			//코멘트만 받아서 검증하므로 post.gatercategory만 받고 나머지는 껍데기만 씌워줌
			challenge.setPost(post);
			
			//listComment로 넘어온게 아니라면 userId가 set되지 않음.
			challenge.setCommentt(comment);
			
			//addPost를 해서 comment의 정보가 없다면
			
			System.out.println("/rest/completeChallenge challenge : " + challenge);
			System.out.println("/rest/completeChallenge challenge 보상 : " + challenge.getChallReward());
			
			//null제약으로 인한 빈껍데기 넣어주기
			Purchase purchaseItem = new Purchase();
			
			
			reward.setUserId(user.getUserId());
			
			//깡통만들어 넣어줌
			Search search = new Search();
			search.setPageSize(pageSize);
			
			//토탈포인트의 정보를 가져오기 위한 긁어옴..
			Map<String, Object> rewardMap = rewardService.getUserBothPointList(search, reward);
			
			List<Reward> totalList = (List<Reward>)(rewardMap.get("list"));
			
			reward.setChallenge(challenge);
			reward.setPurchaseItem(purchaseItem);
			reward.setVariablePoint(challenge.getChallReward());
			reward.setVariableActivityPoint(challenge.getChallReward());
			reward.setCompleteResult(completeResult);
			System.out.println("totlaList : " + totalList);
			if (totalList.size() == 0) {
				reward.setTotalActivityPoint(0);
			}else {
				reward.setTotalActivityPoint(totalList.get(0).getTotalActivityPoint());
			}
			
			System.out.println("/rest/completeChallenge completeChallenge() reward : " + reward + "chall : " + challenge);
			challengeService.completePostChallenge(reward, challenge, map, user);
			System.out.println("challengeReward : " + reward.getChallenge().getChallReward());
		}
		
		System.out.println("reward : " + reward);
		System.out.println("reward isboolean : " + reward.isCompleteResult());
		return reward;
	}
	
	
	
	
}
