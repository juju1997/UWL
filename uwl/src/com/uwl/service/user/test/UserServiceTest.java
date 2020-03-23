package com.uwl.service.user.test;

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
import com.uwl.service.domain.Post;
import com.uwl.service.domain.User;
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
@ContextConfiguration(locations = { "classpath:config/context-common.xml", "classpath:config/context-aspect.xml",
		"classpath:config/context-mybatis.xml", "classpath:config/context-transaction.xml" })
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
public class UserServiceTest {

	// ==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

//	@Test
	public void testAddUser() throws Exception {

		User user = new User();
		user.setUserId("teUserId");
		user.setName("teUserName");
		user.setNickname("teNickname");
		user.setPassword("tePassword");
		user.setPhone("000-1111-2222");
		user.setMail("te@test.com");
		user.setGender("1");
		user.setPublicStatus("1");
		user.setDeleteStatus("1");

		userService.addUser(user);

		user = userService.getUser("teUserId");

		System.out.println(user);
	}
	
	
//	@Test
	public void testAddQuestions() throws Exception {

		Post post = new Post();
		post.setPostCategoryNo("5");
		post.setPostNo(1);
		post.setPostTitle("제목");
		post.setPostContent("내용");
		post.setUserId("user01");
		
		userService.addQuestions(post);
	}
	
	

//	@Test
	public void testAddRealname() throws Exception {

		User user = new User();
		user.setUserId("teUserId");
		user.setRole("2");

		userService.addRealname(user);

		user = userService.getUser("teUserId");

		System.out.println(user);
	}
	

//	@Test
	public void testGetUser() throws Exception {

		User user = new User();

		user = userService.getUser("user02");

//		Assert.assertEquals("testUserId", user.getUserId());
//		Assert.assertEquals("testUserName", user.getName());
//		Assert.assertEquals("testNickname", user.getNickname());
//		Assert.assertEquals("testPassword", user.getPassword());
//		Assert.assertEquals("111-2222-3333", user.getPhone());
//		Assert.assertEquals("test@test.com", user.getMail());

//		Assert.assertNotNull(userService.getUser("user02"));
//		Assert.assertNotNull(userService.getUser("user05"));
	}

//	@Test
	public void testUpdateUser() throws Exception {

		User user = userService.getUser("testUserId");
		Assert.assertNotNull(user);

		Assert.assertEquals("testUserName", user.getName());
		Assert.assertEquals("111-2222-3333", user.getPhone());
		Assert.assertEquals("test@test.com", user.getMail());

		user.setName("change");
		user.setPhone("777-7777-7777");
		user.setMail("change@change.com");

		userService.updateUser(user);

		user = userService.getUser("testUserId");
		Assert.assertNotNull(user);

		Assert.assertEquals("change", user.getName());
		Assert.assertEquals("777-7777-7777", user.getPhone());
		Assert.assertEquals("change@change.com", user.getMail());
	}

//	@Test
	public void testCheckDuplicationUserId() throws Exception {

		Assert.assertFalse(userService.checkDuplicationUserId("testUserId"));
		Assert.assertTrue(userService.checkDuplicationUserId("testUserId" + System.currentTimeMillis()));

		System.out.println(userService.checkDuplicationNickname("testUserId"));
		System.out.println(userService.checkDuplicationNickname("testUserId" + System.currentTimeMillis()));
		
	}

//	@Test 
	public void testCheckDuplicationNickname() throws Exception {

//		Assert.assertFalse( userService.checkDuplicationNickname("testNickname") );
//	 	Assert.assertTrue( userService.checkDuplicationNickname("testNickname"+System.currentTimeMillis()) );

		System.out.println(userService.checkDuplicationNickname("testNickname"));
		System.out.println(userService.checkDuplicationNickname("testNickname" + System.currentTimeMillis()));
	}

//	@Test
	public void testGetUserList() throws Exception {

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		Map<String, Object> map = userService.getUserList(search);

		List<Object> list = (List<Object>) map.get("list");
		Assert.assertEquals(3, list.size());

		Integer totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);

