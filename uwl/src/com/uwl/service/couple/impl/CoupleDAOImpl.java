package com.uwl.service.couple.impl;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.uwl.common.Search;
import com.uwl.service.couple.CoupleDAO;
import com.uwl.service.domain.Commentt;
import com.uwl.service.domain.Couple;
import com.uwl.service.domain.Post;


@Repository("coupleDAOImpl")
public class CoupleDAOImpl implements CoupleDAO{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public CoupleDAOImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addCouple(Couple couple) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("CoupleMapper.addCouple", couple);
	}

	@Override
	public Couple getCouple(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CoupleMapper.getCouple", userId);
	}

	@Override
	public void deleteCouple(Couple couple) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("CoupleMapper.deleteCouple", couple);
	}

	@Override
	public void addCoupleTimelinePost(Post post) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("CoupleMapper.addCoupleTimelinePost", post);
	}

	@Override
	public Post getCoupleTimelinePost(int postNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CoupleMapper.getCoupleTimelinePost", postNo);
	}

	@Override
	public List<Post> getCoupleTimelinePostList(Search search, String userId) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("userId", userId);
		return sqlSession.selectList("CoupleMapper.getCoupleTimelinePostList", map);
	}

	@Override
	public void updateCoupleTimelinePost(Post post) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("CoupleMapper.updateCoupleTimelinePost", post);
	}

	@Override
	public void deleteCoupleTimelinePost(Post post) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("CoupleMapper.deleteCoupleTimelinePost", post);
	}

	@Override
	public int getTotalCoupleTimelinePost(Search search, String userId) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("userId", userId);
		return sqlSession.selectOne("CoupleMapper.getTotalCoupleTimelinePost", map);
	}

	@Override
	public void addCoupleTimelineComment(Commentt comment) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("CoupleMapper.addCoupleTimelineComment", comment);
	}
	
	@Override
	public Commentt getCoupleTimelineComment(int commentNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CoupleMapper.getCoupleTimelineComment", commentNo);
	}

	@Override
	public List<Commentt> getCoupleTimelineCommentList(Search search, int postNo) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("postNo", postNo);
		return sqlSession.selectList("CoupleMapper.getCoupleTimelineCommentList", map);
	}

	@Override
	public void deleteCoupleTimelineComment(Commentt comment) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("CoupleMapper.deleteCoupleTimelineComment", comment);
	}
	
	@Override
	public int getTotalCoupleTimelineComment(Search search, int postNo) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("postNo", postNo);
		
		return sqlSession.selectOne("CoupleMapper.getTotalCoupleTimelineComment", map);
	}

	@Override
	public void addSchedule(Post post) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("CoupleMapper.addSchedule", post);
	}

	@Override
	public Post getSchedule(int postNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CoupleMapper.getSchedule", postNo);
	}

	@Override
	public List<Post> getScheduleList(Search search, String userId, String postDate) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("userId", userId);
		
		map.put("postDate", postDate.toString());
		
		return sqlSession.selectList("CoupleMapper.getScheduleList", map);
	}
	
//	@Override
//	public List<Post> getScheduleList2(Search search, String userId) throws Exception {
//		// TODO Auto-generated method stub
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		map.put("search", search);
//		map.put("userId", userId);
//		
//		return sqlSession.selectList("CoupleMapper.getScheduleList2", map);
//	}

	@Override
	public void updateSchedule(Post post) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("CoupleMapper.updateSchedule", post);
	}

	@Override
	public void deleteSchedule(Post post) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("CoupleMapper.deleteSchedule", post);
	}

	@Override
	public int getTotalSchedule(Search search, String userId, String postDate) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("userId", userId);
		map.put("postDate", postDate);
		return  sqlSession.selectOne("CoupleMapper.getTotalSchedule", map);
	}

	

//	@Override
//	public int getTotalSchedule2(Search search, String userId) throws Exception {
//		// TODO Auto-generated method stub
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		map.put("search", search);
//		map.put("userId", userId);
//		
//		return sqlSession.selectOne("CoupleMapper.getTotalSchedule2", map);
//	}

	@Override
	public void deleteCoupleTimeline(String firstUserId, String secondUserId) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("firstUserId", firstUserId);
		map.put("secondUserId", secondUserId);
		sqlSession.update("CoupleMapper.deleteCoupleTimeline", map);
		
		
	}

	

	
	
	

	

	

	

}
