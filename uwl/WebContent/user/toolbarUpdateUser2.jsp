<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        li {
            list-style: none;
        }
        a {
            text-decoration: none;
            color: inherit;
        }
        a:hover,
        a:focus {
            text-decoration: none;
            color: inherit;
        }
        body {
            color: #333;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
font-family: 'Nanum Gothic', sans-serif;

        }
        div.updateUser {
            overflow: hidden;
            
        }
        div.leftNavigation {
            
            width: 30%;
            float: left;
        }
        div.leftNavigation ul li a {
            
            line-height: 45px;
            display: block;
            padding: 0 30px;
        }
        div.updateProfile,
        div.updatePassword {
            padding-top: 20px;
            width: 70%;
            float: right;
            border-left: 1px solid #eee;
            min-height: 100vh;
        }
        div.updateProfile table,
        div.updatePassword table {
            width: 100%;
        }
        div.profileImage {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            overflow: hidden;
            position: relative;
            display: inline-block;
            vertical-align: middle;
        }
        div.profileImage img {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            height: 100%;
        }
        div.updateProfile table tr,
        div.updatePassword table tr {
            height: 50px;
        }
        div.updateProfile table tr:nth-child(1),
        div.updatePassword table tr:nth-child(1) {
            font-weight: bold;
            font-size: 17px;
            line-height: 1;
        }
        div.updateProfile table tr:nth-child(6) {
            font-weight: bold;
            font-size: 13px;
            color: #686868;
            vertical-align: bottom;
        }
        div.updateProfile table tr:nth-child(1) a {
            font-size: 14px;
            color: #d25412;
        }
        div.updateProfile table tr td:nth-child(1),
        div.updatePassword table tr td:nth-child(1){
            text-align: right;
            padding: 0 40px;
            font-weight: bold;
        }
        div.updateProfile table tr td:nth-child(2) input,
        div.updatePassword table tr td:nth-child(2) input {
            width: 92%;
            line-height: 1.8;
            padding: 0 10px;
            border-radius: 3px;
            border: none;
            border: 1px solid #eee;
        }
        div.updateProfile table tr td:nth-child(2) textarea {
            width: 92%;
            height: 80px;
            resize: none;
            overflow-y: scroll;
            padding: 0 10px;
            border-radius: 3px;
            border: none;
            border: 1px solid #eee;
        }
        div.updateProfile tr:nth-child(10) td:nth-child(2) div {
            display: inline-block;
            
        }
        div.updateProfile tr:nth-child(10) td:nth-child(2) div input {
            width: auto;
            vertical-align: middle;
        }
        div.updateProfile tr:nth-child(10) td:nth-child(2) div:nth-child(2) {
            width: 180px;
            font-size: 14px;
            font-weight: bold;
            vertical-align: middle;
            line-height: 1;
        }
        div.updateProfile tr:nth-child(10) td:nth-child(2) div:nth-child(2) a {
            color: #EBAD7A;
        }
        div.updateProfile tr:nth-child(11) div:nth-child(1) {
            display: inline-block;
            
            margin-right: 10px;
        }
        div.updateProfile tr:nth-child(11) div:nth-child(2) {
            display: inline-block;
            
            
            
        }
        div.updateProfile tr:nth-child(11) div:nth-child(1) a {
            background-color: #d25412;
            display: inline-block;
            line-height: 29px;
            padding: 0 11px;
            border-radius: 3px;
            color: #fff;
            font-weight: bold;
            font-size: 14px;
        }
        div.updateProfile tr:nth-child(11) div:nth-child(2) a {
            color: #d25412;
            font-weight: bold;
            font-size: 14px;
            
        }
        div.updatePassword table tr:nth-child(5) a {
            display: inline-block;
            background: #d25412;
            color: #fff;
            font-weight: bold;
            font-size: 14px;
            line-height: 32px;
            padding: 0 11px;
            border-radius: 5px;
        }
        div.updatePassword table tr:nth-child(6) a {
            color: #d25412;
            font-weight: bold;
            font-size: 14px;
        }
        
        div.publicStatus {
            
            width: 70%;
            float: right;
            border-left: 1px solid #eee;
            min-height: 100vh;
        }
        div.publicStatus > div {
            
            width: 95%;
            margin: 0 auto;
            padding: 20px 0;
            
            
        }
        div.publicStatus > div + div {
            border-top: 1px solid #aaa;
        }
        div.publicStatus > div > div:nth-child(1) {
            font-size: 23px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        div.publicStatus > div > div:nth-child(2) {
            font-weight: bold;
            
        }
        div.publicStatus > div > div:nth-child(2) input {
            margin-right: 5px;
        }
        div.publicStatus > div > div:nth-child(3) {
            font-size: 14px;
        }
        div.updateProfile {
            display: none;
        }
        div.updatePassword {
            display: none;
        }
        div.publicStatus {
            display: none;
        }
        div.updateProfile.on {
            display: block;
        }
        div.updatePassword.on {
            display: block;
        }
        div.publicStatus.on {
            display: block;
        }
        p {
            margin: 0;
            padding: 0;
        }
        div.leftNavigation li.on {
            border-left: 3px solid;
        }
    </style>
    <script>
    
		var sessionUserId = "${user.userId}";
    
        $(function() {
            $('div.leftNavigation li a').on('click', function() {
                $('div.leftNavigation li').removeClass('on');
                $(this).parent().addClass('on');
                var index = $(this).parent().index();
                
                $('div.updateUser > div').removeClass('on');
                $('div.updateUser > div').eq(index + 1).addClass('on');
            });
        });
        
     
        $(document).on("click", "a:contains('제출')", function() {
			
			$("form#updateProfile")
			.attr("method", "post")
			.attr("action", "/user/updateProfile")
			.attr("enctype", "multipart/form-data")
			.submit();
		});
        
        $(document).on("click", "a:contains('프로필 사진 바꾸기')", function() {
			$("input[type='file']").click();
		});
        
        $(document).on("click", "td a:contains('비밀번호 변경')", function() {
			var exPassword = $("input#exPassword").val();
			var password = $("input#password").val();
			var password2 = $("input#password2").val();
			var sessionPassword = "${user.password}";
			
			if (exPassword.length < 1 || exPassword == null) {
				alert("이전 비밀번호를 입력하세요.");
				return;
			}
			
			if (password.length < 1 || password == null) {
				alert("새 비밀먼호를 입력하세요.");
				return;
			}
			
			if (password2.length < 1 || password2 == null) {
				alert("새 비밀먼호 확인을  입력하세요.");
				return;
			}
			
			if (password != password2) {
				alert("두 비밀번호가 일치하는지 확인하세요.");
				return;
			}
			
			
			$.ajax({
				url : "/user/rest/updatePassword",
				method : "POST",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				dataType : "json",
				data : JSON.stringify({
					exPassword : exPassword,
					password : password
				}),
				success : function(data) {
					var result = data.result;
					console.log(result);
					if (data.result == "1") {
						alert("수정이 완료되었습니다.");
						$("input[type='password']").val("");
					} else if(data.result == "2"){
						alert("이전 비밀번호가 일치하지 않습니다.");
						$("input[type='password']").val("");
					} else if (data.result == "3") {
						alert("새 비밀번호를 이전 비밀번호와 다르게 입력하세요.");
						$("input[type='password']").val("");
					}
				}
			});
		});
        
        $(document).on("change", "input[type='checkbox']", function() {
			var ps = null;
			console.log($(this).is(":checked"));
			
			if($(this).is(":checked")) {
				ps = "2";
			} else {
				ps = "1";
			}
			
			$.ajax({
				url : "/user/rest/updatePublicStatus",
				method : "POST",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				dataType : "json",
				data : JSON.stringify({
					userId : sessionUserId,
					publicStatus : ps
				}),
				success : function() {
					console.log("update ps success");
				}
			});
		});
        
    </script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: inherit;

        }

        a:hover,
        a:focus {
            text-decoration: none;
            color: inherit;
        }

        body {
            color: #333;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;

        }

        div.layoutWrap2 {
            width: 1280px;
            height: 100vh;

            margin: 0 auto;
            overflow: hidden;
        }

        div.leftToolbar2 {

            width: 240px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-right: 1px solid #eee;
            padding: 15px 0 0 15px;
        }

        div.work2 {

            width: 770px;
            height: 100vh;
            float: left;
            
            position: relative;
			
        }

        div.rightToolbar2 {

            width: 270px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-left: 1px solid #eee;
            padding: 15px 15px 0 15px;
        }
        
        
    </style>
