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
        div.notice div.list input {
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
  <form method="POST" action="/post/updateNotice">  
  <input type="hidden" name="postNo" value="${post.postNo }">
  <div class="wrap">
       <div class="navigation">
           <span>홈 > 고객행복센터 ></span>
           <span>공지사항 수정</span>
       </div>
        <div class="noticeTop">
            <span>공지사항 수정</span>
            <span>어울림의 새로운 소식들과 유용한 정보들을 수정하세요.</span>
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
                    <td><input type="text" name="postTitle" value="${post.postTitle }" style="line-height : 1" ></td>
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
        <a href="/post/deleteNotice?postNo=${post.postNo }">삭제</a>
        <a href="javascript:history.go(-1)">뒤로</a>
        <input type="submit" value="등록">
    	</div>
            
        </div>
        
    </div>
  
   </form>
</body>
</html>