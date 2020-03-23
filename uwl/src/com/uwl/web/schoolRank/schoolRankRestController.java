package com.uwl.web.schoolRank;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.challenge.ChallengeService;
import com.uwl.service.domain.Challenge;
import com.uwl.service.domain.SchoolRank;
import com.uwl.service.schoolRank.SchoolRankService;

import sun.security.util.PropertyExpander.ExpandException;

@RestController
@RequestMapping("/schoolRank/*")
public class schoolRankRestController {
	
	//Field ==> 더 필요하면 추가시킬것.
	@Autowired
	@Qualifier("schoolRankServiceImpl")
	private SchoolRankService schoolRankService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	//Constructor
	public schoolRankRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value = "rest/getSchoolRankingList", method = RequestMethod.POST)
	public Map getSchoolRankingList(@RequestBody Search search) throws Exception{
		
		
		System.out.println("rest/schoolRank/getSchoolRankingList : POST ");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		//flag 1 : 학교이름, 2: 주소
		search.setPageSize(pageSize);
		
		Map<String, Object> map = schoolRankService.getSchoolRankingList(search);
		
		System.out.println("schoolRankController getSchoolRankingList()의 map : " + map);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageSize, pageUnit);
		System.out.println("schoolRankController getSchoolRankingList()의 resultPage : " + resultPage);
		
		map.put("resultPage", resultPage);
		map.put("search", search);
		
		return map;
	}
	
	@RequestMapping( value = "rest/getIndividualRankingList", method = RequestMethod.POST)
	public Map getIndividualRankingList(@RequestBody SchoolRank schoolRank) throws Exception{
		
		System.out.println("schoolRank/rest/getIndividualRankingList : POST ");
		
		Search search = new Search();
		
		
		Map<String, Object> map = schoolRankService.getIndividualRankingList(search);
		
		System.out.println("schoolRankController getIndividualRankingList()의 map : " + map);
		
		return map;
	}
	
	@RequestMapping( value = "rest/getMySchool", method = RequestMethod.POST)
	public SchoolRank getMySchool(@RequestBody SchoolRank schoolRank) throws Exception{
		
		System.out.println("schoolRank/rest/getSchoolRankingList : POST ");
		
		System.out.println("RequestBody로 받은 schoolRank : " + schoolRank);
		schoolRank = schoolRankService.getMySchool(schoolRank.getUserId());
		
		System.out.println("schoolRankService.getMySchool()로 긁어온 정보 : " + schoolRank);
		
		
		return schoolRank;
	}
	
		
	
}