</head>

<body>
    <div class="layoutWrap2">
        <div class="leftToolbar2">
            <jsp:include page="/layout/left.jsp" />
        </div>
        <div class="work2" id="wrapper">
        <ul>
        	<div class="updateUser">
        <div class="leftNavigation">
            <ul>
                <li class="on"><a href="#">프로필 편집</a></li>
                <li><a href="#">비밀번호 변경</a></li>
                <li><a href="#">공개 범위 및 보안</a></li>
            </ul>
        </div>
        
        
        <div class="updateProfile on">
           <form id="updateProfile">
            <table>
                <colgroup>
                    <col width="35%">
                    <col width="65%">
                </colgroup>
                <tr>
                    <td>
                        <div class="profileImage">
                            <img src="/images/${user.profileName}" alt="">
                            <input type="file" name="file" style="display : none">
                            <input type="hidden" name="profileName" value="${user.profileName}">
                        </div>
                    </td>
                    <td>
                        <div>
                            ${user.userId}
                            <input type="hidden" name="userId" value="${user.userId }">
                            <input type="hidden" name="publicStatus" value="${user.publicStatus}">
                        </div>
                        <div>
                            <a href="#">프로필 사진 바꾸기</a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name" value="${user.name}"></td>
                </tr>
                <tr>
                    <td>사용자 이름</td>
                    <td><input type="text" name="nickname" value="${user.nickname}"></td>
                </tr>
                <tr style="display :none;">
                </tr>
                <tr>
                    <td>소개</td>
                    <td>
                        <textarea name="selfIntroduction" id="selfIntroduction" cols="30" rows="10">${user.selfIntroduction}</textarea>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>개인 정보</td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="text" name="mail" value="${user.mail}" readonly></td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td><input type="text" name="phone" value="${user.phone}" readonly></td>
                </tr>
                <tr>
                    <td>성별</td>
                    <c:if test="${user.gender == 1 }">
                    	<c:set var="gender" value="여성"/>
                    </c:if>
                    <c:if test="${user.gender == 2 }">
                    	<c:set var="gender" value="남성"/>
                    </c:if>
                    <td>${gender}</td>
                </tr>
                <tr>
                    <td>학교</td>
                    <td>
                    <input type="text" value="${user.schoolName}" readonly>
                    <input type="hidden" name="schoolNo" value="${user.schoolNo}">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <div><a href="#">제출</a></div>
                        <div><a href="#"></a></div>
                    </td>
                </tr>
            </table>
           </form>
        </div>
        
        <div class="updatePassword">
       	 <form id="updatePassword">
            <table>
                <colgroup>
                    <col width="35%">
                    <col width="65%">
                </colgroup>
                <tr>
                    <td>
                        <div class="profileImage">
                            <img src="/images/${user.profileName}" alt="">
                        </div>
                    </td>
                    <td>${user.name}</td>
                </tr>
                <tr>
                    <td>이전 비밀번호</td>
                    <td><input type="password" id="exPassword"></td>
                </tr>
                <tr>
                    <td>새 비밀번호</td>
                    <td><input type="password" id="password"></td>
                </tr>
                <tr>
                    <td>새 비밀번호 확인</td>
                    <td><input type="password" id="password2"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><a href="#">비밀번호 변경</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td><a href="#">비밀번호를 잊으셨나요?</a></td>
                </tr>	
            </table>
        </form>
        </div>
        
        <div class="publicStatus">
            <div>
                <div>계정 공개 범위</div>
                <div>
                <input type="checkbox" ${ ! empty user.publicStatus && user.publicStatus==2 ? "checked" : "" }>
                
                
                	비공개 계정</div>
                <div>계정이 비공개 상태인 경우 회원님이 승인한 사람만 어울림에서 회원님의 사진과 동영상을 볼 수 있습니다. 기존 팔로워는 영향을 받지 않습니다.</div>
            </div>
        </div>
    </div>
        </ul>
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
</body></html>