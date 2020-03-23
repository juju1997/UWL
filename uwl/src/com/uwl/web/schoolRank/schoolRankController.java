package com.uwl.web.schoolRank;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.challenge.ChallengeService;
import com.uwl.service.domain.Challenge;
import com.uwl.service.domain.Purchase;
import com.uwl.service.domain.Reward;
import com.uwl.service.domain.SchoolRank;
import com.uwl.service.domain.User;
import com.uwl.service.reward.RewardService;
import com.uwl.service.schoolRank.SchoolRankService;

import sun.security.util.PropertyExpander.ExpandException;

@Controller
@RequestMapping("/schoolRank/*")
public class schoolRankController {
	
	//Field ==> 더 필요하면 추가시킬것.
	@Autowired
	@Qualifier("schoolRankServiceImpl")
	private SchoolRankService schoolRankService;
	
	@Autowired
	@Qualifier("rewardServiceImpl")
	private RewardService rewardService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	private User user;
	
	//getter, setter
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	//Constructor
	public schoolRankController() {
		System.out.println(this.getClass());
	}
	@RequestMapping( value = "listSchoolRanking")
	public String getSchoolRankingList(@ModelAttribute("search")Search search,@ModelAttribute("schoolRank") SchoolRank schoolRank, 
										Model model, HttpServletRequest request, HttpSession session) throws Exception{
		
		
		user = (User)session.getAttribute("user");
		
		
		//login을 하지않으면 접근할 수 없다. ==> commonNullPointException.jsp로 이동
		if (user.getUserId() == null) {
			System.out.println("ChallengeController getCompleteChallengeList() : GET / POST ==> 로그인이 안되어있으면 /user/login으로 이동시킴");
			return "forward:/user/login";
		}
		
		System.out.println("/schoolRank/getSchoolRankingList : GET / POST");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		if(search.getSearchCondition() == null) {	//searchCondition은 신고처리 유무 없다면 디폴트 신고처리안됨목록
			search.setSearchCondition("1");
		}
		
		//flag 1 : 학교이름, 2: 주소
		search.setPageSize(pageSize);
//		search.setSearchCondition(request.getParameter("searchCondition"));
//		search.setSearchKeyword(request.getParameter("searchKeyword"));
		
		Map<String, Object> map = schoolRankService.getSchoolRankingList(search);
		
		Map<String, Object> individualMap = schoolRankService.getIndividualRankingList(search);
		
		System.out.println("=====>schoolRankController  user.userId : " + user.getUserId() );
		SchoolRank mySchool = schoolRankService.getMySchool(user.getUserId());
		
		System.out.println("=====>schoolRankController getSchoolRankingList()의 mySchool : " + mySchool);
		System.out.println("=====>schoolRankController getSchoolRankingList()의 map : " + map);
		
		System.out.println("search : " + search + "=====================");
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageSize, pageUnit);
		System.out.println("schoolRankController getSchoolRankingList()의 resultPage : " + resultPage);
		System.out.println("map.get(\"list\") : " + map.get("list"));
		
		System.out.println("individualMap : " + individualMap);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("mySchool", mySchool);
		model.addAttribute("individualRank", individualMap.get("list"));
		//recentlyTotalPoint를 가져오기위한 정보
		return "forward:/schoolRank/toolbarListSchoolRanking.jsp";
	}
	
	@RequestMapping(value = "getSearchRank")
	public String getSearchRank() throws Exception{
		
		return null;
	}
		
	
}
