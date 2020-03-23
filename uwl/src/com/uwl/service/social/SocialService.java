package com.uwl.service.social;

import java.util.List;
import java.util.Map;

import com.uwl.common.Search;
import com.uwl.service.domain.Ask;
import com.uwl.service.domain.Item;
import com.uwl.service.domain.Notification;
import com.uwl.service.domain.Post;

public interface SocialService {

	public void addTimeline(Post post) throws Exception;
	
	public Post getTimeline(int postNo) throws Exception;
	
	public Map<String,Object> getTimelineList(String userId, Search search) throws Exception;
	
	public void updateTimeline(Post post) throws Exception;
	
	public void deleteTimeline(int postNo) throws Exception;
	
	public void addQuestion(Ask ask) throws Exception;
	
	public void replyQuestion(Ask ask) throws Exception;
	
	public Map<String, Object> getAskList(String userId, Search search, String questionStatus) throws Exception;
	
	public Map<String, Object> getAskQuestionList(String userId, Search search, String questionStatus) throws Exception;
	
	public void rejectQuestion(int questionPostNo) throws Exception;
	
	public void addNoti(Notification notification) throws Exception;
	
	public Map<String, Object> getNotiList(String userId, Search search) throws Exception;
	
	public void deleteNoti(int notiNo) throws Exception;
	
	public void deleteNotiAll(String userId) throws Exception;
	
	public void addDefaultItem(Item item) throws Exception;
}
