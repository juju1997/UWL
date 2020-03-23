package com.uwl.service.schoolRank.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.uwl.common.Search;
import com.uwl.service.challenge.ChallengeDAO;
import com.uwl.service.challenge.ChallengeService;
import com.uwl.service.domain.Challenge;
import com.uwl.service.domain.Reward;
import com.uwl.service.domain.SchoolRank;
import com.uwl.service.domain.User;
import com.uwl.service.reward.RewardService;
import com.uwl.service.schoolRank.SchoolRankService;
import com.uwl.service.user.UserService;



/*
 *	FileName :  UserServiceTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data 를 다양하게 Wiring 하자...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																	"classpath:config/context-aspect.xml",
																	"classpath:config/context-mybatis.xml",
																	"classpath:config/context-transaction.xml" })
public class SchoolRankServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("schoolRankServiceImpl")
	private SchoolRankService schoolRankService;
	
	
	@Test
	public void testGetSchoolRankingList() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(4);
		search.setStartRowNum(1);
		search.setEndRowNum(3);
		int schoolNo = 1438;
		
		Map<String, Object> map = schoolRankService.getSchoolRankingList(search);
		
//		System.out.println("ddd : " + map);
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println(totalCount);
		
	}
	
	@Test
	public void testGetSearchRank() throws Exception{
		
		SchoolRank schoolRank = new SchoolRank();
		schoolRank.setSchoolNo(1);
		
		schoolRank = schoolRankService.getSearchRank(schoolRank.getSchoolNo());
		
//		Assert.assertEquals("제주신성여자고등학교", schoolRank.getSchoolName());
//		Assert.assertEquals("제주특별자치도 제주시 아봉로 174-1", schoolRank.getSchoolAddress());
		
		
	}
	
	//@Test
	public void testAddSchoolRank() throws Exception{
		
		SchoolRank schoolRank = new SchoolRank();
		schoolRank.setSchoolNo(1308);
		schoolRank.setSchoolName("태릉고등학교");
		schoolRank.setSchoolAddress("서울특별시 중랑구 신내로 23길 36 태릉고등학교 묵동");
		
		schoolRankService.addSchoolRank(schoolRank);
		
		System.out.println("addSchoolRank가 되었는지 확인");
		
	}
	
	//@Test
	public void testUpdateSchoolRank() throws Exception{
		
		SchoolRank schoolRank = new SchoolRank();
		schoolRank.setSchoolNo(1438);
		
		schoolRankService.updateSchoolRank(schoolRank);
		
	}
	
	//@Test
	public void testGetMySchool() throws Exception{
		
		String userId = "user01";
		
		schoolRankService.getMySchool(userId);
		
	}
	
}
