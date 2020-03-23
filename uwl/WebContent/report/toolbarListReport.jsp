<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/images/favicon1.ico" type="image/x-icon">
    <link rel="icon" href="/images/favicon1.ico" type="image/x-icon">
    <title>어울림</title>
    <style type="text/css">
    	
    </style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://kit.fontawesome.com/4b823cf630.js"
	crossorigin="anonymous"></script>
<title>Insert title here</title>

<script type="text/javascript">

	var myScroll = null;
	
	$(function() {
		
	    myScroll = new IScroll('#wrapper', {
	        mouseWheel: true,
	        scrollbars: true
	    });
	    
	    setTimeout(function() {
			myScroll.refresh();
		}, 0);
	    $('#master').find('i:nth-child(3)').removeClass('fa-caret-down').addClass('fa-caret-up');
	});

	$(document).ready(function(){
		$('#searchReportButton').on("click",function(){
			$('form.form-signin').attr("method","POST").attr("action", "/report/listReport").submit();
		});
		
		 $("tr").on("click",function(){     ////////셀렉터 바꿔서 누른 신고게시글 가져오기....바꿔야댐 < 2020 02 21 >
			var reportNo = $(this).find(".reportNo").val();  
			self.location = "/report/getReport?reportNo="+reportNo; 
		}); 
	});
	
	
	//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form.nav").attr("method","POST").attr("action","/report/listReport").submit();
	}
	
	
	//============= "검색"  Event  처리 =============	
	 $(function() {
		 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 
		 $("input[name=searchKeyword]").focus();
		 	
			$("input[name=searchKeyword]").keydown(function(key){
		    	if(key.keyCode == 13){
	    			fncGetList(1);
		    	}
		    } );
		 $( ".btn-default:contains('검색')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
				fncGetList(1);
			});
		 
		 var tdNum = $('table th td').length;
		 
		 $('table th td:nth-child(n + 2)').css({
			 'width' : 'calc(95% / ' + (tdNum - 1) + ')'
		 });
		 
	 });
	
</script>

<style>


        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        a:hover {
            text-decoration: none;
            color: inherit;
        }

        body {
            color: #333;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;

        }

        div.layoutWrap {

            width: 100%;
            min-height: 200vh;
            padding: 0 20%;
            position: relative;
        }

        div.leftToolbar {
            width: 20%;
            height: 100vh;

            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            background: #fff;
            border-right: 1px solid #eee;
        }

        div.rightToolbar {
            width: 20%;
            height: 100vh;

            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            background: #fff;
            border-left: 1px solid #eee;
        }
        
        #goMaster {
            transition: max-height 1s;
            max-height: 500px;
            padding-top: 10px;
        }
        #goMaster ul li:nth-child(2) {
        	color: #EBAD7A;
        }
        
        .fa-crown {
            color: #ffc811;
        }
    </style>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: inherit;

        }

        a:hover,
        a:focus {
            text-decoration: none;
            color: inherit;
        }

        body {
            color: #333;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;

        }

        div.layoutWrap2 {
            width: 1280px;
            height: 100vh;

            margin: 0 auto;
            overflow: hidden;
        }

        div.leftToolbar2 {

            width: 240px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-right: 1px solid #eee;
            padding: 15px 0 0 15px;
        }

        div.work2 {

            width: 770px;
            height: 100vh;
            float: left;
            
            position: relative;
			
        }

        div.rightToolbar2 {

            width: 270px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-left: 1px solid #eee;
            padding: 15px 15px 0 15px;
        }
        
        div.mainHeader {

            line-height: 55px;
            font-weight: bold;
            padding-left: 15px;
            padding-right: 15px;
            font-size: 20px;
            width: 100%;
            overflow: hidden;
            border-bottom: 1px solid #ebebeb;
            background-color: #fff;
        }

        div.mainHeader div.left2 {
            width: 50%;
            float: left;
        }

        div.mainHeader div.right2 {
            text-align: right;
            width: 50%;
            float: right;
        }

        div.mainHeader div.right2 i {
            vertical-align: baseline;
        }
        
        table.table td {
        	border-top: none;
        	border-bottom: 1px solid #eee;
        }
    </style>


