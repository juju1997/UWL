<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>어울림</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!--  jQuery CDN -->	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- bootstrap 4.4 CDN -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" >	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<!-- jQuery Redirect CDN     https://github.com/mgalante/jquery.redirect  -->
	<script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>

	<script type="text/javascript">
		
	$(function() {
		var sessionId = $("input#sessionId").val();
		console.log("sessionId", sessionId);		
		$("button:contains('수락')").on("click", function() {
			
			var userId = $(this).next().next().val();
			console.log("userId", userId);
			
			$.ajax({
				url : "/friend/rest/acceptFriend",
				method : "POST",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					firstUserId : sessionId,
					secondUserId : userId
				}),
				success : function() {
					var html = "<button type='button' class='btn btn-success'>친구</button>";
					$(html).appendTo("#"+userId+"");
					$("."+userId+"").remove();
					
				}
			})
		})
		
		$("button:contains('거절')").on("click", function() {
			
			var userId = $(this).next().val();
			console.log("userId", userId);
			
			$.ajax({
				url : "/friend/rest/deleteFriend",
				method : "POST",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					firstUserId : "user01",
					secondUserId : userId
				}),
				success : function() {	
						var html = "<button type='button' class='btn btn-secondary'>거절됨</button>";
						$(html).appendTo("#"+userId+"");
						$("."+userId+"").remove();
				}
			})
		})
		
		$("span#userId").on("click", function() {
			var userId = $(this).html();
			self.location = "/user/getProfile/"+userId;
		})
		
		$("img#profileName").on("click", function() {
			var userId = $(this).next().html();
			self.location = "/user/getProfile/"+userId;
		})		
	})
	
	</script>
	
	<style type="text/css">
	
	body {
		margin-top: 100px;
	}
	
	</style>
	
</head>
<body>
<jsp:include page="/friend/friendToolbar.jsp"></jsp:include>
	<div class="container">
	
		
		<div class="row">
		<div class="col-md-2">
		
		</div>
		<div class="col-md-8">
		<div class="page-header text-info">
			<h3>친구신청 목록</h3>
		</div>
			<input type="hidden" name="sessionId" id="sessionId" value="${user.userId}">
			<c:forEach var="u" items="${list}">
			<div id="${u.userId}">
				<img src="../../images/${u.profileName}" id="profileName"/>&nbsp; 
				<span id="userId">${u.userId}</span> &nbsp; 
				<span id="name">${u.name}</span> &nbsp; 
				<span>${u.schoolName}</span> &nbsp;
				 <button type="button" class="btn btn-primary ${u.userId}" id="acceptButton">수락</button>
				 <button type="button" class="btn btn-danger ${u.userId}" id="deleteButton">거절</button>
				 <input type="hidden" value="${u.userId}"/>
			</div>
			</c:forEach>
			<c:if test="${empty list}">
			표시할 요청이 없습니다.
			</c:if>
		</div>
		<div class="col-md-2">
		
		</div>
		</div>
	</div>
	
</body>
</html>