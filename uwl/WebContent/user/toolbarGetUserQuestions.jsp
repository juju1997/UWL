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
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<!--  스위트 알랏또 -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
	



    <title>Insert title here</title>

    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/javascript/iscroll.js"></script>
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
    });
        // 	$(function() {
        // 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
        // 		$("button").on("click", function() {
        // 			self.location = "/user/updateUser?userId=${user.userId}";
        // 		});
        // 	});
    </script>
    <script>
    
    $(function() {
    	$(document).on('click', 'div.noticeList table tr:nth-child(n + 2) td:nth-child(2)', function() {
    		var postNo = $(this).find('#anserPostNo').val();
    		//alert(postNo);
    		
    		
    		if(postNo == '0'){
    			
    			swal.fire({
    			    title: "현재 처리중인 문의사항입니다",
    			    icon: "info" //"info,success,warning,error" 중 택1
    			});
    			
    			
    		
    						
    						
    						
    						
    						
    						
    				
    			    
    			    
    				
    			
    			
    			
    			/* var answer = "<<<   처리중인 문의사항입니다.   >>>"
    			
    			var displayValue = '<tr class="append">' +
	                '<td colspan="1" class="admin" style="text-align: right;">' +
	                '<span>A</span>' +
	                ' <i class="fas fa-angle-right"></i>' +
	                '</td>' +
	                '<td colspan="2" class="answer" style="text-align: left">' +
	               	answer +
	                '</td>' +
	                '<td></td>'+
	                '</tr>';
	                
	                $('.' + postNo).parent().parent().after(displayValue);  */
	                
	                
    		}else{
    		
    		$.ajax({
    			url: "/user/rest/getAnswer",
    			method : "POST",
    			headers : {
    				"Accept" : "application/json",
    				"Content-Type" : "application/json"
    			},
    			data : JSON.stringify({
    				
    				postNo : postNo
    			}),
    			success : function(data) {
    				//alert(data.post.postContent);
    				
    				var answer = data.post.postContent;
    				var date = data.post.postDate
    				
   					var displayValue =
   						'<tr class="append2">' +
   	                '<td colspan="1" class="admin" style="text-align: right;">' +
   	                '<span>A</span>' +
   	                ' <i class="fas fa-angle-right"></i>' +
   	                '</td>' +
   	                '<td colspan="2" class="answer" style="text-align: left">' +
   	               	answer +
   	                '</td>' +
   	                '<td>'+date+'</td>'+
   	                '</tr>';
   	                
   	             //$('.' + postNo).parent().parent().after(displayValue);
   	             	//alert("넣는값 :: " + displayValue);
   	             
   	             
   	                if($('tr.append2').hasClass('on')){
   	                	//alert("이프탄다");
   	                	$('tr.append2').removeClass('on');
   	                	$('tr.append2').remove();
   	                
   	                }else {
   	                	//alert("엘스탄다");
   	                 $('.' + postNo).parent().parent().after(displayValue);
   	                	$('tr.append2').removeClass('on');
   	                    $('tr.append2').addClass('on');
   	                	//$(this).remove();
   	                }
   	                
    				}  // 에이작스 성공시 호출하는 콜백함수
    			
    			});      // 에이작스
       		}    // 엘스 
    		  
    	});   // 클릭펑션
    });  // 전체펑션 
    
    
    $(function() {
    	$(document).on('click', 'tr.append', function() {
    		$(this).remove();
    		
    	})
    	
    })
    
    $(function() {
    	$(document).on('click', 'tr.append2', function() {
    		$(this).remove();
    	})
    	
    })
    
    
    
