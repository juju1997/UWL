<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="shortcut icon" href="/images/favicon1.ico" type="image/x-icon">
    <link rel="icon" href="/images/favicon1.ico" type="image/x-icon">
    <title>어울림</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--  jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!-- bootstrap 4.4 CDN -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <!-- jQuery Redirect CDN     https://github.com/mgalante/jquery.redirect  -->
    <script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
    <!-- Modal Alert https://github.com/PureOpenSource/pureAlert  -->
    <script src="/javascript/jquery.bootstrap-pureAlert.js"></script>

    <link rel="stylesheet" href="/css/jaeiCommon.css">
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
	<!--     datePicker -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
    
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

body {
    font-size: 16px;
    color: #333;
    font-family: 'Roboto', sans-serif;
    font-family: 'Nanum Gothic', sans-serif;
}

a:hover,
a:focus {
    color: inherit;
    text-decoration: none;
}

input:focus {
    outline: none;
}

img,
i,
input {
    vertical-align: middle;
}

div.wrap {
    width: 540px;
    margin: 0 auto;
    text-align: center;
    overflow: hidden;
}

@media (max-width: 539.98px) {
    div.wrap {
        width: 100%;
    }
}

div.logo {
    padding: 20px 0;
}


div.logo img {
    width: 100px;
}

.wrap>div:nth-child(2) {
    font-size: 22px;
    font-weight: bold;
    padding: 5px 0 20px;
    text-align: left;
}

div.loginForm div.id p:nth-child(1),
div.loginForm div.password p:nth-child(1) {
    text-indent: 8px;
    padding-top: 5px;
    text-align: left;
    background-color: #f8f8f8;
    font-size: 15px;
}

div.loginForm div.id:nth-child(11) p:nth-child(1) {
    background-color: #fff;
}

p.gender {
    text-align: left;
    margin-top: 5px;
    margin-bottom: 20px;
}

div.loginForm div.id p:nth-child(1) i,
div.loginForm div.password p:nth-child(1) i {
    font-size: 10px;
    vertical-align: 2px;
    margin-right: 5px;
}

div.loginForm div.id input,
div.loginForm div.password input {
    background-color: #f8f8f8;
    border: none;
    border-bottom: 2px solid;
    width: 100%;
    line-height: 30px;
    padding: 0 10px 2px;
    margin-bottom: 20px;
    font-size: 16px;
}

div.loginForm div.id:nth-child(6) p input {
    margin-bottom: 10px;
}

div.loginForm div.id:nth-child(9) p input {
    margin-bottom: 10px;
}

div.loginForm div.id:nth-child(13) p input {
    margin-bottom: 10px;
}

div.loginForm a {
    background-color: #EBAD7A;
    display: block;
    line-height: 45px;
    border-radius: 30px;
    text-align: center;
    font-weight: bold;
    margin-bottom: 30px;
    color: #fff;
    font-size: 14px;
}

div.loginForm>p>a {

    margin-top: 10px;
    margin-bottom: 20px;
}

div.loginForm div.id:nth-child(9) p a {
    margin-bottom: 20px;
}

div.loginForm div.id:nth-child(13) p a {
    margin-bottom: 20px;
}

div.loginForm div:last-child a {

    margin-bottom: 10px;
}

div.wrap>div:nth-child(4) {
    font-size: 14px;
}

div.wrap>div:nth-child(4) a {
    color: #EBAD7A;
}

p {
    margin-bottom: 0;
}

