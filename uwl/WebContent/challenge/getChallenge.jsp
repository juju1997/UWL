<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
     
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/fb8ae6e812.js" crossorigin="anonymous"></script>
	<!-- 나눔고딕 -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    
    <!-- sweetalert -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
    
   
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
            
           /*  margin-bottom: 5px; */
            margin-bottom: 30px;
            text-align: right;
            margin-right: 30px;
        }
        
        div.navigation span:nth-child(2) {
            
            font-weight: bold;
        }
         div.challengeTop {
            
            /* margin-bottom: 50px; */
            margin-bottom: 5px;
        } 
        div.challengeTop span:nth-child(1) {
            
            font-size: 23px;
            font-weight: bold;
            margin-right: 10px;
        }
        
        
        div.challenge table {
            
            border-top: 2px solid #EBAD7A;
            border-bottom: 2px solid #EBAD7A;
            width: 100%;
            border-collapse: collapse;
        }
        div.challenge table tr {
            
            line-height: 45px;
            border-bottom: 1px solid #eee;
        }
        div.challenge table tr:nth-child(1) td:nth-child(1),
        div.challenge table tr:nth-child(2) td:nth-child(1),
        div.challenge table tr:nth-child(2) td:nth-child(3),
        div.challenge table tr:nth-child(3) td:nth-child(1),
        div.challenge table tr:nth-child(3) td:nth-child(3) {
            background-color: #fdfdfd;
            
            font-weight: bold;
        }
        div.challenge table tr td {
            
            padding-left: 15px;
        }
        div.challenge table tr:nth-child(4) td {
            padding: 0;
            padding: 10px;
        }
        div.challenge table tr td img {
            vertical-align: middle;
            
        }
        div.navigation div.list {
            text-align: right;
        }
        div.navigation div.list a {
            background-color: #EBAD7A;
            display: inline-block;
            line-height: 40px;
            padding: 0 65px;
            color: #fff;
            font-weight: bold;
            margin: 20px 0;
        }
        /* 수정삭제를 하기위해 내가 추가한 것 */
        div.bottom div.list {
            text-align: right;
        }
        div.bottom div.list a {
            background-color: #EBAD7A;
            display: inline-block;
            line-height: 40px;
            padding: 0 65px;
            color: #fff;
            font-weight: bold;
            margin: 20px 0;
        }
         /* 수정삭제를 하기위해 내가 추가한 것 */
        
        div.wrap > div:nth-child(5) table {
            
            border-top: 2px solid #EBAD7A;
            border-bottom: 2px solid #EBAD7A;
            width: 100%;
            border-collapse: collapse;
        }
        div.wrap > div:nth-child(5) table tr {
            
            line-height: 35px;
            border-bottom: 1px solid #eee;
        }
        
        
        div.wrap > div:nth-child(5) table tr td:nth-child(1) {
            width: 70px;
            text-align: center;
            border-right: 1px solid #eee;
            background-color: #fdfdfd;
        }
        div.wrap > div:nth-child(5) table tr td:nth-child(2) {
            padding-left: 30px;
        }
        
        /* 아이콘 색 지정*/
        .fa-coins {
        	color: #ffc811;
        }
        .fa-running {
        	color: #28aa10;
        }
        .fa-credit-card {
        	color: #1e291b;
        }
        .fa-calendar-check {
        	color: #a72644;
        }
        .fa-map-marked-alt {
        	color: #168641;
        }
        .fa-piggy-bank {
        	color: #ffb8c6;
        }
        .fa-camera {
        	color: rgb(12, 98, 183);
        }
        .fa-clipboard {
        	color: rgb(4, 4, 5);
        }
        .fa-users {
        	color: #3750d8;
        }
        
        /*삭제 알럿창 sweet alert2 */
        body {
		  font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif; 
		}
	        
    </style>
    <script type="text/javascript">
    $(function() {
    	////////////////////////////////////////////
		//수정할것 삭제를 해서 챌린지넘버가 중간에 비면 오류가남
		///////////////////////////////////////////
		
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 $( "#prePost" ).on("click" , function() {
			var preChallNo = ${preNextPost.preChallNo};
			console.log("preChallNo : "+ preChallNo); 
			alert("preChallNo : "+ preChallNo); 
			self.location ="/challenge/getChallengeAdmin?challNo="+ preChallNo;  
		});
		 
		$( "#nextPost" ).on("click" , function() {
			var nextChallNo = ${preNextPost.nextChallNo}
			console.log("nextChallNo" + nextChallNo); 
			alert("nextChallNo" + nextChallNo); 
			self.location ="/challenge/getChallengeAdmin?challNo="+nextChallNo;  
		});
		
		/* update event */
		$( "#updateButton" ).on("click" , function() {
			var challNo = ${challenge.challNo};
			console.log("challNo : " + challNo);
			self.location ="/challenge/updateChallenge/" + challNo;   
		});
		
		/* delete event 
		 $( "div.wrap > div:nth-child(4) a:contains('삭제')" ).on("click" , function() {
			var challNo = ${challenge.challNo};
			console.log("challNo : " + challNo);
		 	self.location ="/challenge/deleteChallenge/" + challNo;
		}); */
		
	/* delete event */
	 $( "#deleteButton" ).on("click" , function() {
	 	
		Swal.fire({
			  title: '삭제하시겠습니까?',
			  text: "삭제된 글은 복구되지 않습니다!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#cb4414',
			  cancelButtonColor: '#3c3c3c',
			  confirmButtonText: '삭제',
			}).then((result) => {
			  if (result.value) {
				  var challNo = ${challenge.challNo};
				  console.log("challNo : " + challNo);
				  Swal.fire({
					  icon: 'success',
					  title: '삭제가 완료 되었습니다.',
					  showConfirmButton: false,
					  timer: 1200
					}).then((result) => {
			 		   self.location ="/challenge/deleteChallenge/" + challNo;
					})	
			  }
			})
	}); 
		
	});	//end of function
	
    
    
    </script>
