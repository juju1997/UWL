<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!--  jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- bootstrap 4.4 CDN -->
	<link
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		rel="stylesheet">
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<!-- jQuery Redirect CDN     https://github.com/mgalante/jquery.redirect  -->
	<script
		src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
	<!-- Modal Alert https://github.com/PureOpenSource/pureAlert  -->
	<script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
    
    <link rel="stylesheet" href="/css/jaeiCommon.css">
       <!-- jQuery UI toolTip 사용 CSS-->
	  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <!-- jQuery UI toolTip 사용 JS-->
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript">
    	$(document).on("click", "button#updateProfileBtn", function() {
			$("form#updateProfileForm").attr("method", "POST").attr("action", "/user/updateProfile").submit();	
		})
		
		$(document).on("click", "button#updatePasswordBtn", function() {
			console.log("hello");
			var prePassword = $("input#prePassword").val();
			var password = $("input#password").val();
			var password2 = $("input#password2").val();
			
			if (password != password2) {
				alert("두 비밀번호가 일치하는지 확인하세요");
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
					prePassword : prePassword,
					password : password
				}),
				success : function(data) {
					var result = data.result;
					if (data.result) {
						alert("수정이 완료되었습니다.");
						$("input[type='password']").val("");
					} else {
						alert("이전 비밀번호가 일치하지 않습니다.");
						$("input[type='password']").val("");
					}
				}
			});
		});
		
		$( function() {
	    	$("input[name='birth']").datepicker({
	        changeMonth: true,
	        changeYear: true,
	        dateFormat : "yy-mm-dd"
	      });
	  });
    
    	$(function() {
            $('div.section ul li a').on('click', function() {
                
                var i = $(this).parent().index();
                $('div.section ul li').removeClass('on');
                $('div.section ul li').eq(i).addClass('on');
                $('section > div').removeClass('on');
                $('section > div').eq(i).addClass('on');
                
            });
        });
    	
    	$(document).on("click", "a.profileName", function() {
			console.log("hello");
			$("input[name='profileName']").click();
		})
    </script>
	
	<style type="text/css">
	
		body {
			margin : 50px 0 0 200px;
		}
		div.col-md-9 {
			margin : 0;
			padding : 0;
		}
		div.col-md-3 {
			margin : 0;
			padding : 0;
		}
		.profileName {
			
		}
		
		.list-group-item{
			border: hidden;
		}
		
		a.profileName {
			border-radius: 30px;
		}
		
		img.profileName {
			width : 70px;
			height : 70px;
			border-radius: 30px;
		}
		h5 {
			display: inline-block;
		}
		
		
		
		
		div.innerSection {
            border-top: 1px solid #dddddd;
        }
        div.section ul {
            width: 55%;
            margin: 0 auto;
            
        }
        div.section ul li {
            
            text-align: center;
            line-height: 50px;
            font-size: 12px;
            color: #898989;
            font-weight: bold;
        }
        div.section ul li.on {
            color: #333;
        }
        div.section ul li a {
            
            display: block;
            position: relative;
            
        }
        div.section ul li a:after {
            content: '';
            width: 45%;
            height: 1px;
            background-color: #333;
            
            position: absolute;
            top: -1px;
            left: 50%;
            transform: translateX(-50%);
            display: none;
            
        }
        div.section ul li.on a:after {
            display: block;
        }
        div.section ul li a i {
            
            margin-right: 3px;
        }
        section > div.list1 {
            background-color: lightblue;
        }
        section > div.list2 {
            background-color: lightcoral;
        }
        section > div.list3 {
            background-color: lightcyan;
        }
        section > div.list4 {
            background-color: lightgray;
        }
        section > div {
            display: none;
            height: 300px;
        }
        section > div.on {
            display: block;
        }
        section {
            clear: both;
        }
		
	</style>



