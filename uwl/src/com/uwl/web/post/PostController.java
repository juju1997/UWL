package com.uwl.web.post;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.community.CommunityService;
import com.uwl.service.domain.Post;
import com.uwl.service.domain.User;
import com.uwl.service.post.PostService;

@Controller
@RequestMapping("/post/*")
public class PostController {
	
	@Autowired
	@Qualifier("postServiceImpl")
	private PostService postService;
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	public PostController() {
		System.out.println(this.getClass());
	}
	
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping(value="getBoard", method=RequestMethod.GET)	//------------------------------------------------테스트 종료
	public String getBoard(@RequestParam("postNo") int postNo, Model model, HttpSession session) throws Exception{
		System.out.println("getBoard.GET");
		User user = (User)session.getAttribute("user");
		Post post = postService.getBoard(postNo);
		
		Search search = new Search();
		search.setCurrentPage(1);	//1인 이유는 무조건 getBoard할때는 현재 댓글은 1페이지라서임 ㅋㅋ
		search.setPageSize(pageSize);
		search.setSearchCondition("1");	//1 = 게시글의 댓글보기, 2 = 자신이 작성한 댓글 보기
		search.setSearchKeyword(postNo+"");
		Map<String, Object> map = communityService.getCommentList(search, postNo, user.getUserId());		//user는 세션처리 할꺼
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("post", post);
		
		
		
		model.addAttribute("post", post);
		return "forward:/post/toolbarGetBoard.jsp";
	}
	
	@RequestMapping(value ="addBoard", method=RequestMethod.GET)	//------------------------------------------------테스트 종료
	public String addBoard(@RequestParam("gatherCategoryNo") String gatherCategoryNo, @RequestParam("postChallenge") String postChallenge,Model model) throws Exception {
		System.out.println("addBoard.GET");
		System.out.println("PostController challenge : " + postChallenge);
		
		model.addAttribute("gatherCategoryNo", gatherCategoryNo);
		
		return "forward:/post/toolbarAddBoard.jsp";
	}
	
	//원본
//	@RequestMapping(value ="addBoard", method=RequestMethod.GET)	//------------------------------------------------테스트 종료
//	public String addBoard(@RequestParam("gatherCategoryNo") String gatherCategoryNo, Model model) throws Exception {
//		System.out.println("addBoard.GET");
//		model.addAttribute("gatherCategoryNo", gatherCategoryNo);
//		return "forward:/post/addBoard.jsp";
//	}
	
	@RequestMapping(value="addBoard", method=RequestMethod.POST)	//------------------------------------------------테스트 종료(테스트 중)
	public String addBoard(@ModelAttribute("post") Post post, HttpSession session,
					HttpServletRequest request, Model model, @RequestParam("file") MultipartFile file,@RequestParam("postChallenge") String postChallenge) throws Exception {
		System.out.println("addBoard.POST");
		User user = (User)session.getAttribute("user");
		post.setUserId(user.getUserId());
		
		Map<String, Object> map = new HashMap <String,Object>();
		
		System.out.println("addBoard POST postChallenge : " + postChallenge);
		
		
//		String path = "C:\\Users\\User\\git\\UWL\\uwl\\WebContent\\resources\\images\\"; //썸네일 저장할 경로
		String path = "C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\uwl\\resources\\images";
		String name="";
//		userid hidden
		if(!file.getOriginalFilename().isEmpty()) {	//썸네일을 올렸을 때
			file.transferTo(new File(path, file.getOriginalFilename()));
			name = file.getOriginalFilename();
			post.setUploadFileName(name);
			postService.addBoard(post);
			//return "redirect:/post/listBoard?gatherCategoryNo="+post.getGatherCategoryNo();
			System.out.println("PostController addBoard()에 도착함 ====== 썸네일 올렸을떄");
			return "redirect:/post/listBoard?gatherCategoryNo="+post.getGatherCategoryNo()+"&postChallenge=" + postChallenge;
			//+"&challenge=" + challenge
		}else { 	//썸네일을 안올렸을 때
			post.setUploadFileName("empty.jpg");
			postService.addBoard(post);
			System.out.println("PostController addBoard()에 도착함 ====== 썸네일 안 올렸을떄");
			return "redirect:/post/listBoard?gatherCategoryNo="+post.getGatherCategoryNo()+"&postChallenge=" + postChallenge;
		}
	}
	
