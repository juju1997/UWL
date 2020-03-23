package com.uwl.service.social.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.uwl.common.Search;
import com.uwl.service.community.CommunityDAO;
import com.uwl.service.domain.Ask;
import com.uwl.service.domain.Item;
import com.uwl.service.domain.Notification;
import com.uwl.service.domain.Post;
import com.uwl.service.social.SocialDAO;
import com.uwl.service.social.SocialService;

@Service("socialServiceImpl")
public class SocialServiceImpl implements SocialService {

	@Autowired
	@Qualifier("socialDAOImpl")
	private SocialDAO socialDAO;
	
	@Autowired
	private CommunityDAO communityDAO;

	public void setSocialDAO(SocialDAO socialDAO) {
		this.socialDAO = socialDAO;
	}

	@Override
	public void addTimeline(Post post) throws Exception {
		socialDAO.addTimeline(post);
	}

	@Override
	public Post getTimeline(int postNo) throws Exception {
		return socialDAO.getTimeline(postNo);
	}

	// searchCondition = 0 : 공개한 게시글만 출력 1 : 나만 보기한 게시글 까지 출력
	@Override
	public Map<String, Object> getTimelineList(String userId, Search search) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		//TL 게시글 불러오기
		int totalCount = socialDAO.getTimelineTotalCount(userId, search);
		List<Post> list = socialDAO.getTimelineList(userId, search);
		map.put("totalCount", totalCount);
		map.put("list", list);
		
		//TL 댓글 불러오기
		search.setSearchCondition("1");
		
		
		
		
		
		return map;
	}

	@Override
	public void updateTimeline(Post post) throws Exception {
		socialDAO.updateTimeline(post);
	}

	@Override
	public void deleteTimeline(int postNo) throws Exception {
		socialDAO.deleteTimeline(postNo);
	}

	@Override
	public void addQuestion(Ask ask) throws Exception {
		socialDAO.addQuestion(ask);
	}

	@Override
	public void replyQuestion(Ask ask) throws Exception {
		socialDAO.replyQuestion(ask);
		socialDAO.updateQuestionStatus(ask.getQuestionPostNo());
	}

	@Override
	public Map<String, Object> getAskList(String userId, Search search, String questionStatus) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int totalCount = socialDAO.getAskTotalCount(userId, questionStatus);
		List<Ask> list = socialDAO.getAskList(userId, search);
		map.put("list", list);
		map.put("totalCount", totalCount);

		return map;
	}

	@Override
	public Map<String, Object> getAskQuestionList(String userId, Search search, String questionStatus)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int totalCount = socialDAO.getAskTotalCount(userId, questionStatus);
		List<Ask> list = socialDAO.getAskQuestionList(userId, search);
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public void rejectQuestion(int questionPostNo) throws Exception {
		socialDAO.rejectQuestion(questionPostNo);
	}
	
	///////////////////// NOTIFICATION /////////////////////////
	
	@Override
	public void addNoti(Notification notification) throws Exception {
		socialDAO.addNoti(notification);
	}

	@Override
	public Map<String,Object> getNotiList(String userId, Search search) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", socialDAO.getNotiList(userId, search));
		map.put("totalCount", socialDAO.getTotalNotiList(userId));
		
		return map;
	}

	@Override
	public void deleteNoti(int notiNo) throws Exception {
		socialDAO.deleteNoti(notiNo);
	}
	@Override
	public void deleteNotiAll(String userId) throws Exception {
		socialDAO.deleteNotiAll(userId);
	}
	
	@Override
	public void addDefaultItem(Item item) throws Exception {
		socialDAO.addDefaultItem(item);
	}

}
