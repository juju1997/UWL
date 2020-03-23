<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<!-- 참조 : http://getbootstrap.com/css/   참조 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
	    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
	    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
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
        body {
            font-size: 12px;
            color: #333;
            font-family: 'Roboto', sans-serif;
font-family: 'Nanum Gothic', sans-serif;
        }
        div.wrap {
            
            margin: 50px auto;
            width: 1050px;
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
        
        div.wrap > div:nth-child(4) table {
            
            border-top: 2px solid #EBAD7A;
            border-bottom: 2px solid #EBAD7A;
            width: 100%;
            border-collapse: collapse;
        }
        div.wrap > div:nth-child(4) table tr {
            
            line-height: 35px;
            border-bottom: 1px solid #eee;
        }
        
        
        div.wrap > div:nth-child(4) table tr td:nth-child(1) {
            width: 70px;
            text-align: center;
            border-right: 1px solid #eee;
            background-color: #fdfdfd;
        }
        div.wrap > div:nth-child(4) table tr td:nth-child(2) {
            padding-left: 30px;
        }
        
        
    </style>
<title>Insert title here</title>
</head>
<body>
<form>
 <div class="wrap">
       <div class="navigation">
           <span>홈 > 고객행복센터 ></span>
           <span>공지사항</span>
       </div>
        <div class="noticeTop">
            <span>공지사항</span>
            <span>어울림의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
        </div>
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
                    <td>${post.postTitle }</td>
                    <td>카테고리</td>
                    <!--  카테고리 번호에 따라서 나옴 -->
                    <c:if test="${post.gatherCategoryNo == '101'}">
                    <td>매칭</td>
                    </c:if>
                    <c:if test="${post.gatherCategoryNo == '102'}">
                    <td>아이템</td>
                    </c:if>
                     <c:if test="${post.gatherCategoryNo == '103'}">
                    <td>도전과제</td>
                    </c:if>
                     <c:if test="${post.gatherCategoryNo == '104'}">
                    <td>결제</td>
                    </c:if>
                     <c:if test="${post.gatherCategoryNo == '105'}">
                    <td>친구</td>
                    </c:if>
                     <c:if test="${post.gatherCategoryNo == '106'}">
                    <td>타임라인</td>
                    </c:if>
                     <c:if test="${post.gatherCategoryNo == '107'}">
                    <td>ASK</td>
                    </c:if>
                     <c:if test="${post.gatherCategoryNo == '108'}">
                    <td>계정</td>
                    </c:if>
                     <c:if test="${post.gatherCategoryNo == '109'}">
                    <td>알림</td>
                    </c:if>
                     <c:if test="${post.gatherCategoryNo == '110'}">
                    <td>위치</td>
                    </c:if>
                     <c:if test="${post.gatherCategoryNo == '111'}">
                    <td>기타</td>
                    </c:if>
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
        <div>${post.postContent }</div>
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
            <table>
                <tr>
                    <td>이전글</td>
                    <c:if test="${post2.prePostNo ne '0'}">
                    <td><a href="/post/getNotice?postNo=${post2.prePostNo }">${post2.prePostTitle}</a></td>
                    </c:if>
                    <c:if test="${post2.prePostNo eq '0'}">
                    <td><a href="#">이전글이 없습니다.</a></td>
                    </c:if>
                </tr>
                <tr>
                    <td>다음글</td>
                    <c:if test="${post2.nextPostNo ne '0'}">
                    <td><a href="/post/getNotice?postNo=${post2.nextPostNo }">${post2.nextPostTitle}</a></td>
                    </c:if>
                    <c:if test="${post2.nextPostNo eq '0'}">
                    <td><a href="#">다음글이 없습니다.</a></td>
                    </c:if>
                </tr>
                
            </table>
            <div class="list">
                <a href="/post/listNotice">목록</a>
                <c:if test="${user.role eq '4' }">
                <a href="/post/updateNotice?postNo=${post.postNo }">수정</a>
        <a href="/post/deleteNotice?postNo=${post.postNo }">삭제</a>
        </c:if>
        <a href="javascript:history.go(-1)">뒤로</a>
            </div>
            
            
                
                
        </div>
        
    </div>
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
   
    </form>
</body>
</html>