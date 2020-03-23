<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<!-- 참조 : http://getbootstrap.com/css/   참조 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	    
	    <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	    
	    
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
	    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
  
  
  <style>
	body {
		background-color: #f9fad4;
		margin-top: 10px;
		margin: 50px;
		padding: 30px;
	}
	hr {
		background-color: black;
		height: 2px;
	}
</style>
  
<script type="text/javascript">
// function loadEvent(){
// 	$("title").on("click", function(){
// 		var userId = $(this).next().val();
		
// 		$.ajax(
// 				{
// 					url : "/user/rest/getUser/"+userId,
// 					method : "GET",
// 					dataType : "json",
// 					headers : {
// 						"Accept" : "application/json",
// 						"Content=Type" : "application/json",
// 					},
// 					success : function(JSONData, status){
// 						var displayValue = "<h6>"
// 						+" 아이디 "+JSONData.userId+"<br/>"
// 						+" 이름 "+JSONData.name+"<br/>"
// 						+"</h6>";
// 					$("h6").remove();
// 					$("#"+userId+"").html(displayValue);
// 					}
						
// 				});
// 	});
	
// 	$("#userId").on("click", function(){
// 		self.location="/user/getUser?userId="+$(this).text().trim();
// 	});
// 	$("#userId").css("color","red");
	
// }


//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			var i = $(".container").attr("method" , "POST").attr("action" , "/user/getUserList").submit();
		}
		
//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			 });
		 });
		 

function CheckAll(chkUserId){
				
				if( document.detailForm.chkAll.checked == true ) {
					for (i = 0; i < chkUserId.length; i++){
						chkUserId[i].checked = true ;
					}
				} else {
					for (i = 0; i < chkUserId.length; i++){
						chkUserId[i].checked = false;
					}
				}
			}
			
			
</script>
</head>


<body>
<h1>전체 회원 목록</h1>

<!--     <hr> -->
<%--     	<jsp:include page="/product/prodToolBar.jsp" /> --%>
 	<div class="container">
 		<br/>
 		<hr style="background-color:black; height:4px;">
 		
 		<div class="row" style="text-align:center;">
							<div class="col-md-1" style="text-align:left;">
										<input type="checkbox" name="chkAll" onclick="CheckAll(chkUserId)"/>
							</div>
							
							<div class="col-md-1" style="text-align:center;">
										아이디
							</div>
							<div class="col-md-1" style="text-align:center;">
										이름
							</div>
							<div class="col-md-1" style="text-align:center;">
										닉네임
							</div>
							<div class="col-md-2" style="text-align:center;">
										전화번호
							</div>
							<div class="col-md-1" style="text-align:center;">
										성별
							</div>
							<div class="col-sm-2" style="text-align:center;">
										생일
							</div>
							<div class="col-md-1" style="text-align:center;">
										학교
							</div>
							<div class="col-md-2" style="text-align:center;">
										메일
							</div>
							<br><hr>
		</div>
		
		
		<form>
		<c:set var="i" value="0"/>
<!--  		<div>  -->
 		<c:forEach var="user" items="${ list }">
		<c:set var ="i" value="${i}"/>

		<!-- 	<title="Click"> -->
		<input type="hidden" value = "${user.userId}">
		 <div class="row user" style="padding:0.5em;">	
		 
		<div class="col-md-1" style="text-align:left">
		<input type="checkbox" name="chkUserId" value="${user.userId}">
		</div>
		<div class="col-md-1" style="text-align:center;">
		<a href="/user/getUser?userId=${user.userId}">${user.userId}</a>
		</div>
		<div class="col-md-1" style="text-align:center;">
		<c:out value="${user.name}"></c:out> 
		</div>
		<div class="col-md-1" style="text-align:center;">
		<c:out value="${user.nickname}"></c:out> 
		</div>
		<div class="col-sm-2" style="text-align:center;">
		<c:out value="${user.phone}"></c:out> 
		</div>
		<div class="col-md-1" style="text-align:center;">
		<c:out value="${user.gender}"></c:out> 
		</div>
		<div class="col-sm-2" style="text-align:center;">
		<c:out value="${user.birth}"></c:out> 
		</div>
		<div class="col-md-1" style="text-align:center;">
		<c:out value="${user.schoolNo}"></c:out> 
		</div>
		<div class="col-md-1" style="text-align:center;">
		<c:out value="${user.mail}"></c:out> 
		</div>
		<!--   	</title> -->
		</div>
  		<hr>
 		 </c:forEach>
  		</form>
  		</div>
		<br>
    <br>

<!--     <button onclick="location.href='/user/addQuestions.jsp'">등록가기</button><br> -->
    <a href="javascript:history.go(-1)">뒤로</a>
    
    
    <!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
    
</body>
</html>
