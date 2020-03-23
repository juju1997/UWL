<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! addUserView 수 정 중 !!!!!!!!!!!!! -->
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
<!-- 	<link rel="stylesheet" type="text/css" href="assets/css/main.css"> -->
	
	
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
	
	
	
	<!--  ///////////////////////// datePicker ////////////////////////// -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--  	<link rel="stylesheet" href="/resources/demos/style.css"> -->
 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( '#signUp' ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
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
			var schoolNo=$("input[name='schoolNo']").val();
			var mail=$("input[name='mail']").val();
			// 메일 인증 유무를 판단하기 위한 Flag 
// 			var mailValue = $("input[name='mailValue']").val();
		
// 			// 1일 때 메일 인증 완료이므로 그 외 혹은 메일 인증을 진행하지 않은 경우 바로 종료
// 			if ( mailValue == "" || mailValue != "1" ) { 
// 				$("h6").text("메일 인증을 진행해주세요.");
// 				return;
// 			}
			
			if(id == null || id.length <1){
				alert("아이디는 반드시 입력하셔야 합니다.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("패스워드는  반드시 입력하셔야 합니다.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("패스워드 확인은  반드시 입력하셔야 합니다.");
				return;
			}
			if(name == null || name.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if(nickname == null || nickname.length <1){
				alert("닉네임은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if(gender == null || gender.length <1){
				alert("성별은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if(birth == null || birth.length <1){
				alert("생일은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if(schoolNo == null || schoolNo.length <1){
				alert("학교는  반드시 입력하셔야 합니다.");
				return;
			}
			
			if(mail == null || mail.length <1){
				alert("메일은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				return;
			}
				
			var value = "";	
			if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
				var value = $("option:selected").val() + "-" 
									+ $("input[name='phone2']").val() + "-" 
									+ $("input[name='phone3']").val();
			}

			$("input:hidden[name='phone']").val( value );

			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
		

		//==>"이메일" 유효성Check  Event 처리 및 연결=============================안됨!!!!!!!!!!!!!!!!!!!!!!!!!!
		 $(function() {
			 
			 $("input[name='mail']").on("change" , function() {
				
				 var mail=$("input[name='mail']").val();
			    
				 if(mail != "" && (mail.indexOf('@') < 1 || mail.indexOf('.') == -1) ){
			    	alert("이메일 형식이 아닙니다.");
			     }
			});
		});	
		
		
	 	//==>"ID중복확인" Event 처리 및 연결
			var checkId = 0;
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
		                if(data == true) {
		                    $("#userId").css("background-color", "#B0F6AC"); //초록
		                    $(".btn btn-outline-info btn-lg").prop("disabled", true);
	                         $(".btn btn-outline-info btn-lg").css("background-color", "#4CAF50"); //초록
		                    checkId = true;
		                }else {
		                    $("#userId").css("background-color", "#FFCECE"); //빨강
		                    $(".btn btn-outline-info btn-lg").prop("disabled", false);
		                    $(".btn btn-outline-info btn-lg").css("background-color", "#aaaaaa"); //회색
		                    checkId = false;
	                         signupCheck();
		                }
		            },
		            error : function(){
		            	alert("실패");
		            }
		        });
		    }		
		    
		    
		    
		  //==>"Nickname 중복확인" Event 처리 및 연결
		    var checkNick = 0;
		    // 체크하여 가입버튼 비활성화, 중복확인.
		    function checkDuplicationNickname() {
		        var inputed = $('#nickname').val();
		        console.log(inputed);
		        $.ajax({
		            data : {
		            	nickname : inputed
		            },
		            url : "/user/rest/checkDuplicationNickname",
		            method : 'GET',
		            success : function(data) {
		                if(data == true) {
		                    $("#nickname").css("background-color", "#B0F6AC"); //초록
		                    $(".btn btn-outline-info btn-lg").prop("disabled", true);
	                         $(".btn btn-outline-info btn-lg").css("background-color", "#4CAF50"); //초록
		                    checkId = true;
		                }else {
		                    $("#nickname").css("background-color", "#FFCECE"); //빨강
		                    $(".btn btn-outline-info btn-lg").prop("disabled", false);
		                    $(".btn btn-outline-info btn-lg").css("background-color", "#aaaaaa"); //회색
		                    checkId = false;
	                         signupCheck();
		                }
		            },
		            error : function(){
		            	alert("실패");
		            }
		        });
		    }		
		    
		    
		    
		  //==>"mail 중복확인" Event 처리 및 연결
		    var mail = 0;
		    // 체크하여 가입버튼 비활성화, 중복확인.
		    function checkDuplicationMail() {
		        var inputed = $('#mail').val();
		        console.log(inputed);
		        $.ajax({
		            data : {
		            	mail : inputed
		            },
		            url : "/user/rest/checkDuplicationMail",
		            method : 'get',
		            success : function(data) {
		                if(data == true) {
		                    $("#mail").css("background-color", "#B0F6AC"); //초록
		                    $(".btn btn-outline-info btn-lg").prop("disabled", true);
	                         $(".btn btn-outline-info btn-lg").css("background-color", "#4CAF50"); //초록
		                    checkId = true;
		                }else {
		                    $("#mail").css("background-color", "#FFCECE"); //빨강
		                    $(".btn btn-outline-info btn-lg").prop("disabled", false);
		                    $(".btn btn-outline-info btn-lg").css("background-color", "#aaaaaa"); //회색
		                    checkId = false;
	                         signupCheck();
		                }
		            },
		            error : function(){
		            	alert("실패");
		            }
		        });
		    }		
		    
// 		//==>"ID중복확인" Event 처리 및 연결
// 		 $(function() {
// 			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
// 			 $("button#checkId").on("click" , function() {
// 				popWin 
// 				= window.open("/user/checkDuplicationUserId.jsp",
// 											"popWin", 
// 											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
// 											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
// 			});
// 		});	
		
//  		//==>"Nickname중복확인" Event 처리 및 연결
//  		 $(function() {
//  			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
//  			 $("button#checkNick").on("click" , function() {
//  				popWin 
//  				= window.open("/user/checkDuplicationNickname.jsp",
//  											"popWin", 
//  											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
//  											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
//  			});
//  		});	
		
		//==>"학교 주소찾기" Event 처리 및 연결
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $("button#checkSchool").on("click" , function() {
				popWin 
				= window.open("/user/checkDuplicationUserId.jsp",
											"popWin", 
											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
			});
		});	
		
		
		
	/////////////////////////////////////////형진이가 건듬 ㅅㅂㅋㅋ/////////////////////////////////////////////////////////	
	/////////////////////////////////////////형진이가 건듬 ㅅㅂㅋㅋ/////////////////////////////////////////////////////////	
	/////////////////////////////////////////형진이가 건듬 ㅅㅂㅋㅋ/////////////////////////////////////////////////////////	
	/////////////////////////////////////////형진이가 건듬 ㅅㅂㅋㅋ/////////////////////////////////////////////////////////	
	/////////////////////////////////////////형진이가 건듬 ㅅㅂㅋㅋ/////////////////////////////////////////////////////////	
	/////////////////////////////////////////형진이가 건듬 ㅅㅂㅋㅋ/////////////////////////////////////////////////////////	
	/////////////////////////////////////////형진이가 건듬 ㅅㅂㅋㅋ/////////////////////////////////////////////////////////	
	/////////////////////////////////////////형진이가 건듬 ㅅㅂㅋㅋ/////////////////////////////////////////////////////////	
	/////////////////////////////////////////형진이가 건듬 ㅅㅂㅋㅋ/////////////////////////////////////////////////////////	
	/////////////////////////////////////////형진이가 건듬 ㅅㅂㅋㅋ/////////////////////////////////////////////////////////	
		
		
		
		
		//==>"phone 본인인증" Event 처리 및 연결
		 $(function() {
			 $("button#checkPhone").on("click" , function() {
				 var phone = $('#phone').val();
				 if(isNaN(phone) || phone==''){
					 console.log('번호를 제대로 입력해줘!');
				 }else{
					 $('#phoneNumberCheckBox').remove();
					var view=
							"<div class='form-group' id='phoneNumberCheckBox'>"
							+ "<label for='phone' class='col-md-offset-1 col-md-3 control-label'>인증번호 입력</label>"
							+ "<div class='col-sm-4'>"
							+ "<input type='text' class='form-control' id='code' name='code' placeholder='인증번호를 입력해주세요.'>"
							+ "</div>"
							+ "<div class='col-sm-3'>"
							+ "<button type='button' class='btn btn-outline-warning' id='codeNumberCheck'>인증완료</button>"
							+ "</div>"
							+ "</div>";
						$('#phoneCheckAppend').after(view);
						$.ajax({
							url : "/userrrrrr/rest/sendSms",
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
						url : "/userrrrrr/rest/smsCheck",
						data : {code : code},
						success : function(data){
							if(data == true){
								//인증완료 시
								var view = "<h1><span>인증이 완료되었습니다</span></h1>"
								$('body').after(view);
							}else{
								//인증 틀릴시 누님이 이쁘게 틀렸다고 알려주세요! 
								var view = "<span>인증번호를 다시 확인해주세요.</span>"
							}
						},
						error : function(){
							console.log('error');
						}
					});
			 });

		/////////////////////////////////////////형진이가 건듬 ㅅㅂㅋㅋ/////////////////////////////////////////////////////////	
		/////////////////////////////////////////형진이가 건듬 ㅅㅂㅋㅋ/////////////////////////////////////////////////////////	
		/////////////////////////////////////////형진이가 건듬 ㅅㅂㅋㅋ/////////////////////////////////////////////////////////	
		/////////////////////////////////////////형진이가 건듬 ㅅㅂㅋㅋ/////////////////////////////////////////////////////////	
		/////////////////////////////////////////형진이가 건듬 ㅅㅂㅋㅋ/////////////////////////////////////////////////////////	
		/////////////////////////////////////////형진이가 건듬 ㅅㅂㅋㅋ/////////////////////////////////////////////////////////	
		/////////////////////////////////////////형진이가 건듬 ㅅㅂㅋㅋ/////////////////////////////////////////////////////////	
		/////////////////////////////////////////형진이가 건듬 ㅅㅂㅋㅋ/////////////////////////////////////////////////////////	
		/////////////////////////////////////////형진이가 건듬 ㅅㅂㅋㅋ/////////////////////////////////////////////////////////	
		/////////////////////////////////////////형진이가 건듬 ㅅㅂㅋㅋ/////////////////////////////////////////////////////////			

		// 		//==>"mail 중복체크" Event 처리 및 연결
		// 		 $(function() {
		// 			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		// 			 $("button#checkMail").on("click" , function() {
		// 				popWin 
		// 				= window.open("/user/checkDuplicationMail.jsp",
		// 											"popWin", 
		// 											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
		// 											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
		// 			});
		// 		});	

		//==>"mail 본인인증" Event 처리 및 연결 =====
		$(function() {
			// 이메일 입력 시 인증번호확인 버튼이 보이지 않도록 hide 
			$("button.btn.btn-primary:contains('인증번호확인')").hide();

			// 		$( "button.btn.btn-primary:contains('가입')" ).on("click" , function() {
			// 			fncAddUser();
			// 		});

			// 		$( "button.btn.btn-primary:contains('메일전송')" ).on("click" , function() {
			$("button#sendMail")
					.on(
							"click",
							function() {
								var mail = $("input[name='mail']").val();
								console.log(mail);

								$
										.ajax({
											url : "/user/rest/checkMail",
											method : "post",
											dataType : "JSON",
											headers : {
												"Accept" : "application/json",
												"Content-Type" : "application/json"
											},
											data : JSON.stringify({
												mail : mail
											}),
											// beforeSend :: request 실행 전에 동작하는 call back function 
											beforeSend : function() {
												$("h6")
														.text(
																"메일 발송 중입니다... 잠시만 기다려 주세요.");
											},
											success : function(JSONData, Status) {
												// 메일을 성공적으로 보냈을 시 returnMap.put("result", "done");
												if (JSONData.result == "done") {
													// 이메일 입력 칸을 인증번호입력칸으로 바꾸므로 입력한 이메일을 백업하는 input type hidden 설정 구간 
													$("input[name='mail']")
															.val(
																	$(
																			"input[name='mail']")
																			.val());

													$("input[name='mail']")
															.val("");
													$("#mail").text("인증번호입력");

													// 본인인증할 state를 returnMap.put("mailCheck", state);로 반환했으므로 해당 값을 input type hidden에 백업
													$("input[name='mailCheck']")
															.val(
																	JSONData.mailCheck);

													// 없는 이메일로 메일 발송 자체는 가능하므로 이에 대한 추가적인 Business Logic이 필요함 
													$("h6")
															.text(
																	"메일 발송이 완료되었습니다. 메일을 확인해 주세요. 메일이 없을 시 다시 발송 버튼을 입력해주세요.");

													$("button#sendMail")
															.remove();
													$(
															"button.btn.btn-primary:contains('인증번호확인')")
															.show();
													$("input[name='mail']")
															.attr(
																	"placeholder",
																	"인증번호 입력");
												}
											}
										})
							});

			$("button.btn.btn-primary:contains('인증번호확인')").on("click",
					function() {
						var mailValue = $("input[name='mail']").val();
						var mailCheck = $("input[name='mailCheck']").val();

						console.log("비교대상 값 : " + mailCheck);
						console.log("입력 값 : " + mailValue);

						// mailCheck는 이메일 인증 문자열 state이며 
						// mailValue는 이메일 인증 유무를 판단하는 Flag이다 

						// mailCheck의 default는 null String이므로 
						if (mailCheck == "") {
							$("h6").text("메일이 발송되지 않았습니다.");
						}

						if (mailCheck != "") {
							if (mailCheck == mailValue) {
								$("input[name='mailValue']").val("1");
								$("h6").text("인증되었습니다.");
								$("input[name='mail']").attr("readonly", true);
							}

							if (mailCheck != mailValue) {
								$("h6").text("인증 문자가 틀렸습니다. 다시 확인해주세요.");
							}
						}
					});
		});

		$(function() {
			$("a[href='#']").on("click", function() {
				$("form")[0].reset();
			});
		});
		//==>"mail 본인인증" Event 처리 및 연결 =====
	</script>		
    
    <!--  ///////////////////////// datePicer ////////////////////////// -->
  <script>
  $( function() {
    $( "#birth" ).datepicker({
      changeMonth: true,
      changeYear: true,
      yearRange: "2000:2020"
    });
  } );
  </script>
  
  <script>
  $(document).ready(function(){

		 $("#fileInput").on('change', function(){  // 값이 변경되면

		 if(window.FileReader){  // modern browser

		 var profileName = $(this)[0].files[0].name;

		 } else {  // old IE

		 var profileName = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출

		 }

		 

		 // 추출한 파일명 삽입

		 $("#userfile").val(profileName);
		 });
		
	});
  </script>
  
  
  
     
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default" id="top">
        	<a class="navbar-brand" href="/index.jsp" ><h3>어'울림</h3></a>
<!--         	<img src="./images/twitter_header_photo_1.jpg"> -->
<!-- 이미지 추가 -->

   	</div>	
   	<!-- ToolBar End /////////////////////////////////////-->	


	<!--  화면구성 div Start /////////////////////////////////////-->
<!-- 	<div class="container"> -->
	
<!-- 		<h1 class="bg-primary text-center">회 원 가 입</h1> -->
		
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		<div class="form-group">
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label" >* 아 이 디</label>
<!-- 		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label" style="color:orange">* 아 이 디</label> -->
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" oninput="checkDuplicationUserId()">
		      <span id = "checkMsg"></span> 
		      
<!-- 		      	<strong class="text-danger">입력전 중복확인 부터..</strong> -->
		    </div>
<!-- 		    <div class="col-sm-3"> -->
<!-- 		      <button type="button" class="btn btn-info" id="checkId">중복확인</button> -->
<!-- 		    </div> -->
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label" >* 비밀번호</label>
<!-- 		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label" style="color:orange">* 비밀번호</label> -->
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">* 비밀번호 확인</label>
<!-- 		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label" style="color:orange">* 비밀번호 확인</label> -->
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="name" class="col-sm-offset-1 col-sm-3 control-label" >* 이름</label>
<!-- 		    <label for="name" class="col-sm-offset-1 col-sm-3 control-label" style="color:orange">* 이름</label> -->
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="name" name="name" placeholder="회원이름">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="nickname" class="col-sm-offset-1 col-sm-3 control-label" >* 닉네임</label>
<!-- 		    <label for="nickname" class="col-sm-offset-1 col-sm-3 control-label" style="color:orange">* 닉네임</label> -->
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickname" name="nickname" oninput="checkDuplicationNickname()">
		    </div>
<!-- 		    <div class="col-sm-3"> -->
<!-- 		      <button type="button" class="btn btn-info" id="checkNick">중복확인</button> -->
<!-- 		    </div> -->
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="schoolNo" class="col-sm-offset-1 col-sm-3 control-label" >* 학교</label>
<!-- 		    <label for="schoolNo" class="col-sm-offset-1 col-sm-3 control-label" style="color:orange">* 학교</label> -->
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="schoolNo" name="schoolNo" placeholder="학교">
		    </div>
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-outline-warning" id="checkSchool">주소찾기</button>
<!-- 		      <button type="button" class="btn btn-info" id="checkSchool">주소찾기</button> -->
		    </div>
		  </div>
		  
		  
		  
		  
		  
		  <!-- 형진이가 건듬       ---------------------------------------------------------------------------------- -->
		  <!-- 형진이가 건듬       ---------------------------------------------------------------------------------- -->
		  <!-- 형진이가 건듬       ---------------------------------------------------------------------------------- -->
		  <!-- 형진이가 건듬       ---------------------------------------------------------------------------------- -->
		  <!-- 형진이가 건듬       ---------------------------------------------------------------------------------- -->
		  <!-- 형진이가 건듬       ---------------------------------------------------------------------------------- -->
		  <!-- 형진이가 건듬       ---------------------------------------------------------------------------------- -->
		  <!-- 형진이가 건듬       ---------------------------------------------------------------------------------- -->
		  <!-- 형진이가 건듬       ---------------------------------------------------------------------------------- -->
		  
		  <div class="form-group" id="phoneCheckAppend">
		    <label for="phone" class="col-md-offset-1 col-md-3 control-label">휴대전화번호</label>
<!-- 		    <label for="phone" class="col-md-offset-1 col-md-3 control-label" style="color:orange">휴대전화번호</label> -->
		     <div class="col-sm-4">
		      	<input type="text" class="form-control" id="phone" name="phone" placeholder="- 는 제외하고 입력해주세요.">
		    </div>
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-outline-warning" id="checkPhone">본인인증</button>
		    </div>
		  </div>

		  
		  <!-- 형진이가 건듬       ---------------------------------------------------------------------------------- -->
		  <!-- 형진이가 건듬       ---------------------------------------------------------------------------------- -->
		  <!-- 형진이가 건듬       ---------------------------------------------------------------------------------- -->
		  <!-- 형진이가 건듬       ---------------------------------------------------------------------------------- -->
		  <!-- 형진이가 건듬       ---------------------------------------------------------------------------------- -->
		  <!-- 형진이가 건듬       ---------------------------------------------------------------------------------- -->
		  <!-- 형진이가 건듬       ---------------------------------------------------------------------------------- -->
		  <!-- 형진이가 건듬       ---------------------------------------------------------------------------------- -->
		  <!-- 형진이가 건듬       ---------------------------------------------------------------------------------- -->





		  
		  
		  <div class="form-group">
		    <label for="birth" class="col-sm-offset-1 col-sm-3 control-label" >* 생일</label>
<!-- 		    <label for="birth" class="col-sm-offset-1 col-sm-3 control-label" style="color:orange">* 생일</label> -->
		    <div class="col-sm-4">
		      <input type="text"  class="form-control" id="birth" name="birth"  placeholder="생일을 달력에서 선택하세요.">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="gender" class="col-sm-offset-1 col-sm-3 control-label" >* 성별</label>
<!-- 		    <label for="gender" class="col-sm-offset-1 col-sm-3 control-label" style="color:orange">* 성별</label> -->
		    <div class="col-sm-4">
		    <input type="radio" name="gender" value="1"> 여자 &nbsp;
		    <input type="radio" name="gender" value="2"> 남자
		    </div>
		  </div>
		  
		  
		   <div class="form-group">
		    <label for="mail" class="col-sm-offset-1 col-sm-3 control-label"> 이메일</label>
<!-- 		    <label for="mail" class="col-sm-offset-1 col-sm-3 control-label" style="color:orange">이메일</label> -->
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="mail" name="mail"  oninput="checkDuplicationMail()" >
		    </div>
<!-- 		    <div class="col-sm-3"> -->
<!-- 		      <button type="button" class="btn btn-info" id="checkMail">중복확인</button> -->
<!-- 		    </div> -->
		    
		    <div class="form-group" >
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		    <label for="profileName" class="col-sm-offset-1 col-sm-3 control-label" > 사 진</label>
<!-- 		    <label for="profileName" class="col-sm-offset-1 col-sm-3 control-label" style="color:orange"> 사 진</label> -->
		    <div class="col-sm-4">
		     	<input name="file" id="fileInput"  type="file" data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
					<div class="bootstrap-filestyle input-group">
						<input type="text" id="userfile" class="form-control" name="userfile" disabled="">
						<span class="group-span-filestyle input-group-btn" tabindex="0">
							<label for="fileInput" class="btn btn-default ">
								<span class="glyphicon fa fa-upload"></span>
							</label>
						</span>
					</div>
		    	</div>
		     </div>
		    
			<!-- 		    메일로 인증번호 전송 -->
		    <div class="col-sm-3">
		    	<button type="button" class="btn btn-outline-warning" id="sendMail">메일전송</button>
<!-- 		    	<button type="button" class="btn btn-info" id="sendMail">메일전송</button> -->
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    	<button type="button" class="btn btn-outline-warning">인증번호확인</button>
<!-- 		    	<button type="button" class="btn btn-info">인증번호확인</button> -->
		    	<input type="hidden" name="mailValue" value="">
		    	<input type="hidden" name="mailCheck" value="">
		    	<input type="hidden" name="mail1" value="">
		    </div>
		    <!-- 		    메일로 인증번호 전송 -->
		    
		  </div>
		  </div>
<!-- 		  </div> -->
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
<!-- 		     <button type="submit" id="signUp"	class="btn btn-outline-info btn-lg" disabled="disabled">Sign Up</button> -->
		     <button type="submit" id="signUp"	class="btn btn-outline-info btn-lg" >Sign Up</button>
<!-- 		      <button type="button" class="btn btn-primary"  >가 &nbsp;입</button> -->
			  <a class="btn btn-outline-info btn-lg btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		  </div>
		</form>
		
		<!-- form Start /////////////////////////////////////-->
		
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>