p.level {
    text-align: left;
}
</style>
    <script type="text/javascript">

    //============= "가입"  Event 연결 =============
	 $(function() {
		$( '#signUp' ).on("click" , function() {
			fncAddUser();
		});
	 });	
		
		//============= "취소"  Event 처리 및  연결 =============
	$(function() {
		$("a[name='cancel']").on("click" , function() {
			 $("#userId").css("background-color", "#F8F8F8"); 
			 $("#nickname").css("background-color", "#F8F8F8"); 
			 $("#mail").css("background-color", "#F8F8F8"); 
			$("form")[0].reset();
			
		});
	});	
	 
	 $(function(){
			$('#password2').keyup(function(){
				 if( $('#password').val() != $('#password2').val() ) {	
						$('#not').remove();
						var view = "<span id='not' style='color:red'> 비밀번호가 일치하지 않습니다.</span>";
						$('#password2').after(view);
				 } else {
					 $('#not').remove();
						var view = "<span id='not'> 비밀번호가 일치합니다.</span>";
						$('#password2').after(view);
				 }
				 var pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/g;
				    if( !pwReg.test( $("input[name=password]").val() ) ) {
				    	$('#not').remove();
						var view = "<span id='not' style='color:red'> 패스워드는 최소 8자리, 숫자, 문자, 특수문자를 포함하여야 합니다. </span>";
						$('#password').after(view);
						return false;
				    }	
			 });
		}); 
		
	function fncAddUser() {
		var id=$("input[name='userId']").val();
		var pw=$("input[name='password']").val();
		var pw_confirm=$("input[name='password2']").val();
		var name=$("input[name='name']").val();
		var nickname=$("input[name='nickname']").val();
		var gender=$("input[name='gender']").val();
		var birth=$("input[name='birth']").val();
		var schoolName=$("input[name='schoolName']").val();
		var mail=$("input[name='mail']").val();
		var mailValue=$("input[name='mailValue']").val();
			
	    if(id == null || id.length <1){
			$('#not').remove();
			var view = "<span id='not' style='color:red'> 아이디는 반드시 입력하셔야 합니다.</span>";
			$('#userId').after(view);
			$('#userId').focus();
			return false;
		}
		
		var idReg = /^[a-z]+[a-z0-9]{5,9}$/g;
	    if( !idReg.test( $("input[name=userId]").val() ) ) {
	    	$('#not').remove();
			var view = "<span id='not' style='color:red'> 아이디는 영문자로 시작하는 6~10자 영문자 또는 숫자이어야 합니다. </span>";
			$('#userId').after(view);
			$('#userId').focus();
			return false;
	    }	
	    
		if(pw == null || pw.length <1){
			$('#not').remove();
			var view = "<span id='not' style='color:red'> 패스워드는 반드시 입력하셔야 합니다.</span>";
			$('#password').after(view);
			$('#password').focus();
			return false;
		}
		
		if(pw_confirm == null || pw_confirm.length <1){
			$('#not').remove();
			var view = "<span id='not' style='color:red'> 패스워드 확인은  반드시 입력하셔야 합니다.</span>";
			$('#password2').after(view);
			$('#password2').focus();
			return false;
		}
		
		if(name == null || name.length <1){
			$('#not').remove();
			var view = "<span id='not' style='color:red'> 이름은 반드시 입력하셔야 합니다.</span>";
			$('#name').after(view);
			$('#name').focus();
			return false;
		}
		
		var nameReg = /[a-zA-Z가-힣]$/g;
	    if( !nameReg.test( $("input[name=name]").val() ) ) {
	    	$('#not').remove();
			var view = "<span id='not' style='color:red'> 이름은 한글 또는 영어이어야 합니다. </span>";
			$('#name').after(view);
			$('#name').focus();
			return false;
	    }
		
		if(nickname == null || nickname.length <1){
			$('#not').remove();
			var view = "<span id='not' style='color:red'> 닉네임은 반드시 입력하셔야 합니다.</span>";
			$('#nickname').after(view);
			$('#nickname').focus();
			return false;
		}
		
		var nickReg = /[a-zA-Z0-9가-힣]{0,9}$/g;
	    if( !nickReg.test( $("input[name=nickname]").val() ) ) {
	    	$('#not').remove();
			var view = "<span id='not' style='color:red'> 닉네임은 10자 이하 한글,영문자 또는 숫자이어야 합니다. </span>";
			$('#nickname').after(view);
			$('#nickname').focus();
			return false;
	    }
			
		if(schoolName == null || schoolName.length <1){
			$('#not').remove();
			var view = "<span id='not' style='color:red'> 학교는 반드시 입력하셔야 합니다.</span>";
			$('#schoolName').after(view);
			$('#schoolName').focus();
			return false;
		}
			
		if(birth == null || birth.length <1){
			$('#not').remove();
			var view = "<span id='not' style='color:red'> 생일은 반드시 입력하셔야 합니다. </span>";
			$('#birth').after(view);
			$('#birth').focus();
			return false;
		}
		
		if(gender == null || gender.length <1){
			$('#not').remove();
			var view = "<span id='not' style='color:red'> 성별은 반드시 입력하셔야 합니다.</span>";
			$('#gender').after(view);
			$('#gender').focus();
			return false;
		}
		
		if(mail == null || mail.length <1){
			$('#not').remove();
			var view = "<span id='not' style='color:red'> 메일은 반드시 입력하셔야 합니다.</span>";
			$('#mail').after(view);
			$('#mail').focus();
			return false;
		}
		
		if(mailValue != '1'){
				$('#not').remove();
				var view = "<span id='not' style='color:red'> 메일 인증을 해주세요.</span>";
				$('#mail').after(view);
				$('#mail').focus();
				console.log(mailValue);
				return false;
		}	
		 
		var value = "";	
		if( $("input[name='phone2']").val() != ""  &&  $("input[name='phone3']").val() != "") {
			var value = $("option:selected").val() + "-" 
								+ $("input[name='phone2']").val() + "-" 
								+ $("input[name='phone3']").val();
		}
		$("input:hidden[name='phone']").val( value );

		Swal.fire({
			  icon: 'success',
			  title: '어 울림',
			  text : '회원가입이 완료되었습니다.',
			  timer: 3000
		});
		
		setTimeout(function() {
		$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		},1000);
	} 
    
	//==>"이메일" 유효성Check  Event 처리 및 연결============================= 
	 $(function() {
		 $("input[name='mail']").on("change" , function() {
			 var mail=$("input[name='mail']").val();
			 var nickReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			 if(mail != "" && !nickReg.test( $("input[name=mail]").val()) && (mail.indexOf('@') < 1 || mail.indexOf('.') == -1)){
				 $('#not').remove();
				 var view = "<span id='not' class='mailNot' style='color:red'> 이메일 형식이 아닙니다.</span>";
				 $('#mail').after(view);
				 $('#mail').focus();
				 return false;
		     }
		});
	});		
	
	var isIdValid = false;
