<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<!--  jQuery CDN -->	
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- jQuery Redirect CDN     https://github.com/mgalante/jquery.redirect  -->
<script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
<meta charset="utf-8">
<title>어울림</title>
</head>
<body>

<button id="1">친구목록</button>
<button id="2">친구신청목록</button>
<button id="3">신청한 목록</button>
<button id="5">생일친구목록</button>
<button id="6">ASK INDEX</button>
<button id="7">listPurchase</button>
</body>

<script type="text/javascript">
	var sessionUserId = "${user.userId}";
	
	$(function() {
		$("#1").on("click", function() {
			$.redirect("/friend/getFriendList",{
				userId : "user01"
			})
		})
		
		$("#2").on("click", function() {
			$.redirect("/friend/getAskedList",{
				userId : "user01"
			})
		})
		
		$("#3").on("click", function() {
			$.redirect("/friend/getRequestList",{
				userId : "user01"
			})
		})
		
		$("#4").on("click", function() {
			self.location = "/friend/dropdown.jsp";
		})
		
		$("#5").on("click", function() {
			$.redirect("/friend/getBirthFriendList",{
				userId : "user01"
			})
		})
		
		$("#6").on("click", function() {
			$.redirect("/social/socialIndex.jsp",{
			},"GET")
		})
		
		$("#7").on("click", function() {
			$.redirect("/purchase/getPurchaseList",{
				userId : sessionUserId
			},"POST")
		})
		
		
	})


</script>
</html>