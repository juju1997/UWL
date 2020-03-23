<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

$(function() {
	var sessionId = "${user.userId}";
	console.log("sessionId", sessionId);
	$.ajax({
		url : "/friend/rest/getFriendListByName",
		method : "POST",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			name : "name03"
		}),
		success : function(d) {
			console.log(d.list);
		}
	});
})
</script>
</head>
<body>

</body>
</html>