// 	var isPwValid = false;
// 	var isNameValid = false;
	var isNicknameValid = false;
	var isSchoolNameValid = false;
// 	var isBirthValid = false;
// 	var isGenderValid = false;
	var isMailValid = false;	
	
	function signupCheck() {
		if (isIdValid && isNicknameValid && isSchoolNameValid && isMailValid) {
			$("a[name='signUp']").prop("disabled", false);
	       	$("a[name='signUp']").css("background-color", "#4CAF50"); //초록
		} else {
			$("a[name='signUp']").prop("disabled", true);
		    $("a[name='signUp']").css("background-color", "#aaaaaa"); //회색
		}
	}
	
   //==>"ID중복확인" Event 처리 및 연결
		var checkId = false;
	    //아이디 체크하여 가입버튼 비활성화, 중복확인.
	    function checkDuplicationUserId() {
	        var inputed = $('#userId').val();
	        console.log(inputed);
	        $.ajax({
	            data : {
	                userId : inputed
	            },
	            url : "/user/rest/checkDuplicationUserId",
	            method : 'GET',
	            success : function(data) {
	            	$('#not').remove();
	                if(data == true) {
	                    $("#userId").css("background-color", "#B0F6AC"); //초록
	                    checkId = true;
	                    isIdValid = true;
	                    signupCheck();
	                }else {
	                    $("#userId").css("background-color", "#FFCECE"); //빨강
	                    $("a[name='signUp']").prop("disabled", true);
	                    $("a[name='signUp']").css("background-color", "#aaaaaa"); //회색
		   				var view = "<span id='not' class='mailNot' style='color:red'> 이미 사용 중인 아이디입니다.</span>";
		   				$('#userId').after(view);
		   				$('#userId').focus();
	                    checkId = false;
	                    isIdValid = false;
                        signupCheck();
	                }
	            },
	            error : function(){
	            	alert("실패");
	            }
	        });
	    }		
    
		  //==>"Nickname 중복확인" Event 처리 및 연결
	    var checkNick = false;
		    // 체크하여 가입버튼 비활성화, 중복확인.
	    function checkDuplicationNickname() {
	        var inputed = $('#nickname').val();
	        console.log(inputed);
	        $.ajax({
	            url : "/user/rest/checkDuplicationNickname",
	            method : 'POST',
	            headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
	            data : JSON.stringify({
	            	nickname : inputed
	            }),
	            success : function(data) {
	            	$('#not').remove();
	                if(data.result == true) {
	                    $("#nickname").css("background-color", "#B0F6AC"); //초록
	                    $("a[name='signUp']").prop("disabled", false);
                        $("a[name='signUp']").css("background-color", "#4CAF50"); //초록
                        checkNick = true;
                        isNicknameValid = true;
                        signupCheck();
	                }else {
	                    $("#nickname").css("background-color", "#FFCECE"); //빨강
	                    var view = "<span id='not' class='mailNot' style='color:red'> 이미 사용 중인 닉네임입니다.</span>";
		   				$('#nickname').after(view);
		   				$('#nickname').focus();
	                    checkNick = false;
	                    isNicknameValid = false;
                        signupCheck();
	                }
	            },
	            error : function(){
	            	alert("실패");
	            }
	        });
	    }		
		    
		  //==>"mail 중복확인" Event 처리 및 연결
	    var mail = false;
		    // 체크하여 가입버튼 비활성화, 중복확인.
	    function checkDuplicationMail() {
	        var inputed = $('#mail').val();
	        console.log(inputed);
	        $.ajax({
	            data : {
	            	mail : inputed
	            },
	            url : "/user/rest/checkDuplicationMail",
	            method : 'GET',
	            success : function(data) {
	            	$('#not').remove();
	                if(data == true) {
	                    $("#mail").css("background-color", "#B0F6AC"); //초록
	                    $("a[name='signUp']").prop("disabled", false);
                         $("a[name='signUp']").css("background-color", "#4CAF50"); //초록
                         mail = true;
                         isMailValid = true;
                         signupCheck();
	                }else {
	                    $("#mail").css("background-color", "#FFCECE"); //빨강
	                    var view = "<span id='not' class='mailNot' style='color:red'> 동일한 이메일이 있습니다.</span>";
		   				$('#mail').after(view);
		   				$('#mail').focus();
	                    mail = false;
	                    isMailValid = false;
                        signupCheck();
	                }
	            },
	            error : function(){
	            	alert("실패");
	            }
	        });
	    }		
		    
