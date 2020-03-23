package com.uwl.service.challenge.test;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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
import com.uwl.service.challenge.ChallengeService;
import com.uwl.service.domain.Challenge;
import com.uwl.service.domain.Commentt;
import com.uwl.service.domain.Post;
import com.uwl.service.domain.Purchase;
import com.uwl.service.domain.Reward;
import com.uwl.service.domain.User;
import com.uwl.service.reward.RewardService;



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
public class ChallengeServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("challengeServiceImpl")
	private ChallengeService challengeService;
	
	@Autowired
	@Qualifier("rewardServiceImpl")
	private RewardService rewardService;
	
	//@Test
	public void testAddChallenge()throws Exception{
		
		Challenge challenge = new Challenge();
		//challenge.setChallNo(10010);
		challenge.setChallCategory("2");
		challenge.setChallTitle("게시판활동 조건ㅇㄴㅇㄴㅇㄴ");
		challenge.setChallContent("5회이상 작성하세요");
		challenge.setChallReward(6000);
		
		challengeService.addChallenge(challenge);
		
	
		
//		challengeService.getChallengeAdmin(challNo);
//		
//		Assert.assertEquals("2", challenge.getChallCategory());
//		Assert.assertEquals("TEST 제목입니다", challenge.getChallTitle());
//		Assert.assertEquals("TEST 내용입니다.", challenge.getChallContent());
	}
	
	//@Test
	public void testAddWeeklyStart()throws Exception{
		
		Challenge challenge = new Challenge();
		
		challengeService.addWeeklyStart(challenge);
		
		
		
	}
	
	//@Test
	public void testUpdateChallenge() throws Exception{
		
		Challenge challenge = challengeService.getChallengeAdmin(10094);
		
//		Assert.assertEquals("2", challenge.getChallCategory());
//		Assert.assertEquals("TEST 제목입니다", challenge.getChallTitle());
//		Assert.assertEquals("TEST 내용입니다.", challenge.getChallContent());
		
		System.out.println("testupdateChallenge 전 : " + challenge);
		
		challenge.setChallCategory("3");
		challenge.setChallTitle("진학상담 게시글작성 5회");
		challenge.setChallContent("진학상담 게시글에서 5회글을 작성하세요");
		challenge.setChallReward(4000);
		challenge.setPostCommentComplete(5);
		
//		Post post = new Post();
//		post.setGatherCategoryNo("201");
		
		challengeService.updateChallenge(challenge);
		
//		Assert.assertEquals("2", challenge.getChallCategory());
//		Assert.assertEquals("TEST 제목입니다", challenge.getChallTitle());
//		Assert.assertEquals("TEST 내용입니다.", challenge.getChallContent());
		
		System.out.println("testupdateChallenge 후 : " + challenge);
	}
	
	//@Test
	public void testGetChallengeAdmin() throws Exception{
		
		Challenge challenge = new Challenge();
		challenge.setChallNo(10001);
//		challenge.setChallCategory("3");
//		challenge.setChallTitle("TEST UPDATE제목입니다");
//		challenge.setChallContent("TEST UPDATE내용입니다.");
//		challenge.setChallReward(3000);
		
		challenge = challengeService.getChallengeAdmin(challenge.getChallNo());
		
//		Assert.assertEquals("3", challenge.getChallCategory());
//		Assert.assertEquals("TEST UPDATE제목입니다", challenge.getChallTitle());
//		Assert.assertEquals("TEST UPDATE내용입니다.", challenge.getChallContent());
//		Assert.assertEquals(3000, challenge.getChallReward());
	}
	
	//@Test
	public void testDeleteChallenge() throws Exception{
		
		Challenge challenge = challengeService.getChallengeAdmin(10001);
		
		Assert.assertEquals("1", challenge.getChallCategory());
		Assert.assertEquals("제목2", challenge.getChallTitle());
		Assert.assertEquals("내용엔어떤내용이들어있나요", challenge.getChallContent());
		
		System.out.println("testupdateChallenge 전 : " + challenge);
		
		challenge.setViewStatus("3");
		
		challengeService.updateChallenge(challenge);
		
		
		System.out.println("testupdateChallenge 후 : " + challenge);
		
	}
	
	//@Test
	public void testGetAdminChallengeList() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("2");
		search.setSearchKeyword("업데이트");
		
		Map<String, Object> map = challengeService.getAdminChallengeList(search);
		
		List<Object> list = (List<Object>) map.get("list");
		Assert.assertEquals(8, list.size());
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println(totalCount);
	}
	
	//@Test
