<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="shortcut icon" href="/images/favicon1.ico" type="image/x-icon">
    <link rel="icon" href="/images/favicon1.ico" type="image/x-icon">
    <title>어울림</title>
    <style type="text/css">
    	
    </style>
    <meta charset="UTF-8">
    <!-- 참조 : http://getbootstrap.com/css/   참조 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
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
        
        $('#more').find('i:nth-child(3)').removeClass('fa-caret-down').addClass('fa-caret-up');
    });
	
	
	</script>

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
        h6 {
        	font-size: 16px;
        }



        div.navigation {

            margin-bottom: 5px;
            text-align: right;
            margin-right: 30px;
        }

        div.navigation span:nth-child(2) {

            font-weight: bold;
        }

        div.noticeTop {

            margin-bottom: 50px;
        }

        div.noticeTop span:nth-child(1) {

            font-size: 23px;
            font-weight: bold;
            margin-right: 10px;
        }


        div.notice table {

            border-top: 2px solid #EBAD7A;
            border-bottom: 2px solid #EBAD7A;
            width: 100%;
            border-collapse: collapse;
        }

        div.notice table tr {

            line-height: 45px;
            border-bottom: 1px solid #eee;
        }

        div.notice table tr:nth-child(1) td:nth-child(1),
        div.notice table tr:nth-child(2) td:nth-child(1),
        div.notice table tr:nth-child(3) td:nth-child(1),
        div.notice table tr:nth-child(3) td:nth-child(3) {
            background-color: #fdfdfd;

            font-weight: bold;
        }

        div.notice table tr td {

            padding-left: 15px;
        }

        div.notice table tr:nth-child(4) td {
            padding: 0;
            padding: 10px;
        }

        div.notice table tr td img {
            vertical-align: middle;

        }

        div.notice div.list {
            text-align: right;
        }

        div.notice div.list a {
            background-color: #EBAD7A;
            display: inline-block;
            line-height: 25px;
            padding: 0 40px;
            color: #fff;
            font-weight: bold;
            margin: 20px 0;

        }

        div.notice div.list input {
            background-color: #EBAD7A;
            display: inline-block;
            line-height: 25px;
            padding: 0 40px;
            color: #fff;
            font-weight: bold;
            margin: 20px 0;

        }

        div.wrap>div:nth-child(4) table {

            border-top: 2px solid #EBAD7A;
            border-bottom: 2px solid #EBAD7A;
            width: 100%;
            border-collapse: collapse;
        }

        div.wrap>div:nth-child(4) table tr {

            line-height: 35px;
            border-bottom: 1px solid #eee;
        }


        div.wrap>div:nth-child(4) table tr td:nth-child(1) {
            width: 70px;
            text-align: center;
            border-right: 1px solid #eee;
            background-color: #fdfdfd;
        }

        div.wrap>div:nth-child(4) table tr td:nth-child(2) {
            padding-left: 30px;
        }
        
        #goMore {
            transition: max-height 1s;
            max-height: 500px;
            padding-top: 10px;
        }
        #goMore ul li:nth-child(1) {
        	color: #EBAD7A;
        }
    </style>
    <title>Insert title here</title>

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
                     공지사항 수정
                     <span>어울림의 새로운 소식들과 유용한 정보들을 수정하세요.</span>
                 </div>
                 <div class="right2">
                     <a href="#"><i class="far fa-star"></i></a>
                 </div>
            </div>
            <form method="POST" action="/post/updateNotice">
                <input type="hidden" name="postNo" value="${post.postNo }">
                <div class="wrap">
                    
                    <div class="notice">
                        <table>
                            <colgroup>
                                <col width="10%">
                                <col width="40%">
                                <col width="10%">
                                <col width="40%">
                            </colgroup>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="postTitle" value="${post.postTitle }" style="line-height : 1"></td>
                                <td>카테고리</td>
                                <td><select name="gatherCategoryNo">
                                        <option value="101" ${post.gatherCategoryNo eq '101' ? "selected" : "" }>매칭</option>
                                        <option value="102" ${post.gatherCategoryNo eq '102' ? "selected" : "" }>아이템</option>
                                        <option value="103" ${post.gatherCategoryNo eq '103' ? "selected" : "" }>도전과제</option>
                                        <option value="104" ${post.gatherCategoryNo eq '104' ? "selected" : "" }>결제</option>
                                        <option value="105" ${post.gatherCategoryNo eq '105' ? "selected" : "" }>친구</option>
                                        <option value="106" ${post.gatherCategoryNo eq '106' ? "selected" : "" }>타임라인</option>
                                        <option value="107" ${post.gatherCategoryNo eq '107' ? "selected" : "" }>ASK</option>
                                        <option value="108" ${post.gatherCategoryNo eq '108' ? "selected" : "" }>계정</option>
                                        <option value="109" ${post.gatherCategoryNo eq '109' ? "selected" : "" }>알림</option>
                                        <option value="110" ${post.gatherCategoryNo eq '110' ? "selected" : "" }>위치</option>
                                        <option value="111" ${post.gatherCategoryNo eq '111' ? "selected" : "" }>기타</option>
                                        <!-- 기존 카테고리 selected-->
                                    </select></td>
                            </tr>
                            <tr>
                                <td>작성자</td>
                                <td>${post.userId }</td>

                            </tr>
                            <tr>
                                <td>작성일</td>
                                <td>${post.postDate }</td>
                                <td>조회수</td>
                                <td>${post.hitCount }</td>
                            </tr>
                            <td colspan="4">
                                <br>
                                <!--  내용  -->
                                <div><textarea cols="50" rows="10" name="postContent" style="resize:none ; width:100% ">${post.postContent }</textarea></div>
                                <br>
                            </td>
                            <tr>
                                <td colspan="4">
                                    <img src="img/e7b99206a6a2d1e0.webp" alt="">
                                </td>
                            </tr>
                        </table>


                    </div>
                    <div class="notice">
                        <div class="list">
                            <a href="/post/listNotice">목록</a>
                            <a href="/post/deleteNotice?postNo=${post.postNo }">삭제</a>
                            <a href="javascript:history.go(-1)">뒤로</a>
                            <input type="submit" value="등록">
                        </div>

                    </div>

                </div>

            </form>
            </ul>
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
</body></html>