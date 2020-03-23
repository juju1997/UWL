package com.uwl.web.community;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.community.CommunityService;
import com.uwl.service.domain.Commentt;
import com.uwl.service.domain.Likey;
import com.uwl.service.domain.Post;
import com.uwl.service.domain.User;
import com.uwl.service.fcm.FcmService;
import com.uwl.service.post.PostService;

@RestController
@RequestMapping("/community/*")
public class CommunityRestController {
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	private FcmService fcmService;
	
	@Autowired
	private PostService postService;
	
	public CommunityRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
//------------------------좋아요----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="rest/addPostLike", method=RequestMethod.POST)	//---------------------------테스트 종료
	public boolean addPostLike(@RequestBody Likey likey, HttpSession session) throws Exception{
		System.out.println("rest/addPostLike.POST");
		User user = (User)session.getAttribute("user");
		likey.setUserId(user.getUserId());		//session 처리 해야해
		likey.setLikeWhat("1");
		communityService.addPostLike(likey);
		likey = communityService.getLike(likey);
		if(likey != null) {
			return true;
		}else {
			return false;
		}
	}
	
	@RequestMapping(value="rest/addCommentLike", method=RequestMethod.POST)
	public boolean addCommentLike(@RequestBody Likey likey, HttpSession session) throws Exception{
		System.out.println("rest/addCommentLike.POST");
		User user = (User)session.getAttribute("user");
		likey.setUserId(user.getUserId());	//session 처리할것
		likey.setLikeWhat("2");
		Likey checkLike = communityService.getLike(likey);
		try {
			if(checkLike == null) {
				communityService.addCommentLike(likey);
				return true;
			}else {
				return false;
			}
		}catch(Exception e) {
			return false;
		}
	}
	
	@RequestMapping(value="rest/deleteLike", method=RequestMethod.POST)	//----------------------------테스트 종료
	public boolean deleteLike(@RequestBody Likey likey, HttpSession session) throws Exception{
		System.out.println("rest/deleteLike.GET");
		User user = (User)session.getAttribute("user");
		if(likey.getRefCommentNo() == 0) {
			likey.setLikeWhat("1");
		}else {
			likey.setLikeWhat("2");
		}
		likey.setUserId(user.getUserId());	//session 처리해야해
		likey = communityService.getLike(likey);
		communityService.deleteLike(likey);
		likey = communityService.getLike(likey);	//좀 이상한데...?			
		if(likey != null) {
			return true;
		}else {
			return false;
		}
	}
	
	@RequestMapping(value="rest/getLike", method=RequestMethod.POST)		//------------------------테스트 종료
																			//-------------------게시글 좋아요 판단
	public boolean getLikey(@RequestBody Likey likey, HttpSession session) throws Exception{
		System.out.println("rest/getLike.POST");
		User user = (User)session.getAttribute("user");
		likey.setUserId(user.getUserId()); 		//session처리해야해
		likey.setLikeWhat("1");
		likey = communityService.getLike(likey);
		if(likey != null) {
			return true;
		}else {
			return false;
		}
	}
	
//------------------------좋아요-----------------------------------------------------------------------------------------------------------
	
	
//------------------------댓글-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value="rest/addComment", method=RequestMethod.POST)
	public Commentt addComment(@RequestBody Commentt comment, HttpSession session) throws Exception{
		System.out.println("rest/addComment.POST");
		User user = (User)session.getAttribute("user");
		comment.setUserId(user.getUserId()); //session 처리해야해
		communityService.addComment(comment);
		
		
		//get해서 다시 붙여주는 용도
		comment = communityService.getComment(comment.getUserId(), comment.getPostNo());
		System.out.println(comment);
		return comment;
	}
	
	@RequestMapping(value="rest/listComment")		//페이지 넘기기 용?
	public Map<String, Object> getCommentList(@RequestBody HashMap<String, Object> jsonMap) throws Exception{
		System.out.println("rest/getCommentList.POST or GET");
		int currentPage = (Integer)jsonMap.get("currentPage");
		int postNo = (Integer)jsonMap.get("postNo");
		String userId = "";
		
		Search search = new Search();
		search.setCurrentPage(currentPage);
		search.setPageSize(pageSize);
		search.setSearchCondition("1");
		search.setSearchKeyword(postNo+"");
		
		Map<String, Object> map = communityService.getCommentList(search, postNo, userId);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		map.put("list", map.get("list"));
		map.put("resultPage", resultPage);
		map.put("search", search);
		return map;
	}
	
	@RequestMapping(value="rest/deleteComment", method=RequestMethod.POST)
	public void deleteComment(@RequestBody Commentt comment) throws Exception{
		//postNo랑 commentNo 받아야 함
		System.out.println("rest/deleteComment.POST");
		communityService.deleteComment(comment);
	}
	
	@RequestMapping(value="rest/updateComment", method=RequestMethod.POST)
	public Commentt updateComment(@RequestBody Commentt comment, HttpSession session) throws Exception{
		System.out.println(comment);
		User user = (User)session.getAttribute("user");
		communityService.updateComment(comment);
		
		communityService.getComment(user.getUserId(), comment.getPostNo());
		return comment;
	}
//------------------------댓글-----------------------------------------------------------------------------------------------------------
	
}
