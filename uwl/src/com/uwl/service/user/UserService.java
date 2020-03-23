package com.uwl.service.user;

import java.util.Map;

import com.uwl.common.Search;
import com.uwl.service.domain.Ask;
import com.uwl.service.domain.Post;
import com.uwl.service.domain.User;

public interface UserService {

	// INSERT
	public void addUser(User user) throws Exception;

	public void addQuestions(Post post) throws Exception; // 문의사항 등록

	public void addRealname(User user) throws Exception; // 실명인증 여부

	// SELECT ONE
	public User getUserByMail(String mail) throws Exception; // mail로 id 불러오기

	public User getUser(String userId) throws Exception; // 회원정보 조회 , id 중복체크

	public User getUserByNickname(String nickname) throws Exception; // nickname 중복체크

	public User getProfile(String userId) throws Exception; // 프로필 조회

	public Post getQuestions(int postNo) throws Exception; // 문의사항 내용

	public Map<String, Object> getUserQuestions(Search search, String userId) throws Exception;; // 나의 문의사항 내역

//	public Map<String, Object> getUserPostList(Search search) throws Exception; // 내가 쓴 게시글 목록

//	public Map<String, Object> getUserCommentList(Search search) throws Exception; // 내가 쓴 댓글 목록

//	public Map<String, Object> getUserLikePostList(Search search) throws Exception; // 내가 좋아요한 글 목록

	// SELECT LIST
	public Map<String, Object> getUserList(Search search) throws Exception; // 전체 회원 목록

	public Map<String, Object> getUserQuestionsList(Search search) throws Exception; // 전체 문의사항 내역

//	public Map<String, Object> getActivityList(Search search) throws Exception; // 나의 활동내역

	// UPDATE
	public void updateUser(User user) throws Exception; // 회원정보 수정

	public void updateProfile(User user) throws Exception; // 프로필 수정

	public void updateQuestions(Post post) throws Exception; // 문의사항 수정

	public void updateSchoolNo(User user) throws Exception; // 학교번호 수정

	public void deleteUser(User user) throws Exception; // 회원탈퇴 여부

	// 중복체크
	public boolean checkDuplicationUserId(String userId) throws Exception;; // id 중복체크

	public boolean checkDuplicationNickname(String nickname) throws Exception; // nickname 중복체크

	public boolean checkDuplicationMail(String mail) throws Exception; // mail 중복체크
	
	public void updatePassword(User user) throws Exception;
	
	public void updatePublicStatus(User user) throws Exception;
	
	//
	
	public void replyQuestion(Ask ask) throws Exception;
	
	public Post getAnswer(int postNo) throws Exception;

}
