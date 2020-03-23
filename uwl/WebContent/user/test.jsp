<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" 
integrity="sha384-v8BU367qNbs/aIZIxuivaU55N5GPF89WBerHoGA4QTcbUjYiLQtKdrfXnqAcXyTv" crossorigin="anonymous">



<!-- =========================================================== 날씨 api test ================================= -->



<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">

	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript"></script>

<script>


	$(document).ready(function(){
		$.ajax({
			
			//	REQUEST
			url: "/user/rest/getWeather", 
			type: 'POST',
			dataType: 'json',
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
            	user: "name21" //  
            }),
			
			// RESPONSE data => return 받은 값. ex) map, string ...
			success : function(data) {
				console.log(": Success");
				console.log(data);
				console.log(data.SKY);
				console.log(data.PTY);
				
				/* var html = "<i class='fas fa-sun'  id='"+data.SKY+"'>"+data.SKY+"</i>"
							+"<i class='fas fa-cloud-showers-heavy' id='"+data.PTY+"'>"+data.PTY+"</i>"; */
				
				if (data.SKY == 1) {
					var view = "<h1><a href='javascript:;'><i class='fas fa-sun' id='SKY1'> 맑음</i></a></h1>";
				}else if(data.SKY == 3){
					var view = "<h1><a href='javascript:;'><i class='fas fa-cloud' id='SKY3'> 구름 많음</i></a></h1>";
				}else if(data.SKY == 4){
					var view = "<h1><a href='javascript:;'><i class='fas fa-cloud-sun' id='SKY4'> 흐림</i></a></h1>";
				}$("div.weather").append(view);
				
							
				if(data.PTY == 1){
					var view = "<h1><a href='javascript:;'><i class='fas fa-cloud-showers-heavy' id='PTY1'> 비</i></a></h1>";
				}else if(data.PTY == 2){
					var view = "<h1><a href='javascript:;'><i class='fas fa-cloud-meatball' id='PTY2'> 비/눈</i></a></h1>";
				}else if(data.PTY == 3){
					var view = "<h1><a href='javascript:;'><i class='far fa-snowflake'  id='PTY3'> 눈</i></a></h1>";
				}else if(data.PTY == 4){
					var view = "<h1><a href='javascript:;'><i class='fas fa-cloud-sun-rain'  id='PTY4'> 소나기</i></a></h1>";
				}
				$("div.weather").append(view); 
			}, error: function(XMLHHttpRequest, textStatus, errorThrown) {
				console.log(": Fail");
			}
		})
	});

	
</script>
</head>

<body>

	<i class='fas fa-sun' id='SKY1'> 맑음</i> <br><br>
	<i class='fas fa-cloud' id='SKY3'> 구름 많음</i> <br><br>
	<i class='fas fa-cloud-sun' id='SKY4'> 흐림</i> <br><br>

	<i class='fas fa-cloud-showers-heavy' id='PTY1'> 비</i> <br><br>
	<i class='fas fa-cloud-meatball' id='PTY2'> 비/눈</i> <br><br>
	<i class='far fa-snowflake'  id='PTY3'> 눈</i> <br><br>
	<i class='fas fa-cloud-sun-rain'  id='PTY4'> 소나기</i> <br><br>
	<hr/>
 		${user.schoolName }
 		${user.schoolNo }
	<div class="weather"></div>
	
	
	
	
</body>
</html>