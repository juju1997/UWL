package com.uwl.web.report;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.uwl.service.domain.Report;
import com.uwl.service.domain.User;
import com.uwl.service.report.ReportService;

@RestController
@RequestMapping("/report/*")
public class ReportRestController {

	
	@Autowired
	@Qualifier("reportServiceImpl")
	private ReportService reportService;
	
	public ReportRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="rest/addReportComment", method=RequestMethod.POST)
	public void addReportComment(@RequestBody Report report, HttpSession session) throws Exception{
		System.out.println("rest/addReportComment");
		User user = (User)session.getAttribute("user");
		report.setUserId01(user.getUserId());	//신고자 session처리
		report.setReportWhat("2");	//댓글 신고
		reportService.addCommentReport(report);
	}
}
