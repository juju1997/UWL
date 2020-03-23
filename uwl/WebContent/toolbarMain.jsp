<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="shortcut icon" href="/images/favicon1.ico" type="image/x-icon">
    <link rel="icon" href="/images/favicon1.ico" type="image/x-icon">
    <title>어울림</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--  CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
    <script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/4b823cf630.js" crossorigin="anonymous"></script>
    <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-messaging.js"></script>
    
    
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
            color: inherit;
            text-decoration: none;
        }

        body {

            color: #333;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;
        }

        img {
            vertical-align: middle;
        }

        i {
            vertical-align: middle;
        }

        input {
            vertical-align: middle;
        }

        select {
            vertical-align: middle;
        }

        a:hover,
        a:focus {
            text-decoration: none;
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

        div.addPostBtn {
            width: 60px;
            height: 60px;
            background-color: rgb(232, 115, 123);

            border-radius: 50%;
            position: fixed;
            bottom: 165px;
            right: 20px;


            text-align: center;
            color: #fff;
        }

        div.addPostBtn a {
            display: block;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 60px;
        }

        div.addPostBtn a div:nth-child(2) {
            font-size: 12px;
            font-weight: bold;
        }

        div.cummunityPostList {
            padding: 10px;
        }

        div.cummunityPostList div.post {
            background-color: #fff;
            overflow: hidden;

            padding: 10px;
            margin-bottom: 10px;



            box-shadow: 5px 5px rgb(238, 238, 238);
            border: 1px solid #eee;
            border-radius: 10px;
        }

        div.uploadFile {

            width: calc(30% - 10px);
            float: left;
            margin-right: 10px;
            height: 190px;
            overflow: hidden;

            border-radius: 10px;
            position: relative;
            background: rgb(238, 238, 238);
        }

        div.uploadFile img {
            width: 100%;

            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        div.post>a>div:nth-child(2) {

            width: 70%;
            float: right;

        }

        div.postTop {

            overflow: hidden;
            margin-bottom: 10px;


        }

        div.postTop div.postTitle {

            width: 75%;
            float: left;


        }

        p {
            margin: 0;
        }

        div.postTitle p {
            display: inline-block;


        }

        div.postTitle p:nth-child(1) {
            font-size: 20px;
            font-weight: bold;
            margin-right: 10px;
            width: calc(100% - 10px);
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            /* 라인수 */
            -webkit-box-orient: vertical;
            word-wrap: break-word;
            line-height: 1.2em;
            max-height: 2.4em;
            /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */


        }

        div.postTitle p:nth-child(2) {
            vertical-align: top;
            font-weight: bold;
            color: #d75e0f;
        }

        div.postCategory {

            display: inline-block;
            float: right;
            width: 25%;
            text-align: right;
			color: #898989;
            font-size: 14px;
        }

        div.postContent {

            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 4;
            /* 라인수 */
            -webkit-box-orient: vertical;
            word-wrap: break-word;
            line-height: 1.2em;
            max-height: 4.8em;
            /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
            margin-bottom: 10px;

        }

        div.postContent img {
            display: none;
        }

        div.post>a>div:nth-child(2)>div:nth-child(3) p {
            margin-right: 40px;
            display: inline-block;

            font-weight: bold;
        }

        div.post>a>div:nth-child(2) {

            height: 190px;
            position: relative;
        }

        div.post>a>div:nth-child(2)>div:nth-child(3) {

            position: absolute;
            bottom: 0;
        }
    </style>
    
    
    
	<script src="/javascript/iscroll.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            preventDefaultAnchor();


        });


        function preventDefaultAnchor() {
            $(document).on('click', 'a[href="#"]', function(e) {
                e.preventDefault();
            });
        }

        
        $(function() {
	        $("#schoolRankingMain").on("click", function() { //학교랭킹 nav
	        	//alert("dsds")
	            $(location).attr('href', "/schoolRank/listSchoolRanking");
	        });
	        
	        $(".userRanking").on("click", function() { //학교랭킹 nav
	        	//alert("작동중")
		        $('form').attr("method","POST").attr("action", "/schoolRank/listSchoolRanking").submit();
	        });
	        
        });
        var myScroll = null;
        /* var myScroll2 = null; */

        $(function() {

            myScroll = new IScroll('#wrapper', {
                mouseWheel: true,
                scrollbars: true,
                disablePointer: true,
                disableTouch: false,
                disableMouse: true
            });

            setTimeout(function() {
                myScroll.refresh();
            }, 0);

            /* myScroll2 = new IScroll('#wrapper2', {
                mouseWheel: true,
                scrollbars: true
            });

            setTimeout(function() {
                console.log("myScroll2 refresh");
                myScroll2.refresh();
            }, 0); */
            
            myScroll.on('scrollEnd', function() {
            	//alert("스크롤앤드에 접근")
                var wrapperHeight = $('#wrapper').height();
                var ulHeight = $('#wrapper ul').height();
                var evtHeight = wrapperHeight - ulHeight;

                if (this.y <= evtHeight + 100) {
                    console.log('wrapperHeight', wrapperHeight);
                    console.log('ulHeight', ulHeight);
                    console.log('evtHeight', evtHeight);
                    console.log('this.y', this.y);
                    mainPostListInfiniteScroll();
                }
            });
            
            
            
            
        });



        //////////////// FCM /////////////////
        const firebaseModule = (function() {
            async function init() {
                // Your web app's Firebase configuration
                if ('serviceWorker' in navigator) {
                    window.addEventListener('load', function() {
                        navigator.serviceWorker.register('/javascript/firebase-messaging-sw.js')
                            .then(registration => {
                                var firebaseConfig = {
                                    apiKey: "AIzaSyCP7-9lifICjBrXx38qVaYolWTYChiy9nU",
                                    authDomain: "webuwl.firebaseapp.com",
                                    databaseURL: "https://webuwl.firebaseio.com",
                                    projectId: "webuwl",
                                    storageBucket: "webuwl.appspot.com",
                                    messagingSenderId: "379855395449",
                                    appId: "1:379855395449:web:ef47774cfc1627f914d2a8",
                                    measurementId: "G-YJ4JNNVF8T"
                                };
                                // Initialize Firebase
                                firebase.initializeApp(firebaseConfig);


                                // Show Notificaiton Dialog
                                const messaging = firebase.messaging();
                                messaging.requestPermission()
                                    .then(function() {
                                        console.log('Have permission.');
                                        return messaging.getToken();
                                    })
                                    .then(async function(token) {
                                        await fetch('/user/rest/register', {
                                            method: 'post',
                                            body: token
                                        })
                                        messaging.onMessage(payload => {
                                            const title = payload.notification.title
                                            const options = {
                                                body: payload.notification.body
                                            }
                                            navigator.serviceWorker.ready.then(registration => {
                                                registration.showNotification(title, options);
                                            })
                                        })
                                    })
                                    .catch(function(err) {
                                        console.log("Error Occured");
                                    })

                            })
                    })
                }
            }

            return {
                init: function() {
                    init()
                }
            }
        })()

        firebaseModule.init();

        $(document).ready(function() {
            $(document).on("click",".post",function(){
                var postNo = $(this).children().find('.postNo').val();
                self.location = "/post/getBoard?postNo=" + postNo;
            });
        });
        
        
        //무한스크롤 시작--------------------------------------------------------------------------------------------------------------------------
        var mainPostListPage = 1;
		
        function mainPostListInfiniteScroll() {	//6개가 늘어날 때는
            if (mainPostListPage <= ${resultPage.maxPage}) {		//여길 안들어감 ㅋㅋ
            	mainPostListPage++;
                console.log('mainPostListPage : ' + mainPostListPage);

                $.ajax({
                    url: "/post/rest/listBoard",
                    method: "POST",
                    dataType: "json",
                    data: JSON.stringify({
                        currentPage: mainPostListPage
                    }),
                    headers: {
                        "Accept": "application/json",
                        "Content-Type": "application/json"
                    },
                    success: function(data) {
                    	
                    	var list = data.list;
                    	for(var i=0; i<list.length; i++){ //view 붙이기용 for문 ㅋㅋ
                    		
                    		
                    		if(list[i].gatherCategoryNo == '201'){
                    			var categoryView = '<i class="fas fa-graduation-cap"></i> 진학상담';
                    		}
                    		if(list[i].gatherCategoryNo == '202'){
                    			var categoryView = '<i class="fas fa-heart"></i> 사랑과 이별 <i class="fas fa-heart-broken"></i>';
                    		}
                    		if(list[i].gatherCategoryNo == '203'){
                    			var categoryView = '<i class="fas fa-male"></i> 남자끼리';
                    		}
                    		if(list[i].gatherCategoryNo == '204'){
                    			var categoryView = '<i class="fas fa-female"></i> 여자끼리';
                    		}
                    		if(list[i].gatherCategoryNo == '205'){
                    			var categoryView = '<i class="far fa-kiss-wink-heart"></i> 데이트 자랑';
                    		}
                    		if(list[i].gatherCategoryNo == '206'){
                    			var categoryView = '<i class="fas fa-bullhorn"></i> 대나무 숲';
                    		}
                    		
                    		var view = '<div class="post">'
                    						+ '<a href="#">'
                    							+ '<div class="uploadFile">'
                    								+ ' <img src="/images/'+list[i].uploadFileName+'" alt="">'
                    							+ '</div>'
                    							+ '<div>'
                    								+ '<div class="postTop">'
                    									+ '<div class="postTitle">'
                    										+ '<p>'+list[i].postTitle+'</p>'
                    										+ '<p>'+list[i].user.nickname+'</p>'
                    									+ '</div>'
                    									+ '<div class="postCategory">'
                    										+ categoryView
                    										+ ' <p>'+list[i].postDate+'</p>'
                    									+ '</div>'
                    								+ '</div>'
                    								+ '<div class="postContent">'
                    									+ list[i].postContent
                    								+ '</div>'
                    								+ '<div>'
                    									+ '<p><i class="far fa-comment"></i> '+list[i].commentCount+'</p>'
                    									+ '<p><i class="far fa-eye"></i> '+list[i].hitCount+'</p>'
                    									+ '<p><i class="far fa-heart"></i> '+list[i].likeCount+'</p>'
                    								+ '</div>'
                    							+ '</div>'
                    							+ '<input type="hidden" class="postNo" value="'+list[i].postNo+'">'
                    						+ '</a>'
                    					+ '</div>';
                    		$('.cummunityPostList').append(view);
                    	}
                          
                        setTimeout(function() {
                            myScroll.refresh();
                        }, 0);
                    },
                    error : function(){
                    	alert('에러');
                    }
                });
            }
        } //end of rewardListInfiniteScroll
        //무한스크롤 끝 ------------------------------------------------------------------------------------------------------------------------------------------
        
       $(function(){
    	   $(".noticeOne").on("click", function(){
    		  var noticeNo = $(this).find(".noticeNo").val()
    		  self.location = "/post/getNotice?postNo=" + noticeNo;
    	   });
    	   
    	   $('.addPostBtn').on("click", function(){
	    		var gatherCategoryNo = "0711";
	    		self.location = "/post/addBoard?gatherCategoryNo="+gatherCategoryNo + "&postChallenge=2";
	    	});
    	   
       });
        
        
        
    </script>
    <style>
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

        p {
            margin: 0;
        }



        div.image-slide {

            width: 770px;
            position: relative;
            box-sizing: border-box;
            padding-left: 100px;
            
        }

        div.image-slide>div.box {
            position: relative;
            height: 130px;
            overflow: hidden;
            
        }

        div.image-slide ul.slide {
            position: absolute;
            left: 0;
            top: 0;
            width: 5000px;
            
        }

        div.image-slide ul.slide li {
            float: left;

            padding: 0 10px;
            border-right: 1px solid #eee;
        }
        
        div.image-slide ul.slide li:nth-child(1) {
            border-left: 1px solid #eee;
        }

        div.image-slide ul.slide li a {
            display: block;
            width: 170px;
            height: 130px;
            
            
        }
        div.image-slide ul.slide li:last-child {
            
            font-size: 12px;
            color: #898989;
            text-align: center;
            position: relative;
        }
        div.image-slide ul.slide li:last-child div div:nth-child(1) {
            margin-bottom: 8px;
            
        }
        div.image-slide ul.slide li:last-child a > div {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            
            width: 100%;
        }
        div.image-slide ul.slide li:last-child a {
            width: 78px;
        }

        div.image-slide p.control a.prev {
            position: absolute;
            left: 0;
            top: 0;
            
            width: 100px;
            height: 100%;
            box-sizing: border-box;
            
            font-size: 20px;

            background-color: #e38c48;
            color: #fff;
            
        }

        div.weeklySchoolRanking div.rank {
            background-color: #979797;
            display: inline-block;
            padding: 2px 5px 24px 5px;
            position: relative;
            color: #fff;
            font-size: 13px;
        }
        div.weeklySchoolRanking div.rank span {
            font-size: 16px;
            font-weight: bold;
        }
        div.weeklySchoolRanking li:nth-child(1) div.rank {
            background-color: #b80014;
        }
        div.weeklySchoolRanking li:nth-child(2) div.rank {
            background-color: #d75e0f;
        }
        div.weeklySchoolRanking div.rank:after {
            content: '';
            display: block;

            position: absolute;
            bottom: 0;
            left: -2px;


            width: 0px;
            height: 0px;
            border-top: 18px solid none;
            border-bottom: 18px solid #fff;
            border-right: 18px solid transparent;
            border-left: 18px solid transparent;
        }

        div.weeklySchoolRanking div.schoolName {
            margin-left: 5px;
            display: inline-block;
            font-weight: bold;
            vertical-align: -5px;
            width: 75%;
            
            vertical-align: top;
        }

        div.weeklySchoolRanking div.schoolAddr {
            
            margin-top: 3px;
            font-size: 13px;
        }

        div.weeklySchoolRanking div.schoolScore {
            font-weight: bold;
            margin-top: 3px;
        }

        div.weeklyPersonalRanking div.banner-infinite {
            position: relative;

            
            padding-left: 100px;
        }

        div.weeklyPersonalRanking div.banner-infinite>div.box {
            position: relative;
            overflow: hidden;
            
        }

        div.weeklyPersonalRanking div.banner-infinite ul.banner {
            position: relative;
            width: 10000px;
            background-color: #dedede;
            
        }

        div.weeklyPersonalRanking div.banner-infinite ul.banner:after {
            content: '';
            display: block;
            clear: both;
        }

        div.weeklyPersonalRanking div.banner-infinite ul.banner li {
            position: relative;
            width: 120px;
            height: 35px;
            
            float: left;
            transition: transform 1s;
            margin-right: 20px;
            line-height: 35px;
            font-size: 13px;
            
        }
        div.weeklyPersonalRanking div.banner-infinite ul.banner li:after {
            content: '';
            display: block;
            width: 1px;
            height: 20px;
            background-color: #c2c2c2;
            position: absolute;
            right: -10px;
            top: 50%;
            transform: translateY(-50%);
        }


        div.weeklyPersonalRanking div.banner-infinite ul.banner li a {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
        }

        div.weeklyPersonalRanking ul.banner span {
            
            width: 20px;
            height: 20px;
            overflow: hidden;
            display: inline-block;
            border-radius: 50%;
            position: relative;
            vertical-align: -5.5px;
            margin-left: 5px;
        }

        div.weeklyPersonalRanking ul.banner span img {
            height: 100%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);

        }

        div.weeklyPersonalRanking div.banner-infinite p.control a.prev {
            position: absolute;
            left: 0;
            top: 0;
            
            width: 100px;
            height: 100%;
            box-sizing: border-box;
            color: #333;
            font-size: 13px;

            background-color: #c2c2c2;
            
        }
        
        div.weeklyPersonalRanking div.banner-infinite p.control a.prev span span {
            font-weight: bold;
        }

        div.weeklyPersonalRanking div.banner-infinite p.control a.prev > span,
        div.image-slide p.control a.prev > span {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 76px;
        }

        div.weeklyPersonalRanking div.banner-infinite p.control a.prev > span {
            width: 78px;
        }

        

        div.notice ul {
            
            padding: 15px;
            border-bottom: 1px solid #eee;
        }

        

        div.notice ul li a {
            

            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            /* 라인수 */
            -webkit-box-orient: vertical;
            word-wrap: break-word;
            line-height: 1.2em;
            height: 1.2em;
            /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
            margin-bottom: 10px;
            font-weight: bold;
        }

        div.notice ul li:last-child a {
            margin-bottom: 0;

        }

        div.notice ul li a span {
            color: #c33214;

            margin-right: 10px;
        }
        
        a#home {
        	color: #EBAD7A;
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
                <form>
                    <div class="mainHeader">
                        <div class="left2">
                            홈
                        </div>
                        <div class="right2">
                            <a href="#"><i class="far fa-star"></i></a>
                        </div>
                    </div>
                    <div class="mainMain">
                        <div class="weeklySchoolRanking">
                            <div class="image-slide">
                                <div class="box">
                                    <ul class="slide">
										<c:forEach var="schoolRank" items="${schoolList}" end="4">
                                        <li>
                                        	<a href="#">
                                                <div class="rank"><span>${schoolRank.ranking}</span>위</div>
                                                <div class="schoolName">${schoolRank.schoolName}</div>
                                                <div class="schoolAddr">${schoolRank.schoolAddress}</div>
                                                <div class="schoolScore"><fmt:formatNumber value="${schoolRank.totalActivityPoint}" pattern="#,###" /> 점</div>
                                            </a>
                                        </li>
                                        </c:forEach>
                                        <li><a href="#" id="schoolRankingMain">
                                                <div>
                                                    <div>학교별 랭킹<br>바로가기!</div>
                                                    <div><i class="fas fa-chevron-circle-right"></i></div>
                                                </div>
                                            </a></li>
                                    </ul>

                                </div>
                                <p class="control">
                                    <a href="#" class="prev" title="이전배너"><span>주간<br><span style="font-weight: bold">학교랭킹</span></span></a>
                                </p>
                            </div>
                        </div>
                        <div class="weeklyPersonalRanking">
                            <div class="banner-infinite">
                                <div class="box">
                                    <ul class="banner">
                                 	   <c:forEach var="userRank" items="${individualRank}" end="5">
	                                        <li>
	                                        	<a href="#" class="userRanking">
	                                                ${userRank.ranking}위 <span><img src="/images/bonobono.jpg" alt=""></span> ${userRank.userId}
	                                            </a>
	                                        </li>
                                 	   </c:forEach>
                                 	    <!-- 개인랭킹으로 넘어가기위한 hidden값 -->
                          		   		<!-- <input type="hidden" name="searchCondition" value="2"/> -->
                                    </ul>
                                </div>
                                <p class="control">
                                    <a href="#" class="prev" title="이전배너"><span>주간 <span>개인랭킹</span></span></a>
                                </p>
                            </div>
                        </div>
                        <div class="notice">
                            <ul>
                            	<c:forEach var="noticeList" items="${noticeList }" end="2">
	                                <li><a href="#" class="noticeOne">
	                                        <span>공지</span>${noticeList.postTitle }
	                                        <input type="hidden" class="noticeNo" value="${noticeList.postNo }">
	                                </a></li>
                            	</c:forEach>
                            </ul>
                        </div>
                        
                        <!-- POST -->
                        <div class="cummunityPostList">
                           <c:forEach var="post" items="${list }">
                            <div class="post">
                                <a href="#">
                                    <div class="uploadFile">
                                        <img src="/images/${post.uploadFileName}" alt="">
                                    </div>
                                    <div>
                                        <div class="postTop">
                                            <div class="postTitle">
                                                <p>${post.postTitle }</p>
                                                <p>${post.user.nickname }</p>
                                            </div>
                                            <div class="postCategory">
                                            <c:if test="${post.gatherCategoryNo eq '201' }">
                                                <i class="fas fa-graduation-cap"></i> 진학상담
                                            </c:if>
                                            <c:if test="${post.gatherCategoryNo eq '202' }">
                                                <i class="fas fa-heart"></i> 사랑과 이별 <i class="fas fa-heart-broken"></i>
                                            </c:if>
                                            <c:if test="${post.gatherCategoryNo eq '203' }">
                                                <i class="fas fa-male"></i> 남자끼리
                                            </c:if>
                                            <c:if test="${post.gatherCategoryNo eq '204' }">
                                                <i class="fas fa-female"></i> 여자끼리
                                            </c:if>
                                            <c:if test="${post.gatherCategoryNo eq '205' }">
                                                <i class="far fa-kiss-wink-heart"></i>데이트 자랑
                                            </c:if>
                                            <c:if test="${post.gatherCategoryNo eq '206' }">
                                                <i class="fas fa-bullhorn"></i> 대나무 숲
                                            </c:if>
                                                <p>${post.postDate }</p>
                                            </div>
                                        </div>
                                        <div class="postContent">
                                            ${post.postContent }
                                        </div>
                                        <div>
                                            <p><i class="far fa-comment"></i> ${post.commentCount }</p>
                                            <p><i class="far fa-eye"></i> ${post.hitCount }</p>
                                            <p><i class="far fa-heart"></i> ${post.likeCount }</p>
                                        </div>
                                    </div>
                                    <input type="hidden" class="postNo" value="${post.postNo}">

                                </a>
                            </div>
                            </c:forEach>
                        </div>
                        <!-- POST -->                        
                        
                    </div>
                </form>
            </ul>
            <div class="addPostBtn">
                <a href="#">
                    <div><i class="fas fa-pencil-alt"></i></div>
                    <div>글쓰기</div>
                </a>
            </div>
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>

    <script>
        setImageSlide('div.image-slide:eq(0)', 1, false, 2000);



        function setImageSlide(selector, first, status, speed) {
            var numSlide = $(selector).find('ul.slide li').length;
            var slideNow = 0;
            var slidePrev = 0;
            var slideNext = 0;
            var slideFirst = first;
            var timerId = null;
            var isTimerOn = status;
            var timerSpeed = speed;
            var startX = 0;
            var delX = 0;
            var offsetX = 0;
            var isClickBlocked = false;





            var offsetLeft = 0;
            var boxWidth = $('div.banner-slide div.box').innerWidth();
            var barWidth = 0;
            var minOffsetLeft = 0;
            var moveDistance = 190;
            var timerId = 0;
            
            



            // 초기화
            /*$(selector).find('ul.slide li').each(function(i) {
                $(this).css({
                    'left': (i * $(this).outerWidth(true)) + 'px',
                    'display': 'block'
                });
                $(selector).find('ul.indicator').append('<li><a href="#">' + (i + 1) + '번 슬라이드</a></li>\n');
            });*/

            $(selector).find('ul.slide li').each(function() {
                barWidth += $(this).outerWidth(true);
                console.log('$(this).outerWidth(true) : ' + $(this).outerWidth(true));
            });


            console.log('barWidth : ' + barWidth);
            $(selector).find('ul.slide').css({
                'width': barWidth + 'px'
            });
            


            if (isTimerOn === true) {
                $(selector).find('p.control a.play').addClass('on');
            } else {
                $(selector).find('p.control a.play').removeClass('on');
            }
            showSlide(slideFirst);

            $(selector).find('ul.indicator li a').on('click', function() {
                var index = $(selector).find('ul.indicator li').index($(this).parent());
                showSlide(index + 1);
            });
            $(selector).find('p.control a.prev').on('click', function() {
                $(this).stop(true).animate({
                    'left': '-70px'
                }, 50).animate({
                    'left': '-60px'
                }, 100);
                showSlide(slidePrev);
            });
            $(selector).find('p.control a.next').on('click', function() {
                $(this).stop(true).animate({
                    'right': '-70px'
                }, 50).animate({
                    'right': '-60px'
                }, 100);
                showSlide(slideNext);
            });
            $(selector).find('p.control a.play').on('click', function() {
                if (isTimerOn === true) {
                    clearTimeout(timerId);
                    $(this).removeClass('on');
                    isTimerOn = false;
                } else {
                    timerId = setTimeout(function() {
                        showSlide(slideNext);
                    }, timerSpeed);
                    $(this).addClass('on');
                    isTimerOn = true;
                }
            });
            
           
            
            /* console.log('myScroll : ' + myScroll);
            $(selector).find('ul.slide').on('click', function() {
            	console.log('clickkk');
            	myScroll.destroy();
            	myScroll = null;
            	
            }); */
            
            $(selector).find('ul.slide').on('mousedown', function(e) {
            	
            	/* console.log('mousedownkk'); */
            	/* myScroll.destroy(); */
            	/* console.log('myScroll.destroy()'); */
                clearTimeout(timerId);
                $(selector).find('ul.slide').css({
                    'transition': 'none'
                });
                startX = e.clientX;
                offsetX = $(this).position().left;
                console.log('offsetX : ' + offsetX);
                $(document).on('mousemove', function(e) {
                    e.preventDefault();
                    delX = e.clientX - startX;
                    if (Math.abs(delX) > 10) isClickBlocked = true;
                    if ((delX < 0 && slideNow === 3) || (delX > 0 && slideNow === 1)) {
                        delX = delX / 10;
                    }
                    
                    $(selector).find('ul.slide').css({
                        'left': (offsetX + delX) + 'px'
                    });
                });
                $(document).on('mouseup', function(e) {
                	
                	/* if(myScroll == null){
                		myScroll = new IScroll('#wrapper');
                	} */
                    if (delX < -50 && slideNow !== numSlide) {
                        showSlide(slideNext);
                    } else if (delX > 50 && slideNow !== 1) {
                        showSlide(slidePrev);
                    } else {
                        showSlide(slideNow);
                    }
                    $(document).off('mousemove mouseup');
                });
            });
            $(selector).find('ul.slide li a').on('click', function(e) {
                if (isClickBlocked === true) e.preventDefault();
                isClickBlocked = false;
            });

            function showSlide(n) {
                clearTimeout(timerId);
                if (slideNow === 0) {
                    $(selector).find('ul.slide').css({
                        'transition': 'none',
                        'left': -((n - 1) * 190) + 'px'
                    });
                } else {
                    $(selector).find('ul.slide').css({
                        'transition': 'left 0.3s',
                        'left': -((n - 1) * 190) + 'px'
                    });
                }
                $(selector).find('ul.indicator li').removeClass('on');
                $(selector).find('ul.indicator li:eq(' + (n - 1) + ')').addClass('on');
                slideNow = n;
                slidePrev = (n - 1) < 1 ? numSlide : n - 1;
                slideNext = (n + 1) > 3 ? 3 : n + 1;
                //console.log(slidePrev + ' / ' + slideNow + ' / ' + slideNext);
                if (isTimerOn === true) {
                    timerId = setTimeout(function() {
                        showSlide(slideNext);
                    }, timerSpeed);
                }
            }
        }




        var offsetLeft = 0;
        var boxWidth = $('div.banner-slide div.box').innerWidth();
        var barWidth = 0;
        var minOffsetLeft = 0;
        var moveDistance = 190;
        var timerId = 0;
        var isTimerOn = false;
        var timerSpeed = 3000;


        // 초기화
        $('div.banner-slide ul.banner li').each(function() {
            barWidth += $(this).outerWidth(true);
            console.log($(this).outerWidth(true));
        });
        console.log(barWidth);
        $('div.banner-slide ul.banner').css({
            'width': barWidth + 'px'
        });
        minOffsetLeft = -(barWidth - boxWidth);
        if (isTimerOn === true) {
            $('div.banner-slide p.control a.play').addClass('on');
            timerId = setTimeout(function() {
                moveBanner('next', 'auto');
            }, timerSpeed);
        } else {
            $('div.banner-slide p.control a.play').removeClass('on');
        }

        // 이벤트
        $('div.banner-slide p.control a.prev').on('click', function() {
            $(this).find('i').stop(true).animate({
                'left': '-3px'
            }, 50).animate({
                'left': 0
            }, 100);
            moveBanner('prev', 'manual');
        });
        $('div.banner-slide p.control a.next').on('click', function() {
            $(this).find('i').stop(true).animate({
                'right': '-3px'
            }, 50).animate({
                'right': 0
            }, 100);
            moveBanner('next', 'manual');
        });
        $('div.banner-slide p.control a.play').on('click', function() {
            if (isTimerOn === true) { // 끄기
                clearTimeout(timerId);
                $(this).removeClass('on');
                isTimerOn = false;
            } else { // 켜기
                timerId = setTimeout(function() {
                    moveBanner('next', 'auto');
                }, timerSpeed);
                $(this).addClass('on');
                isTimerOn = true;
            }
        });




        function moveBanner(direction, type) {
            clearTimeout(timerId);
            if (direction === 'prev') {
                if (offsetLeft === 0) {
                    $('div.banner-slide ul.banner').stop(true).animate({
                        'left': '10px'
                    }, 50).animate({
                        'left': 0
                    }, 100);
                } else {
                    offsetLeft += moveDistance;
                    if (offsetLeft > 0) offsetLeft = 0;
                    $('div.banner-slide ul.banner').stop().animate({
                        'left': offsetLeft + 'px'
                    }, 500);
                }
            } else if (direction === 'next') {
                if (offsetLeft === minOffsetLeft) {
                    if (type === 'auto') {
                        offsetLeft = 0;
                        $('div.banner-slide ul.banner').stop().animate({
                            'left': offsetLeft + 'px'
                        }, 500);
                    } else {
                        $('div.banner-slide ul.banner').stop(true).animate({
                            'left': (minOffsetLeft - 10) + 'px'
                        }, 50).animate({
                            'left': minOffsetLeft + 'px'
                        }, 100);
                    }
                } else {
                    offsetLeft -= moveDistance;
                    if (offsetLeft < minOffsetLeft) offsetLeft = minOffsetLeft;
                    $('div.banner-slide ul.banner').stop().animate({
                        'left': offsetLeft + 'px'
                    }, 500);
                }
            }
            if (isTimerOn === true) {
                timerId = setTimeout(function() {
                    moveBanner('next', 'auto');
                }, timerSpeed);
            }
        }

        setBannerInfinite('div.weeklyPersonalRanking div.banner-infinite');

        function setBannerInfinite(selector) {
            var numBanner = $(selector).find('ul.banner li').length;
            var bannerNow = 0;
            var bannerPrev = 0;
            var bannerNext = 0;
            var widthBox = $(selector).find('> div.box').innerWidth();
            var widthBar = 0;
            var offsetLeft = 0;
            var minNumSide = 0;
            var timerId = null;
            var isTimerOn = true;
            var timerSpeed = 3000;

            $(selector).find('ul.banner li').each(function(i) {
                widthBar += $(this).outerWidth(true);
                $(this).attr({
                    'data-num': (i + 1)
                });
                $(selector).find('ul.indicator').append('<li><a href="#">' + (i + 1) + '번 배너</a></li>');
            });
            $(selector).find('ul.banner').css({
                'width': widthBar + 'px'
            });
            if (isTimerOn === true) {
                $(selector).find('a.play').addClass('on');
            } else {
                $(selector).find('a.play').removeClass('on');
            }
            checkMinNumSide();
            showBanner(1);

            // 이벤트
            $(selector).find('ul.indicator li a').on('click', function() {
                var index = $(selector).find('ul.indicator li').index($(this).parent());
                showBanner(index + 1);
            });
            $(selector).find('a.prev').on('click', function() {
                showBanner(bannerPrev);
            });
            $(selector).find('a.next').on('click', function() {
                showBanner(bannerNext);
            });
            $(selector).find('a.play').on('click', function() {
                if (isTimerOn === true) {
                    clearTimeout(timerId);
                    $(this).removeClass('on');
                    isTimerOn = false;
                } else {
                    timerId = setTimeout(function() {
                        showBanner(bannerNext);
                    }, timerSpeed);
                    $(this).addClass('on');
                    isTimerOn = true;
                }
            });
            $(window).on('resize', function() {
                widthBox = $(selector).find('> div.box').innerWidth();
                checkMinNumSide(bannerNow);
                showBanner(bannerNow);
            });

            function showBanner(n) {
                clearTimeout(timerId);
                checkVisibility(n);
                var $bannerNow = null;
                $(selector).find('ul.banner li').each(function() {
                    if (Number($(this).attr('data-num')) === n) {
                        $bannerNow = $(this);
                        return false;
                    }
                });
                offsetLeft = -$bannerNow.position().left + (widthBox / 2) - $bannerNow.outerWidth() / 2;
                console.log('offsetLeft : ' + offsetLeft);
                if (bannerNow === 0) {
                    $(selector).find('ul.banner').css({
                        'transition': 'none',
                        'left': offsetLeft + 'px'
                    });
                } else {
                    $(selector).find('ul.banner').css({
                        'transition': 'left 1s',
                        'left': offsetLeft + 'px'
                    });
                }
                $(selector).find('ul.banner li').removeClass('on');
                $bannerNow.addClass('on');
                $(selector).find('ul.indicator li').removeClass('on');
                $(selector).find('ul.indicator li:eq(' + (n - 1) + ')').addClass('on');
                bannerNow = n;
                bannerPrev = (n - 1) < 1 ? numBanner : n - 1;
                bannerNext = (n + 1) > numBanner ? 1 : n + 1;
                if (isTimerOn === true) {
                    timerId = setTimeout(function() {
                        showBanner(bannerNext);
                    }, timerSpeed);
                }
            }

            function checkMinNumSide() {
                var widthBox = $(selector).find('> div.box').innerWidth();
                var sumWidth = 0;
                $(selector).find('ul.banner li').each(function(i) {
                    sumWidth += $(this).outerWidth(true);
                    if (sumWidth > widthBox) {
                        minNumSide = Math.floor((i + 1) / 2);
                        return false;
                    }
                });
                //console.log(minNumSide);
            }

            // 앞뒤로 minNumSide 갯수 만큼의 banner가 존재하도록 재배치
            function checkVisibility(n) {
                var $bannerNow = null;
                $(selector).find('ul.banner li').each(function() {
                    if (Number($(this).attr('data-num')) === n) {
                        $bannerNow = $(this);
                        return false;
                    }
                });
                for (var i = $bannerNow.prevAll().length; i < minNumSide; i++) {
                    $bannerNow.parent().prepend($(selector).find('ul.banner li:last').clone());
                    $(selector).find('ul.banner li:last').remove();
                    offsetLeft -= $(selector).find('ul.banner li:eq(0)').outerWidth(true);
                    $(selector).find('ul.banner').css({
                        'transition': 'none',
                        'left': offsetLeft + 'px'
                    });
                    console.log(offsetLeft);
                }
                for (var i = $bannerNow.nextAll().length; i < minNumSide; i++) {
                    $bannerNow.parent().append($(selector).find('ul.banner li:eq(0)').clone());
                    $(selector).find('ul.banner li:eq(0)').remove();
                    offsetLeft += $(selector).find('ul.banner li:last').outerWidth(true);
                    $(selector).find('ul.banner').css({
                        'transition': 'none',
                        'left': offsetLeft + 'px'
                    });
                }
            }
        }
    </script>
</body></html>
