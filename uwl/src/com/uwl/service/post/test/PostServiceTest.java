package com.uwl.service.post.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.uwl.common.Search;
import com.uwl.service.domain.Post;
import com.uwl.service.post.PostService;



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
public class PostServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("postServiceImpl")
	private PostService postService;
	
//	@Test
	public void getBoard() throws Exception{
		int postNo = 10025;
		
		System.out.println(postService.getBoard(postNo));
	}

	
//	@Test
	public void addBoard() throws Exception{
		Post post = new Post();
		post.setUserId("user01");
		post.setPostTitle("조회,좋아요,댓글 테스트  ㅋㅋ");
		post.setPostContent("됐으면 좋겠당 ㅎㅎ ㅋㅋ");
		post.setGatherCategoryNo("202");
		
		postService.addBoard(post);
	}
	
//	@Test
	public void updateBoard() throws Exception{
		Post post = new Post();
		post.setPostNo(10000);
		post.setPostTitle("이거 제목 수정인데 바뀌냐? ㅋㅋ");
		post.setPostContent("이거 내용수정인데 바뀌냐? ㅋㅋ");
		post.setGatherCategoryNo("203");
		
		postService.updateBoard(post);
	}
	
//	@Test
	public void deleteBoard() throws Exception{
		int postNo = 10013;
		
		postService.deleteBoard(postNo);
	}
	
	@Test
	public void getBoardList() throws Exception{
		Search search  = new Search();
		search.setCurrentPage(1);
		search.setPageSize(4);
		String gatherCategoryNo = "202";
		
		System.out.println(postService.getBoardList(search, gatherCategoryNo));
	}
	
//	@Test
	public void getNotice() throws Exception{
		int postNo = 10012;
		
		System.out.println(postService.getNotice(postNo));
	}
	
//	@Test
	public void addNotice() throws Exception{
		Post post = new Post();
		post.setUserId("user01");
		post.setPostTitle("이거 공지사항 조회, 좋아요, 댓글 들어가냐? ㅋㅋ");
		post.setPostContent("됐으면 좋겠당 ㅋㅋㅋ공지사항ㅋㅋ ㅋㅋ");
		post.setGatherCategoryNo("105");
		
		postService.addBoard(post);
	}
	
//	@Test
	public void updateNotice() throws Exception{
		Post post = new Post();
		post.setPostNo(10007);
		post.setPostTitle("이거 공지사항 제목 수정인데 바뀌냐? ㅋㅋ");
		post.setPostContent("이거 공지사항 내용수정인데 바뀌냐? ㅋㅋ");
		post.setGatherCategoryNo("105");
		
		postService.updateBoard(post);
	}
	
//	@Test
	public void deleteNotice() throws Exception{
		int postNo = 10011;
		postService.deleteBoard(postNo);
	}
	
//	@Test
	public void getNoticeList() throws Exception{
		Search search  = new Search();
		search.setCurrentPage(1);
		search.setPageSize(4);
		String gatherCategoryNo = "102";
		
		System.out.println(postService.getBoardList(search, gatherCategoryNo));
	}
}