<title>어울림</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-3 section">
		     <div class="list-group innerSection">
		     <ul>
              <li class="on"><a href="#" class="list-group-item list-group-item-action">프로필 편집</a></li>
              <li><a href="#" class="list-group-item list-group-item-action">비밀번호 변경</a></li>
		     </ul>
            </div> 
		</div>
		<section>
		<div class="list1 on">
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12 userId" >
		                	<a href="#" class="profileName"><img src="/images/${user.profileName}" class="profileName"></a>
		                    <h5>${user.userId}</h5>
		                    <hr>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-md-12">
		                    <form id="updateProfileForm">
							  <input type="file" class="form-control" name="profileName" value="${user.profileName}" style="display : none;">		                    
		                      <input type="hidden" name="userId" value="${user.userId}">
		                      <%-- <input type="hidden" name="profileName" value="${user.profileName}"> --%>
		                      <input type="hidden" name="publicStatus" value="${user.publicStatus}">
                              <div class="form-group row">
                                <label for="name" class="col-4 col-form-label">이름</label>
                                <div class="col-8">
                                  <input id="name" name="name" placeholder="이름" class="form-control here" type="text" required="required" value="${user.name}">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="nickname" class="col-4 col-form-label">닉네임</label> 
                                <div class="col-8">
                                  <input id="nickname" name="nickname" placeholder="닉네임" class="form-control here" required="required" type="text" value="${user.nickname}">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="schoolName" class="col-4 col-form-label">학교</label> 
                                <div class="col-8">
                                  <input id="schoolName" name="schoolName" placeholder="학교" class="form-control here" required="required" type="text" value="${user.schoolName}" readonly="readonly">
                                  <input type="hidden" name="schoolNo" value="${user.schoolNo}">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="birth" class="col-4 col-form-label">생일</label> 
                                <div class="col-8">
                                  <input id="birth" name="birth" placeholder="생일" class="form-control here" required="required" type="text" value="${user.birth}" readonly="readonly">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="mail" class="col-4 col-form-label">E-mail</label> 
                                <div class="col-8">
                                  <input id="mail" name="mail" placeholder="E-mail" class="form-control here" required="required" type="text" value="${user.mail}">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="phone" class="col-4 col-form-label">휴대폰번호</label> 
                                <div class="col-8">
                                  <input id="phone" name="phone" placeholder="'-'를 포함하여 입력해주세요" class="form-control here" required="required" type="text" value="${user.phone}">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="selfIntroduction" class="col-4 col-form-label">자기소개</label> 
                                <div class="col-8">
                                  <textarea id="selfIntroduction" name="selfIntroduction" cols="40" rows="4" class="form-control">${user.selfIntroduction}</textarea>
                                </div>
                              </div>
                              <div class="form-group row">
                                <div class="offset-4 col-8">
                                  <button id="updateProfileBtn" type="submit" class="btn btn-primary">수정</button>
                                </div>
                              </div>
                            </form>
		                </div>
		            </div>
		            
		        </div>
		    </div>
		</div>
		<div class="list2">
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12 userId" >
		                	<a href="#" class="profileName"><img src="/images/${user.profileName}" class="profileName"></a>
		                    <h5>${user.userId}</h5>
		                    <hr>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-md-12">
		                      <input type="hidden" name="userId" value="${user.userId}">
                              <div class="form-group row">
                                <label for="prePassword" class="col-4 col-form-label">이전 비밀번호</label> 
                                <div class="col-8">
                                  <input id="prePassword"  name="prePassword" placeholder="이전 비밀번호" class="form-control here" required="required" type="password">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="password" class="col-4 col-form-label">새 비밀번호</label> 
                                <div class="col-8">
                                  <input id="password" name="password" placeholder="새 비밀번호" class="form-control here" required="required" type="password">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="password2" class="col-4 col-form-label">새 비밀번호 확인</label> 
                                <div class="col-8">
                                  <input id="password2"  name="password2" placeholder="새 비밀번호 확인" class="form-control here" required="required" type="password">
                                </div>
                              </div>
                              <div class="form-group row">
                                <div class="offset-4 col-8">
                                  <button id="updatePasswordBtn" class="btn btn-primary">비밀번호 변경</button>
                                </div>
                              </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		</section>
	</div>
</div>	
	
</body>
</html>