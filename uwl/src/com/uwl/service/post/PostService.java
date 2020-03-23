package com.uwl.service.post;

import java.util.Map;

import com.uwl.common.Search;
import com.uwl.service.domain.Post;

public interface PostService {
	
	///BoardService
	public Post getBoard(int postNo) throws Exception;
	
	public void addBoard(Post post) throws Exception;
	
	public void updateBoard(Post post) throws Exception;
	
	public void deleteBoard(int postNo) throws Exception;	
	
	public Map<String, Object> getBoardList(Search search, String gatherCategoryNo) throws Exception;
	
	
	///NoticeService
	public Post getNotice(int postNo) throws Exception;
	
	public void addNotice(Post post) throws Exception;
	
	public void updateNotice(Post post) throws Exception;
	
	public void deleteNotice(int PostNo) throws Exception;
	
	public Map<String, Object> getNoticeList(Search search) throws Exception;
	
	public Post getNextOrPrePost(int postNo) throws Exception;// 추가
	
}
