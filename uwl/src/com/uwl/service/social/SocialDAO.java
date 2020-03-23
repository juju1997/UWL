package com.uwl.service.social;

import java.util.List;

import com.uwl.common.Search;
import com.uwl.service.domain.Ask;
import com.uwl.service.domain.Item;
import com.uwl.service.domain.Notification;
import com.uwl.service.domain.Post;

public interface SocialDAO {

	public void addTimeline(Post post) throws Exception;
	
	public Post getTimeline(int postNo) throws Exception;
	
	public List<Post> getTimelineList(String userId, Search search) throws Exception;
	
	public void updateTimeline(Post post) throws Exception;
	
	public void deleteTimeline(int postNo) throws Exception;
	
	public int getTimelineTotalCount(String userId, Search search) throws Exception;
	
	public void addQuestion(Ask post) throws Exception;
	
	public void replyQuestion(Ask post) throws Exception;
	
	public void updateQuestionStatus(int postNo) throws Exception;
	
	public List<Ask> getAskQuestionList(String userId, Search search) throws Exception;
	
	public List<Ask> getAskList(String userId, Search search) throws Exception;
	
	public void rejectQuestion(int questionPostNo) throws Exception;
	
	public int getAskTotalCount(String userId, String questionStatus) throws Exception;
	
	public void addNoti(Notification notification) throws Exception;
	
	public List<Notification> getNotiList(String userId, Search search) throws Exception;
	
	public int getTotalNotiList(String userId) throws Exception;
	
	public void deleteNoti(int notiNo) throws Exception;
	
	public void deleteNotiAll(String userId) throws Exception;
	
	public void addDefaultItem(Item item) throws Exception;
}
