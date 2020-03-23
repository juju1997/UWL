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
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<!-- datepicker -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<!-- sweetalert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
	
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/fb8ae6e812.js" crossorigin="anonymous"></script>
    <!-- 나눔고딕 -->
  	<script>
    $(function() {
    	
    	
        myScroll = new IScroll('#wrapper', {
            mouseWheel: true,
            scrollbars: true
        });
        
        setTimeout(function() {
    		myScroll.refresh();
    	}, 50);
        
        $('#master').find('i:nth-child(3)').removeClass('fa-caret-down').addClass('fa-caret-up');
	});	
    </script>

    <style>
        div.challDate {
            text-align: right;
        }

        

        /* 아이콘 색 지정*/
        
        .fa-crown {
            color: #ffc811;
        }
        
        div.work2 .fa-coins {
            color: #ffc811;
        }

        div.work2 .fa-running {
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

        .fa-medal {
            color: #ffc811;
        }


        /* 등록 하기위해 내가 추가한 것 */
        div.addChallenge div.list {
            text-align: right;
            border-color: #c33214;
        }

        div.addChallenge div.list a {
            background-color: #EBAD7A;
            display: inline-block;
            line-height: 40px;
            padding: 0 65px;
            color: #fff;
            font-weight: bold;
            /* 재이수정 */
            margin: 20px 0 0 0;
            border-color: #c33214;
            border: medium;
        }

        #challengeBox {
            border-color: #ebad7a;
        }

        div.alert {
            background-color: #f4cdad;
            border-color: #f4cdad;
        }

        div.work2 img {
            display: none;
        }

        div.totalChallenge {
            font-size: 30px;
        }

    </style>
	<script src="/javascript/iscroll.js"></script>
    <script type="text/javascript">
    
	    var myScroll = null;
	    
	    $(document).ready(function() {
	    	 //alert("왜안돼")
	    	$("#startChallenge").empty();
	    	 
	    	$.ajax({
				url : "/challenge/rest/getWeeklyStart",
				method : "POST",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(data) {
					console.log("data ; " + data.weeklyStart);
					var weeklyStart = "관리자라면 등록자 상관없이 내용을 수정할 수 있습니다. <br>"
									+ "<b>도전과제 시작날짜: " + data.weeklyStart + "</b>"
					$("#startChallenge").append(weeklyStart);
					
					/* var weeklyStart = "<br>도전과제 시작날짜: " + data.weeklyStart; 
					alert("된다된다 ㅋㅋ : " + weeklyStart)
					$("#startChallenge").append(weeklyStart); */
					}
			}); //end of ajax 
        });
	    
	    
	    
		
        

    
        $(function() {
        	
        	/* 재이수정 */
        	
            

            //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
            $(".list-group-item").on("click", function() {
                var challNo = $(this).children('div').children("input[type='hidden']").val();
                console.log("challNo : " + challNo);
                self.location = "/challenge/getChallenge?challNo=" + challNo;
            });

           /*  $(".list a:contains('등록')").on("click", function() {
                alert("등록되는거임 ㅋㅋ") 
                self.location = "/challenge/addChallenge"
            });  */ 
            
            $("#addChall").on("click", function() {
                /* alert("등록되는거임 ㅋㅋ") */
                self.location = "/challenge/addChallenge"
            });
            $("#addWeeklyStart").on("click", function() {
                var weeklyStart = $("input[name='weeklyStart']").val();
					//alert("weeklyStart : " + weeklyStart);
				$("#startChallenge").empty();
				
                 $.ajax({
    				url : "/challenge/rest/addWeeklyStart",
    				method : "POST",
    				headers : {
    					"Accept" : "application/json",
    					"Content-Type" : "application/json"
    				},
    				data : JSON.stringify({
    					weeklyStart : weeklyStart
    				}),
    				success : function(data) {
    					Swal.fire({
    	                    icon: 'success',
    	                    title: '등록이 완료 되었습니다.',
    	                    showConfirmButton: false,
    	                    timer: 700
    	                })
    					//alert("data : " + data.weeklyStart)
    					var weeklyStart = "관리자라면 등록자 상관없이 내용을 수정할 수 있습니다. <br>"
							+ "<b>도전과제 시작날짜: " + data.weeklyStart + "</b>"
    					//alert("weeklyStart : " + weeklyStart)
						$("#startChallenge").append(weeklyStart);
   					}
    			}); //end of ajax
    			
            });
            
            //datepicker 옵션 설정
            $("#datepicker").datepicker({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
            });                    
            
            
            //주간도전과제 날짜 설정
            $("#datepicker").datepicker();


        });
        


        /* 페이지네비게이션 */
        function fncGetList(currentPage) {
            $("#currentPage").val(currentPage)
            /* alert("currPage"+currentPage); */
            $("form").attr("method", "POST").attr("action", "/challenge/listAdminChallenge").submit();
        }

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
            width: 50%;
            float: left;
        }

        div.mainHeader div.right2 {
            text-align: right;
            width: 50%;
            float: right;
        }

        div.mainHeader div.right2 i {
            vertical-align: baseline;
        }
        
        div.challengeChallCountent {
        	overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            /* 라인수 */
            -webkit-box-orient: vertical;
            word-wrap: break-word;
            line-height: 1.2em;
            max-height: 3.6em;
            /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
            margin-bottom: 10px;
        }
        
        #goMaster {
            transition: max-height 1s;
            max-height: 500px;
            padding-top: 10px;
        }
        #goMaster ul li:nth-child(1) {
        	color: #EBAD7A;
        }
        
        .list-group > a {
        	margin-bottom: 10px;
        }
        
        .list-group > a:last-child {
        	margin-bottom: 0;
        }
    </style>
    
