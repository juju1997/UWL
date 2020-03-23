package com.uwl.service.report;

import java.util.List;
import java.util.Map;

import com.uwl.common.Search;
import com.uwl.service.domain.Report;

public interface ReportService {
	
	///ReportService

	public Report getReport(int reportNo) throws Exception;
	
	public List<Report> getReportById(String userId) throws Exception;
	
	public void addPostReport(Report report) throws Exception;
	
	public void addCommentReport(Report report) throws Exception;
	
	public void updateReport(Report report) throws Exception; //신고처리
	
	public Map<String, Object> getReportList(Search search) throws Exception;
}
