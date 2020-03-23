<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
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
	 <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/fb8ae6e812.js" crossorigin="anonymous"></script>
<title>Insert title here</title>

<script type="text/javascript">
	
	//document가 열린다면
	$(document).ready(function(){

		$(':button').on("click",function(){
			
			//self.location = "/schoolRank/getSchoolRankingList"
			$('form').attr("method","POST").attr("action", "/schoolRank/listSchoolRanking").submit();
				
		});
		
	});
	
	
</script>

<style type="text/css">
	.fa-running {
            color: #28aa10;
        }
</style>


</head>
<body>

	<form class="form-signin" name="testForm">
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<div class="panel panel-default">

						<div class="panel panel-primary">

							<br />
							<br />
							<div class="text-center">
								<h3 style="color: #2C3E50"><i class="fas fa-school"></i> Ranking List</h3>
								
										<!-- <input type="radio" name="searchCondition" value="1" checked="checked"/>학교랭킹
										<input type="radio" name="searchCondition" value="2"/>개인랭킹
										 &emsp; -->
										 
										<c:if test="${search.searchCondition eq 1 }">
											<input type="radio" name="searchCondition" value="1" checked="checked"/>학교랭킹
											<input type="radio" name="searchCondition" value="2"/>개인랭킹
										</c:if>
										<c:if test="${search.searchCondition eq 2 }">
											<input type="radio" name="searchCondition" value="1"/>학교랭킹
											<input type="radio" name="searchCondition" value="2" checked="checked"/>개인랭킹
										</c:if>		
										 &emsp;
									<br>
									<br>
								<button type="button" class="btn btn-danger btn-lg btn3d" style="padding: 5px 30px" >
									<i class="fas fa-search"></i>
								</button>
							</div>
							<c:if test="${search.searchCondition eq 1 }">
								<h5 style="text-align: right;">
									<label>
										<i class="fas fa-school"></i> ${mySchool.schoolName} 
										<i class="fas fa-running"></i> 
									<fmt:formatNumber value="${mySchool.recentlyTotalActivityPoint}" pattern="#,###" />점
									
									</label>
								</h5>
							<br />
							<div class="panel-body">

								<table class="table table-striped table-condensed">
									<thead>
										<tr>
											<th class="text-center" width="70px"><i class="fas fa-medal"></i> Rank</th>
											<th class="text-center" width="100px"><i class="fas fa-school"></i> 학교이름</th>
											<th class="text-center" width="150px"><i class="fas fa-map-marker-alt"></i> 주소</th>
											<th class="text-center" width="90px">총 점수</th>
										</tr>
									</thead>
									<tbody>

										<c:if test="${search.searchCondition == 1}">
											<c:set var="i" value="0" />
											<c:forEach var="schoolRank" items="${list}">
												<c:set var="i" value="${i+1 }" />
												<tr>
														
													<td class="text-center" width="70px">
														<c:if test="${schoolRank.ranking == 1}">
															<i class="fas fa-medal" style="color: #ffd700;"></i>
														</c:if>
														<c:if test="${schoolRank.ranking == 2}">
															<i class="fas fa-medal" style="color: #c0c0c0;"></i>
														</c:if>
														<c:if test="${schoolRank.ranking == 3}">
															<i class="fas fa-medal" style="color: #800000;"></i>
														</c:if>
														${schoolRank.ranking}
													</td> 
													<td class="text-center" width="100px"> ${schoolRank.schoolName}</td>
													<td class="text-center" width="150px">${schoolRank.schoolAddress}</td>
													<td class="text-center" width="90px"> <i class="fas fa-running"></i> 
														<fmt:formatNumber value="${schoolRank.totalActivityPoint}" pattern="#,###" /> 점
	
													</td>
												</tr>
											</c:forEach>
										</c:if>
										
									</tbody>
								</table>
								<!-- 이제부터 무한스크롤 구현 -->
							</c:if>	<!-- end of search eq 1 -->
							
							<c:if test="${search.searchCondition eq 2 }">
								<h5 style="text-align: right;">
									<label>
										내 점수 : <i class="fas fa-running"></i> 
									<%-- <fmt:formatNumber value="${reward.recentlyTotalActivityPoint}" pattern="#,###" />점 --%>
									
									</label>
								</h5>
							<br />
							<div class="panel-body">

								<table class="table table-striped table-condensed">
									<thead>
										<tr>
											<th class="text-center" width="70px"><i class="fas fa-medal"></i> Rank</th>
											<th class="text-center" width="100px"><i class="fas fa-school"></i> 유저아이디</th>
											<th class="text-center" width="150px"><i class="fas fa-map-marker-alt"></i> 소속학교</th>
											<th class="text-center" width="90px">총 점수</th>
										</tr>
									</thead>
									<tbody>

										<c:if test="${search.searchCondition == 2}">
											<c:set var="i" value="0" />
											<c:forEach var="schoolRank" items="${individualRank}">
												<c:set var="i" value="${i+1 }" />
												<tr>
														
													<td class="text-center" width="70px">
														<c:if test="${schoolRank.ranking eq '1'}">
															<i class="fas fa-medal" style="color: #ffd700;"></i>
														</c:if>
														<c:if test="${schoolRank.ranking eq '2'}">
															<i class="fas fa-medal" style="color: #c0c0c0;"></i>
														</c:if>
														<c:if test="${schoolRank.ranking eq '3'}">
															<i class="fas fa-medal" style="color: #800000;"></i>
														</c:if>
														${schoolRank.ranking}
													</td> 
													<td class="text-center" width="100px"> ${schoolRank.userId}</td>
													<td class="text-center" width="150px">${schoolRank.schoolName}</td>
													<td class="text-center" width="90px"> <i class="fas fa-running"></i> 
														<fmt:formatNumber value="${schoolRank.recentlyTotalActivityPoint}" pattern="#,###" /> 점
	
													</td>
												</tr>
											</c:forEach>
										</c:if>
										
									</tbody>
								</table>
								<!-- 이제부터 무한스크롤 구현 -->
							</c:if>	<!-- end of search eq 2 -->
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>