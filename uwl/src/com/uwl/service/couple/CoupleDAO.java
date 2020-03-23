package com.uwl.service.couple;

import java.sql.Date;
import java.util.List;

import com.uwl.common.Search;
import com.uwl.service.domain.Commentt;
import com.uwl.service.domain.Couple;
import com.uwl.service.domain.Post;

public interface CoupleDAO {

	public void addCouple(Couple couple) throws Exception;
	
	public Couple getCouple(String userId) throws Exception;
	
	
	
	public void deleteCouple(Couple couple) throws Exception;
	
	
	
	public void addCoupleTimelinePost(Post post) throws Exception;
	
	public Post getCoupleTimelinePost(int postNo) throws Exception;
	
	public List<Post> getCoupleTimelinePostList(Search search, String userId) throws Exception;
	
	public void updateCoupleTimelinePost(Post post) throws Exception;
	
	public void deleteCoupleTimelinePost(Post post) throws Exception;
	
	
	
	public int getTotalCoupleTimelinePost(Search search, String userId) throws Exception;
	
	public void addCoupleTimelineComment(Commentt comment) throws Exception;
	
	public Commentt getCoupleTimelineComment(int commentNo) throws Exception;
	
	public List<Commentt> getCoupleTimelineCommentList(Search search, int postNo) throws Exception;
	
	public void deleteCoupleTimelineComment(Commentt comment) throws Exception;
	
	public int getTotalCoupleTimelineComment(Search search, int postNo) throws Exception;
	
	public void addSchedule(Post post) throws Exception;
	
	public Post getSchedule(int postNo) throws Exception;
	
	public List<Post> getScheduleList(Search search, String userId, String postDate) throws Exception;
	
//	public List<Post> getScheduleList2(Search search, String userId) throws Exception;
	
	public void updateSchedule(Post post) throws Exception;
	
	public void deleteSchedule(Post post) throws Exception;
	
	public int getTotalSchedule(Search search, String userId, String postDate) throws Exception;
	
//	public int getTotalSchedule2(Search search, String userId) throws Exception;
	
	public void deleteCoupleTimeline(String firstUserId, String secondUserId) throws Exception;
}
