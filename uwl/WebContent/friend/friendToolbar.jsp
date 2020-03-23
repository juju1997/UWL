<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<script type="text/javascript">
	
		$(function() {
			// dropdown Event 
			$("#dropdownMenuButton").on("click", function() {
				
			$.ajax({
				url : "/friend/rest/getAskedList",
				method : "POST",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					
				}),
				success : function(d) {
					$(".addData").remove();					
					
					for (var i = 0; i < d.list.length; i++) {
						
					var addData = "<div id='"+d.list[i].userId+"' class='addData'>"+
					"<img src='../../images/"+d.list[i].profileName+"'/>"+
						 "&nbsp; "+d.list[i].userId+" &nbsp; "+d.list[i].name+" &nbsp; "+d.list[i].schoolName+" &nbsp;"+
						 "<button type='button' class='btn btn-primary "+d.list[i].userId+"' id='acceptButton'>수락</button>"+
						 "<button type='button' class='btn btn-danger "+d.list[i].userId+"' id='deleteButton'>거절</button>"+
						 "<input type='hidden' value='"+d.list[i].userId+"'/>"+
					"</div>";
					
					$(addData).appendTo("#addHere");
					}
					
					var buttonAll = "<button type='button' class='btn btn-primary btn-lg btn-block addData'>모든 요청 보기</button>";
					$(buttonAll).appendTo("#addHere");
					
					$("button.addData").on("click", function() {
						
						$.redirect("/friend/getAskedList",{
							userId : "user01"
						})					
					})
					
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
								firstUserId : "user01",
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
				}
				
			})
		});
		});
		
		$(function() {
			$("input[name='searchKeyword']").on("keypress", function(e) {
				if(e.which == 13) {
					searchFriend();
				}
			});
			
			$("button#searchBtn").on("click", function() {
				searchFriend();
			});
			
		});
		
		function searchFriend() {
			var searchKeyword = $("input[name='searchKeyword']").val();
			console.log(searchKeyword);
			
			if (searchKeyword == null || searchKeyword.length < 1 ) {
				alert("검색어를 입력해주세요");
				return;
			}
			
			$("form.form-inline").attr("method", "post").attr("action", "/friend/getSearchFriendList").submit();
		}
	
	</script>
	
	<style type="text/css">
	
	.dropdown-menu {
            max-height: 500px;
            overflow-y: auto;
            /* prevent horizontal scrollbar */
            overflow-x: hidden;
            /* add padding to account for vertical scrollbar */
            padding-right: 20px;
            width: 570px;
}
	</style>
	
<title>어울림</title>
</head>
<body>
<div class="container">
<nav class="navbar fixed-top navbar-dark bg-dark">
  <a class="navbar-brand" href="/friend/friendIndex.jsp">FriendIndex</a>
  <div class="dropdown mr-auto">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	친구신청목록
  </button>
  <div class="dropdown-menu " aria-labelledby="dropdownMenuButton">
  <form id="addHere"></form>
  </div>
</div>
<form class="form-inline">
<input type="text" style="visibility:collapse">
<div class="form-group">
	<select class="custom-select mr-sm-2" id="inlineFormCustomSelect" name="searchCondition">
        <option value="0" ${search.searchCondition == 0 ? "selected" : "" }>아이디</option>
        <option value="1" ${search.searchCondition == 1 ? "selected" : "" }>이름</option>
        <option value="2" ${search.searchCondition == 2 ? "selected" : "" }>학교명</option>
      </select>
	<input class="form-control" type="text" name="searchKeyword" placeholder="Search">
	<input type="hidden" name="userId" value="${user.userId}">
</div>
<div class="form-group">
</div>
	<div class="form-group">
		<button class="btn btn-outline-secondary" type="button" id="searchBtn">Search</button>
	</div>
</form>
</nav>
</div>
</body>
</html>