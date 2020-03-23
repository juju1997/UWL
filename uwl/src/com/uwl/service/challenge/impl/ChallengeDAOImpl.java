package com.uwl.service.challenge.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.uwl.common.Search;
import com.uwl.service.challenge.ChallengeDAO;
import com.uwl.service.domain.Challenge;
import com.uwl.service.domain.Reward;
import com.uwl.service.domain.SchoolRank;

@Repository("challengeDAOImpl")
public class ChallengeDAOImpl implements ChallengeDAO{
	
	//Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	//Constructor
	public ChallengeDAOImpl() {
		// TODO Auto-generated constructor stub
	}
	
	//setSqlSession
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	

	@Override
	public void addChallenge(Challenge challenge) throws Exception {
		sqlSession.insert("ChallengeMapper.addChallenge", challenge);
	}
	
	@Override
	public void addWeeklyStart(Challenge challenge) throws Exception {
		System.out.println("ChallengeDAO에 접근 addWeekstart() 실행");
		sqlSession.insert("ChallengeMapper.addWeeklyStart", challenge);
		
	}

	@Override
	public void updateChallenge(Challenge challenge) throws Exception {
		sqlSession.update("ChallengeMapper.updateChallenge", challenge);
	}
	
	@Override
	public void deleteChallenge(Challenge challenge) throws Exception {
		sqlSession.update("ChallengeMapper.deleteChallenge", challenge);
	}
	
	///////////////////////////////// 주간도전과제 고정을 위해 새로추가한것. /////////////////////////////////
	@Override
	public void startChallenge(Challenge challenge) throws Exception {
		sqlSession.update("ChallengeMapper.startChallenge", challenge);
		
	}

	@Override
	public void resetChallenge(Challenge challenge) throws Exception {
		sqlSession.update("ChallengeMapper.resetChallenge", challenge);
		
	}

	@Override
	public List<Challenge> getWeeklyChallengeList() throws Exception {
		return sqlSession.selectList("ChallengeMapper.getWeeklyChallengeList");
	}
	///////////////////////////////// 주간도전과제 고정을 위해 새로추가한것. /////////////////////////////////
	
	@Override
	public List<Challenge> getAdminChallengeList(Search search) throws Exception {
		return sqlSession.selectList("ChallengeMapper.getAdminChallengeList",search);
	}

	@Override
	public Challenge getChallengeAdmin(int challNo) throws Exception {
		return sqlSession.selectOne("ChallengeMapper.getChallengeAdmin", challNo);
	}
	
	@Override
	public Challenge getNextOrPrePost(int challNo) throws Exception {
		return sqlSession.selectOne("ChallengeMapper.getNextOrPrePost",challNo);
	}

	@Override
	public List<Challenge> getChallengeList() throws Exception {
		return sqlSession.selectList("ChallengeMapper.getChallengeList");
	}
	
	@Override
	public Map<String, Object> getCompleteChallengeList(Search search, String userId) throws Exception {
		
		Map<String, Object> completeMap = new HashMap<String, Object>();
		
		System.out.println("getCompleteChallengeList의 search : " + search);
		System.out.println("getCompleteChallengeList의 userId : " + userId);
		
		completeMap.put("search", search);
		completeMap.put("userId", userId);
		
		List<Reward> completeList = sqlSession.selectList("ChallengeMapper.getCompleteChallengeList", completeMap);
		
		completeMap.put("totalCount", sqlSession.selectOne("ChallengeMapper.getTotalCountOne", userId));
		completeMap.put("list", completeList);
		
		return completeMap;
	}


	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ChallengeMapper.getTotalCount",search);
	}

	@Override
	public int getTotalCountOne(String userId) throws Exception {
		return sqlSession.selectOne("ChallengeMapper.getTotalCountOne",userId);
	}

	@Override
	public int getChallPostCompleteCount(Challenge challenge) throws Exception {
		return sqlSession.selectOne("ChallengeMapper.getChallPostCompleteCount",challenge);
	}

	@Override
	public int getChallCommentCompleteCount(Challenge challenge) throws Exception {
		
		System.out.println("ChallengeDAOImpl의  getChallCommentCompleteCount() 작동 중 getCommentt.getUserId : " + challenge.getCommentt().getUserId() );
		
		return sqlSession.selectOne("ChallengeMapper.getChallCommentCompleteCount",challenge);
	}

	@Override
	public List<Challenge> getDetailCategoryList(String challCategory) throws Exception {
		System.out.println("ChallengeDAOImpl의  getDetailCategoryList()" + challCategory );
		return sqlSession.selectList("ChallengeMapper.getDetailCategoryList", challCategory);
	}

	@Override
	public Challenge getWeeklyStart() throws Exception {
		System.out.println("ChallengeDAOImpl의  getWeeklyStart()");
		return sqlSession.selectOne("ChallengeMapper.getWeeklyStart");
	}

	

	
	
	
	


}
