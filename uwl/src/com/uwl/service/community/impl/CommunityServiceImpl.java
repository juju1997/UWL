package com.uwl.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.uwl.common.Search;
import com.uwl.service.community.CommunityDAO;
import com.uwl.service.community.CommunityService;
import com.uwl.service.domain.Commentt;
import com.uwl.service.domain.Likey;
import com.uwl.service.domain.Notification;

@Service("communityServiceImpl")
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	@Qualifier("communityDAOImpl")
	private CommunityDAO communityDAO;
	public void setCommunityDAO(CommunityDAO communityDAO) {
		this.communityDAO = communityDAO;
	}
	
	
	@Override
	public void addComment(Commentt comment) throws Exception {
		communityDAO.addComment(comment);
	}

	@Override
	public Commentt getComment(String userId, int postNo) throws Exception {
		return communityDAO.getComment(userId, postNo);
	}
	
	
	@Override
	public Commentt getCommentByCommentNo(int commentNo) throws Exception {
		return communityDAO.getCommentByCommentNo(commentNo);
	}

	@Override
	public void updateComment(Commentt comment) throws Exception {
		communityDAO.updateComment(comment);
	}

	@Override
	public void deleteComment(Commentt comment) throws Exception {
		communityDAO.deleteComment(comment);
	}

	@Override
	public Map<String, Object> getCommentList(Search search, int postNo, String userId) throws Exception {
		List<Commentt> list = communityDAO.getCommentList(search, postNo, userId);
		int totalCount = communityDAO.getCommentTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void addPostLike(Likey likey) throws Exception {
		communityDAO.addPostLike(likey);
	}

	@Override
	public void addCommentLike(Likey likey) throws Exception {
		communityDAO.addCommentLike(likey);
	}

	@Override
	public void deleteLike(Likey likey) throws Exception {
		communityDAO.deleteLike(likey);
	}


	@Override
	public Map<String, Object> getLikeList(Search search, String userId) throws Exception {
		List<Likey> list = communityDAO.getLikeList(search, userId);
		int totalCount = communityDAO.getLikeTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	@Override
	public Likey getLike(Likey likey) throws Exception {
		return communityDAO.getLike(likey);
	}

	
	

	@Override
	public void addNotification(Notification notification) throws Exception {
		communityDAO.addNotification(notification);
	}





	
	
}
