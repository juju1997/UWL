<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!-- ===================================================== test ========================= -->
<html lang="ko">

<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">
	// $(function() {
	// 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	// 		$("button").on("click", function() {
	// 			self.location = "/user/findId?userId=${user.userId}"
	// 		});
	// 	});


// 	$(function() {
// 		// 	$("#userId").focus();
// 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
// 		$("button#findPw").on(
// 				"click",
// 				function() {

// 					$("form").attr("method", "POST").attr("action",
// 							"/user/rest/findPw").submit();
// 				});
// 	});
	$(function() {
	$(document).on("click", "#findPw", function() {
		var userId = $("input#userId").val();
		$.ajax({
			url: "/user/rest/findPw", 
			type: 'POST',
			dataType: 'json',
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data: JSON.stringify({
				userId : userId
			}),
			success : function(data) {
			console.log(data);
	        	var userLists = data.password;
	        	var userLength = userLists.length;
	        	var userFind = userLength.substring(1, userLength-1);
// 	        	var userFind = data.getPassword();
	        	console.log(userFind)
	       	 		 $("#userId").append("<h1>"+"회원님의 정보 : "+userFind+" 입니다.</h1>");
	       	 		 $("#userId").after(userFind);
	        }
		});
		});
	});
</script>
</head>
<body>
	<form>
		<div id=findPw>
			아 이 디 <input type="text" id="userId" name="userId" placeholder="ID">
<!-- 			이 름 <input type="text" id="name" name="name" placeholder="이름"> -->
<!-- 			메 일 <input type="text" id="mail" name="mail" placeholder="이름"> -->
			
			<button type="button" id="findPw" name="findPw">비밀번호 찾기</button>
		</div>
	</form>
</body>
</html>