</head>
<body>
<div class="layoutWrap2">
        <div class="leftToolbar2">
            <jsp:include page="/layout/left.jsp" />
        </div>
        <div class="work2" id="wrapper">
        <ul>
        <div class="mainHeader">
                    <div class="left2">
                        신고목록 확인
                    </div>
                    <div class="right2">
                        <a href="#"><i class="far fa-star"></i></a>
                    </div>
                </div>
            <form class="form-signin" style="margin-top:20px;">
		<div>
			<div class="row">
				<div class="col-md-12">

					<div class="panel panel-default">

						<div class="panel panel-primary">

							
							<div class="text-center">
								
								<h4 style="margin-bottom:10px">
									<label for="Choose Report" style="color: #E74C3C">Choose Report</label>
								</h4>
									<c:if test="${search.searchCondition eq 1 }">
										<input type="radio" name="searchCondition" value="1" checked="checked"/> 아직 처리가 안됐어요!
										<input type="radio" name="searchCondition" value="2" style="margin-left:10px;"/> 처리완료 됐어요!
									</c:if>
									<c:if test="${search.searchCondition eq 2 }">
										<input type="radio" name="searchCondition" value="1"/> 아직 처리가 안됐어요!
										<input type="radio" name="searchCondition" value="2" checked="checked" style="margin-left:10px;"/> 처리완료 됐어요!
									</c:if>									
										 &emsp;
									<br>
									<br>
								<button type="button" class="btn btn-danger btn-lg btn3d" style="padding: 5px 30px" id="searchReportButton">
									<i class="fas fa-search"></i>
								</button>
							</div>
							<br />
							<div class="panel-body">

								<table class="table table-striped table-condensed">
								
									<thead>
										<tr>
											<th class="text-center" width="5%">#</th>
											<th class="text-center">신고한 회원</th>
											<th class="text-center">신고 당한회원</th>
											<th class="text-center">신고 카테고리</th>
											<th class="text-center">신고날짜</th>
											<c:if test="${search.searchCondition eq 2 }">
											<th class="text-center">정지 날짜</th>
											</c:if>
											<th class="text-center">분류</th>
										</tr>
									</thead>
									<tbody>


										<c:set var="i" value="0" />
										<c:forEach var="report" items="${list }">
											<c:set var="i" value="${i+1 }" />
											<tr style="cursor: pointer;">
												<input type="hidden" class="reportNo" value="${report.reportNo }">
												<td class="text-center">${i }</td>
												<td class="text-center">${report.userId01 }</td>
												<td class="text-center">${report.userId02 }</td>
												<td class="text-center">
													<c:if
														test="${report.reportCategoryNo == '1' }">
														<span>부적적한 게시글</span>
													</c:if> 
													<c:if test="${report.reportCategoryNo == '2' }">
														<span>음란성 게시글</span>
													</c:if> 
													<c:if test="${report.reportCategoryNo == '3' }">
														<span>명예훼손 / 저작권 침해</span>
													</c:if> 
													<c:if test="${report.reportCategoryNo == '4' }">
														<span>기타</span>
													</c:if>
												</td>
												<td class="text-center">${report.reportDate }</td>
												<c:if test="${search.searchCondition eq 2 }">
													<td class="text-center">${report.stopDate }</td>
												</c:if>
												<td class="text-center">
													<c:if test="${report.reportWhat == '1' }">
														게시글
													</c:if>
													<c:if test="${report.reportWhat == '2' }">
														댓글
													</c:if>
												</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
								<div class="text-center">
									<h4 style="margin-bottom:0;">
										<label style="color: #E74C3C" for="Total">Total : </label> ${resultPage.totalCount }건
									</h4>
								</div>
							</div>
						</div>
					</div>
				</div>	  
			</div>
		</div>
	</form>
	
	<form class="nav">
    		<div class="navnav" style="margin:0 auto">
				<!-- PageNavigation Start... -->
					<jsp:include page="../common/pageNavigator_new.jsp"/>
				<!-- PageNavigation End... -->
				  
				<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
			</div>
	</form>
	</ul>
	
	</div>
	 <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
    
    
    

</body>
</html>