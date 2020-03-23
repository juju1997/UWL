package com.uwl.service.couple.test;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.uwl.common.Search;
import com.uwl.service.couple.CoupleService;
import com.uwl.service.domain.Commentt;
import com.uwl.service.domain.Couple;
import com.uwl.service.domain.Post;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
		"classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml" })
public class CoupleServiceTest {

	@Autowired
	@Qualifier("coupleServiceImpl")
	private CoupleService coupleService;
	
	@Test
	public void testAddCouple() throws Exception {
		Couple couple = new Couple();
		couple.setFirstUserId("user02");
		couple.setSecondUserId("user01");
		
		coupleService.addCouple(couple);
	}
	
	//@Test
	public void testGetCouple() throws Exception {
		Couple couple = new Couple();
		
		couple = coupleService.getCouple("user01");
		
		Assert.assertEquals(10003, couple.getCoupleNo());
		Assert.assertEquals("user01", couple.getFirstUserId());
		Assert.assertEquals("user06", couple.getSecondUserId());
		
		Assert.assertEquals("2020-01-30", couple.getMatchingDate().toString());
		Assert.assertEquals("1", couple.getDeleteStatus());
		
		Assert.assertNotNull(coupleService.getCouple("user01"));
		Assert.assertNotNull(coupleService.getCouple("user06"));
	}
	
	//@Test
	public void testDeleteCouple() throws Exception {
		Couple couple = new Couple();
		couple = coupleService.getCouple("user01");
		Assert.assertNotNull(couple);
		
		couple.setDeleteStatus("2");
		
		coupleService.deleteCouple(couple);
		
		
		
	}
	
	//@Test
	public void testAddCoupleTimelinePost() throws Exception {
		Post post = new Post();
		post.setUserId("user01");
		post.setPostTitle("1111");
		post.setPostContent("1111");
		post.setUploadFileName("1111");
		post.setPlace("1111");
		
		coupleService.addCoupleTimelinePost(post);
	}
	
	//@Test
	public void testGetCoupleTimelinePost() throws Exception {
		Post post = new Post();
		
		post = coupleService.getCoupleTimelinePost(10009);
		
		Assert.assertEquals(10009, post.getPostNo());
		Assert.assertEquals("user01", post.getUserId());
		Assert.assertEquals("1111", post.getPostTitle());
		Assert.assertEquals("1111", post.getPostContent());
		Assert.assertEquals("2020-01-30", post.getPostDate().toString());
		Assert.assertEquals("1111", post.getUploadFileName());
		Assert.assertEquals("1", post.getViewStatus());
		Assert.assertEquals("6", post.getPostCategoryNo());
		Assert.assertEquals("1111", post.getPlace());
		
		Assert.assertNotNull(coupleService.getCoupleTimelinePost(10009));
	}
	
	//@Test
	public void testGetCoupleTimelinePostList() throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		String userId = "user01";
		System.out.println("userId : " + userId);
		Map<String, Object> map = coupleService.getCoupleTimelinePostList(search, userId);
		System.out.println("map : " + map);
		
		List<Object> list = (List<Object>)map.get("list");
		Assert.assertEquals(0, list.size());
		System.out.println("list : " + list);
		
