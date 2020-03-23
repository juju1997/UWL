package com.uwl.service.post.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.uwl.common.Search;
import com.uwl.service.domain.Post;
import com.uwl.service.post.PostDAO;
import com.uwl.service.post.PostService;

@Service("postServiceImpl")
public class PostServiceImpl implements PostService{
	
	@Autowired
	@Qualifier("postDAOImpl")
	private PostDAO postDAO;
	public void setPostDAO(PostDAO postDAO) {
		this.postDAO = postDAO;
	}
	
	@Override
	public Post getBoard(int postNo) throws Exception {
		return postDAO.getBoard(postNo);
	}

	@Override
	public void addBoard(Post post) throws Exception {
		postDAO.addBoard(post);
	}

	@Override
	public void updateBoard(Post post) throws Exception {
		postDAO.updateBoard(post);
	}

	@Override
	public void deleteBoard(int postNo) throws Exception {
		postDAO.deleteBoard(postNo);
	}

	@Override
	public Map<String, Object> getBoardList(Search search, String gatherCategoryNo) throws Exception {
		List<Post> list = postDAO.getBoardList(search, gatherCategoryNo);
		int totalCount = postDAO.getTotalCount2(gatherCategoryNo);
		
		Map<String, Object> map = new HashMap<String , Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		System.out.println("서비스임쁠탄다");
		return map;
	}

	
	
	
	@Override
	public Post getNotice(int postNo) throws Exception {
		return postDAO.getNotice(postNo);
	}

	@Override
	public void addNotice(Post post) throws Exception {
		postDAO.addNotice(post);
	}	

	@Override
	public void updateNotice(Post post) throws Exception {
		postDAO.updateNotice(post);
	}

	@Override
	public void deleteNotice(int PostNo) throws Exception {
		postDAO.deleteNotice(PostNo);
	}

	@Override
	public Map<String ,Object> getNoticeList(Search search) throws Exception {
		List<Post> list = postDAO.getNoticeList(search);
		int totalCount = postDAO.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}

	@Override // 추가
	public Post getNextOrPrePost(int postNo) throws Exception {
		
		return postDAO.getNextOrPrePost(postNo);
	}

}