//	 		//==>"Modal 학교 주소찾기" Event 처리 및 연결 test================================ 
	 	$(function() {
			$(document).ready(function(){ 
	 			$("button#checkSchool").on("click" , function() {
	 				var schoolLevel = $('input[name=school]:checked').val();
	 				var schoolName = $("#ModalSchoolName").val();
	 				console.log(schoolLevel)
	 				console.log(schoolName)
	 				
	 				if(schoolName == "" || schoolName == null){
	 					$('#not').remove();
	 					var view = "<span id='not' style='color:red'> 학교이름을 입력해주세요.</span>";
	 					$('#append').after(view);
	 					$('#schoolName').focus();
	 					isSchoolNameValid = false;
	 					signupCheck();
	 				}else{
	 					$('#school2').remove();
	 					var url = "http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=0e5ab738c07aa5a4e219e84f907db889&svcType=api&svcCode=SCHOOL&contentType=json&gubun="+schoolLevel+"&searchSchulNm="+schoolName;
	 					ajaxCall(url,callback,error);	
	 					isSchoolNameValid = true;
	 					signupCheck();
	 				}
	 			});
	  		});
			
	 		function ajaxCall(url,callback){
	 			$.ajax({
	 				url : url,
	 				async : true,
	 				type : "GET",
	 				dataType : 'json',
	 				success : callback,
	 				error : error
	 			});
	 		}
	 		
	 		function callback(json){
	 			var total = json.dataSearch.content.length;
	 			$('#school1').remove();
	 			var firstView = "<span id='school1'>검색어 <strong>"+$("input[name='schoolName']").val()+"</strong> 에 대한 검색결과 총 <span>"+total+"</span>건입니다<hr/></span>"; 
	 			$("#append").append(firstView);
	 			
	 			$('#school2 *').remove();
	 			for(var i=0; i<total; i++){
	 				var schoolName = json.dataSearch.content[i].schoolName;
	 				var adres = "     _"+json.dataSearch.content[i].adres;
	 				var seq = "     _"+json.dataSearch.content[i].seq;
	 				//이렇게 DB에 저장하면 될듯..?
	 				var secondView = "<span id='school2'><span>"+schoolName+adres+seq+"</span><br/><br/></span>"
	 				$("#append2").append(secondView);
	 				console.log($("#school1"));
	 				console.log($("#school2"));
	 				console.log($("span#school3"));
	 			}
	 		}
		 		
	 		$(function(){
	 			$(document).on('click', 'span#school2', function() {
					var schoolSplit = $(this).text();
					var split = schoolSplit.split('_');
					var schoolName = split[0].trim();
					var schoolAddress = split[1].trim();
					var schoolNo = split[2].trim();	
					console.log("schoolNo", schoolNo);
					console.log("schoolName", schoolName);
					
	 				$("input[name='schoolName']").val(schoolName);
	 				$("input[name='schoolAddress']").val(schoolAddress);
	 				$("input[name='schoolNo']").val(schoolNo);
	 				$('#schoolModal').modal('hide');
		 		});
	 		});
	 		function error(){
	 			alert("에러발생! 에러발생!");
	 		}	
		});	
				
			//==>"phone 본인인증" Event 처리 및 연결  ================================
		$(function() {
		 $("a[id='checkPhone']").on("click" , function() {
			 var phone = $('#phone').val();
			 if(isNaN(phone) || phone==''){
				 $('#not').remove();
					var view = "<span id='not' style='color:red'>번호를 입력해주세요.</span>"
					$('#phone').after(view);
					$('#phone').focus();
			 }else{
				 $("a[id='checkPhone']").remove();
				 $('#phoneNumberCheckBox').remove();
				var view=
					"<div class='id' id='phoneNumberCheckBox'>"
					+"<p>인증번호 입력</p>"
					+ "<p><input type='text' name='code' id='code' placeholder='인증번호를 입력해주세요.'></p>"
         		        + "<p><a href='#' id='codeNumberCheck' onclick='return false'>인증번호확인</a></p>"
         		        +"</div>";
					$('#phone').after(view);
					$.ajax({
						url : "/user/rest/sendSms",
						dataType : 'json',
						data : {receiver : phone},
						success : function(data){
							$('#phone').attr('readonly' ,true);
						},
						error : function(){
							console.log('error');
						}
					});
				 }
			});
		});
		
		 $(document).on("click",'#codeNumberCheck', function(){
			 var code = $('#code').val();
			 $.ajax({
					url : "/user/rest/smsCheck",
					data : {code : code},
					success : function(data){
						if(data == true){
							//인증완료 시
							$('#codeNumberCheck').remove();
							$('#code').remove();
							$('#yes').remove();
							var view = "<span id='yes'>인증이 완료되었습니다</span>"
							$('#phone').after(view);
						}else{
							//인증실패시 
							$('#not').remove();
							var view = "<span id='not' style='color:red'> 인증번호를 다시 확인해주세요.</span>";
							$('#phone').after(view);
						}
					},
					error : function(){
						console.log('error');
					}
				});
		 });

		//==>"mail 본인인증" Event 처리 및 연결  ================================시작
		$(function() {
			// 이메일 입력 시 인증번호확인 버튼이 보이지 않도록 hide 
			$("a#checkMailBtn").hide();
			$("a:contains('인증완료!')").hide();
			$("input:contains('인증번호')").hide();
		})
		
		$(document).on("click" ,"a#sendMail", function() {
			var mail = $("input[name='mail']").val();
			console.log(mail);
			$.ajax(
					{
						url : "/user/rest/checkMail" , 
						method : "post" , 
						dataType : "JSON" , 
						headers : {
							"Accept" : "application/json" , 
							"Content-Type" : "application/json" 
						} , 
						data : JSON.stringify({
							mail : mail
						}) , 
						// beforeSend :: request 실행 전에 동작하는 call back function 
						beforeSend : function() {
							$("h6").text("메일 발송 중입니다... 잠시만 기다려 주세요.");
						} , 
						success : function( JSONData, Status ) {
							// 메일을 성공적으로 보냈을 시 returnMap.put("result", "done");
							if ( JSONData.result == "done" ) {
								// 이메일 입력 칸을 인증번호입력칸으로 바꾸므로 입력한 이메일을 백업하는 input type hidden 설정 구간 
								$("input[name='mail']").val($("input[name='mail']").val());
								
								// 본인인증할 state를 returnMap.put("mailCheck", state);로 반환했으므로 해당 값을 input type hidden에 백업
								$("input[name='mailCheck']").val(JSONData.mailCheck);
								
								// 없는 이메일로 메일 발송 자체는 가능하므로 이에 대한 추가적인 Business Logic이 필요함 
								$("h6").text("메일 발송이 완료되었습니다.");
								$("a:contains('메일전송')").remove();
								
								$("a[id='#sendMail']").remove();
								$("a:contains('인증번호확인')").show();
								$("input[name='confirmNo']").attr("placeholder", "인증번호 입력");
							} 
						}
					}
			)
		});
		
		$(document).on("click" ,"a#checkMailBtn", function() {
			var mailValue = $("input#confirmNo").val();
			var mailCheck = $("input[name='mailCheck']").val();
			console.log("비교대상 값 : " + mailCheck);
			console.log("입력 값 : " + mailValue);
			// mailCheck는 이메일 인증 문자열 state이며 
			// mailValue는 이메일 인증 유무를 판단하는 Flag이다 
			if ( mailCheck == "" ) {
				$("h6").text("메일이 발송되지 않았습니다.");
			}
			// mailCheck의 default는 null String이므로 
			if ( mailCheck != "" ) {
				if ( mailCheck == mailValue ) {
					$('#not').remove();
					$("a:contains('메일전송')").remove();
					$("span.mailNot").remove();
					$("input[name='mailValue']").val("1");
					$("h6").text("메일 발송이 완료되었습니다.").remove();
					$("input[name='confirmNo']").attr("readonly", true);
					$("input[name='mail']").attr("readonly", true);
					$("a:contains('인증번호확인')").remove();
					$("a:contains('인증완료!')").show();
				}
				if ( mailCheck != mailValue ) {
					 $('#not').remove();
					var view = "<span id='not' style='color:red'>인증번호가 틀렸습니다. 다시 확인해주세요.</span>"
					$('#mail').after(view);
					$('#mail').focus();
				}
			}
		});
	//==>"mail 본인인증" Event 처리 및 연결  ================================ 끝					
				
	 <!--  ///////////////////////// datePicker ////////////////////////// -->
	  $( function() {
	    $( "#birth" ).datepicker({
	      changeMonth: true,
	      changeYear: true,
	      yearRange: "1988:2020",
	      dateFormat: "yy-mm-dd"
	    });
	  });
	  
