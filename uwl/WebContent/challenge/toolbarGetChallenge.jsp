<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="shortcut icon" href="/images/favicon1.ico" type="image/x-icon">
    <link rel="icon" href="/images/favicon1.ico" type="image/x-icon">
    <title>어울림</title>
    <style type="text/css">
    	
    </style>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/fb8ae6e812.js" crossorigin="anonymous"></script>
    <!-- 나눔고딕 -->
    

    <!-- sweetalert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
	
	<script src="/javascript/iscroll.js"></script>

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

        div.navigation {

            /*  margin-bottom: 5px; */
            
            text-align: right;
            padding-right: 10px;
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
        div.challenge table tr:nth-child(3) td:nth-child(3), 
        div.challenge table tr:nth-child(4) td:nth-child(1) {
            background-color: #fafafa;
			
            font-weight: bold;
        }

        div.challenge table tr td {

            padding: 0 15px;
        }
		div.challenge table tr:nth-child(5) td {
			padding: 10px 15px;
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
            padding-right: 10px;
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

        div.wrap>div:nth-child(5) table {

            border-top: 2px solid #EBAD7A;
            border-bottom: 2px solid #EBAD7A;
            width: 100%;
            border-collapse: collapse;
        }

        div.wrap>div:nth-child(5) table tr {

            line-height: 35px;
            border-bottom: 1px solid #eee;
        }


        div.wrap>div:nth-child(5) table tr td:nth-child(1) {
            width: 70px;
            text-align: center;
            border-right: 1px solid #eee;
            background-color: #fdfdfd;
        }

        div.wrap>div:nth-child(5) table tr td:nth-child(2) {
            padding-left: 30px;
        }

        /* 아이콘 색 지정*/
        div.work2 .fa-coins {
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
        
        
        #goMaster {
            transition: max-height 1s;
            max-height: 500px;
            padding-top: 10px;
        }
        #goMaster ul li:nth-child(1) {
        	color: #EBAD7A;
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
	        
	        /* 재이수정 */
	        $('#master').find('i:nth-child(3)').removeClass('fa-caret-down').addClass('fa-caret-up');
	        $('#challenge').find('i:nth-child(3)').removeClass('fa-caret-down').addClass('fa-caret-up');
		});	
	        
    
    	//$(function() {
   		$(document).ready(function(){
            ////////////////////////////////////////////
            //수정할것 삭제를 해서 챌린지넘버가 중간에 비면 오류가남
            ///////////////////////////////////////////

            //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
            /* $("#prePost").on("click", function() {
                var preChallNo = ${ preNextPost.preChallNo};
                console.log("preChallNo : " + preChallNo);
                alert("preChallNo : " + preChallNo);
                self.location = "/challenge/getChallengeAdmin?challNo=" + preChallNo;
            });

            $("#nextPost").on("click", function() {
                var nextChallNo = ${
                    preNextPost.nextChallNo
                }
                console.log("nextChallNo" + nextChallNo);
                alert("nextChallNo" + nextChallNo);
                self.location = "/challenge/getChallengeAdmin?challNo=" + nextChallNo;
            }); */

            /* update event */
            
            $("#updateButton").on("click", function() {
            	//alert("작동됨")
                var challNo = ${
                    challenge.challNo
                };
                console.log("challNo : " + challNo);
                self.location = "/challenge/updateChallenge/" + challNo;
            });

            /* delete event 
             $( "div.wrap > div:nth-child(4) a:contains('삭제')" ).on("click" , function() {
            	var challNo = ${challenge.challNo};
            	console.log("challNo : " + challNo);
             	self.location ="/challenge/deleteChallenge/" + challNo;
            }); */
            

            /* delete event */
            $("#deleteButton").on("click", function() {
            	//alert("작동됨")

                Swal.fire({
                    title: '삭제하시겠습니까?',
                    text: "삭제된 글은 복구되지 않습니다!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#cb4414',
                    cancelButtonColor: '#3c3c3c',
                    confirmButtonText: '삭제',
                }).then((result) =>{
                    if (result.value){
                        var challNo = ${
                            challenge.challNo
                        };
                        console.log("challNo : " + challNo);
                        Swal.fire({
                            icon: 'success',
                            title: '삭제가 완료 되었습니다.',
                            showConfirmButton: false,
                            timer: 1200
                        }).then((result) =>{
                            self.location = "/challenge/deleteChallenge/" + challNo;
                        })
                    }
                })
            });

        }); //end of function
    </script>

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
        
        /* 재이수정 */
        
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
            width: 90%;
            float: left;
        }
		div.mainHeader div.left2 span {
			font-weight: normal;
			font-size: 13px;
			margin-left: 10px;
		}
        div.mainHeader div.right2 {
            text-align: right;
            width: 10%;
            float: right;
        }

        div.mainHeader div.right2 i {
            vertical-align: baseline;
        }
        
        #goChallenge {
            transition: max-height 1s;
            max-height: 500px;
            padding-top: 10px;
        }
        #goChallenge ul li:nth-child(1) {
        	color: #EBAD7A;
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
        		<!-- 재이수정 -->
        		<div class="mainHeader">
                    <div class="left2">
                        도전과제 상세보기 <i class="fas fa-users" style="vertical-align:-1px;"></i>
                        
                        <c:if test="${user.role == '4'}">
                        <span>등록된 정보를 확인해 주세요.</span>
                    </c:if>
                    <c:if test="${user.role != '4'}">
                        <span>완료한 도전과제의 정보입니다.</span>
                    </c:if>
                    </div>
                    <div class="right2">
                        <a href="#"><i class="far fa-star"></i></a>
                    </div>
                </div>
            <div class="wrap">

                

                <c:if test="${user.role == '4'}">
                    <div class="navigation">
                        <div class="list">
                            <a href="/challenge/listAdminChallenge">목록</a>
                        </div>
                    </div>
                </c:if>

                <c:if test="${user.role != '4'}">
                    <div class="navigation">
                        <div class="list">
                            <a href="/challenge/listUserCompleteChallenge">내 목록</a>
                        </div>
                    </div>
                </c:if>

                <div class="challenge">
                    <table>
                        <colgroup>
                            <col width="15%">
                            <col width="35%">
                            <col width="15%">
                            <col width="35%">
                        </colgroup>
                        <tr><!-- 1번째 tr -->
                            <td>제목</td>
                            <td colspan="3" style="font-size: 25px">${challenge.challTitle}</td>
                        </tr>
                        <tr><!-- 2번째 tr -->
                            <td>카테고리</td>

                            <td>
                                <c:if test="${challenge.challCategory == '1'}">
                                    <i class="fas fa-map-marked-alt" style="font-size: 25px; "></i>&nbsp;&nbsp;Map&nbsp;&nbsp;
                                </c:if>
                                <c:if test="${challenge.challCategory == '2'}">
                                    <i class="fas fa-camera" style="font-size: 25px; "></i>&nbsp;&nbsp;Vision&nbsp;&nbsp;
                                </c:if>
                                <c:if test="${challenge.challCategory == '3'}">
                                    <i class="far fa-clipboard" style="font-size: 20px;vertical-align:-1px"></i>&nbsp;&nbsp;게시판활동&nbsp;&nbsp;
                                </c:if>
                            </td>
                            <td>작성일</td>
                            <td>${challenge.challDate}</td>
                            
                            
                        </tr>
                        <tr><!-- 3번째 tr -->
                        	<td>키워드</td>
                            <td>
                            
                             <c:if test="${challenge.challCategory == '1'}">
                            	 ${challenge.detailCategory}	
                             </c:if>
                             
                             <c:if test="${challenge.challCategory == '2'}">
                            	 ${challenge.detailCategory}	
                             </c:if>
                             
                             <c:if test="${challenge.challCategory == '3'}">
	                             <c:if test="${challenge.detailCategory == '201'}">
	                             	진학상담
	                             </c:if>
	                             <c:if test="${challenge.detailCategory == '202'}">
	                             	사랑과 이별
	                             </c:if>
	                             <c:if test="${challenge.detailCategory == '203'}">
	                             	남자끼리
	                             </c:if>
	                             <c:if test="${challenge.detailCategory == '204'}">
	                             	여자끼리
	                             </c:if>
	                             <c:if test="${challenge.detailCategory == '205'}">
	                             	데이트자랑
	                             </c:if>
	                             <c:if test="${challenge.detailCategory == '206'}">
	                             	대나무숲
	                             </c:if>
	                             <c:if test="${challenge.detailCategory == '댓글'}">
	                             	댓글
	                             </c:if>
                             </c:if>
                             
                            </td>
                            <td>포인트</td>
                            <td>+
                           	 <fmt:formatNumber value="${challenge.challReward}" pattern="#,###" /> 점 
                            </td>
                            
                        </tr>
                        <tr><!-- 4번째 tr -->
                            <c:if test="${challenge.challCategory == '3'}">
                                <td>달성조건</td>
                                <td>${challenge.postCommentComplete} 회 작성</td>
                            </c:if>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr><!-- 5번째 tr -->
                            <td colspan="4">
                                ${challenge.challContent}
                            </td>
                        </tr>
                    </table>
</div>
                <c:if test="${user.role == '4'}">
	                
	                <div class="bottom">
	                    <div class="list">
	                        <a href="#" id="updateButton">수정</a>
		            		<a href="#" id="deleteButton">삭제</a>
	                    </div>
	                </div>
                </c:if>

                <%-- <div>
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
                </div> --%>
               
            </div>
            </ul>
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
</body></html>