//	public void testWeeklyStart() throws Exception{
//		challengeService.weeklyStart();	
//	}
	
	//@Test
	public void testGetChallengeList() throws Exception{
		
//		List<Challenge> list = challengeService.getChallengeList();
		
//		System.out.println("담긴정보 확인 : " + list);
		
	}
	
	//@Test
	public void testGetCompleteChallengeList() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		
		String userId = "user41";
		
		Map<String, Object> map = challengeService.getCompleteChallengeList(search, userId);
		
		List<Reward> list = (ArrayList<Reward>)map.get("list");
		
		
		System.out.println("testGetCompleteChallengeList list : " + list.size());
		System.out.println("map 담긴정보 확인 : " + map);
		
		Assert.assertEquals(2, list.size());
		
	}
	
	//@Test
	public void testCompleteChallenge() throws Exception{
		
		
		Map<String, Object> map = challengeService.getChallengeList();
		
		List<Challenge> list = (List<Challenge>)(map.get("list"));
		
		boolean completeCheck = false;
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(6);
		search.setStartRowNum(1);
		search.setEndRowNum(5);
		
		System.out.println("map.get() : " + map.get("list"));
		System.out.println("list.size() : " + list.size());
		
		
//		for (int i = 0; i < list.size(); i++) {
		for (int i = 0; i < 1; i++) {
			
			Commentt commentt = new Commentt();
			commentt.setUserId("user01");
			Post post = new Post();
			post.setGatherCategoryNo("201");
			post.setUserId("user01");
			
			Challenge challenge = new Challenge();
			challenge.setChallNo(list.get(i).getChallNo());
			challenge.setChallCategory(list.get(i).getChallCategory());
			challenge.setChallReward(list.get(i).getChallReward());
			challenge.setPostCommentComplete(list.get(i).getPostCommentComplete());
			challenge.setPost(post);
			challenge.setCommentt(commentt);
			System.out.println("chall : " + challenge.getPost());
			
			Purchase purchaseItem = new Purchase();
			
			User user = new User();
			user.setUserId("user01");
			
			Reward reward = new Reward();
			reward.setUserId("user01");
			reward.setChallenge(challenge);
			reward.setPurchaseItem(purchaseItem);
			reward.setVariablePoint(challenge.getChallReward());
			reward.setVariableActivityPoint(challenge.getChallReward());
			reward.setTotalActivityPoint(12000);
			
			System.out.println("JunitTest reward : " + reward + "ㅇㄴㅇㄴㅇchall : " + challenge + "map의 get : " + map.get("list"));
//			challengeService.completeChallenge(reward, challenge, map,user);
			
			}
		}
	
	//@Test
	public void testGetNextOrPrePost() throws Exception{
		Challenge challenge = new Challenge();
		challenge.setChallNo(10121);
		
		challenge = challengeService.getNextOrPrePost(challenge.getChallNo());
		
		
	}
	
	@Test
	public void testGetWeeklyStart() throws Exception{
		

//		//Calendar cal = Calendar.getInstance();
//		Calendar cal = new GregorianCalendar(2020,Calendar.FEBRUARY,23);
//		System.out.println("도전과제 시작날짜: "+sdf.format(cal.getTime()));
//		
//		cal.add(Calendar.DAY_OF_WEEK, 7);
//		System.out.println("오늘로 부터 일주일 후: "+sdf.format(cal.getTime()));
		
		
		Challenge challenge = new Challenge();
		challenge = challengeService.getWeeklyStart();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = challenge.getWeeklyStart();
		
		String format = sdf.format(date);
		
		System.out.println("challenge : " + challenge);
		System.out.println("format : " + format);
		
	}
	
	//@Test
//	public void testInsertAddWeeklyStart() throws Exception{
//		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
//		Challenge challenge = new Challenge();
//		challenge.setWeeklyStart(date);
//		
//		challengeService.addWeeklyStart(challenge);
//	}
	
		
		
	}
	
	
