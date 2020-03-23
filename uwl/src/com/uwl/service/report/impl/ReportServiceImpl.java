package com.uwl.service.report.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.uwl.common.Search;
import com.uwl.service.domain.Report;
import com.uwl.service.report.ReportDAO;
import com.uwl.service.report.ReportService;

@Service("reportServiceImpl")
public class ReportServiceImpl implements ReportService{
	
	
	@Autowired
	@Qualifier("reportDAOImpl")
	private ReportDAO reportDAO;
	public void setReportDAO(ReportDAO reportDAO) {
		this.reportDAO = reportDAO;
	}
	
	@Override
	public Report getReport(int reportNo) throws Exception {
		return reportDAO.getReport(reportNo);
	}
	
	@Override
	public List<Report> getReportById(String userId) throws Exception {
		return reportDAO.getReportById(userId);
	}

	@Override
	public void addPostReport(Report report) throws Exception {
		reportDAO.addPostReport(report);
	}
	
	
	@Override
	public void addCommentReport(Report report) throws Exception {
		reportDAO.addCommentReport(report);
	}

	@Override
	public void updateReport(Report report) throws Exception {	//신고처리
		reportDAO.updateReport(report);
	}

	@Override
	public Map<String, Object> getReportList(Search search) throws Exception {
		List<Report> list = reportDAO.getReportList(search);
		int totalCount = reportDAO.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}



	
}
