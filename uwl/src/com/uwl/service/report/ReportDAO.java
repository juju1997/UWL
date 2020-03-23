package com.uwl.service.report;

import java.util.List;

import com.uwl.common.Search;
import com.uwl.service.domain.Report;

public interface ReportDAO {
	///ReportService

		public Report getReport(int reportNo) throws Exception;
		
		public List<Report> getReportById(String userId) throws Exception;
		
		public void addPostReport(Report report) throws Exception;
		
		public void addCommentReport(Report report) throws Exception;
		
		public void updateReport(Report report) throws Exception; //신고처리
		
		public List<Report> getReportList(Search Search) throws Exception;
		
		
		public int getTotalCount(Search search) throws Exception;
}
