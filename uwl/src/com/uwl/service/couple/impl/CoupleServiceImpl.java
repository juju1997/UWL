package com.uwl.service.couple.impl;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.uwl.common.Search;
import com.uwl.service.couple.CoupleDAO;
import com.uwl.service.couple.CoupleService;
import com.uwl.service.domain.Commentt;
import com.uwl.service.domain.Couple;
import com.uwl.service.domain.Post;

@Service("coupleServiceImpl")
public class CoupleServiceImpl implements CoupleService{

	@Autowired
	@Qualifier("coupleDAOImpl")
	private CoupleDAO coupleDAO;
	public void setCoupleDAO(CoupleDAO coupleDAO) {
		this.coupleDAO = coupleDAO;
	}
	
	public CoupleServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addCouple(Couple couple) throws Exception {
		// TODO Auto-generated method stub
		coupleDAO.addCouple(couple);
	}

	@Override
	public Couple getCouple(String userId) throws Exception {
		// TODO Auto-generated method stub
		return coupleDAO.getCouple(userId);
	}

	@Override
	public void deleteCouple(Couple couple) throws Exception {
		// TODO Auto-generated method stub
		coupleDAO.deleteCouple(couple);
	}

	@Override
	public void addCoupleTimelinePost(Post post) throws Exception {
		// TODO Auto-generated method stub
		coupleDAO.addCoupleTimelinePost(post);
	}

	@Override
	public Post getCoupleTimelinePost(int postNo) throws Exception {
		// TODO Auto-generated method stub
		return coupleDAO.getCoupleTimelinePost(postNo);
	}

	@Override
	public Map<String, Object> getCoupleTimelinePostList(Search search, String userId) throws Exception {
		// TODO Auto-generated method stub
		List<Post> list = coupleDAO.getCoupleTimelinePostList(search, userId);
		int totalCoupleTimelinePost = coupleDAO.getTotalCoupleTimelinePost(search, userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCoupleTimelinePost", new Integer(totalCoupleTimelinePost));
		return map;
	}

	@Override
	public void updateCoupleTimelinePost(Post post) throws Exception {
		// TODO Auto-generated method stub
		coupleDAO.updateCoupleTimelinePost(post);
	}

	@Override
	public void deleteCoupleTimelinePost(Post post) throws Exception {
		// TODO Auto-generated method stub
		coupleDAO.deleteCoupleTimelinePost(post);
	}

	@Override
	public void addCoupleTimelineComment(Commentt comment) throws Exception {
		// TODO Auto-generated method stub
		coupleDAO.addCoupleTimelineComment(comment);
	}

	@Override
	public Commentt getCoupleTimelineComment(int commentNo) throws Exception {
		// TODO Auto-generated method stub
		return coupleDAO.getCoupleTimelineComment(commentNo);
	}

	@Override
	public Map<String, Object> getCoupleTimelineCommentList(Search search, int postNo) throws Exception {
		// TODO Auto-generated method stub
		List<Commentt> list = coupleDAO.getCoupleTimelineCommentList(search, postNo);
		int totalCoupleTimelineComment = coupleDAO.getTotalCoupleTimelineComment(search, postNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCoupleTimelineComment", new Integer(totalCoupleTimelineComment));
		return map;
	}

	@Override
	public void deleteCoupleTimelineComment(Commentt comment) throws Exception {
		// TODO Auto-generated method stub
		coupleDAO.deleteCoupleTimelineComment(comment);
	}

	@Override
	public void addSchedule(Post post) throws Exception {
		// TODO Auto-generated method stub
		coupleDAO.addSchedule(post);
	}

	@Override
	public Post getSchedule(int postNo) throws Exception {
		// TODO Auto-generated method stub
		return coupleDAO.getSchedule(postNo);
	}

	@Override
	public Map<String, Object> getScheduleList(Search search, String userId, String postDate) throws Exception {
		// TODO Auto-generated method stub
		List<Post> list = coupleDAO.getScheduleList(search, userId, postDate);
		int totalSchedule = coupleDAO.getTotalSchedule(search, userId, postDate);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalSchedule", new Integer(totalSchedule));
		return map;
	}
	
//	@Override
//	public Map<String, Object> getScheduleList2(Search search, String userId) throws Exception {
//		// TODO Auto-generated method stub
//		List<Post> list = coupleDAO.getScheduleList2(search, userId);
//		int totalSchedule = coupleDAO.getTotalSchedule2(search, userId);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list);
//		map.put("totalSchedule", totalSchedule);
//		return map;
//	}

	@Override
	public void updateSchedule(Post post) throws Exception {
		// TODO Auto-generated method stub
		coupleDAO.updateSchedule(post);
	}

	@Override
	public void deleteSchedule(Post post) throws Exception {
		// TODO Auto-generated method stub
		coupleDAO.deleteSchedule(post);
	}

	@Override
	public void deleteCoupleTimeline(String firstUserId, String secondUserId) throws Exception {
		// TODO Auto-generated method stub
		coupleDAO.deleteCoupleTimeline(firstUserId, secondUserId);
	}

	

	
	
	

}
