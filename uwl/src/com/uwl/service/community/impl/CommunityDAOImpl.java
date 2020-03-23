package com.uwl.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.uwl.common.Search;
import com.uwl.service.community.CommunityDAO;
import com.uwl.service.domain.Commentt;
import com.uwl.service.domain.Likey;
import com.uwl.service.domain.Notification;

@Repository("communityDAOImpl")
public class CommunityDAOImpl implements CommunityDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//constructor
	public CommunityDAOImpl() {
		super();
	}
	
	@Override
	public void addComment(Commentt comment) throws Exception {
		sqlSession.insert("CommunityMapper.addComment", comment);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postNo", comment.getPostNo());
		map.put("change", +1);
		sqlSession.update("CommunityMapper.updateCommentStatus", map);
	}

	@Override
	public Commentt getComment(String userId, int postNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("postNo", postNo);
		return sqlSession.selectOne("CommunityMapper.getComment", map);
	}

	@Override
	public Commentt getCommentByCommentNo(int commentNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getCommentByCommentNo", commentNo);
	}
	
	@Override
	public void updateComment(Commentt comment) throws Exception {
		sqlSession.update("CommunityMapper.updateComment", comment);
	}

	@Override
	public void deleteComment(Commentt comment) throws Exception {
		sqlSession.update("CommunityMapper.deleteComment", comment.getCommentNo());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postNo", comment.getPostNo());
		map.put("change", -1);
		sqlSession.update("CommunityMapper.updateCommentStatus", map);
	}

	@Override
	public List<Commentt> getCommentList(Search search, int postNo, String userId) throws Exception {
		Map<String ,Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("postNo", postNo);
		map.put("userId", userId);
		
		return sqlSession.selectList("CommunityMapper.getCommentList", map);
	}

	
	
	
	@Override
	public void addPostLike(Likey likey) throws Exception {
		sqlSession.insert("CommunityMapper.addPostLike", likey);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postNo", likey.getRefPostNo());
		map.put("change", +1);
		sqlSession.update("CommunityMapper.updatePostLikeStatus", map);
	}

	@Override
	public void addCommentLike(Likey likey) throws Exception {
		sqlSession.insert("CommunityMapper.addCommentLike", likey);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commentNo", likey.getRefCommentNo());
		map.put("change", +1);
		sqlSession.update("CommunityMapper.updateCommentLikeStatus", map);
	}

	@Override
	public void deleteLike(Likey likey) throws Exception {
		sqlSession.delete("CommunityMapper.deleteLike", likey.getLikeNo());
		Map<String, Object> map = new HashMap<String, Object>();
		if(likey.getRefCommentNo() == 0) {
			map.put("postNo", likey.getRefPostNo());
			map.put("change", -1);
			sqlSession.update("CommunityMapper.updatePostLikeStatus", map);
		}
		if(likey.getRefCommentNo() != 0) {
			map.put("commentNo", likey.getRefCommentNo());
			map.put("change", -1);
			sqlSession.update("CommunityMapper.updateCommentLikeStatus", map);
		}
	}

	@Override
	public List<Likey> getLikeList(Search search, String userId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userId", userId);
		return sqlSession.selectList("CommunityMapper.getLikeList", map);
	}
	
	
	@Override
	public Likey getLike(Likey likey) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getLike", likey);
	}

	@Override
	public void addNotification(Notification notification) throws Exception {
		sqlSession.insert("CommunityMapper.addNotification", notification);
	}

	@Override
	public int getCommentTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getCommentTotalCount", search);
	}

	@Override
	public int getLikeTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getLikeTotalCount", search);
	}

	

	
}