</head>
<body>
    <div class="wrap">
       
        <div class="challengeTop">
           <span>도전과제 상세보기  <i class="fas fa-users"></i></span>
            <br>
            <br>
            <c:if test="${user.role == '4'}">
            	<span>등록된 정보를 확인해 주세요.</span>
            </c:if>
            <c:if test="${user.role != '4'}">
            	<span>완료한 도전과제의 정보입니다.</span>
            </c:if>
        </div>
        
         <c:if test="${user.role == '4'}">
	        <div class="navigation">
	      	 <div class="list" >
	             <a href="/challenge/listAdminChallenge">목록</a>
	         </div>
	       </div>
         </c:if>
         
         <c:if test="${user.role != '4'}">
	        <div class="navigation">
	      	 <div class="list" >
	             <a href="/challenge/listUserCompleteChallenge">목록</a>
	         </div>
	       </div>
         </c:if>
        
        <div class="challenge">
            <table>
               <colgroup>
                   <col width="10%">
                   <col width="40%">
                   <col width="10%">
                   <col width="40%">
               </colgroup>
                <tr>
                    <td>제목</td>
                    <td colspan="3" style="font-size: 25px">${challenge.challTitle}</td>
                </tr>
                <tr>
                    <td>카테고리</td>
                    
                    <td>
                    	<c:if test="${challenge.challCategory == '1'}">
							<i class="fas fa-map-marked-alt" style="font-size: 25px; "></i>&nbsp;&nbsp;Map&nbsp;&nbsp;
						</c:if>
						<c:if test="${challenge.challCategory == '2'}">
							<i class="fas fa-camera" style="font-size: 25px; "></i>&nbsp;&nbsp;Vision&nbsp;&nbsp;
						</c:if>
						<c:if test="${challenge.challCategory == '3'}">
							<i class="far fa-clipboard" style="font-size: 25px; "></i>&nbsp;&nbsp;게시판활동&nbsp;&nbsp;
						</c:if>
                    </td>
                    <td>작성일</td>
                    <td>${challenge.challDate}</td>
                </tr>
                <tr>
                    <td><i class="fas fa-coins" style="font-size: 25px; text-align: right;" ></i>포인트</td>
                    <td>&nbsp; + ${challenge.challReward} </td>
                    <c:if test="${challenge.challCategory == '3'}">
	                    <td>달성조건</td>
	                    <td>${challenge.postCommentComplete}</td>
                    </c:if>
                </tr>
                <tr>
                    <td colspan="4">
                    	${challenge.challContent}
                    </td>
                </tr>
            </table>
            
        <c:if test="${user.role == '4'}">
        </div>
        <div class="bottom">
	        <div class="list" >
	             <a href="#" id="updateButton">수정</a>
	             <a href="#" id="deleteButton">삭제</a>
	        </div>
        </div>
         
        <div>
            <table>
                <tr>
                    <td>이전글</td>
                    <td><a id="prePost" href="#">${preNextPost.preChallTitle}</a></td>
                </tr>
                <tr>
                    <td>다음글</td>
                    <td><a id="nextPost" href="#">${preNextPost.nextChallTitle}</a></td>
                </tr>
            </table>
        </div>
         </c:if>
    </div>
</body>
</html>