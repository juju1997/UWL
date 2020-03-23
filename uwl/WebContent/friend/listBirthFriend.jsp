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
		var userId = $(this).next().val();
		console.log("userId", userId);
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
		
		<div class="page-header text-info">
			<h3>친구목록</h3>	
		</div>
		<div class="row">
			<input type="hidden" name="sessionId" id="sessionId" value="${user.userId}">
			<c:forEach var="u" items="${list}">
		<div class="col-sm-6">
			<div id="${u.userId}">
				<img src="../../images/${u.profileName}"/>
				 &nbsp; ${u.userId} &nbsp; ${u.name} &nbsp; ${u.schoolName} &nbsp;
				 <input type="hidden" value="${u.userId}"/>
			</div>
		</div>
			</c:forEach>
			<c:if test="${empty list}">
			생일인 친구가 없습니다.
			</c:if>
		</div>
		
	</div>
	
</body>
</html>