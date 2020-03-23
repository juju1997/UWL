<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="shortcut icon" href="/images/favicon1.ico" type="image/x-icon">
    <link rel="icon" href="/images/favicon1.ico" type="image/x-icon">
    <title>어울림</title>
    <style type="text/css">
    	
    </style>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/fb8ae6e812.js" crossorigin="anonymous"></script>
    <!-- 나눔고딕 -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="/javascript/iscroll.js"></script>
	<script type="text/javascript">
	var myScroll = null;
    //var challNo = ${challenge.challNo}
	
    
    $(function() {
    	
        myScroll = new IScroll('#wrapper', {
            mouseWheel: true,
            scrollbars: true
        });
        
        setTimeout(function() {
    		myScroll.refresh();
    		}, 0);
        
        $(".work2 a").on("click", function() {
            //var challNo = $(".work2").children(".card-group").children(".card").children("input[type='hidden']").val();
            var challNo = $(this).parent().children("input[type='hidden']").val();
            console.log("challNo : " + challNo);
            //alert("challNo : " + challNo);
            self.location = "/challenge/getChallenge?challNo=" + challNo;
        });
        
        $('#challenge').find('i:nth-child(3)').removeClass('fa-caret-down').addClass('fa-caret-up');
        
	});
	</script>
    <style>
        div.challDate {
            text-align: right;
        }

        div.alert {
            background-color: #f4cdad;
            border-color: #f4cdad;
        }

        div.card-body {
            border-color: #ebad7a;
            border: medium;
        }

        div.card-footer {
            background-color: #ebad7a;
            border-color: #ebad7a;
        }
        
        #goChallenge {
            transition: max-height 1s;
            max-height: 500px;
            padding-top: 10px;
        }
        #goChallenge ul li:nth-child(1) {
        	color: #EBAD7A;
        }
        
    </style>

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
            /* width: 730px; */
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
        
        /* 도전과제 탭 접근시 초록색으로 변함 */
        .fa-running {
            color: #28aa10;
        }
        
        /* div 설정 */
        .out{
        	width: 96%;
        	text-align: center;
        	/* border: 1px solid black;  */
        	padding: 20px;
        	margin: 15px;
        }
        
        .in{
        	display: inline-block;
        	width: 80%;
        	/* border: 1px solid red; */ 
        	height: 200px;
        }
        
        
        .challDateOut{
        	width: 96%;
        	text-align: center;
        	/* border: 1px solid black;  */
        	padding: 20px;
        	margin: 15px;
        	margin-bottom: 30px;
        }
        
        .challDatein{
        	display: inline-block;
        	width: 70%;
        	border-bottom: 3px solid #ebad7a; 
        	height: 80px;
        } 
        
        h3 {
        	background: #fff;
        }
        
        h3.forBottomline:after {
        	content: '';
        	width: 450px;
        	height: 3px;
        	background-color: #ebad7a;
        	display: block;
        	position: absolute;
        	bottom: -30px;
        	left: 50%;
        	transform: translateX(-50%);
        }
        .card-img-top{
        	border-bottom: 1px solid gray;
        }
        
        div.mainHeader2 {

            line-height: 55px;
            font-weight: bold;
            padding-left: 15px;
            padding-right: 15px;
            font-size: 20px;
            width: 100%;
            overflow: hidden;
            border-bottom: 1px solid #ebebeb;
            background-color: #fff;
        }
        div.mainHeader2 div.left2 {
            width: 90%;
            float: left;
        }
		div.mainHeader2 div.left2 span {
			font-weight: normal;
			font-size: 13px;
			margin-left: 10px;
		}
        div.mainHeader2 div.right2 {
            text-align: right;
            width: 10%;
            float: right;
        }

        div.mainHeader2 div.right2 i {
            vertical-align: baseline;
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
        	<div class="mainHeader2">
                 <div class="left2">
                     진행중인 도전과제
                     <span>어울림 커뮤니티를 활동하여 도전하세요</span>
                 </div>
                 <div class="right2">
                     <a href="#"><i class="far fa-star"></i></a>
                 </div>
            </div>
        	<!-- <div class="header out">
			    <div class="header in" style="position:relative;">
		        	<h3 class="forBottomline" style="position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);">
		        		<b>어울림 커뮤니티를<br>
		        		활동하여&emsp;&emsp;&emsp;&emsp;<br>
		        			도전하세요&emsp;&emsp;&emsp;
		        		</b>
		        	</h3> 
			    </div>
			</div>
			
			<div class="header out">
				<img src="/images/list_challenge_background.jpg" style="max-width: 100%; height: auto;">
			</div> -->
			
			<!-- 시간 고지 및 상세사항 글쓰기 -->
			<div class="mid challDateOut">
				<div class="mid challDatein">
					<h3><b>도전과제 목록</b></h3>
					<span style="text-align: right;">자세한 사항은 아래 도전과제를 클릭해서 확인하세요.</span>
				</div>
			</div>
			
			<div class="card-group" style="width:100%">
			<c:forEach var="challenge" items="${list}">
				  <div class="card" style="width:calc(33.3333% - 20px);margin:0 10px;box-shadow:5px 5px #eee;border:none;border-radius:0;border:1px solid #eee;">
				 	 <input type="hidden" name="challNo" value="${challenge.challNo}" />
				   <c:if test="${challenge.detailCategory == '201'}">
				    	<a href="#" style="display:block;height:200px;overflow:hidden;"><img src="/images/study.png" class="card-img-top" style="width:100%;border:none"></a>
				   </c:if>
				   <c:if test="${challenge.detailCategory == '202'}">
				    	<a href="#" style="display:block;height:200px;overflow:hidden;"><img src="/images/broken_heart.jpg" class="card-img-top" style="width:100%;border:none"></a>
				   </c:if>
				   <c:if test="${challenge.detailCategory == '205'}">
				  	  <a href="#" style="display:block;height:200px;overflow:hidden;"><img src="/images/challenge_date.jpeg" class="card-img-top" style="width:100%;border:none"></a>
				   </c:if>
				   <c:if test="${challenge.detailCategory == '206'}">
				  	  <a href="#" style="display:block;height:200px;overflow:hidden;"><img src="/images/challenge_bamboo.jpg" class="card-img-top" style="width:100%;border:none"></a>
				   </c:if>
				   <c:if test="${challenge.detailCategory == '댓글'}">
				  	  <a href="#" style="display:block;height:200px;overflow:hidden;"><img src="/images/comment.jpg" class="card-img-top" style="width:100%;border:none"></a>
				   </c:if>
				   <!-- div 클릭시 상세정보 보기로 이동 -->
				    <a href="#">
					    <div class="card-body"">
					      <h5 class="card-title" style="font-weight:bold">${challenge.challTitle}</h5>
					      <p class="card-text">조건 : ${challenge.postCommentComplete}회 작성</p>
					      <p class="card-text"> 
					      <span class="badge badge-secondary" style="margin-top:5px;"> ${challenge.challReward}점</span>
					      <%-- <p class="card-text">${challenge.challContent}</p> --%>
					      <p class="card-text" style="text-align: right;margin-top:10px"><small class="text-muted" >${weeklyChallenge.weeklyEnd} 00:00분까지 진행</small></p>
					    </div>
				    </a>
				  </div>
            	</c:forEach>
				</div><!-- end of card-group -->
				
				<!-- 공백 footer -->
	            <div class="footer challDateOut">
						<div class="footer challDateIn">
						</div>
				</div>
            </ul>
        </div>
        
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
</body>
</html>