/* var answer = '';

 $(document).on("click", ".questionBox", function() {
	 
		var postNo = $(this).children().find('#anserPostNo').val();
		console.log("postNo", postNo);
		
		
		$.ajax({
			url : "/user/rest/getAnswer",
			method : "POST",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				
				postNo : postNo
			}),
			success : function(d) {
				//console.log(d.post.postContent);
				answer = d.post.postContent
				console.log(answer);
				
				//추가
				
				
				//추가끝
				
                
			}
		})
		
		
	})
	
 

 
        $(function() {
            $(document).on('click', 'a[href="#"]', function(e) {
                e.preventDefault();
            });

            
            $('div.noticeList table tr:nth-child(n + 2) td:nth-child(2)').on('click', function() {
                
                $('div.noticeList table').find('.admin').parent().remove();
                var displayValue = '<tr>' +
                '<td colspan="1" class="admin" style="text-align: right;">' +
                '<span>A</span>' +
                ' <i class="fas fa-angle-right"></i>' +
                '</td>' +
                '<td colspan="2" class="answer" style="text-align: left">' +
               	answer+
                '</td>' +
                '</tr>';
                $(this).parent().after(displayValue);
                
            });
        });  */
 
        
        //=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method","GET").attr("action","/user/getUserQuestions").submit();
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
			 $('#more').find('i:nth-child(3)').removeClass('fa-caret-down').addClass('fa-caret-up');
			 
		 });
        
        
        
          
    </script>
    <style>
    
    tr.append2 on{
          display: none;
           /*  display: block;  */
            
        }

    tr.append2 on {
            /* display: none;  */
            display: block;
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





        div.mainHeader {

            margin-bottom: 30px;
            padding-top: 2px;
        }

        div.mainHeader span:nth-child(1) {

            font-size: 23px;
            font-weight: bold;
            margin-right: 10px;
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

        div.noticeList div.addNotice button {
            background-color: #EBAD7A;
            display: inline-block;
            line-height: 25px;
            padding: 0 40px;
            color: #fff;
            font-weight: bold;
            margin: 20px 0;

        }




        div.noticeList table {

            border-top: 3px solid #EBAD7A;
            border-bottom: 3px solid #EBAD7A;
            border-collapse: collapse;
            width: 100%;
        }

        div.noticeList table tr {

            border-bottom: 2px solid #ddd;
            line-height: 40px;
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
    </style>

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
        #goMore {
            transition: max-height 1s;
            max-height: 500px;
            padding-top: 10px;
        }
        #goMore ul li:nth-child(2) {
        	color: #EBAD7A;
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
                     내가올린 문의사항
                     
                 </div>
                 <div class="right2">
                     <a href="#"><i class="far fa-star"></i></a>
                 </div>
            </div>
            <div class="wrap">
	
                <div class="main">
                    
                    <div class="noticeList">
                        <table>

                            <div class="addNotice">
                                <c:if test="${user.role eq '4' }">
                                    <button onclick="location.href='/user/getUserQuestionsList'" style="border:none">문의사항 전체목록</button>
                                </c:if>
                                <a href="/user/addQuestions">문의사항 등록</a>
                            </div>
                            <colgroup>
                                <col width="15%">
                                <col width="35%">
                                <col width="15%">
                                <col width="15%">
                            </colgroup>
                            <tr>
                                <td>수정 여부</td>
                                <td>제목</td>
                                <td>작성일</td>
                                <td>처리여부</td>
                            </tr>
                            <c:forEach var="notice" items="${list }">
                            <c:if test="${notice.postTitle ne '문의사항답변등록'}">
                                <tr class="questionBox">
                                 <c:if test="${notice.questionStatus eq '1' or notice.questionStatus == null}">
                                    <td><a href="/user/getQuestions?postNo=${notice.postNo }">수정가능</a></td>
                                    </c:if>
                                     <c:if test="${notice.questionStatus eq '2'}">
                                        <td>수정불가</td>
                                    </c:if>
	                                    <td>${notice.postTitle }
	                                    <input type="hidden" id="anserPostNo" name="anserPostNo" value="${notice.replyPostNo}" class="${notice.replyPostNo }"/>
                                    </td>
                                    <td>${notice.postDate }</td>
                                    <c:if test="${notice.questionStatus eq '1' or notice.questionStatus == null}">
                                        <td>처리중</td>
                                    </c:if>
                                    <c:if test="${notice.questionStatus eq '2'}">
                                        <td>처리 완료</td>
                                    </c:if>
                                </tr>
                                </c:if>
                            </c:forEach>

                        </table>
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
            </ul>
        </div>
        
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
</body></html>