		Integer totalCoupleTimelinePost = (Integer)map.get("totalCoupleTimelinePost");
		System.out.println("totalCoupleTimelinePost : " + totalCoupleTimelinePost);
	}
	
	//@Test
	public void testUpdateCoupleTimelinePost() throws Exception {
		Post post = coupleService.getCoupleTimelinePost(10009);
		Assert.assertNotNull(post);
		
		
		post.setPostTitle("2222");
		post.setPostContent("2222");
		post.setUploadFileName("2222");
		post.setPlace("2222");
		
		coupleService.updateCoupleTimelinePost(post);
		
		post = coupleService.getCoupleTimelinePost(10009);
		Assert.assertNotNull(post);
		
		Assert.assertEquals(10009, post.getPostNo());
		Assert.assertEquals("user01", post.getUserId());
		Assert.assertEquals("2222", post.getPostTitle());
		Assert.assertEquals("2222", post.getPostContent());
		Assert.assertEquals("2020-01-30", post.getPostDate().toString());
		Assert.assertEquals("2222", post.getUploadFileName());
		Assert.assertEquals("1", post.getViewStatus());
		Assert.assertEquals("6", post.getPostCategoryNo());
		Assert.assertEquals("2222", post.getPlace());
	}
	
	//@Test
	public void testDeleteCoupleTimelinePost() throws Exception {
		Post post = new Post();
		post = coupleService.getCoupleTimelinePost(10009);
		Assert.assertNotNull(post);
		
		post.setViewStatus("3");
		
		coupleService.deleteCoupleTimelinePost(post);
		
		
	}
	
	//@Test
	public void testAddCoupleTimelineComment() throws Exception {
		Commentt comment = new Commentt();
		comment.setUserId("user01");
		comment.setPostNo(10009);
		comment.setCommentContent("2222");
		
		coupleService.addCoupleTimelineComment(comment);
	}
	
	//@Test
	public void testGetCoupleTimelineComment() throws Exception {
		Commentt comment = new Commentt();
		
		comment = coupleService.getCoupleTimelineComment(10006);
		
		Assert.assertEquals(10006, comment.getCommentNo());
		Assert.assertEquals("user01", comment.getUserId());
		Assert.assertEquals(10009, comment.getPostNo());
		Assert.assertEquals("1111", comment.getCommentContent());
		Assert.assertEquals("2020-01-30", comment.getCommentDate().toString());
		Assert.assertEquals("1", comment.getCommentStatus());
		
		Assert.assertNotNull(coupleService.getCoupleTimelineComment(10006));
	}
	
	//@Test
	public void testGetCoupleTimelineCommentList() throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		int postNo = 10009;
		System.out.println("postNo : " + postNo);
		Map<String, Object> map = coupleService.getCoupleTimelineCommentList(search, postNo);
		System.out.println("map : " + map);
		
		List<Object> list = (List<Object>)map.get("list");
		Assert.assertEquals(2, list.size());
		System.out.println("list : " + list);
		
		Integer totalCoupleTimelineComment = (Integer)map.get("totalCoupleTimelineComment");
		System.out.println("totalCoupleTimelineComment : " + totalCoupleTimelineComment);
	}
	
	//@Test
	public void testDeleteCoupleTImelineComment() throws Exception {
		Commentt comment = new Commentt();
		comment = coupleService.getCoupleTimelineComment(10006);
		Assert.assertNotNull(comment);
		
		comment.setCommentStatus("2");
		
		coupleService.deleteCoupleTimelineComment(comment);
		
		
	}
	
	//@Test
	public void testAddSchedule() throws Exception {
		
		Post post = new Post();
		post.setUserId("user03");
		post.setPostTitle("5555");
		post.setPostContent("1111");
		String  day = "2020-02-07";
		Date d = Date.valueOf(day);

		
		
		post.setPostDate(d);
		post.setPlace("1111");
		
		coupleService.addSchedule(post);
	}
	
	//@Test
	public void testGetSchedule() throws Exception {
		Post post = new Post();
		
		post = coupleService.getSchedule(10013);
		
		Assert.assertEquals(10013, post.getPostNo());
		Assert.assertEquals("user01", post.getUserId());
		Assert.assertEquals("1111", post.getPostTitle());
		Assert.assertEquals("1111", post.getPostContent());
		Assert.assertEquals("2020-01-29", post.getPostDate().toString());
		Assert.assertEquals("1", post.getViewStatus());
		Assert.assertEquals("7", post.getPostCategoryNo());
		Assert.assertEquals("1111", post.getPlace());
		
		Assert.assertNotNull(coupleService.getSchedule(10013));
	}
	
	//@Test
//	public void testGetScheduleList() throws Exception {
//		Search search = new Search();
//		search.setCurrentPage(1);
//		search.setPageSize(10);
//		String userId = "user06";
//		System.out.println("userId : " + userId);
//		String  day = "2020-01-29";
//		Date postDate = Date.valueOf(day);
//		Map<String, Object> map = coupleService.getScheduleList(search, userId, postDate);
//		System.out.println("map : " + map);
//		
//		List<Object> list = (List<Object>)map.get("list");
//		Assert.assertEquals(4, list.size());
//		System.out.println("list : " + list);
//		
//		Integer totalSchedule = (Integer)map.get("totalSchedule");
//		System.out.println("totalSchedule : " + totalSchedule);
//	}   
	
	//@Test
//	public void testGetScheduleList2() throws Exception {
//		Search search = new Search();
//		search.setCurrentPage(1);
//		search.setPageSize(10);
//		String userId = "user02";
//		System.out.println("userId : " + userId);
//		Map<String, Object> map = coupleService.getScheduleList2(search, userId);
//		System.out.println("map : " + map);
//		
//		List<Object> list = (List<Object>)map.get("list");
//		Assert.assertEquals(2, list.size());
//		System.out.println("list : " + list);
//		
//		Integer totalSchedule = (Integer)map.get("totalSchedule");
//		System.out.println("totalSchedule : " + totalSchedule);
//	}
	
	//@Test
	public void testUpdateSchedule() throws Exception {
		Post post = new Post();
		post = coupleService.getSchedule(10013);
		
		post.setPostTitle("3333");
		post.setPostContent("3333");
		String  day = "2020-01-28";
		Date postDate = Date.valueOf(day);
		post.setPostDate(postDate);
		post.setPlace("3333");
		
		coupleService.updateSchedule(post);
		
		
	}
	
	//@Test
	public void testDeleteSchedule() throws Exception {
		Post post = new Post();
		post = coupleService.getSchedule(10013);
		Assert.assertNotNull(post);
		
		post.setViewStatus("3");
		
		coupleService.deleteSchedule(post);
		
		
	}
	
	//@Test
	public void testDeleteCoupleTimeline() throws Exception {
		String firstUserId = "user01";
		String secondUserId = "user02";
		
		coupleService.deleteCoupleTimeline(firstUserId, secondUserId);
	}
}
