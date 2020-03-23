<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">

	<meta charset="EUC-KR">
	
	<title>네이버 로그인 팝업창 처리 jsp</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

	<script type="text/javascript">
		// 이동 시 부모 창 새로고침(main.jsp로 이동)과 팝업창 종료를 위한 구간 
		$(function(){
			//alert("네이버로그인 완료");
			opener.parent.location="/user/addUserNaverLoginView.jsp";
			window.open("about:blank","_self").close();
		})
	</script>

<head>
<meta charset="EUC-KR">
<title>바로 사라지기 때문에 의미 없는 jsp입니다.</title>
</head>
<body>
아이고 의미없다 
</body>
</html>