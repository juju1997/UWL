package com.uwl.service.domain;

import java.sql.Date;

public class Report {
	//field
	private int reportNo;	//신고번호
	private int refPostNo;	//게시글신고번호
	private int refCommentNo;	//댓글신고번호
	private String reportWhat;	//뭘신고(게시글,댓글)
			//	1 : 게시글
			//	2 : 댓글
	private String userId01;	//신고자회원아이디
	private String userId02;	//신고당한회원아이디
	private String reportStatus;	//신고상태
			//	1 : 신고등록
			//	2 : 신고처리
	private String reportCategoryNo;	//신고 카테고리 번호
			//	1 : 부적절한 게시글
			//  2 : 음란성 게시글
			//  3 : 명예훼손/저작권 침해
			//  4 : 기타
	private Date reportDate;	//신고날짜
	private Date proceedDate;	//처리날짜
	private String reportContent;	//신고 내용
	private int plusStopDate;	//정지날짜 몇일줄래?
	private Date stopDate;	//정지날짜결과
	
	
	public Report() {
		super();
	}
	
	
	//method
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public int getRefPostNo() {
		return refPostNo;
	}
	public void setRefPostNo(int refPostNo) {
		this.refPostNo = refPostNo;
	}
	public int getRefCommentNo() {
		return refCommentNo;
	}
	public void setRefCommentNo(int refCommentNo) {
		this.refCommentNo = refCommentNo;
	}
	public String getReportWhat() {
		return reportWhat;
	}
	public void setReportWhat(String reportWhat) {
		this.reportWhat = reportWhat;
	}
	public String getReportStatus() {
		return reportStatus;
	}
	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}
	public String getReportCategoryNo() {
		return reportCategoryNo;
	}
	public void setReportCategoryNo(String reportCategoryNo) {
		this.reportCategoryNo = reportCategoryNo;
	}
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	public Date getProceedDate() {
		return proceedDate;
	}
	public void setProceedDate(Date proceedDate) {
		this.proceedDate = proceedDate;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public Date getStopDate() {
		return stopDate;
	}
	public void setStopDate(Date stopDate) {
		this.stopDate = stopDate;
	}
	public int getPlusStopDate() {
		return plusStopDate;
	}
	public void setPlusStopDate(int plusStopDate) {
		this.plusStopDate = plusStopDate;
	}
	public String getUserId01() {
		return userId01;
	}
	public void setUserId01(String userId01) {
		this.userId01 = userId01;
	}
	public String getUserId02() {
		return userId02;
	}
	public void setUserId02(String userId02) {
		this.userId02 = userId02;
	}
	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", refPostNo=" + refPostNo + ", refCommentNo=" + refCommentNo
				+ ", reportWhat=" + reportWhat + ", userId01=" + userId01 + ", userId02=" + userId02 + ", reportStatus="
				+ reportStatus + ", reportCategoryNo=" + reportCategoryNo + ", reportDate=" + reportDate
				+ ", proceedDate=" + proceedDate + ", reportContent=" + reportContent + ", plusStopDate=" + plusStopDate
				+ ", stopDate=" + stopDate + "]";
	}

	
}
