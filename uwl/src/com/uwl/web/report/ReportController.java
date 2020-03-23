package com.uwl.web.report;

import java.util.Map;

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

import com.uwl.common.Page;
import com.uwl.common.Search;
import com.uwl.service.community.CommunityService;
import com.uwl.service.domain.Commentt;
import com.uwl.service.domain.Post;
import com.uwl.service.domain.Report;
import com.uwl.service.domain.User;
import com.uwl.service.post.PostService;
import com.uwl.service.report.ReportService;

@Controller
@RequestMapping("/report/*")
public class ReportController {
	
	@Autowired
	@Qualifier("reportServiceImpl")
	private ReportService reportService;
	
	@Autowired
	@Qualifier("postServiceImpl")
	private PostService postService;
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	public ReportController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="getReport", method=RequestMethod.GET)	//-------------------------테스트 완료
	public String getReport(@RequestParam("reportNo") int reportNo, Model model) throws Exception{
		System.out.println("getReport.GET");
		Report report = reportService.getReport(reportNo);
		//게시글 신고라면?
		if(report.getRefCommentNo() == 0) {	//코멘트 넘버가 비었다면? 즉 게시글 신고
			Post post = postService.getBoard(report.getRefPostNo());
			model.addAttribute("post", post);
		}else {
			Commentt comment = communityService.getCommentByCommentNo(report.getRefCommentNo());
			model.addAttribute("comment", comment);
		}
		model.addAttribute("report", report);
		return "forward:/report/toolbarGetReport.jsp";
	}
	
	@RequestMapping(value="addReport", method=RequestMethod.POST)	//게시글 신고
	public String addReport(@ModelAttribute("report") Report report, Model model, HttpSession session) throws Exception{		//----------------테스트 완료
		System.out.println("addReport.POST");
		User user = (User)session.getAttribute("user");
		if(user == null) {
			System.out.println("로그인 해주세요");
		}else {
			report.setUserId01(user.getUserId());		//////----------Session 처리 할것임
			report.setReportWhat("1");
			reportService.addPostReport(report);
		}
		return "redirect:/post/getBoard?postNo="+report.getRefPostNo();
	}
	
	@RequestMapping(value="updateReport", method=RequestMethod.POST)	//신고 처리임	------------------테스트 완료
	public String updateReport(@ModelAttribute("report") Report report) throws Exception{
		System.out.println("updateReport.POST");
		if(report.getPlusStopDate() != 0) {	//정지날짜가 있으면 포스트를 삭제시킨다
			Report post = reportService.getReport(report.getReportNo());
			postService.deleteBoard(post.getRefPostNo());
		}else {	//그게 아닐시 정지날짜는 0이며 처리 날짜와 status를 업데이트 해준다.
			report.setPlusStopDate(0);
		}
		reportService.updateReport(report);
		return "forward:/report/listReport";
	}
	
	@RequestMapping(value="listReport")	//---------------------------테스트 완료
	public String getReportList(@ModelAttribute("search") Search search, Model model) throws Exception{
		System.out.println("getReportList GET or POST");
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		if(search.getSearchCondition() == null) {	//searchCondition은 신고처리 유무 없다면 디폴트 신고처리안됨목록
			search.setSearchCondition("1");
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = reportService.getReportList(search);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		return "forward:/report/toolbarListReport.jsp";
	}
}
