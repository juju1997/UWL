<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        div.notice div.list button {
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

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">

// 	$(function() {
// 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
// 		$("button").on("click", function() {
// 			self.location = "/user/updateUser?userId=${user.userId}";
// 		});
// 	});
	
</script>
</head>


<body>



<div class="wrap">
       <div class="navigation">
           <span>홈 > 고객행복센터 ></span>
           <span>내 문의사항 보기</span>
       </div>
        <div class="noticeTop">
            <span>내 문의사항 보기</span>
            <span></span>
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
                    <td>공개여부</td>
                    <td><c:if test="${post.viewStatus == '1' or post.viewStatus == null}">
							공개
	</c:if>
	<c:if test="${post.viewStatus == '2'}">
							비공개
	</c:if></td>
                    
                </tr>
                <tr>
                    <td>작성일</td>
                    <td>${post.postDate }</td>
                    <td>처리결과</td>
                    <td><c:if test="${post.questionStatus == '1' or post.questionStatus == null}">
							처리중
	</c:if>
	<c:if test="${post.questionStatus == '2'}">
							처리 완료
	</c:if></td>
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
            
            <div class="list">
                <a href="/user/getUserQuestions">목록</a>
                <c:if test="${user.role eq '4' }">
                <button onclick="location.href='/user/getUserQuestionsList'">전체목록 ( 관리자 전용 )</button><br>
                </c:if>
                <a href="/user/updateQuestions?postNo=${post.postNo }">수정</a>
        <a href="/user/deleteQuestions?postNo=${post.postNo }">삭제( 미구현 ) </a>
        <!--  답변등록 부분 -->
        <c:if test="${user.role eq '4' }">
        <a href="/user/addAnswerQuestions?postNo=${post.postNo}">답변 등록하기 ( 관리자 전용 )</a>
        </c:if>
        <!--  여까지 -->
        <a href="javascript:history.go(-1)">뒤로</a>
            </div>
            
        </div>
        
    </div>
</body>
</html>
