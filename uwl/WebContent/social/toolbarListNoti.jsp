<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="shortcut icon" href="/images/favicon1.ico" type="image/x-icon">
    <link rel="icon" href="/images/favicon1.ico" type="image/x-icon">
    <title>어울림</title>
    <style type="text/css">
    	
    </style>
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
        
	    //iscroll infinite scroll
	    myScroll.on('scrollEnd', function() {
	        var wrapperHeight = $('#wrapper').height();
	        var ulHeight = $('#wrapper ul').height();
	        var evtHeight = wrapperHeight - ulHeight;
	        if (this.y <= evtHeight + 1) {
				
	            notiListScroll();
	        }
	    });
    
    });
    
    
    var page = 1;

    function notiListScroll() {
        if (page <= ${map.resultPage.maxPage}) {
        	page++;
            console.log('page : ' + page);

            $.ajax({
                url: "/social/rest/getNotiList",
                method: "POST",
                dataType: "json",
                data: JSON.stringify({
                    currentPage: page
                }),
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json"
                },
                success: function(data) {
                    	console.log(data);
                    	for (var i = 0; i < data.list.length; i++) {
							
                    		var html = "<div class='tracking-item "+data.list[i].notiNo+"'>"
			                    		+"<div class='tracking-icon status-intransit'>"
						                  +"<img src='/images/"+data.list[i].sender.profileName+"'>"
						                  +"</div>"
						                  +"<div class='tracking-date'><span>"+data.list[i].notiDate+"</span></div>";
						                  
							if (data.list[i].notiOrigin == 1 && data.list[i].notiCode == 1) {
								html += "<div class='tracking-content'>"+data.list[i].sender.name+"님이 게시글에 댓글을 등록했습니다.<span><a href='/post/getBoard?postNo="+data.list[i].postNo+"'>해당 게시글로 이동</a></span></div>";
							}
							if (data.list[i].notiOrigin == 2 && data.list[i].notiCode == 5) {
								html += "<div class='tracking-content'>Ask에 질문이 등록되었습니다.<span><a href='/user/getProfile/"+data.list[i].receiverId+"'>내 ask로 이동</a></span></div>";
							}
							if (data.list[i].notiOrigin == 3 && data.list[i].notiCode == 1) {
								html += "<div class='tracking-content'>"+data.list[i].sender.name+"님이 타임라인에 댓글을 등록했습니다.<span><a href='/user/getProfile/"+data.list[i].receiverId+"'>내 타임라인으로 이동</a></span></div>";
							}
							if (data.list[i].notiOrigin == 4 && data.list[i].notiCode == 3) {
								html += "<div class='tracking-content'>"+data.list[i].sender.name+"님이 친구 요청을 보냈습니다.<span><a href='/user/getProfile/"+data.list[i].senderId+"'>"+data.list[i].sender.name+"님의 프로필로 이동</a></span></div>";
							}
							if (data.list[i].notiOrigin == 4 && data.list[i].notiCode == 4) {
								html += "<div class='tracking-content'>"+data.list[i].sender.name+"님이 친구 요청을 수락했습니다.<span><a href='/user/getProfile/"+data.list[i].senderId+"'>"+data.list[i].sender.name+"님의 프로필로 이동</a></span></div>";
							}
							if (data.list[i].notiOrigin == 5 && data.list[i].notiCode == 2) {
								html += "<div class='tracking-content'>1:1 문의사항의 답변이 완료되었습니다.<span><a href='/user/getProfile/"+data.list[i].receiverId+"'>내 프로필로 이동</a></span></div>";
							}
							if (data.list[i].notiOrigin == 6 && data.list[i].notiCode == 5) {
								html += "<div class='tracking-content'>누군가가 당신에게 꽃을 보냈습니다.<span><a href='/user/getUserQuestions/"+data.list[i].receiverId+"'>내 문의사항으로 이동</a></span></div>";
							}
                    		
                    		html += "<button class='btn btn-outline-secondary btn-sm' id='deleteNoti' style='float : right;'>삭제</button>";
			                html += "<input type='hidden' value='"+data.list[i].notiNo+"'/>";
                    		
                    		$(html).appendTo("div.tracking-list");
						}
                    	
                	
                        setTimeout(function() {
                            myScroll.refresh();
                        }, 0);
                }
            });
        }
    }
    
    
    
	
	
	//	알림 삭제
		$(document).on("click", "button#deleteNoti", function() {
			var notiNo = $(this).next().val();
	  		deleteNoti(notiNo);
		});
	
	//	링크 클릭 시 알림 삭제
		$(document).on("click", "span a", function() {
			var notiNo = $(this).parent().parent().next().next().val();
			deleteNoti(notiNo);
		});
	
	
		function deleteNoti(notiNo) {
	  		$.ajax({
	            url: "/social/rest/deleteNoti",
	            method: "POST",
	            headers: {
	                "Accept": "application/json",
	                "Content-Type": "application/json"
	            },
	            data: JSON.stringify({
	            	notiNo : notiNo
	            }),
	            success : function() {
					$("."+notiNo+"").remove();
				}
	            });
	  		notiIconLoad();
		}	
	
	</script>    
    
    
    <title>Document</title>
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

        a:hover {
            text-decoration: none;
            color: inherit;
        }

        body {

            color: #333;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;
        }



        section#left {

            height: 100vh;
            width: 250px;
            float: left;
            border-right: 1px solid #eee;
        }

        section#work {
            width: calc(100% - 600px);
            float: left;
            height: 100vh;
            overflow-y: scroll;
        }

        section#right {

            height: 100vh;
            width: 350px;
            float: right;
            overflow-y: scroll;
            border-right: 1px solid #eee;
        }

        .card-header,
        .card-footer {
            background-color: #fbebde;
        }

		div.tracking-content {
			display : inline-block;
		}
		
        .tracking-detail {
            padding: 3rem 0
        }

        #tracking {
            margin-bottom: 1rem
        }

        [class*=tracking-status-] p {
            margin: 0;
            font-size: 1.1rem;
            text-transform: uppercase;
            text-align: center
        }

        [class*=tracking-status-] {
            padding: 1.6rem 0
        }

        .tracking-status-intransit {
            background-color: #fbebde
        }

        .tracking-status-outfordelivery {
            background-color: #f5a551
        }

        .tracking-status-deliveryoffice {
            background-color: #f7dc6f
        }

        .tracking-status-delivered {
            background-color: #4cbb87
        }

        .tracking-status-attemptfail {
            background-color: #b789c7
        }

        .tracking-status-error,
        .tracking-status-exception {
            background-color: #d26759
        }

        .tracking-status-expired {
            background-color: #616e7d
        }

        .tracking-status-pending {
            background-color: #ccc
        }

        .tracking-status-inforeceived {
            background-color: #214977
        }

        .tracking-list {
            border: 1px solid #e5e5e5
        }

        .tracking-item {
            border-left: 1px solid #e5e5e5;
            position: relative;
            padding: 2rem 1.5rem .5rem 2.5rem;
            font-size: .9rem;
            margin-left: 3rem;
            min-height: 5rem
        }

        .tracking-item:last-child {
            padding-bottom: 4rem
        }

        .tracking-item .tracking-date {
            margin-bottom: .5rem
        }

        .tracking-item .tracking-date span {
            color: #888;
            font-size: 85%;
            padding-left: .4rem
        }

        .tracking-item .tracking-content {
            padding: .5rem .8rem;
            background-color: #f4f4f4;
            border-radius: .5rem
        }

        .tracking-item .tracking-content span {
            display: block;
            color: #888;
            font-size: 85%
        }

        .tracking-item .tracking-icon {
            line-height: 2.6rem;
            position: absolute;
            left: -1.3rem;
            width: 2.6rem;
            height: 2.6rem;
            text-align: center;
            border-radius: 50%;
            font-size: 1.1rem;
            background-color: #fff;
            color: #fff;
        }

        .tracking-item .tracking-icon.status-sponsored {
            background-color: #f68
        }

        .tracking-item .tracking-icon.status-delivered {
            background-color: #4cbb87
        }

        .tracking-item .tracking-icon.status-outfordelivery {
            background-color: #f5a551
        }

        .tracking-item .tracking-icon.status-deliveryoffice {
            background-color: #f7dc6f
        }

        .tracking-item .tracking-icon.status-attemptfail {
            background-color: #b789c7
        }

        .tracking-item .tracking-icon.status-exception {
            background-color: #d26759
        }

        .tracking-item .tracking-icon.status-inforeceived {
            background-color: #214977
        }

        .tracking-item .tracking-icon.status-intransit {
            color: #e5e5e5;
            border: 1px solid #e5e5e5;
            font-size: .6rem
        }

        @media(min-width:992px) {
            .tracking-item {
                margin-left: 10rem
            }

            .tracking-item .tracking-date {
                position: absolute;
                left: -10rem;
                width: 7.5rem;
                text-align: right
            }

            .tracking-item .tracking-date span {
                display: block
            }

            .tracking-item .tracking-content {
                padding: 0;
                background-color: transparent
            }
        }

        .tracking-icon img {
            width: 2.7rem;
            height: 2.7rem;
            border-radius: 50%;
        }

    </style>

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
            padding: 15px 0 0 15px;d
            position: relative;
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

		a#notiIcon {
			color: #EBAD7A;
			
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
    </style>