	//원본
//	@RequestMapping(value="addBoard", method=RequestMethod.POST)	//------------------------------------------------테스트 종료(테스트 중)
//	public String addBoard(@ModelAttribute("post") Post post, HttpSession session,
//			HttpServletRequest request, Model model, @RequestParam("file") MultipartFile file) throws Exception {
//		System.out.println("addBoard.POST");
//		User user = (User)session.getAttribute("user");
//		post.setUserId(user.getUserId());
//		String path = "C:\\Users\\User\\git\\UWL\\uwl\\WebContent\\resources\\images\\"; //썸네일 저장할 경로
//		String name="";
////		userid hidden
//		if(!file.getOriginalFilename().isEmpty()) {	//썸네일을 올렸을 때
//			file.transferTo(new File(path, file.getOriginalFilename()));
//			name = file.getOriginalFilename();
//			post.setUploadFileName(name);
//			postService.addBoard(post);
//			//return "redirect:/post/listBoard?gatherCategoryNo="+post.getGatherCategoryNo();
//			return "redirect:/post/listBoard?gatherCategoryNo="+post.getGatherCategoryNo()+"&postChallenge=" + postChallenge;
//			//+"&challenge=" + challenge
//		}else { 	//썸네일을 안올렸을 때
//			post.setUploadFileName("empty.jpg");
//			postService.addBoard(post);
//			return "redirect:/post/listBoard?gatherCategoryNo="+post.getGatherCategoryNo();
//		}
//	}
	
	@RequestMapping(value="updateBoard", method=RequestMethod.GET)	//------------------------------------------------테스트 종료
	public String updateBoard(@RequestParam("postNo") int postNo, Model model) throws Exception {
		System.out.println("updateBoard.GET");
		Post post = postService.getBoard(postNo);
		model.addAttribute("post", post);
		return "forward:/post/toolbarUpdateBoard.jsp";
	}
	
	@RequestMapping(value="updateBoard", method=RequestMethod.POST)	//------------------------------------------------테스트 종료
	public String updateBoard(@ModelAttribute("post") Post post, @RequestParam("file") MultipartFile file
								, Model model, HttpSession session) throws Exception {
		System.out.println("updateBoard.POST");
		//String path = "C:\\Users\\User\\git\\UWL\\uwl\\WebContent\\resources\\images\\"; //썸네일 저장할 경로
		String path = "C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\uwl\\resources\\images";
		String name="";
		User user = (User)session.getAttribute("user");
		Search search = new Search();
		search.setCurrentPage(1);	//1인 이유는 무조건 getBoard할때는 현재 댓글은 1페이지라서임 ㅋㅋ
		search.setPageSize(pageSize);
		search.setSearchCondition("1");	//1 = 게시글의 댓글보기, 2 = 자신이 작성한 댓글 보기
		search.setSearchKeyword(post.getPostNo()+"");
		Map<String, Object> map = communityService.getCommentList(search, post.getPostNo(), user.getUserId());		//user는 세션처리 할꺼
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		if(!file.getOriginalFilename().isEmpty()) {	//썸네일을 올렸을 때
			file.transferTo(new File(path, file.getOriginalFilename()));
			name = file.getOriginalFilename();
			post.setUploadFileName(name);
			postService.updateBoard(post);
			post = postService.getBoard(post.getPostNo());
			model.addAttribute("post", post);
			return "forward:/post/toolbarGetBoard.jsp";
		}else { 	//썸네일을 안올렸을 때
			post.setUploadFileName("empty.jpg");
			postService.updateBoard(post);
			post = postService.getBoard(post.getPostNo());
			model.addAttribute("post", post);
			return "forward:/post/toolbarGetBoard.jsp";
			}
		}

