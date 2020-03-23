package com.uwl.service.challenge;

import java.util.List;
import java.util.Map;

import com.uwl.common.Search;
import com.uwl.service.domain.Challenge;
import com.uwl.service.domain.Reward;
import com.uwl.service.domain.SchoolRank;
import com.uwl.service.domain.User;

public interface ChallengeService {
	

	//Adimin이 도전과제 List를 가져오는 method (serach flag 1:제목, 2:내용 LIKE기능으로 일부 단어로 검색가능)
	public Map<String, Object> getAdminChallengeList(Search search) throws Exception;
	
	//특정 도전과제를 가져오는 method
	public Challenge getChallengeAdmin(int challNo) throws Exception;
	
	//특정 도전과제를 볼때 전 글 , 이후 글
	public Challenge getNextOrPrePost(int challNo) throws Exception;
	
	//도전과제를 추가하는 method
	public void addChallenge(Challenge challenge) throws Exception;
	
	//주간도전과제 시작시간을 추가하는 method
	public void addWeeklyStart(Challenge challenge) throws Exception;
	
	//등록된 도전과제를 수정하는 method
	public void updateChallenge(Challenge challenge) throws Exception;
	
	//등록된 도전과제를 삭제하는 method (플래그만 해서 지울것? 아니면 진짜로 db에서 delete??)
	public void deleteChallenge(Challenge challenge) throws Exception;
	
	//viewStatus를 4번으로 3개만 변경
	public void startChallenge(Challenge challenge) throws Exception;
	
	//viewStatus를 4번으로 변경했던것을 다시 1번으로 초기화하는 method
	public void resetChallenge(Challenge challenge) throws Exception;
	
	//주간으로 진행되는 도전과제의 시작날짜와 끝의 시간을 가져오는 method
	public Challenge getWeeklyStart() throws Exception;
	
	//user들이 보는 도전과제 list (주간 도전과제 수행 전)
	public Map<String, Object> getChallengeList() throws Exception;

	//4번으로 바꾼것을 담아서 view해주는 것.
	public Map<String, Object> getWeeklyChallengeList() throws Exception;
		
	//user들이 보는 도전과제 list (주간 도전과제 수행 전)
	//public Challenge weeklyStart() throws Exception;
	
	//User가 자신들이 깬 도전과제를 볼 수 있는 method
	public Map<String, Object> getCompleteChallengeList(Search search, String userId) throws Exception;
	
	//addChallenge 시 세부 카테고리를 선택창의 값을 불러오는 method
	public List<Challenge> getDetailCategoryList(String challCategory) throws Exception;
	
	//도전과제를 수행했을떄 ==> 게시판작성
	public Reward completePostChallenge(Reward reward, Challenge challenge, Map<String, Object> map, User user) throws Exception;
	
	//도전과제를 수행했을떄 ==> 코멘트작성
	public Reward completeConmentChallenge(Reward reward, Challenge challenge, Map<String, Object> map, User user) throws Exception;
	
	//주간도전과제 user용 list method만들것(3개씩 보여주는거)
	


}