</head>

<body>
    <div class="layoutWrap2">
        <div class="leftToolbar2">
            <jsp:include page="/layout/left.jsp" />
        </div>
        <div class="work2"  id="wrapper">
        	<ul>
        	<!-- 재이수정 -->
        	<div class="mainHeader">
                    <div class="left2">
                        주간 도전과제 목록 (관리자용)
                    </div>
                    <div class="right2">
                        <a href="#"><i class="far fa-star"></i></a>
                    </div>
                </div>
            <form class="form-inline">
            
            
                <div class="container-md">
                    
                    <div class="alert alert-secondary" role="alert" style="margin-top: 10px">
                        <font style="font-size: 20px" id="startChallenge"></font><br>
                        	
                        <div class="addChallenge">
                            <div class="list">
                                <a href="#" id="addChall">과제등록</a>
	                            <!-- 모달 실행 버튼 -->
                                <a href="#" data-toggle="modal" data-target="#myModal">날짜등록</a>
                            </div>
                        </div>
                    </div>
                    <div class="totalChallenge" style="float:left;">
                        총 <i class="fas fa-medal"></i> ${resultPage.totalCount} 등록
                    </div>
                    <br>
                    <br>
                    
                


                    <div class="list-group">
                        <c:forEach var="challenge" items="${list}">
                            <a href="#" class="list-group-item list-group-item-action" id="challengeBox" style="border-top:1px solid #EBAD7A;border-radius:.25rem;">
                                <div class="d-flex w-100 justify-content-between">
                                    <input type="hidden" value="${challenge.challNo}">
                                    <h5 class="mb-1" style="max-width:610px">${challenge.challTitle}</h5>
                                    <small class="text-muted">${challenge.challDate}</small>
                                </div>
                                <div class="challengeChallCountent">
                                ${challenge.challContent}
                                </div>
                                
                                <small class="text-muted">
                                    <c:if test="${challenge.challCategory == '1'}">
                                        <i class="fas fa-map-marked-alt" style="font-size: 25px; "></i>&nbsp;&nbsp;Map&nbsp;&nbsp;
                                    </c:if>
                                    <c:if test="${challenge.challCategory == '2'}">
                                        <i class="fas fa-camera" style="font-size: 25px; "></i>&nbsp;&nbsp;Vision&nbsp;&nbsp;
                                    </c:if>
                                    <c:if test="${challenge.challCategory == '3'}">
                                        <i class="far fa-clipboard" style="font-size: 25px; "></i>&nbsp;&nbsp;게시판활동&nbsp;&nbsp;
                                    </c:if>
                                    
                                     <i class="fas fa-coins" style="font-size: 25px; text-align: right;"></i>
                                     &nbsp;&nbsp;+ 
                                      <fmt:formatNumber value="${challenge.challReward}" pattern="#,###" />점 
                                </small>
                            </a>
                            
                        </c:forEach>
                    </div>
                    <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
                    <input type="hidden" id="currentPage" name="currentPage" value="" />
            </div>
            </form>

            

            <!-- PageNavigation Start... -->
            <jsp:include page="../common/pageNavigator_new.jsp" />
            <!-- PageNavigation End... -->

			
			</ul>
        </div>
    
    <div class="rightToolbar2">
        <jsp:include page="/layout/right.jsp" />
    </div>
  </div>
  
  <!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">


    <!-- Modal content-->
		    <div class="modal-content" >
		      <div class="modal-header">
		        <h4 class="modal-title">도전과제 시작</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		      <div class="modal-body">
		      	주간도전과제의 시작날짜를 설정할 수 있습니다.
		      	<br>
		        <br>
		    	시작날짜 : <input type="text" name="weeklyStart" id="datepicker" placeholder="여기를 클릭">
		    	<br>
		    	<br>
		        <small>
		        	*<b style="color: red;">설정된 날짜</b>에서 <b style="color: red;">00시00분</b>에 시작되며,<b style="color: red;">일주일동안</b> 주간 도전과제를 실행합니다.<br>
		       	</small>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" id="addWeeklyStart"  data-dismiss="modal">적용</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		      </div>
		    </div><!-- class modal -->

  </div>
</div>
  
  
</body>

</html>
