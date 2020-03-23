package com.uwl.service.community;

import java.util.Map;

import com.uwl.common.Search;
import com.uwl.service.domain.Commentt;
import com.uwl.service.domain.Likey;
import com.uwl.service.domain.Notification;

public interface CommunityService {
	
	///댓글
	public void addComment(Commentt comment) throws Exception;
	
	public Commentt getComment(String userId, int postNo) throws Exception;	//댓글 작성용
	
	public Commentt getCommentByCommentNo(int commentNo) throws Exception; //진짜 댓글 가져오기
	
	public void updateComment(Commentt comment) throws Exception;
	
	public void deleteComment(Commentt comment) throws Exception;
	
	public Map<String, Object> getCommentList(Search search, int postNo, String userId) throws Exception;
	
	
	
	//좋아요
	public void addPostLike(Likey likey) throws Exception;
	
	public void addCommentLike(Likey likey) throws Exception;
	
	public void deleteLike(Likey likey) throws Exception;
	
	public Map<String, Object> getLikeList(Search search, String userId) throws Exception;
	
	public Likey getLike(Likey likey) throws Exception;
	
	
	//알림
	public void addNotification(Notification notification) throws Exception;
	
}