//   사진 첨부 ===============================================================================
 	$(document).ready(function(){
		 $("#fileInput").on('change', function(){  // 값이 변경되면
			 if(window.FileReader){  // modern browser
				var profileName = $(this)[0].files[0].name;
			 }else {  // old IE
		 		var profileName = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
			 }
		 // 추출한 파일명 삽입
			 $("#userfile").val(profileName);
		 });
	});	    
	
//  사진 미리보기 ===============================================================================
 	$(document).ready(function(){
        $("#fileInput").on('change', function(){
        	readURL(this);
        });
    });
 	function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#preview').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $("#fileInput").change(function() {
        readURL(this);
    });
    
</script>   
    <title>어울림</title>
</head>
<body>	
    <form class="form-horizontal" enctype="multipart/form-data">
        <div class="wrap">
            <div class="logo">
                <img src="img/twitter_header_photo_1-removebg-preview.png" alt="">
            </div>
            <div>계정을 생성하세요</div>
            <div class="loginForm">
                <div class="id">
                    <p><i class="fas fa-star-of-life"></i>아이디</p>
                    <p><input type="text" name="userId" id="userId" oninput="checkDuplicationUserId()" placeholder="영문자로 시작하는 6~10자 영문자 또는 숫자"></p>
                </div>
                <div class="password">
                    <p><i class="fas fa-star-of-life"></i>비밀번호</p>
                    <p><input type="password" name="password" id="password" placeholder="최소 8자리, 숫자, 문자, 특수문자를 포함"></p>
                </div>
                <div class="password">
                    <p><i class="fas fa-star-of-life"></i>비밀번호 확인</p>
                    <p><input type="password" name="password2" id="password2"></p>
                </div>
                <div class="id">
                    <p><i class="fas fa-star-of-life"></i>이름</p>
                    <p><input type="text" name="name" id="name" ></p>
                </div>
                <div class="id">
                    <p><i class="fas fa-star-of-life"></i>닉네임</p>
                    <p><input type="text" name="nickname" id="nickname" oninput="checkDuplicationNickname()" placeholder="10자 이하 한글, 영문자, 숫자"></p>
                </div>
                <div class="id">
                    <p><i class="fas fa-star-of-life"></i>학교</p>
                    <p>
                    	<input type="text" name="schoolName" id="schoolName" data-toggle="modal" data-target="#schoolModal" readonly="readonly">
                    	<input type="hidden" name="schoolNo" value="">
                    	<input type="hidden" name="schoolAddress" value="">
                    </p>
                </div>
                <p><a href="#" data-toggle="modal" data-target="#schoolModal">주소찾기</a></p>
                <div class="id" id="phoneCheckAppend">
                    <p>휴대전화번호</p>
                    <p><input type="text" name="phone" id="phone" placeholder=" - 는 제외하고 입력해주세요."></p>
                    <p><a href="#" id="checkPhone" onclick="return false" onclick="return false">본인인증</a></p>
                </div>
                <div class="id">
                    <p><i class="fas fa-star-of-life"></i>생일</p>
                    <p><input type="text" id="birth" name="birth"  placeholder="생일을 달력에서 선택하세요."></p>
                </div>
                <div class="id">
                    <p><i class="fas fa-star-of-life"></i>성별</p>
                </div>
	                <p class="gender">
	                     <input type="radio" name="gender" value="1">여자 
	                     <input type="radio" name="gender" value="2">남자
	                </p>
                <div class="id">
                    <p><i class="fas fa-star-of-life"></i>이메일</p>
                    <p><input type="text" id="mail" name="mail"  oninput="checkDuplicationMail()"></p>
                    <p><input type="text" id="confirmNo" name="confirmNo" placeholder="인증번호"></p>
                    <h6></h6>
                    <p><a href="#" id="sendMail" onclick="return false">메일전송</a></p>
                    <p><a href="#" id="checkMailBtn" onclick="return false" onclick="return false">인증번호확인</a></p>
                    <p><a href="#" onclick="return false" >인증완료!</a></p>
                    <p><input type="hidden" name="mailValue" value=""></p>
			    	<p><input type="hidden" name="mailCheck" value=""></p>
			    	<p><input type="hidden" name="mail1" value=""></p>
                </div>
                <div class="id">
                    <p>사진</p>
                    <!-- 						이미지 사이즈 -->
                    <img id="preview" src="#" alt="" style="width: 30%; height: 30%;"/>	
					<!-- 						이미지 사이즈 -->
                    <p><input type="file" name="file" id="fileInput" data-class-input="form-control" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="clip: rect(0px 0px 0px 0px); display : none;"></p>
                    <div class="bootstrap-filestyle input-group">
						<input type="text" id="userfile" class="form-control" name="userfile" onchange="readURL(this)" disabled>
						<!-- 						아이콘 -->
						<span class="group-span-filestyle input-group-btn" tabindex="0">
							<label for="fileInput" class="btn btn-default ">
								<span class="glyphicon fa fa-upload"></span>
							</label>
						</span>
						<!-- 						아이콘 -->
					</div>
                </div>
                <div>
                    <a href="#" name="signUp" id="signUp" onclick="return false">가 입</a>
                    <a href="#" name="cancel" id="cancel" >취 소</a>
                </div>
            </div>
        </div>
         <!-- Modal 학교 주소 찾기 -->
		<div class="modal fade" id="schoolModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">학교 찾기</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
				<div class="form-group">
					<label for="schoolName">학교</label>
			     	<input type="text" class="form-control" id="ModalSchoolName" name="ModalSchoolName" 
			     					onkeydown = "if (event.keyCode == 13)document.getElementById('checkSchool').click()" />
				</div>	
				<div >
				    <input type="radio" id="school" name="school" value="elem_list" checked />초등학교
					<input type="radio" id="school" name="school" value="midd_list"/>중학교
					<input type="radio" id="school" name="school" value="high_list"/>고등학교
					<input type="radio" id="school" name="school" value="univ_list"/>대학교
		   		</div>
				<div id="append"></div>
				<br/><br/>
				<div id="append2"></div>
			</div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="checkSchool">확인</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
    </form>
</body>
</html>