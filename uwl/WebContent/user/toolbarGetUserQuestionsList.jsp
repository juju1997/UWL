<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
        <script src="/javascript/iscroll.js"></script>
        
        <script>
        var myScroll = null;

        $(function() {

            myScroll = new IScroll('#wrapper', {
                mouseWheel: true,
                scrollbars: true
            });

            setTimeout(function() {
                myScroll.refresh();
            }, 0);
            
            
        });
        </script>
    
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

        a:hover {
            text-decoration: none;
            color: inherit;
        }

        body {
            font-size: 16px;
            color: #333;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;
        }

        div.wrap {


            overflow: hidden;
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

        div.select {

            margin-bottom: 13px;
        }

        div.select select {

            height: 35px;

        }







        div.questionList table {

            border-top: 2px solid #EBAD7A;

            border-collapse: collapse;
            width: 100%;
        }

        div.questionList table tr {

            border-bottom: 1px solid #ddd;
            line-height: 50px;
        }



        div.questionList table tr td {

            text-align: center;
        }



        div.questionList table tr:nth-child(n + 2) td:nth-child(3) {
            text-align: left;
        }

        div.questionList table tr:nth-child(n + 2) td:nth-child(3) a {

            line-height: 50px;
            display: block;
        }

        div.questionList nav {

            padding: 15px 0;
            border-bottom: 1px solid #EBAD7A;
            margin-top: 50px;
        }


        div.main nav ul li a {

            padding: 10px 15px;
            color: #333;
            font-weight: bold;
        }

        div.main nav ul li.on a {
            background-color: #eee;

            color: #e9a064;

        }

        div.main nav ul li a:hover {
            background-color: #eee;

            color: #e9a064;
        }

        div.main nav ul li a:hover i {
            background-color: #eee;

            color: #333;
        }

        td.admin {

            vertical-align: top;
            line-height: 1;
            padding-right: 10px;
            padding-top: 25px;
            padding-bottom: 25px;
        }

        td.admin span {
            display: inline-block;

            background-color: rgb(255, 108, 104);
            padding: 3px 5px;
            font-size: 1px;
            color: #fff;
            font-weight: bold;
            border-radius: 5px;
        }

        td.admin i {
            vertical-align: middle;
            color: rgb(255, 108, 104);
        }

        td.answer {

            line-height: 1;
            padding-top: 25px;
            padding-bottom: 25px;
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
        
        #goMore {
            transition: max-height 1s;
            max-height: 500px;
            padding-top: 10px;
        }
        #goMore ul li:nth-child(2) {
        	color: #EBAD7A;
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



    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

    <script type="text/javascript">

    </script>

    <script>
 
 var questionPostNo = null;
	var targetUserId = "${targetUserId}";
	var sessionId = "${user.userId}";

	
	
        $(function() {
        	
        	$('#more').find('i:nth-child(3)').removeClass('fa-caret-down').addClass('fa-caret-up');
        	
            $(document).on('click', 'a[href="#"]', function(e) {
                e.preventDefault();
            });

            
            $('div.questionList table tr:nth-child(n + 2) td:nth-child(3)').on('click', function() {
                
                
                $('div.questionList table').find('.admin').parent().remove();
                var displayValue = '<tr class = "append">' +
                '<td colspan="1" class="admin" style="text-align: right;">' +
                '<span>A</span>' +
                ' <i class="fas fa-angle-right"></i>' +
                '</td>' +
                '<td colspan="2" class="answer" style="text-align: left">' +
                '<div class="commentForm">'
			       + '<textarea name="" id="" cols="70" rows="10" placeholder="답변입력" class="comment">'
			        + '</textarea>'
			        + '<p><a class="replyBtn"><i class="fas fa-pen"></i> 답변하기</a>'
			        + '<a class="closeBtn"><i class="far fa-hand-point-up"></i> 닫기</a></p>'
			    + '</div>';
                $(this).parent().after(displayValue);
                
                
                
            });
        });
        
        $(document).on("click", "a.replyBtn", function() {
			var content = $("textarea.comment").val();
			var questionPostNo = $(this).parent().parent().parent().parent().prev().find('input.postNo').val();
			
			console.log("content : " + content);
			console.log("번호  : " + questionPostNo);
			
			if (content.length < 1 || content == null || content == "") {
				var pureAlert = $.pureAlert.alert({
					title : "알림",
					content : "내용을 입력하세요.",
					okBtn : "확인",
					autoShow : true,
					closeButton : false
				});
				
				return;
			}
			
			$.ajax({
				url : "/user/rest/replyQuestion",
				method : "POST",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					userId : sessionId,
					questionPostNo : questionPostNo,
					answerContent : content,
					questionTitle : "문의사항답변등록"
				}),
				success : function(d) {
					$("div."+questionPostNo+"").remove();
					//alert("답변등록완료");
					swal.fire({
    			    title: "답변입력완료 !",
    			    icon: "success" //"info,success,warning,error" 중 택1
    			});
					$('tr.append').remove();
					
				}
			})
		})
		
		
		$(function() {
    	$(document).on('click', 'a.closeBtn', function() {
    		$('tr.append').remove();
    		
    	})
    	
    })
        
        
    //=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method","POST").attr("action","/user/getUserQuestionsList").submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 
			 $("input[name=searchKeyword]").focus();
			 	
				$("input[name=searchKeyword]").keydown(function(key){
			    	if(key.keyCode == 13){
		    			fncGetList(1);
			    	}
			    } );
			 $( ".btn-default:contains('검색')" ).on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
					fncGetList(1);
				});
			 
			 
		 });
		
		
		
    </script>

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
                     전체회원의 문의사항 목록
                     
                 </div>
                 <div class="right2">
                     <a href="#"><i class="far fa-star"></i></a>
                 </div>
            </div>
            <div class="wrap">
            
            

                <div class="main">
            
            <div class="select">
                <select name="gatherCategoryNo">
               			 <option>선택</option>
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
    				</select>
            </div>
           	 <div class="questionList">
				<input type="hidden"	id="postContent" name="postContent" value="${post.postContent}"/> <!--  이거 써먹고싶음  -->
					<table>
                    <colgroup>
                        <col width="10%">
                        <col width="15%">
                        <col width="65%">
                        <col width="10%">

                    </colgroup>
                    <tr>
                        <td>번호</td>
                        <td>카테고리</td>
                        <td>제목</td>
                        <td>처리여부</td>

                    </tr>
                    
                    
                    
					<c:set var="i" value="0"/>
						<c:forEach var="post" items="${ list }">
							<c:set var ="i" value="${i}"/>
								<c:if test="${post.postCategoryNo == '5' and post.postTitle !='문의사항답변등록' and post.viewStatus =='1'}">
						<tr>
								<td>
								<a class="postNo" href="/user/getQuestions?postNo=${post.postNo}">${post.postNo}</a>
								<input type="hidden" class="postNo" value="${post.postNo }"/>
								<%-- <input type="hidden" id="postNo" name="postNo" value="${post.postNo}"/> --%>
								</td>
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
                    
					<td>	<c:out value="${post.postTitle}"></c:out>	</td>
					
					 <c:if test="${post.questionStatus eq '1' or post.questionStatus == null}">
					<td>	처리중	</td>
					</c:if>
					
					<c:if test="${post.questionStatus eq '2'}">
					<td>	처리 완료	</td>
					</c:if>
						</tr>
						</c:if>
					  	</c:forEach>
                   
                </table>
			</div>
		<div class="notice">
            <div class="list">
        <a href="javascript:history.go(-1)">뒤로( 임시 )</a>
        <a href="/user/addQuestions">등록</a> <!--  수정필요  -->
    	</div>
            
        </div>
                <form class="form-inline" name="detailForm">
                
			    
				  
                <!-- PageNavigation Start... -->
					<jsp:include page="../common/pageNavigator_new.jsp"/>
				<!-- PageNavigation End... -->
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
	    	
				</form>
        </div>
            </div>
            </ul>
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
</body></html>