		System.out.println("=======================================");

		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("0");
		search.setSearchKeyword("");
		map = userService.getUserList(search);

		list = (List<Object>) map.get("list");
		Assert.assertEquals(3, list.size());

		totalCount = (Integer) map.get("totalCount");
		System.out.println(totalCount);
	}

	
//	@Test
	public void testUpdateProfile() throws Exception {

		User user = userService.getUser("user05");
		Assert.assertNotNull(user);

		Assert.assertEquals(null, user.getSelfIntroduction());
		Assert.assertEquals("change", user.getProfileName());
		Assert.assertEquals("2", user.getPublicStatus());

		user.setSelfIntroduction("changeIntroduction");
		user.setProfileName("changeProfileName");
		user.setPublicStatus("1");

		userService.updateProfile(user);

		user = userService.getUser("user05");
		Assert.assertNotNull(user);

		Assert.assertEquals("changeIntroduction", user.getSelfIntroduction());
		Assert.assertEquals("changeProfileName", user.getProfileName());
		Assert.assertEquals("1", user.getPublicStatus());
	}

	
//	@Test
	public void testFindId() throws Exception {
		
		User user = new User();
		Assert.assertNotNull(user);
//		Assert.assertEquals("kimkang@mail.mail", user.getMail());

		user = userService.getUserByMail("kimkang@mail.mail");
		String id = user.getUserId();
		System.out.println(id);
	}
	
	
//	@Test
	public void testFindPwById() throws Exception {
		
		User user = new User();
		Assert.assertNotNull(user);

		user = userService.getUser("user07");
		String pw = user.getPassword();
		System.out.println(pw);
		
	}
	
	
	
//	@Test
	public void testDeleteUser() throws Exception {

		User user = userService.getUser("user01");
		Assert.assertNotNull(user);

		Assert.assertEquals("user01", user.getUserId());
		Assert.assertEquals("1", user.getDeleteStatus());

		user.setDeleteStatus("2");

		userService.deleteUser(user);

		user = userService.getUser("user01");
		Assert.assertNotNull(user);

		Assert.assertEquals("user01", user.getUserId());
		Assert.assertEquals("2", user.getDeleteStatus());
	}
	
	
	
	
	
	
//	 삭제?
////	 @Test
//	 public void testGetUserListByUserId() throws Exception{
//		 
//	 	Search search = new Search();
//	 	search.setCurrentPage(1);
//	 	search.setPageSize(3);
//	 	search.setSearchCondition("4");
//	 	search.setSearchKeyword("admin");
//	 	Map<String,Object> map = userService.getUserList(search);
//	 	
//	 	List<Object> list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(3, list.size());
//	 	
//	 	Integer totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 	
//	 	System.out.println("=======================================");
//	 	
//	 	search.setSearchCondition("0");
//	 	search.setSearchKeyword(""+System.currentTimeMillis());
//	 	map = userService.getUserList(search);
//	 	
//	 	list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(3, list.size());
//	 	
//	 	totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 }
//	 
////	 @Test
//	 public void testGetUserListByUserName() throws Exception{
//		 
//	 	Search search = new Search();
//	 	search.setCurrentPage(1);
//	 	search.setPageSize(3);
//	 	search.setSearchCondition("1");
//	 	search.setSearchKeyword("SCOTT");
//	 	Map<String,Object> map = userService.getUserList(search);
//	 	
//	 	List<Object> list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(3, list.size());
//	 	
//		//==> console Ȯ��
//	 	//System.out.println(list);
//	 	
//	 	Integer totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 	
//	 	System.out.println("=======================================");
//	 	
//	 	search.setSearchCondition("1");
//	 	search.setSearchKeyword(""+System.currentTimeMillis());
//	 	map = userService.getUserList(search);
//	 	
//	 	list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(0, list.size());
//	 	
//		//==> console Ȯ��
//	 	//System.out.println(list);
//	 	
//	 	totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 }	 

}
