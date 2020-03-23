package com.uwl.service.social.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.uwl.common.Search;
import com.uwl.service.domain.Post;
import com.uwl.service.social.SocialService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-common.xml", "classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml", "classpath:config/context-transaction.xml" })
public class SocialServiceTest {

	@Autowired
	@Qualifier("socialServiceImpl")
	private SocialService socialService;

//	@Test
	public void addTimeline() throws Exception {
		Post post = new Post();
		post.setUserId("user30");
		post.setPostTitle("타임라인테스트");
		post.setPostContent("여기는 소셜서비스테스트");
		post.setViewStatus("1");

		socialService.addTimeline(post);
	}

//	@Test
	public void getTimeline() throws Exception {
		int postNo = 10010;
		Post post = socialService.getTimeline(postNo);
		System.out.println(post);
	}

//	@Test
	public void getTimelineList() throws Exception {
		String userId = "user01";
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		search.setSearchCondition("1");

		Map<String, Object> map = socialService.getTimelineList(userId, search);
		System.out.println(map);
	}

//	@Test
	public void updateTimeline() throws Exception {
		
		Post post = new Post();
		post.setPostNo(10018);
		post.setPostTitle("수정된타이틀");
		post.setPostContent("수정된 콘텐트");
		post.setViewStatus("1");
		
		socialService.updateTimeline(post);
		
	}
	
//	@Test
	public void deleteTimeline() throws Exception{
		int postNo = 10020;
		socialService.deleteTimeline(postNo);
		
	}
	
//	@Test
	public void addQuestion() throws Exception{
		Post post = new Post();
		post.setPostTitle("ASK테스트");
		post.setPostContent("ASK테스트");
		post.setUserId("user20");
		
	}
	
//	@Test
	public void replyQuestion() throws Exception{
		Post post = new Post();
		post.setPostTitle("ASK 답변 TEST");
		post.setPostContent("ASK 답변테스트");
		post.setUserId("user21");
		
		int questionPostNo = 10034;
		
	}
	
	@Test
	public void getAskList() throws Exception{
		String userId = "user01";
		String questionStatus = "1";
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(5);
		
		Map<String, Object> map = socialService.getAskList(userId, search, questionStatus);
		System.out.println(map);
	}
	
//	@Test
	public void rejectQuestion() throws Exception{
		int postNo = 10037;
		
		socialService.rejectQuestion(postNo);
	}

//	@Test
	public void getNotiList() throws Exception{
		
		String userId = "user01";
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(6);
		
		System.out.println(socialService.getNotiList(userId, search));
	}
	
}
