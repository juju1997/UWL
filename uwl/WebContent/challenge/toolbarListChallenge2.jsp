<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/fb8ae6e812.js" crossorigin="anonymous"></script>
    <!-- 나눔고딕 -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
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
	</script>
    <style>
        div.challDate {
            text-align: right;
        }

        div.alert {
            background-color: #f4cdad;
            border-color: #f4cdad;
        }

        div.card-body {
            border-color: #ebad7a;
            border: medium;
        }

        div.card-footer {
            background-color: #ebad7a;
            border-color: #ebad7a;
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
        
        /* 도전과제 탭 접근시 초록색으로 변함 */
        .fa-running {
            color: #28aa10;
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
            <div>

                <div>
                    <br>
                    <h2>주간 도전과제 목록
                        <span class="badge badge-danger">New</span>
                    </h2>

                    <br>
                    <div class="alert alert-secondary" role="alert">
                        <b>주간도전과제를 수행하고 포인트(활동점수)를 획득하세요!</b> <br>
                        획득한 점수는 아이템을 구매하거나 학교랭킹에 반영됩니다.<br>
                        <small class="text-muted">${challenge.weeklyStart}부터 ${challenge.weeklyEnd}까지 진행됩니다. <br /></small>
                    </div>
                </div>

                <div>
                    <c:forEach var="challenge" items="${list}">
                        <div class="card-group">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">${challenge.challTitle}
                                        <c:if test="${challenge.challCategory == '1'}">
                                            <span class="badge badge-success">Map</span>
                                    </c:if>
                                    
                                    <c:if test="${challenge.challCategory == '2'}">
                                        <span class="badge badge-primary">Vision</span>
                                    </c:if>
                                    <c:if test="${challenge.challCategory == '3'}">
                                        <span class="badge badge-warning">게시판활동</span>
                                        </c:if></h5>
                                    <p class="card-text">${challenge.challContent}</p>
                                </div>
                                <div class="card-footer">
                                    <h5><span class="badge badge-info">${challenge.challReward} 점 획득</span></h5>
                                    <div class="challDate">
                                        <small class="text-muted" ><br/></small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <br>
                <!-- progress 3단계로 나눠서 진행상황에 따라 상태가 표시되게만들기 -->
                <!-- 
						<p>
						  <a class="btn btn-primary" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">알아두세요!</a>
						</p>
						<div class="row">
						    <div class="col-6 col-md-7">
						    <div class="collapse multi-collapse" id="multiCollapseExample1">
						      <div class="card card-body">
						      	<b>하단의 상태바를 통해 주간도전과제의 진행상황을 볼 수 있습니다.</b>
						        3개의 도전과제를 다 수행했을 시 추가 포인트를 적립할 수 있습니다.
						      </div>
						    </div>
						  </div>
						</div>
												
						<br>
						하나도 수행 안했을 때
						<div class="progress">
						  <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 1%"></div>
						</div>
						<br>
						
						하나만 깻을때 
						<div class="progress">
						  <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 30%"></div>
						</div>
						<br>
						
						두개만 깻을떄
						<div class="progress">
						  <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 65%"></div>
						</div>
						<br>
						
						전부다 수행했을떄
						<div class="progress">
						  <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
						</div>
						<br>
						<br>
						<br> -->




            </div>
            </ul>
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
</body></html>