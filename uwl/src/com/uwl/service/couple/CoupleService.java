package com.uwl.service.couple;

import java.sql.Date;
import java.util.Map;

import com.uwl.common.Search;
import com.uwl.service.domain.Commentt;
import com.uwl.service.domain.Couple;
import com.uwl.service.domain.Post;

public interface CoupleService {

	public void addCouple(Couple couple) throws Exception;
	
	public Couple getCouple(String userId) throws Exception;
	
	public void deleteCouple(Couple couple) throws Exception;
	
	public void addCoupleTimelinePost(Post post) throws Exception;
	
	public Post getCoupleTimelinePost(int postNo) throws Exception;
	
	public Map<String, Object> getCoupleTimelinePostList(Search search, String userId) throws Exception;
	
	public void updateCoupleTimelinePost(Post post) throws Exception;
	
	public void deleteCoupleTimelinePost(Post post) throws Exception;
	
	public void addCoupleTimelineComment(Commentt comment) throws Exception;
	
	public Commentt getCoupleTimelineComment(int commentNo) throws Exception;
	
	public Map<String, Object> getCoupleTimelineCommentList(Search search, int postNo) throws Exception;
	
	public void deleteCoupleTimelineComment(Commentt comment) throws Exception;
	
	public void addSchedule(Post post) throws Exception;
	
	public Post getSchedule(int postNo) throws Exception;
	
	public Map<String, Object> getScheduleList(Search search, String userId, String postDate) throws Exception;
	
//	public Map<String, Object> getScheduleList2(Search search, String userId) throws Exception;
	
	public void updateSchedule(Post post) throws Exception;
	
	public void deleteSchedule(Post post) throws Exception;
	
	public void deleteCoupleTimeline(String firstUserId, String secondUserId) throws Exception;
}
