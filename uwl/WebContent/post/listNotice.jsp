<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<link rel="shortcut icon" href="/images/favicon1.ico" type="image/x-icon">
    <link rel="icon" href="/images/favicon1.ico" type="image/x-icon">
    <title>어울림</title>
    <style type="text/css">
    	@font-face { font-family: 'GmarketSansMedium'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff'); font-weight: normal; font-style: normal; }
    	* {
            font-family: 'GmarketSansMedium';
        }
    </style>
	<meta charset="UTF-8">
		<!-- 참조 : http://getbootstrap.com/css/   참조 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
	    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
	    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
	    
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
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
            font-size: 12px;
            color: #333;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;
        }

        div.wrap {

            margin: 50px auto;
            width: 1065px;
            overflow: hidden;
        }

        div.leftNav {

            width: 205px;
            float: left;
        }

        div.navHeader {

            font-size: 25px;
            font-weight: bold;
            margin-bottom: 30px;
        }

        div.nav {

            margin-bottom: 15px;
        }

        div.nav ul {

            border: 1px solid #ddd;
            
        }

        div.nav ul li {

            line-height: 45px;
        }

        
        

        div.nav ul li.on {
            background-color: #eee;
            color: #e59b5e;
            font-weight: bold;
        }

        div.nav ul li+li {
            border-top: 1px solid #ddd;
        }

        div.nav ul li a {

            display: block;
            padding-left: 17px;
        }

        div.nav ul li a:hover {
            background-color: #eee;
            color: #e59b5e;
            font-weight: bold;
        }
        div.navFooter {
            background-color: #eee;
            padding: 10px 0;
        }

        div.navFooter a {

            display: block;
            line-height: 1.6;
            padding-left: 17px;
        }

        div.navFooter a p:nth-child(1) {

            font-weight: bold;
            font-size: 15px;
        }

        div.navFooter a p:nth-child(2) {

            font-size: 11px;
        }

        div.main {

            width: 1000px;
            float: center;
        }

        div.mainHeader {

            margin-bottom: 30px;
            padding-top: 2px;
        }

        div.mainHeader span:nth-child(1) {

            font-size: 23px;
            font-weight: bold;
            margin-right: 10px;
        }
        div.mainHeader div {

            font-size: 14px;
            font-weight: bold;
            margin-right: 10px;
            text-align: right;
        }
        
        
		div.noticeList div.addNotice {
            text-align: right;
        }
        div.noticeList div.addNotice a {
            background-color: #EBAD7A;
            display: inline-block;
            line-height: 25px;
            padding: 0 40px;
            color: #fff;
            font-weight: bold;
            margin: 20px 0;
            
        }




        div.noticeList table {

            border-top: 2px solid #EBAD7A;
            border-bottom: 2px solid #EBAD7A;
            border-collapse: collapse;
            width: 100%;
        }

        div.noticeList table tr {

            border-bottom: 1px solid #ddd;
            line-height: 50px;
        }

        div.noticeList table tr:nth-child(1) {
            font-weight: bold;
            background-color: #fdfdfd;
        }

        div.noticeList table tr td {

            text-align: center;
        }

        div.noticeList table tr td:nth-child(4),
        div.noticeList table tr td:nth-child(5) {
            color: #898989;
        }

        div.noticeList table tr:nth-child(n + 2) td:nth-child(2) {
            text-align: left;
        }
        nav {
            background-color: lavender;
        }
        div.searchpoint {
        text-align: center;
        }
        div.ul {
         text-align: center;
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
    <script>
    	$(function() {
    		$('#more').find('i:nth-child(3)').removeClass('fa-caret-down').addClass('fa-caret-up');
    	});
    </script>
</head>
<body>
    <form>
    
    
    <div class="wrap">
        
        <div class="main">
            <div class="mainHeader">
                <span>공지사항</span>
                <span>어울림의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
                <div>
                 검색 창 들어갈곳 </div>
                 <div>
                 <select name="gatherCategoryNo">
               			 <option>선택 이거 왼쪽으로 보내줭..</option>
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
    				</select></div>
            </div>
            <div class="noticeList">
                <table>
                
                <div class="addNotice">
                <c:if test="${user.role eq '4' }">
                <a href="/post/addNotice">공지사항 등록</a>
                </c:if>
                </div>
                    <colgroup>
                        <col width="10%">
                        <col width="5%">
                        <col width="55%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <tr>
                        <td>번호</td>
                        <td>카테고리</td>
                        <td>제목</td>
                        <td>작성자</td>
                        <td>작성일</td>
                        <td>조회</td>
                    </tr>
                    <c:forEach var="notice" items="${list }">
                    <tr>
                        <td>${notice.postNo }</td>
                        <c:if test="${notice.gatherCategoryNo == '101'}">
                    <td>매칭</td>
                    </c:if>
                    <c:if test="${notice.gatherCategoryNo == '102'}">
                    <td>아이템</td>
                    </c:if>
                     <c:if test="${notice.gatherCategoryNo == '103'}">
                    <td>도전과제</td>
                    </c:if>
                     <c:if test="${notice.gatherCategoryNo == '104'}">
                    <td>결제</td>
                    </c:if>
                     <c:if test="${notice.gatherCategoryNo == '105'}">
                    <td>친구</td>
                    </c:if>
                     <c:if test="${notice.gatherCategoryNo == '106'}">
                    <td>타임라인</td>
                    </c:if>
                     <c:if test="${notice.gatherCategoryNo == '107'}">
                    <td>ASK</td>
                    </c:if>
                     <c:if test="${notice.gatherCategoryNo == '108'}">
                    <td>계정</td>
                    </c:if>
                     <c:if test="${notice.gatherCategoryNo == '109'}">
                    <td>알림</td>
                    </c:if>
                     <c:if test="${notice.gatherCategoryNo == '110'}">
                    <td>위치</td>
                    </c:if>
                     <c:if test="${notice.gatherCategoryNo == '111'}">
                    <td>기타</td>
                    </c:if>
                        <td><a href="/post/getNotice?postNo=${notice.postNo }">${notice.postTitle }</a></td>
                        <td>${user.userId }</td>
                        <td>${notice.postDate }</td>
                        <td>${notice.hitCount }</td>
                    </tr>
                    </c:forEach>
                   
                </table>
                <br>
                
                <div class="searchpoint">
                검색창 들어갈곳</div>
                <br>
               
            </div>
            가운데로 보내줘..
    <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item">
                            <a class="page-link" href="#"><i class="fas fa-angle-double-left"></i></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#"><i class="fas fa-angle-left"></i></a>
                        </li>
                        <li class="page-item on"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#"><i class="fas fa-angle-right"></i></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#"><i class="fas fa-angle-double-right"></i></a>
                        </li>
                    </ul>
                </nav>
        </div>
    </div>
    
    
    
  
    </form>
</body>
</html>