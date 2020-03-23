<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">

$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button").on("click", function() {
// 			self.location = "/user/getUser?userId=${user.userId}"
			$("form").attr("method" , "POST").attr("action" , "/user/updateQuestions").submit();
		});
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
    
    
</head>


<body>

<form>


<div class="wrap">
       <div class="navigation">
           <span>홈 > 고객행복센터 ></span>
           <span>내 문의사항 수정</span>
       </div>
        <div class="noticeTop">
            <span>내 문의사항 수정</span>
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
                    <td><input type="text" name="postTitle" value="${post.postTitle}"></td>
                    <td>카테고리</td>
                  <td> <select name="gatherCategoryNo">
					        <option value="101">매칭</option>
					        <option value="102">아이템</option>
					        <option value="103">도전과제</option>
					        <option value="104">결제</option>
					        <option value="105">친구</option>
					        <option value="106">타임라인</option>        
					        <option value="107">ASK</option>        
					        <option value="108">계정</option>        
					        <option value="109">알림</option>        
					        <option value="110">위치</option>        
					        <option value="111">기타</option>        
   						 </select></td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td>${post.userId }</td>
                    <td>공개여부</td>
                    <td><input type= "radio" id="viewStatus"	name="viewStatus"	value="1"	checked/> 공개
    					<input type= "radio" id="viewStatus"	name="viewStatus"	value="2"/> 비공개</td>
                    
                </tr>
                <tr>
                    <td>작성일</td>
                    <td>${post.postDate }</td>
                    <td>처리결과</td>
                    <td><c:if test="${post.questionStatus == '1' or post.questionStatus == null}">처리중</c:if>
						<c:if test="${post.questionStatus == '2'}">처리 완료</c:if></td>
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
                <a href="/user/getUserQuestions">목록</a>
        <a href="javascript:history.go(-1)">뒤로</a>
        <button type="button" id="updateQuestions">완료</button>
            </div>
            
        </div>
        
    </div>
    
		<input type="hidden" 	name="postNo"	 	value="${post.postNo}">
		<input type="hidden" 	name="postDate"	 	value="${post.postDate}">
		<input type="hidden" 	name="hitCount"		 value="${post.hitCount}">
		<input type="hidden" 	name="likeCount"	 value="${post.likeCount}">
		<input type="hidden" 	name="commentCount"	 value="${post.commentCount}">
	
	
<%-- 	아이디  : <input type="text"	name="userId"		 value="${user.userId}"		readonly> --%>
	
	<%-- 제목  : <div>${post.postTitle}</div><input type="text"		name="postTitle"	 value="${post.postTitle}">
	<br>
	<br>
	내용  : <div>${post.postContent}</div> <input type="text" 	name="postContent"	 value="${post.postContent}">
	<br>
	<br>
	
	  공개설정 :  <div>  <input type= "radio" id="viewStatus"	name="viewStatus"	value="1"	checked/> 공개
    <input type= "radio" id="viewStatus"	name="viewStatus"	value="2"/> 비공개
    </div>
  
  
    <br> 
    <br> 
    <br> 
	 --%>
	
	
</form>
	

</body>


</html>