package com.uwl.service.community.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.uwl.common.Search;
import com.uwl.service.community.CommunityService;
import com.uwl.service.domain.Commentt;
import com.uwl.service.domain.Likey;
import com.uwl.service.domain.Notification;

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
public class CommunityServiceTest {
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
//	@Test
	public void addComment() throws Exception{
		Commentt comment = new Commentt();
		comment.setUserId("user01");
		comment.setPostNo(10011);
		comment.setCommentContent("이거리얼 최종 ㅋㅋ 리얼로 좋아요수 테스트임 ㅋㅋㅋ");
		
		communityService.addComment(comment);
	}
	
//	@Test
	public void getComment() throws Exception{
		
		System.out.println(communityService.getComment("user01", 10025));
		
	}
	
//	@Test
	public void updateComment() throws Exception{
		Commentt comment = new Commentt();
		comment.setCommentNo(10003);
		comment.setCommentContent("이거 댓글 수정인데 잘 되냐? ㅋㅋ");
		
		communityService.updateComment(comment);
	}
	
//	@Test
	public void deleteComment() throws Exception{
		Commentt comment = new Commentt();
		comment.setCommentNo(10008);
		comment.setPostNo(10011);
		communityService.deleteComment(comment);
	}
	
	@Test
	public void getCommentList() throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("1");
		int postNo = 10026;
		String userId = "user01";
		communityService.getCommentList(search, postNo, userId);
	}
	
//	@Test
	public void addPostLike() throws Exception{
		Likey likey = new Likey();
		likey.setRefPostNo(10011);
		likey.setUserId("user01");
		
		communityService.addPostLike(likey);
	}
	
//	@Test
	public void addCommentLike() throws Exception{
		Likey likey = new Likey();
		likey.setRefCommentNo(10010);
		likey.setUserId("user02");
		
		communityService.addCommentLike(likey);
	}
	
//	@Test
	public void deleteLike() throws Exception{
		Likey like = new Likey();
		like.setLikeNo(10007);
//		like.setRefPostNo(10011);
		like.setRefCommentNo(10010);
		communityService.deleteLike(like);
	}
	
//	@Test
	public void getLikeList() throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("2");
		
		String userId = "user02";
		
		System.out.println(communityService.getLikeList(search, userId));
	}
	
//	@Test
	public void addNotification() throws Exception{
		Notification notification = new Notification();
	}
}
