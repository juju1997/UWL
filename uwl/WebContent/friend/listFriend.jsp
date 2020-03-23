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
	<!-- Modal Alert https://github.com/PureOpenSource/pureAlert  -->
	<script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
	<script type="text/javascript">
		
	$(function() {
		var sessionId = $("input#sessionId").val();
		console.log("sessionId", sessionId);
		
		$("button:contains('친구끊기')").on("click", function() {
			
			var userId = $(this).next().val();
			console.log("userId", userId);
			
			var pureAlert = $.pureAlert.confirm({
				title : "알림",
				content : "친구를 끊으시겠습니까?",
				okBtn : "삭제",
				cancelBtn : "취소",
				autoShow : true,
				closeButton : false
			});
			pureAlert.on('ok.pure-alert', function(e) {
				
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
							var html = "<button type='button' class='btn btn-secondary'>삭제됨</button>";
							$(html).appendTo("#"+userId+"");
							$("."+userId+"").remove();
					}
				})
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
	
	
	
//	스크롤 페이징
var page = 1;

 $(function() {
		$(window).data('ajaxready', true).scroll(function() {
			var maxHeight = $(document).height();
			var currentScroll = $(window).scrollTop() + $(window).height();
			var searchCondition = $("select[name='searchCondition']").val();
			var searchKeyword = $("input[name='searchKeyword']").val();
			var listing = $("input[name='listing']").val();
			
			if($(window).data('ajaxready') == false) return;
			if (maxHeight <= currentScroll) {
			if (page <= ${map.resultPage.maxPage}) {
				$(window).data('ajaxready', false);
				page++;
				console.log('page : ' + page);
					
				$.ajax({
					url : "/friend/rest/getFriendList",
					method : "POST",
					dataType : "json",
					data : JSON.stringify({
						currentPage : page
					}),
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success: function(data) {
						for (var i = 0; i < data.list.length; i++) {
							var html = "<div class='col-sm-6'>"
									+"<div class='friendListDiv' id='"+data.list[i].userId+"'>"
									+"<img src='../../images/"+data.list[i].profileName+"' id='profileName'/>"
							 		+"&nbsp; <span class='text-monospace text-primary font-weight-bold spanUserId' id='userId'>"+data.list[i].userId+"</span> &nbsp; <span class='text-monospace text-primary font-weight-bold spanName' id='name'>"+data.list[i].name+"</span> &nbsp; <span class='text-monospace text-muted spanSchoolName'>"+data.list[i].schoolName+"</span> &nbsp;"
							 		+"<button type='button' class='btn btn-danger "+data.list[i].userId+"' id='deleteButton'>친구끊기</button>"
							 		+"<input type='hidden' value='"+data.list[i].userId+"'/></div></div>";
							 		
							$(html).appendTo(".addTargetDiv");
						}
						$(window).data('ajaxready', true);
					}
				});
			}
			}
		})
	})
	
	</script>
	<style type="text/css">
	
	body {
		margin-top: 100px;
	}
	
	.friendListDiv {
		margin : 10px -10px;
		border: 1px solid gray;
	}
	
	</style>
</head>
<body>
<jsp:include page="/friend/friendToolbar.jsp"></jsp:include>
	<div class="container">
		
		<div class="page-header text-info">
			<h3>친구목록</h3>	
		</div>
		<div class="row addTargetDiv">
			<input type="hidden" name="sessionId" id="sessionId" value="${user.userId}">
			<c:forEach var="u" items="${map.list}">
		<div class="col-sm-6">
			<div class='friendListDiv' id="${u.userId}">
				<img src="../../images/${u.profileName}" id="profileName"/>
				 &nbsp; <span class="text-monospace text-primary font-weight-bold spanUserId">${u.userId}</span>
				 <span class="text-monospace text-primary font-weight-bold spanName" id="name">${u.name}</span> &nbsp;
				 <span class="text-monospace text-muted spanSchoolName">${u.schoolName}</span> &nbsp;
				 <button type="button" class="btn btn-danger ${u.userId}" id="deleteButton">친구끊기</button>
				 <input type="hidden" value="${u.userId}"/>
			</div>
		</div>
			</c:forEach>
			<c:if test="${empty map.list}">
			표시할 친구가 없습니다.
			</c:if>
		</div>
		
	</div>
	
</body>
</html>