	@RequestMapping(value="deleteBoard", method=RequestMethod.GET) //--------------------------------테스트 종료
	public String deleteBoard(@RequestParam("postNo") int postNo, Post post) throws Exception{
		System.out.println("deleteBoard.GET");
		postService.deleteBoard(postNo);
		return "redirect:/post/listBoard?gatherCategoryNo="+post.getGatherCategoryNo()+"&postChallenge=1";
	}
	//pathVariable 넣어주기
	@RequestMapping(value="listBoard")	//----------------------------테스트 종료
	public String getBoardList(@ModelAttribute("search") Search search, @RequestParam("gatherCategoryNo") String gatherCategoryNo,
								Model model, @RequestParam("postChallenge") String postChallenge) throws Exception{
		System.out.println("getBoardList.POST or GET");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);		//몇개의 게시글을 노출시킬 것?
		
		//System.out.println("=======>>listBoard() Post로 넘어온 search.getPostChallenge의 정보 : " + search.getPostChallenge());
		Map<String, Object> map = postService.getBoardList(search, gatherCategoryNo);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("gatherCategoryNo", gatherCategoryNo);
		model.addAttribute("postChallenge", postChallenge);
		System.out.println("컨트롤러탄다");
		return "forward:/post/toolbarListBoard.jsp";
	}
	
	 
	
	
	
	
	
	@RequestMapping(value="getNotice", method=RequestMethod.GET)	//-----------------------테스트 종료
	public String getNotice(@RequestParam("postNo") int postNo, Model model) throws Exception {
		System.out.println("getNotice.GET");
		Post post = postService.getNotice(postNo);
		Post post2 = postService.getNextOrPrePost(postNo);
		model.addAttribute("post", post);
		model.addAttribute("post2", post2);
		return "forward:/post/toolbarGetNotice.jsp";
	}
	
	@RequestMapping(value="addNotice", method=RequestMethod.GET)	//--------------------테스트 종료
	public String addNotice() throws Exception{
		System.out.println("addNotice.GET");
		return "forward:/post/toolbarAddNotice.jsp";
	}
	
	@RequestMapping(value="addNotice", method=RequestMethod.POST)	//--------------------테스트 종료
	public String addNotice(@ModelAttribute("post") Post post,
							HttpServletRequest request, Model model) throws Exception{
		System.out.println("addNotice.POST");
		post.setPostContent(post.getPostContent().replace("\r\n", "<br>"));
		postService.addNotice(post);
		System.out.println("post?? : " + post);
		return "forward:/post/listNotice";
	}
	
	@RequestMapping(value="updateNotice", method=RequestMethod.GET)	//---------------------테스트 종료
	public String updateNotice(@RequestParam("postNo") int postNo, Model model) throws Exception{
		System.out.println("updateNotice.GET");
		Post post = postService.getNotice(postNo);
		post.setPostContent(post.getPostContent().replace("<br>", "\r\n"));
		Post post2 = postService.getNextOrPrePost(postNo);
		model.addAttribute("post", post);
		model.addAttribute("post2", post2);
		return "forward:/post/toolbarUpdateNotice.jsp";
	}
	
	@RequestMapping(value="updateNotice", method=RequestMethod.POST)	//-----------------------테스트 종료
	public String updateNotice(@ModelAttribute("post") Post post, Post post2, int postNo ,Model model) throws Exception{
		post.setPostContent(post.getPostContent().replace("\r\n", "<br>"));
		postService.updateNotice(post);
		post = postService.getNotice(post.getPostNo());
		post2 = postService.getNextOrPrePost(postNo);
		model.addAttribute("post", post);
		model.addAttribute("post2", post2);
		return "forward:/post/toolbarGetNotice.jsp";
	}
	
	@RequestMapping(value="deleteNotice", method=RequestMethod.GET)		//-------------------------테스트 종료
	public String deleteNotice(@RequestParam("postNo") int postNo) throws Exception{
		System.out.println("deleteNotice.GET");
		postService.deleteBoard(postNo);
		return "forward:/post/listNotice";
	}
	
	@RequestMapping(value="listNotice")			//-------------------테스트 종료
	public String getNoticeList(@ModelAttribute("search") Search search, Model model) throws Exception{
		System.out.println("getNoticeList.POST or GET");
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = postService.getNoticeList(search);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		return "forward:/post/toolbarListNotice.jsp";
	}
	
	
	
}