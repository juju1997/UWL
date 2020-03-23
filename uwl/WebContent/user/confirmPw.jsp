<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	
	<!--  ///////////////////////// Bootstrap 4.4, jQuery 3.1.1 CDN ////////////////////////// -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
			rel="stylesheet" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
			crossorigin="anonymous">
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	
	<!--  ///////////////////////// CSS, JS 4.4 CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" 
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" 
integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	
	

    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	//============= 회원정보수정 Event  처리 =============	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button#updateUser").on("click", function() {
			self.location = "/user/updateUser?userId=${user.userId}";
		});
	});
	
	
	
// 		//============= "로그인"  Event 연결 =============
// 		$( function() {
			
// 			$("#password").focus();
			
// 			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
// 			$("button").on("click" , function() {
// 				var pw=$("input:password").val();
				
// 				if(pw == null || pw.length <1) {
// 					alert('패스워드를 입력하지 않으셨습니다.');
// 					$("#password").focus();
// 					return;
// 				}
				
// 				$("form").attr("method","POST").attr("action","/user/updateUser").submit();
// 			});
// 		});	
		
// 		//============= 회원가입화면이동 =============
// 		$( function() {
// 			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
// 			$("a[href='#' ]").on("click" , function() {
// 				self.location = "/user/addUser"
// 			});
// 		});
		
// 		$(function() {
// 			$("input[name='password']").on("keypress", function(e) {
// 				if(e.which == 13) {
// 					$("button").click();
// 				}
// 			});
// 		});
	</script>		
	<style type="text/css">
	
	.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}
@-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}
	
	</style>
</head>

<body>

		 	 	<br/><br/>
				
			        <form class="form-horizontal">
		  <div class="wrapper fadeInDown">
					  <div class="form-group ">
<div class="col-sm-offset-4 col-sm-6 text-center">
					      <input type="password" class="form-control" name="password" id="password" placeholder="패스워드" >
					    </div>
					  </div>
					  
					  
					  <div class="text-center">
			<button type="button" id="updateUser"
				class="btn btn-outline-info btn-lg">정보수정</button>
					  </div>
					  
					  
					  
<!-- 					  <div class="form-group"> -->
<!-- 					    <div class="col-sm-offset-4 col-sm-6 text-center"> -->
<!-- 					      <button type="button" class="btn btn-primary btn-lg btn-block"  >로 &nbsp;그 &nbsp;인</button> -->
<!-- <!-- 					      <a class="btn btn-primary btn-lg btn-block" href="#" role="button">회 &nbsp;원 &nbsp;가 &nbsp;입</a> --> -->
<!-- 					    </div> -->
<!-- 					  </div> -->
			</div>
					</form>
			
</body>

</html>