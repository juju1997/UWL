package com.uwl.service.post;

import java.util.List;

import com.uwl.common.Search;
import com.uwl.service.domain.Post;

public interface PostDAO {
	
	///BoardService
		public Post getBoard(int postNo) throws Exception;
		
		public void addBoard(Post post) throws Exception;
		
		public void updateBoard(Post post) throws Exception;
		
		public void deleteBoard(int postNo) throws Exception;	
		
		public List<Post> getBoardList(Search search, String gatherCategoryNo) throws Exception;
		
		
		///NoticeService
		public Post getNotice(int postNo) throws Exception;
		
		public void addNotice(Post post) throws Exception;
		
		public void updateNotice(Post post) throws Exception;
		
		public void deleteNotice(int PostNo) throws Exception;
		
		public List<Post> getNoticeList(Search search) throws Exception;
	
		public Post getNextOrPrePost(int postNo) throws Exception;// 추가
		
		//getTotalCount
		public int getTotalCount(Search search) throws Exception; // 공지사항
	
		public int getTotalCount2(String gatherCategoryNo) throws Exception; // 각각게시판
}