</head>

<body>
    <div class="layoutWrap2">
        <div class="leftToolbar2">
            <jsp:include page="/layout/left.jsp" />
        </div>
        <div class="work2" id="wrapper">
        <ul>
        <div class="mainHeader">
                 <div class="left2">
                     새로운 알림
                 </div>
                 <div class="right2">
                     <a href="#"><i class="far fa-star"></i></a>
                 </div>
            </div>
            <div>
                <div class="row">
                    <div class="col-md-12 col-lg-12">
                        <div id="tracking">
                            <!-- <div class="text-center tracking-status-intransit">
                                <p class="tracking-status text-tight">새로운 알림</p>
                            </div> -->
                            <div class="tracking-list" style="border:none;">
                                <c:forEach items="${map.list}" var="noti">
                                    <div class="tracking-item ${noti.notiNo}">
			                  <div class="tracking-icon status-intransit">
			                  <c:if test="${noti.notiOrigin ne 6}">
			                  <img src="/images/${noti.sender.profileName}">
			                  </c:if>
			                  <c:if test="${noti.notiOrigin eq 6}">
			                  <img src="/images/defaultProfile.png">
			                  </c:if>
			                  </div>
			                  <div class="tracking-date"><span>${noti.notiDate}</span></div>
			                  <c:if test="${noti.notiOrigin eq 1 }">
			                  	<c:if test="${noti.notiCode eq 1}">
			                  		<div class="tracking-content">${noti.sender.nickname}님이 게시글에 댓글을 등록했습니다.<span><a href="/post/getBoard?postNo=${noti.postNo}">해당 게시글로 이동</a></span></div>
			                  	</c:if>
			                  </c:if>
			                  <c:if test="${noti.notiOrigin eq 2 }">
			                  	<c:if test="${noti.notiCode eq 5 }">
			                  		<div class="tracking-content">Ask에 질문이 등록되었습니다.<span><a href="/user/getProfile/${user.userId }">내 ask로 이동</a></span></div>
			                  	</c:if>
			                  </c:if>
			                  <c:if test="${noti.notiOrigin eq 3 }">
			                  	<c:if test="${noti.notiCode eq 1 }">
			                  		<div class="tracking-content">${noti.sender.name}님이 타임라인에 댓글을 등록했습니다.<span><a href="/user/getProfile/${user.userId}">내 타임라인으로 이동</a></span></div>
			                  	</c:if>
			                  </c:if>
			                  <c:if test="${noti.notiOrigin eq 4 }">
			                  	<c:if test="${noti.notiCode eq 3 }">
			                  		<div class="tracking-content">${noti.sender.name}님이 친구 요청을 보냈습니다.<span><a href="/user/getProfile/${noti.senderId}">${noti.sender.name}님의 프로필로 이동</a></span></div>
			                  	</c:if>
			                  	<c:if test="${noti.notiCode eq 4 }">
			                  		<div class="tracking-content">${noti.sender.name}님이 친구 요청을 수락했습니다.<span><a href="/user/getProfile/${noti.senderId}">${noti.sender.name}님의 프로필로 이동</a></span></div>
			                  	</c:if>
			                  </c:if>
			                  <c:if test="${noti.notiOrigin eq 5 }">
			                  	<c:if test="${noti.notiCode eq 2 }">
			                  		<div class="tracking-content">1:1 문의사항의 답변이 완료되었습니다.<span><a href="/user/getUserQuestions/${noti.receiverId}">내 문의사항으로 이동</a></span></div>
			                  	</c:if>
			                  </c:if>
			                  <c:if test="${noti.notiOrigin eq 6 }">
			                  	<c:if test="${noti.notiCode eq 5 }">
			                  		<div class="tracking-content">누군가가 당신에게 꽃을 보냈습니다.<span><a href="/user/getProfile/${user.userId }">내 프로필로 이동</a></span></div>
			                  	</c:if>
			                  </c:if>
			                  <button class="btn btn-outline-secondary btn-sm" id="deleteNoti" style="float : right;">삭제</button>
			                  <input type="hidden" value="${noti.notiNo}"/>
			               </div>
                                </c:forEach>
                                <c:if test="${empty map.list}">
                                	<br><br><br><h4 class='text-center'>새로운 소식이 없습니다.</h4><br><br><br>
                                </c:if>
                            </div>
                        </div>
                    </div>
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
