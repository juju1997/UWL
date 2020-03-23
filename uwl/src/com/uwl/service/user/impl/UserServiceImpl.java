package com.uwl.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.uwl.common.Search;
import com.uwl.service.domain.Ask;
import com.uwl.service.domain.Post;
import com.uwl.service.domain.User;
import com.uwl.service.schoolRank.SchoolRankDAO;
import com.uwl.service.user.UserDAO;
import com.uwl.service.user.UserService;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

	/// Field
	@Autowired
	@Qualifier("userDAOImpl")
	private UserDAO userDAO;
	

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	/// Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
		System.out.println("UserServiceImpl() 객체 생성");
	}

	/// Method
	@Override
	public void addUser(User user) throws Exception {
		System.out.println("UserServiceImpl : addUser() 호출");
		userDAO.addUser(user);
	}

	@Override
	public void addQuestions(Post post) throws Exception {
		System.out.println("UserServiceImpl : addQuestions() 호출");
		userDAO.addQuestions(post);
	}

	@Override
	public void addRealname(User user) throws Exception {
		System.out.println("UserServiceImpl : addRealname() 호출");
		userDAO.addRealname(user);
	}

	@Override
	public User getUserByMail(String mail) throws Exception {
		System.out.println("UserServiceImpl : getUserByMail() 호출");
		return userDAO.getUserByMail(mail);
	}
	
	@Override
	public User getUser(String userId) throws Exception {
		System.out.println("UserServiceImpl : getUser() 호출");
		return userDAO.getUser(userId);
	}
	
	@Override
	public User getUserByNickname(String nickname) throws Exception {
		System.out.println("UserServiceImpl : getUserByNickname() 호출");
		return userDAO.getUserByNickname(nickname);
	}

	@Override
	public User getProfile(String userId) throws Exception {
		System.out.println("UserServiceImpl : getProfile() 호출");
		return userDAO.getProfile(userId);
	}

	@Override
	public Post getQuestions(int postNo) throws Exception {
		System.out.println("UserServiceImpl : getQuestions() 호출");
		return userDAO.getQuestions(postNo);
	}
	
	
	
	
	@Override
	public Map<String, Object> getUserQuestions(Search search, String userId) throws Exception {
		System.out.println("UserServiceImpl : getUserQuestions() 호출");

		List<Post> list= userDAO.getUserQuestions(search, userId);
		int totalCount = userDAO.getTotalCount(search,userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
//	@Override
//	public  Map<String, Object> getUserPostList(Search search) throws Exception {
//		System.out.println("UserServiceImpl : getUserPostList() 호출");
//
//		List<User> list= userDAO.getUserPostList(search);
//		int totalCount = userDAO.getTotalCount(search);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list );
//		map.put("totalCount", new Integer(totalCount));
//		
//		return map;
//	}
//	
//	@Override
//	public  Map<String, Object> getUserCommentList(Search search) throws Exception {
//		System.out.println("UserServiceImpl : getUserCommentList() 호출");
//
//		List<User> list= userDAO.getUserCommentList(search);
//		int totalCount = userDAO.getTotalCount(search);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list );
//		map.put("totalCount", new Integer(totalCount));
//		
//		return map;
//	}
//	
//	@Override
//	public  Map<String, Object> getUserLikePostList(Search search) throws Exception {
//		System.out.println("UserServiceImpl : getUserLikePostList() 호출");
//
//		List<User> list= userDAO.getUserLikePostList(search);
//		int totalCount = userDAO.getTotalCount(search);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list );
//		map.put("totalCount", new Integer(totalCount));
//		
//		return map;
//	}
	
	@Override
	public  Map<String, Object> getUserList(Search search) throws Exception {
		System.out.println("UserServiceImpl : getUserList() 호출");
		
		List<User> list= userDAO.getUserList(search);
		int totalCount = userDAO.getTotalCountUser(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
//		
//	@Override
//	public  Map<String, Object> getUserQuestionsList(Search search) throws Exception {
//		System.out.println("UserServiceImpl : getUserQuestionsList() 호출");
//		
//		List<User> list= userDAO.getUserQuestionsList(search);
//		int totalCount = userDAO.getTotalCount(search);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list );
//		map.put("totalCount", new Integer(totalCount));
//		
//		return map;
//	}

//	@Override
//	public Map<String, Object> getUserList(Search search) throws Exception {
//		List<User> list = userDAO.getUserList(search);
//		int totalCount = userDAO.getTotalCount(search);
//
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list);
//		map.put("totalCount", new Integer(totalCount));
//
//		return map;
//	}

	@Override
	public Map<String, Object> getUserQuestionsList(Search search) throws Exception {
		List<User> list = userDAO.getUserQuestionsList(search);
		int totalCount = userDAO.getTotalCount2(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

//	@Override
//	public Map<String, Object> getActivityList(Search search) throws Exception {
//		List<User> list = userDAO.getActivityList(search);
//		int totalCount = userDAO.getTotalCount(search);
//
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list);
//		map.put("totalCount", new Integer(totalCount));
//
//		return map;
//	}

	@Override
	public void updateUser(User user) throws Exception {
		System.out.println("UserServiceImpl : updateUser() 호출");
		userDAO.updateUser(user);
	}

	@Override
	public void updateProfile(User user) throws Exception {
		System.out.println("UserServiceImpl : updateProfile() 호출");
		userDAO.updateProfile(user);
	}

	@Override
	public void updateQuestions(Post post) throws Exception {
		System.out.println("UserServiceImpl : updateQuestions() 호출");
		userDAO.updateQuestions(post);
	}

	@Override
	public void updateSchoolNo(User user) throws Exception {
		System.out.println("UserServiceImpl : updateSchoolNo() 호출");
		userDAO.updateSchoolNo(user);
	}

	@Override
	public void deleteUser(User user) throws Exception {
		System.out.println("UserServiceImpl : deleteUser() 호출");
		userDAO.deleteUser(user);
	}

	@Override
	public boolean checkDuplicationUserId(String userId) throws Exception {
		System.out.println("UserServiceImpl : checkDuplicationUserId() 호출");
		boolean result = true;
		User user = userDAO.getUser(userId);
		if (user != null) {
			result = false;
		}
		return result;
	}

	@Override
	public boolean checkDuplicationNickname(String nickname) throws Exception {
		System.out.println("UserServiceImpl : checkDuplicationNickname() 호출");
		boolean result = true;
		User user = userDAO.getUserByNickname(nickname);
		if (user != null) {
			result = false;
		}
		return result;
	}

	@Override
	public boolean checkDuplicationMail(String mail) throws Exception {
		System.out.println("UserServiceImpl : checkDuplicationMail() 호출");
		boolean result = true;
		User user = userDAO.getUserByMail(mail);
		System.out.println(mail + "userService");
		if (user != null) {
			result = false;
		}
		return result;
	}
	
	@Override
	public void updatePassword(User user) throws Exception {
		userDAO.updatePassword(user);
	}
	
	@Override
	public void updatePublicStatus(User user) throws Exception {
		userDAO.updatePublicStatus(user);
	}
	
	///////////////////
	@Override
	public void replyQuestion(Ask ask) throws Exception {
		userDAO.replyQuestion(ask);
		userDAO.updateQuestionStatus(ask.getQuestionPostNo());
		System.out.println("유저 서비스 임쁠 탄다");
	}
	
	@Override
	public Post getAnswer(int postNo) throws Exception {
		System.out.println("유저 서비스 임쁠 탄다 답변내용가져오기");
		return userDAO.getAnswer(postNo);
	}

	

	

	

	
}
