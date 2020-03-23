package com.uwl.service.report.test;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.uwl.common.Search;
import com.uwl.service.domain.Report;
import com.uwl.service.report.ReportService;

/*
 *	FileName :  UserServiceTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data 를 다양하게 Wiring 하자...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																	"classpath:config/context-aspect.xml",
																	"classpath:config/context-mybatis.xml",
																	"classpath:config/context-transaction.xml" })
public class ReportServiceTest {
	
	@Autowired
	@Qualifier("reportServiceImpl")
	private ReportService reportService;
	
//	@Test  
	public void getReport() throws Exception{
		int reportNo = 10002;
		
		System.out.println(reportService.getReport(reportNo));
	}
	
//	@Test
	public void addPostReport() throws Exception{
		Report report = new Report();
		report.setRefPostNo(10000);
		report.setUserId01("user01");
		report.setReportWhat("1");
		report.setReportCategoryNo("1");
		report.setReportContent("이거 순 나쁜 새기에여 ㅋㅋ");
		
		reportService.addPostReport(report);
		
	}
	
//	@Test 댓글 매퍼 만들고 테스트
	public void addCommentReport() throws Exception{
		Report report = new Report();
		report.setRefCommentNo(10000);
		report.setUserId01("user01");
		report.setReportWhat("2");
		report.setReportCategoryNo("1");
		report.setReportContent("이거 순 나쁜 새기에여 ㅋㅋ");
		
		reportService.addCommentReport(report);
	}
	
//	@Test
	public void updateReport() throws Exception{	//이게 신고 처리임 ㅋㅋ
		Report report = new Report();
		report.setReportNo(10002);
		report.setReportStatus("2");
		report.setPlusStopDate(7);
		
		reportService.updateReport(report);
	}
	
//	@Test
	public void getReportList() throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(4);
		
		Report report = new Report();
		report.setReportStatus("2");
		report.setReportWhat("1");
		
		
		System.out.println(reportService.getReportList(search));
	}
}
