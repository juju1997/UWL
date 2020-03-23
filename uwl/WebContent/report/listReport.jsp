<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
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
	$(document).ready(function(){
		$('#searchReportButton').on("click",function(){
			$('form').attr("method","POST").attr("action", "/report/listReport").submit();
		});
		
		$("tr").on("click",function(){
			var reportNo = $(this).find(".reportNo").val();
			self.location = "/report/getReport?reportNo="+reportNo;
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
            width: 1500px;
            height: 100vh;

            margin: 0 auto;
            overflow: hidden;
        }

        div.leftToolbar2 {

            width: 300px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-right: 1px solid #eee;
        }

        div.work2 {

            width: 900px;
            height: 100vh;
            float: left;
            overflow: hidden;
            overflow-y: scroll;

        }

        div.rightToolbar2 {

            width: 300px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-left: 1px solid #eee;
        }
    </style>


</head>
<body>
<div class="layoutWrap2">
        <div class="leftToolbar2">
            <jsp:include page="/layout/left.jsp" />
        </div>
        <div class="work2">
            <form class="form-signin">
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<div class="panel panel-default">

						<div class="panel panel-primary">

							<br />
							<br />
							<div class="text-center">
								<h3 style="color: #2C3E50">신고목록 확인</h3>
								<h4>
									<label for="Choose Report" style="color: #E74C3C">Choose Report</label>
								</h4>
									<c:if test="${search.searchCondition eq 1 }">
										<input type="radio" name="searchCondition" value="1" checked="checked"/>아직 처리가 안됐어요!
										<input type="radio" name="searchCondition" value="2"/>처리완료 됐어요!
									</c:if>
									<c:if test="${search.searchCondition eq 2 }">
										<input type="radio" name="searchCondition" value="1"/>아직 처리가 안됐어요!
										<input type="radio" name="searchCondition" value="2" checked="checked"/>처리완료 됐어요!
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
											<th class="text-center" width="115px">#</th>
											<th class="text-center" width="115px">신고한 회원</th>
											<th class="text-center" width="115px">신고 당한 회원</th>
											<th class="text-center" width="115px">신고 카테고리</th>
											<th class="text-center" width="115px">신고날짜</th>
											<c:if test="${search.searchCondition eq 2 }">
												<th class="text-center" width="115px">정지 날짜</th>
											</c:if>
											<th class="text-center" width="115px">분류</th>
										</tr>
									</thead>
									<tbody>


										<c:set var="i" value="0" />
										<c:forEach var="report" items="${list }">
											<c:set var="i" value="${i+1 }" />
											<tr>
												<input type="hidden" class="reportNo" value="${report.reportNo }">
												<td class="text-center" width="150px">${i }</td>
												<td class="text-center" width="150px">${report.userId01 }</td>
												<td class="text-center" width="150px">${report.userId02 }</td>
												<td class="text-center" width="150px">
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
												<td class="text-center" width="150px">${report.reportDate }</td>
												<c:if test="${search.searchCondition eq 2 }">
													<td class="text-center" width="150px">${report.stopDate }</td>
												</c:if>
												<td class="text-center" width="150px">
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
									<h4>
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
	</div>
	 <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>

</body>
</html>