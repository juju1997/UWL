<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>Insert title here</title>

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



	<script type="text/javascript">

		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "input.btn.btn-primary" ).on("click" , function() {
				fncAddQuestions();
			});
		});	
		
		
		function fncAddQuestions() {
			
			var postTitle = $("input[name='postTitle']").val();
			var postContent = $("input[name='postContent']").val();

			if(postTitle == null || postTitle.length <1){
				alert("제목을 입력하세요.");
				return;
			}
			if(postContent == null || postContent.length <1){
				alert("내용을 입력하세요.");
				return;
			}

			$("form").attr("method" , "POST").attr("action" , "/user/addQuestions").submit();
		}

</script>
</head>


<body>
    <form>

<input type="hidden" id="userId" name="userId" value="${user.userId}"/>
 <div class="wrap">
       <div class="navigation">
           <span>홈 > 고객행복센터 ></span>
           <span>문의사항 등록</span>
       </div>
        <div class="noticeTop">
            <span>문의사항 등록</span>
            <span>문의사항을 등록해 보아요 </span>
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
                    <td><input type="text" id="postTitle" name="postTitle" placeholder="제목 입력"style="line-height : 1" ></td>
                    
                    <td>카테고리</td>
                    <td><select name="gatherCategoryNo">
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
                    <td>공개설정여부</td>
                    <td>
                    <input type= "radio" id="viewStatus"	name="viewStatus"	value="1"	checked/> 공개
    				<input type= "radio" id="viewStatus"	name="viewStatus"	value="2"/> 비공개
    				</td>
                    
                </tr>
                <td colspan="4">
        		 <div><input type= "text" id="postContent"	name="postContent"  placeholder="내용입력" name="postContent" style="resize:none ; width:100% ; height: 350px"/></div>
         		 
         		 <br>
         		</td>
                
               </table>
            
            
        </div>
        <div class="notice">
            <table>
                <tr>
                    
                </tr>
                
            </table>
            <div class="list">
                <a href="/user/getUserQuestions">목록</a>
        <a href="javascript:history.go(-1)">뒤로</a>
        <input type="submit" class="btn btn-primary" value="등록">
    	</div>
            
        </div>
        
    </div>
 
 
 
 
 
 
 
 
 
 <br>
     <br>
  
  
  

<input type= "hidden" />${post.hitCount}
<input type= "hidden" />${post.likeCount}
<input type= "hidden" />${post.commentCount}
<input type= "hidden" />${post.postDate}
<input type= "hidden" />${post.postNo}
    <br> 
    <br> 
    <br> 
          
          
          
          
          
<%-- <div><input type= "hidden" id="hitCount"	name="hitCount"	value="${post.hitCount}"/>${post.hitCount}</div> --%>
<!--     <br> -->
<!--              <br> -->
<%-- <div><input type= "hidden" id="likeCount"	name="likeCount"	value="${post.likeCount}"/>${post.likeCount}</div> --%>
<!--     <br> -->
<!--                  <br> -->
<%-- <div><input type= "hidden" id="commentCount"	name="commentCount"	value="${post.commentCount}"/>${post.commentCount}</div> --%>
<!--     <br> -->
    
    
    
    </form>
    
</body>
</html>
