<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
	
<head>
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 /* $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button" ).on("click" , function() {
					self.location = "/user/updateUser?userId=${user.userId}"
				});
		}); */
		
		 $(function(){
				$("button:contains('추가등록')").on('click',function(){
					self.location = "../challenge/addChallengeView.jsp";
				});
			});
		
		$(function(){
			$("button:contains('확인')").on('click',function(){
				self.location = "/challenge/getAdminChallengeList";
			});
			
			$("button:contains('수정')").on('click',function(){
				var challNo = ${challenge.challNo}
				console.log("challNo : " + challNo);
				self.location = "/challenge/updateChallenge/" + challNo;
			});
			
			$("button:contains('삭제')").on('click',function(){
				var challNo = ${challenge.challNo}
				console.log("challNo : " + challNo);
				self.location = "/challenge/deleteChallenge/" + challNo;
			});
		});
		
	</script>
	
</head>

<body>

	
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">도전과제 상세보기</h3>
	       <h5 class="text-muted">등록된  <strong class="text-danger">정보를 </strong>확인해 주세요.</h5>
	    </div>
	
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>번호</strong></div>
			<div class="col-xs-8 col-md-4">${challenge.challNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>제목</strong></div>
			<div class="col-xs-8 col-md-4">${challenge.challTitle}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>카테고리</strong></div>
	  			<c:if test="${challenge.challCategory == '1'}">
					<div class="col-xs-8 col-md-4">Map</div>
				</c:if>
				<c:if test="${challenge.challCategory == '2'}">
					<div class="col-xs-8 col-md-4">Vision</div>

				</c:if>
				<c:if test="${challenge.challCategory == '3'}">
					<div class="col-xs-8 col-md-4">게시판활동</div>

				</c:if>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>challContent</strong></div>
			<div class="col-xs-8 col-md-4">${challenge.challContent}	</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>challReward</strong></div>
			<div class="col-xs-8 col-md-4">${challenge.challReward}	</div>
		</div>
		
		<hr/>
		
		
		<hr/>
		
		
		<div class="row">
	  		<div class="col-md-20 text-center ">
	  			<!-- 작성자 상관없이 role이 admin일때만 보이게 -->
	  			<button type="button" class="btn btn-primary">추가등록&nbsp;&nbsp;	  		
				<button type="button" class="btn btn-primary">확인</div>
	  			<button type="button" class="btn btn-primary">수정</div>
	  			<button type="button" class="btn btn-primary">삭제</div>
		</div>
		
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>