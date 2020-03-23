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
    <!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> -->
   	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<!-- iscroll -->
	<script src="/javascript/iscroll.js"></script>
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/fb8ae6e812.js" crossorigin="anonymous"></script>
    <!-- 나눔고딕 -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">

    <style>
        div.challDate {
            text-align: right;
        }

        body {
            font-family: 'Nanum Gothic', sans-serif;
            font-family: 'Noto Sans KR', sans-serif;
        }

        /*  div.top{
       		background-color: gray;
        }
        
        #v-pills-tabContent{
        	background-color: blue;
        } */
        /* 포인트들의 내용 */
        /* .tab-pane {
        	border: 1px solid grey;
        } */

        /* 아이콘 색 지정*/
        /*도전과제 완료목록안에만 있는 코인에 색을 입힘*/
         div.work2 .fa-coins {
            color: #ffc811;
        }

        .fa-running {
            color: #28aa10;
        }

        .fa-credit-card {
            color: #1e291b;
        }

        .fa-calendar-check {
            color: #a72644;
        }

        .fa-map-marked-alt {
            color: #168641;
        }

        .fa-piggy-bank {
            color: #ffb8c6;
        }

        .fa-camera {
            color: rgb(12, 98, 183);
        }

        .fa-clipboard {
            color: rgb(4, 4, 5);
        }

        .fa-medal {
            color: #ffc811;
        }

        /* 등록 하기위해 내가 추가한 것 */
        div.addChallenge div.list {
            text-align: right;
        }

        div.addChallenge div.list a {
            background-color: #EBAD7A;
            display: inline-block;
            line-height: 40px;
            padding: 0 65px;
            color: #fff;
            font-weight: bold;
            margin: 20px 0;
        }

        #challengeBox {
            border-color: #ebad7a;
        }

        div.notice {
            border-color: #ebad7a;
            background-color: #ebad7a;
        }

        div.alert {
            border-color: #f4cdad;
            background-color: #f4cdad;
        }

        div.totalComplete {
            font-size: 30px;
        }

        div.work2 img {
           /*  display: none; */
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
        
        
        .introOut{
        	width: 96%;
        	text-align: center;
        	/* border: 1px solid black;   */
        	padding: 20px;
        	margin-bottom: 30px;
        }
        
        .introIn{
        	display: inline-block;
        	width: 80%;
        	/* border-bottom: 3px solid #ebad7a;  */
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
        
        /* 총 카운트 또르르 올라가는거*/
        .section4 {
            /* background: url(/images/trophy_complete.png) center top no-repeat; */
            background-size: cover;
            /*height: 621px;*/
            width: 100%;
        }

        .section4 .inner {
            width: 70%;
            margin: 0 auto;
            text-align: center;
        }

        .section4 .text p:nth-child(1) {
            font-weight: bold;
            color: #2b8ad9;
            margin-bottom: 10px;
        }

        .section4 .text p:nth-child(2) {
            font-size: 30px;
            margin-bottom: 40px;
        }

        .section4 .text p:nth-child(2) span {
            font-weight: bold;
            color: #3c3c3c;
        }

        .keyword {
            width: 100%;
            text-align: center;
          	padding-bottom: 50px; 
        }

        .section4 .keyword > div {
            width: 280px;
            text-align: center;
            border: 10px solid #e38c48;
            height: 280px;
            
            border-radius: 50%;
            display: inline-block;
            vertical-align: bottom;
            margin: 30px;
        }

        .keyword p {
            /* color: #e38c48; */
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .keyword span {
            font-weight: normal;
            color: #898989;
            font-size: 16px;
        }
        
        #goChallenge {
            transition: max-height 1s;
            max-height: 500px;
            padding-top: 10px;
        }
        #goChallenge ul li:nth-child(2) {
        	color: #EBAD7A;
        }
    </style>

    <script type="text/javascript">
    
    
    //아래 함수 call
    scrollCounting('div.keyword strong', 10, 3000);
    scrollCounting('div.keyword strong:eq(3)', 1, 5000);

    function scrollCounting(selector, step, duration) {
    	//도큐먼트가 시작되면 아래의 로직을 작동시켜라
    	$(document).ready(function() {
            var scrollTop = $(document).scrollTop();
            var $selector = $(this);
            var target = Number($selector.text());
            var numNow = 0;
            var numNowComma = '';
            var countStep = step;
            var timerSpeed = Math.round(duration / (target / countStep) );
            var isCounting = false;

            checkVisibility();

            /* $(window).on('scroll resize', function() {
                scrollTop = $(document).scrollTop();
                checkVisibility();
            }); */

            function checkVisibility() {
                var minShow = $selector.offset().top - $(window).height();
                var maxShow = $selector.offset().top + $selector.outerHeight();
                if (scrollTop >= minShow && scrollTop <= maxShow) {
                    if (isCounting === false) {
                        isCounting = true;
                        addNumber();
                    }
                } else {
                    numNow = 0;
                }
            }

            function addNumber() {
                numNow += countStep;
                if (numNow >= target) {
                    numNow = target;
                    numNowComma = numNow.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    $selector.text(numNowComma);
                    isCounting = false;
                } else {
                    numNowComma = numNow.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    $selector.text(numNowComma);
                    setTimeout(function() {
                        addNumber();
                    }, timerSpeed);
                }
            }
        });
    }
    
    
	    var myScroll = null;
	    
	    $(function() {
	    	
	        myScroll = new IScroll('#wrapper', {
	            mouseWheel: true,
	            scrollbars: true
	        });
	        
	        setTimeout(function() {
	    		myScroll.refresh();
	    		}, 0)
		});
	    
	    
	    
	    
	    
        $(function() {

            //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
            $(".list-group-item").on("click", function() {
                var challNo = $(this).children('div').children("input[type='hidden']").val();
                console.log("challNo : " + challNo);
                self.location = "/challenge/getChallenge?challNo=" + challNo;
            });

            $('#challenge').find('i:nth-child(3)').removeClass('fa-caret-down').addClass('fa-caret-up');

        });

        /* 페이지네비게이션 */
        function fncGetList(currentPage) {
            $("#currentPage").val(currentPage)
            /* alert("currPage"+currentPage); */
            $("form").attr("method", "POST").attr("action", "/challenge/listUserCompleteChallenge").submit();
        }
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
        
        div.mainHeader {

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

        div.mainHeader div.left2 {
            width: 50%;
            float: left;
        }

        div.mainHeader div.right2 {
            text-align: right;
            width: 50%;
            float: right;
        }

        div.mainHeader div.right2 i {
            vertical-align: baseline;
        }
        
        div.work2 div.list-group a + a {
        	margin-top: 10px;
        }
        
        div.work2 div.list-group a {
        	border-radius: .25rem;
        	border: none;
        	border: 1px solid #EBAD7A;
        }
    </style>
</head>

<body>
    <div class="layoutWrap2">
        <div class="leftToolbar2">
            <jsp:include page="/layout/left.jsp" />
        </div>
        <div class="work2"  id="wrapper">
        	<ul>
        	<div class="mainHeader">
                 <div class="left2">
                     ${user.name}님의 완료한 도전과제
                 </div>
                 <div class="right2">
                     <a href="#"><i class="far fa-star"></i></a>
                 </div>
            </div>
            <form class="form-inline">
            
           	<%-- <div class="header out">
			    <div class="header in" style="position:relative;">
		        	<h3 class="forBottomline" style="position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);">
		        		<b>${user.name} 님이(가)<br> 
		        		완료한 도전과제는
		        		</b>
		        	</h3> 
			    </div>
			</div> --%>
			
			
			<!-- 총 도전과제 완료 갯수 -->
			<div class="section4">
		        <div class="inner">
		            
		            <div class="keyword">
		                <div>
		                	<br>
		                	<br>
	                        <img src="/images/trophy_complete.png" style="width: 140px; height: 140px;">
	                        <br>
		                    <p style="margin-top:10px;">
	                       		총 <strong>${resultPage.totalCount}</strong>개<br>
		                    </p>
		                </div>
		            
		            </div>
		        </div>
		    </div>
		    
		    
		    
             <!-- 카드형식으로 변경 -->
             <div class="container-md">
             	<%-- <div class="card-deck">
             	<c:forEach var="challenge" items="${list}">
             		 <input type="hidden" value="${challenge.challNo}">
				  <div class="card">
				    <div class="card-body">
				      <h5 class="card-title">${challenge.challTitle}</h5>
				      <p class="card-text">
				      	 <i class="fas fa-coins" style="font-size: 25px; text-align: right;"></i>
				      	 	&nbsp;&nbsp; + ${challenge.challReward} 점
				      	 </p>
				    </div>
				    <div class="card-footer">
				      <small class="text-muted">${challenge.reward.variableDate} 완료</small>
				    </div>
				  </div>
				</c:forEach>
				</div> --%>
             	
             	
                    
                    <div class="list-group">
                        <c:forEach var="challenge" items="${list}">
                            <a href="#" class="list-group-item list-group-item-action" id="challengeBox">
                                <div class="d-flex w-100 justify-content-between">
                                    <input type="hidden" value="${challenge.challNo}">
                                    <h5 class="mb-1">${challenge.challTitle}</h5>
                                    <small class="text-muted">${challenge.reward.variableDate} 완료</small>
                                </div>
                                <br>
                               <%--  <p class="mb-1">${challenge.challContent}</p> --%>
                                <small class="text-muted">
                                    <c:if test="${challenge.challCategory == '1'}">
                                        <i class="fas fa-map-marked-alt" style="font-size: 25px; "></i>&nbsp;&nbsp;Map&nbsp;&nbsp;

                                    </c:if>
                                    <c:if test="${challenge.challCategory == '2'}">
                                        <i class="fas fa-camera" style="font-size: 25px; "></i>&nbsp;&nbsp;Vision&nbsp;&nbsp;
                                        <i class="fas fa-coins" style="font-size: 25px; text-align: right;"></i>&nbsp;&nbsp; + ${challenge.challReward}
                                    </c:if>
                                    <c:if test="${challenge.challCategory == '3'}">
                                        <i class="far fa-clipboard" style="font-size: 25px; "></i>&nbsp;&nbsp;게시판활동&nbsp;&nbsp;
                                        <i class="fas fa-coins" style="font-size: 25px; text-align: right;"></i>&nbsp;&nbsp; + ${challenge.challReward}
                                    </c:if>
                                </small>
                            </a>
                            
                        </c:forEach>
                    </div>
                    <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
                    <input type="hidden" id="currentPage" name="currentPage" value="" />
                    </div>
            </form>

            

            <!-- PageNavigation Start... -->
            <jsp:include page="../common/pageNavigator_new.jsp" />
            <!-- PageNavigation End... -->


			
        
        </ul>
    </div>
    <div class="rightToolbar2">
        <jsp:include page="/layout/right.jsp" />
    </div>
    </div>
</body></html>