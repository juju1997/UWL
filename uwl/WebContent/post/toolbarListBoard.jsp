<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="shortcut icon" href="/images/favicon1.ico" type="image/x-icon">
    <link rel="icon" href="/images/favicon1.ico" type="image/x-icon">
    <title>어울림</title>
    <style type="text/css">
    	
    </style>
    <meta charset="UTF-8">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/4b823cf630.js" crossorigin="anonymous"></script>
    
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
            color: #898989;
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



        /*main에 홈*/
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

        





        div.postList {
            padding: 10px 10px 0 10px;
        }

        div.postList div.post {
            background-color: #fff;
            overflow: hidden;

            padding: 10px;
            margin-bottom: 10px;
            
            
            
            box-shadow: 5px 5px rgb(238, 238, 238);
            border: 1px solid #eee;
            border-radius: 10px;
        }
        div.postList div.post:last-child {
        	margin-bottom: 0;
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
            width: calc(100% - 5px);
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

        div.wrap {
            position: relative;

        }

        div.a {
            width: 60px;
            height: 60px;
            background-color: #d4782b;

            border-radius: 50%;
            position: absolute;
            bottom: 25px;
            right: 10px;
            box-shadow: 3px 3px 5px #868686;
            font-size: 30px;
            text-align: center;
            line-height: 50px
        }

        div.a i {
            line-height: 60px;
            color: #fff;
        }
        
        div.addPostBtn {
        	width: 60px;
            height: 60px;
            background-color: rgb(232,115,123);

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
    </style>
    <script type="text/javascript">
    
    var myScroll = null;
    
    $(function() {
    	
        myScroll = new IScroll('#wrapper', {
            mouseWheel: true,
            scrollbars: true
        });
        
        setTimeout(function() {
    		myScroll.refresh();
    	}, 0);
    });
    
	    $(document).ready(function(){
	    	var userId = "${user.userId}";
	    	var gatherCategoryNo = "${gatherCategoryNo}";
	    	var postChallenge = "${postChallenge}";
			//alert("여기는 1번인거임 ㅋㅋ")
	    	if (postChallenge == '2') {
				//alert("if문 도는거임 ㅋㅋ 2번인거임 ㅋㅋ")
			 	//도전과제 수행하고 충족시키기 위한 조건 넘기는 부분
			     $.ajax({
					url : "/challenge/rest/completePostChallenge",
					method : "POST",
					dataType : "json",
					// postCategoryNo 는 사실 challenge 판단이었던거임 ㅋㅋ 1이면 레프트에서 2면 add에서
					data : JSON.stringify({
						userId: userId,
						gatherCategoryNo : gatherCategoryNo,
						postCategoryNo : postChallenge
					}),
					headers : {
	    				"Accept" : "application/json",
	    				"content-Type" : "application/json"
	    			},
	    			success : function(data){
	    				
	    				var challReward = data.challenge.challReward;
	    				completeResult = data.completeResult;
	    				//alert("ajax가동중")
	    				if (postChallenge == '2') {
		    				if (completeResult == true) {
			    							Swal.fire({
				    						  title: '축하합니다! ' + challReward + " 점 획득!",
				    						  width: 600,
				    						  padding: '3em',
				    						  backdrop: `
				    						    rgba(0,0,123,0.4)
				    						    url("/images/Congratulation-cat.gif")
				    						    center top
				    						    no-repeat
				    						  `
				    						})
							}
						}
	    				
	    				
	    			},
	    			error : function(){
	    				//alert("에러가 발생");
	    				//alert("님아 에러임 ㅋㅋuserID : " + userId+ "gatherCategoryNo : " + gatherCategoryNo+" postChallenge: " + postChallenge);
	    			}
						
				}) //challenge   
	    	}// 도전과제 ajax수행 로직 end of if
	    	
	    	$('.addPostBtn').on("click", function(){
	    		var gatherCategoryNo = ${gatherCategoryNo};
	    		self.location = "/post/addBoard?gatherCategoryNo="+gatherCategoryNo + "&postChallenge=2";
	    	});
	    	
	    	$('.post').on("click", function(){
	    		var postNo = $(this).children().find('.postNo').val();
	    		self.location = "/post/getBoard?postNo="+postNo;
	    	});
	    });
	    
	  //=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			var gatherCategoryNo = ${gatherCategoryNo};
			$("#currentPage").val(currentPage)
			$("form").attr("method","POST").attr("action","/post/listBoard").submit();
		}
		
		
		//============= "검색"  Event  처리 =============	이 위에꺼
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 
			 $("input[name=searchKeyword]").focus();
			 	
				$("input[name=searchKeyword]").keydown(function(key){
			    	if(key.keyCode == 13){
		    			fncGetList(1);
			    	}
			    } );
			 $( ".btn-default:contains('검색')" ).on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
					fncGetList(1);
				});
			 
			 $('#community').find('i:nth-child(3)').removeClass('fa-caret-down').addClass('fa-caret-up');
			 var category = $('.mainHeader .left2 span').text();
			 
			 console.log(category);
			 $('#goCommunity ul li:contains("' + category + '")').css({
				 'color': '#EBAD7A'
			 });
			 
		 });
	    
	    
	    
	    
    </script>

    <style>
        div.layoutWrap {

            width: 100%;
            min-height: 200vh;
            padding: 0 20%;
            position: relative;
        }

        div.leftToolbar {
            width: 20%;
            height: 100vh;

            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            background: #fff;
            border-right: 1px solid #eee;
        }

        div.rightToolbar {
            width: 20%;
            height: 100vh;

            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            background: #fff;
            border-left: 1px solid #eee;
        }
        
        #goCommunity {
            transition: max-height 1s;
            max-height: 500px;
            padding-top: 10px;
        }
        /* #goCommunity ul li:nth-child(1) {
        	color: #EBAD7A;
        } */
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
            <form>

                <div class="mainHeader">
                    <div class="left2">
                        <c:if test="${gatherCategoryNo eq '201' }">
                            <i class="fas fa-graduation-cap"></i> <span>진학상담</span>
                        </c:if>
                        <c:if test="${gatherCategoryNo eq '202' }">
                            <i class="fas fa-heart"></i> <span>사랑과 이별</span> <i class="fas fa-heart-broken"></i>
                        </c:if>
                        <c:if test="${gatherCategoryNo eq '203' }">
                            <i class="fas fa-male"></i> <span>남자끼리</span>
                        </c:if>
                        <c:if test="${gatherCategoryNo eq '204' }">
                            <i class="fas fa-female"></i> <span>여자끼리</span>
                        </c:if>
                        <c:if test="${gatherCategoryNo eq '205' }">
                            <i class="far fa-kiss-wink-heart"></i> <span>데이트자랑</span>
                        </c:if>
                        <c:if test="${gatherCategoryNo eq '206' }">
                            <i class="fas fa-bullhorn"></i> <span>대나무 숲</span>
                        </c:if>
                        <input type="hidden" class="gatherCategoryNo" name="gatherCategoryNo" value="${gatherCategoryNo }" id="gatherCategoryNo">
                        <input type="hidden" class="postChallenge" name="postChallenge" value="2" id="postChallenge">
                    </div>
                    <div class="right2">
                        <a href="#"><i class="far fa-star"></i></a>
                    </div>
                </div>
                

                <div class="postList">
					
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


                
                
				<!-- PageNavigation Start... -->
			<div>
					<jsp:include page="../common/pageNavigator_new.jsp"/>
				  
				<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
                  <!-- 1번을 고정값으로 주므로써  POST로 넘겨 페이지넘버링해도 포인트가 적립안되게 해놓음-->
                  <input type="hidden" name="postChallenge"value="1">
			</div>
				<!-- PageNavigation End... -->
				
        </form>
        
        
<!--         <form class="nav">
         페이징처리 ?? 
        </form> -->
            
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
</body></html>