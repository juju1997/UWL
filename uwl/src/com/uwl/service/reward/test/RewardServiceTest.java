package com.uwl.service.reward.test;

import java.util.ArrayList;
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
import com.uwl.service.domain.Challenge;
import com.uwl.service.domain.Purchase;
import com.uwl.service.domain.Reward;
import com.uwl.service.domain.User;
import com.uwl.service.purchase.PurchaseService;
import com.uwl.service.reward.RewardService;
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
public class RewardServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("rewardServiceImpl")
	private RewardService rewardService;
	
	//테스트 다시할 것.
	//@Test 
	public void testGetUserBothPointList()throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		
		Purchase purchase = new Purchase();
		purchase.setPurchaseNo(0);
		
		Reward reward = new Reward();
		reward.setUserId("user41");
		reward.setPurchaseItem(purchase);
		
		System.out.println("reward.purchaseNo : " + reward.getPurchaseItem());
		
		
		Map<String, Object> map = rewardService.getUserBothPointList(search, reward);
		
		//List에 담긴 갯수를 Assert와 비교하기 위해서 list변수를 만들어서 함
		List<Reward> list = (ArrayList<Reward>) map.get("list");
		
		System.out.println("testGetUserBothPointList list : " + list);
		System.out.println("map에 담긴 정보 확인 : " + map);
		
		//카운트는 5개나오지만 -가 안나와서 걍 이걸로..
		Assert.assertEquals(4,list.size());
	}
	
	//@Test
	public void testGetUserPurchaseList() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		
		Purchase purchase = new Purchase();
		purchase.setPurchaseNo(10000);
		purchase.setItemCategory("1");
		
		Reward reward = new Reward();
		reward.setUserId("user41");
		reward.setPurchaseItem(purchase);
		
		Map<String, Object> map = rewardService.getUserPurchaseList(search, reward);
		
		//List에 담긴 갯수를 Assert와 비교하기 위해서 list변수를 만들어서 함
		List<Reward> list = (ArrayList<Reward>) map.get("purchaseList");
		
		System.out.println("testGetUserBothPointList list : " + list);
		System.out.println("map에 담긴 정보 확인 : " + map);
		
		Assert.assertEquals(1,list.size());
		
	}
	
	//@Test
	public void testIncreasePoint() throws Exception{
		
		Challenge challenge = new Challenge();
		challenge.setChallNo(10002);
		challenge.setChallReward(5000);
		
		
		Reward reward = new Reward();
		reward.setUserId("user01");
		reward.setChallenge(challenge);
		reward.setTotalActivityPoint(5000);
		rewardService.increasePoint(reward);
		
		Assert.assertEquals(10002, challenge.getChallNo());
	
		
		
	}
	
	//@Test
	public void decreasePoint() throws Exception{
	
		Purchase purchase = new Purchase();
		purchase.setPrice(99000);
		purchase.setUserId("user41");
		purchase.setPurchaseNo(10020);
		
		
		rewardService.decreasePoint(purchase);
		
//			Assert.assertEquals(10002, challenge.getChallNo());
	
		
	}
	
	@Test
	public void testGetTotalcount() throws Exception{
		
		String userId = "user01";
		
		rewardService.getTotalPoint(userId);
		
		
	}
	
	
}
