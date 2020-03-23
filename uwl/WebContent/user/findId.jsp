<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>

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

	$(function() {

		// 	$("#userId").focus();

		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button#findId").on(
				"click",
				function() {

					$("form").attr("method", "POST").attr("action",
							"/user/getUser").submit();
				});
	});


	// //==>"인증번호 받기" Event 처리 및 연결
	// $(function() {
	// 	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	// 	 $("button#checkMail").on("click" , function() {
	// 		popWin 
	// 		= window.open("/user/checkDuplicationMail.jsp",
	// 									"popWin", 
	// 									"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
	// 									"scrollbars=no,scrolling=no,menubar=no,resizable=no");
	// 	});
	// });
</script>
</head>


<body>


	<form>
		<div id=findId>
			<hr>
			이 름 <input type="text" id="name" name="name" placeholder="이름">

			<hr>
			<!-- 	전화번호   -->
			<!-- 	<input type="text" id="phone" name="phone" placeholder="전화번호"> -->
			<!-- 	  <div><button type="button" class="btn btn-info" id="checkNick">인증번호</button></div> -->
			<!-- 	<hr> -->
			메 일 <input type="text" id="mail" name="mail" placeholder="메일">
			<button type="button" id="findId">아이디 찾기</button>
		</div>
	</form>




</body>


</html>