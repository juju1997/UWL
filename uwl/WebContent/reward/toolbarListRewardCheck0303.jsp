<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>어울림</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="/javascript/iscroll.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
    <script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>

    <script>
    	
		//숫자에 콤마를 찍어주는 함수
	    function numberWithCommas(x) {
	        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    }
		
	 	//rewardListInfiniteScroll
        var rewardListPage = 1;

        function rewardListInfiniteScroll() {
            if (rewardListPage <= ${resultPage.maxPage}) {
            	rewardListPage++;
                console.log('rewardListPage : ' + rewardListPage);
                //alert("rewardListPage : " + rewardListPage);

                $.ajax({
                    url: "/reward/rest/listRewardCheck",
                    method: "POST",
                    dataType: "json",
                    data: JSON.stringify({
                        currentPage: rewardListPage
                    }),
                    headers: {
                        "Accept": "application/json",
                        "Content-Type": "application/json"
                    },
                    success: function(data) {
                    	//alert("ajax 성공한거임");
                    	var list = data.list
                    	//console.log("ajax 진입");
                    	//${mySchool.recentlyTotalActivityPoint}
                    	//console.log("data.list : " + data.list[0]);
                    	//alert("data.list : " + data.list[0].totalPoint);
                    	//alert("data.list : " + data.list[0].totalPoint);
                          for (var i = 0; i < data.list.length; i++) {
                        	//alert("data.list[i].schoolRank : " + data.list[i].schoolRank)
                         	var html =  "<tbody>" 
	                         				+ "<tr>"
						                  	   	+  "<th scope='row'>" + list[i].rowSeq + "</th>"
						                	    + "<td> + " + numberWithCommas(list[i].variableActivityPoint) + "</td>" 
						                	    + "<td>" +  numberWithCommas(list[i].totalPoint) + "</td>" 
						                	    + "<td>" + list[i].variableDate + "</td>"
					                	    + "</tr>"  
					                	+"</tbody>" 
                            $("#rewardList").append(html);
              				//alert(html);
                            setTimeout(function() {
                                myScroll.refresh();
                            }, 0);
                        }  //end of for */
                    }
                });
            }
        } //end of rewardListInfiniteScroll
        
        
	 	//purchaseListInfiniteScroll
         var purchaseListPage = 1;

        function purchaseListInfiniteScroll() {
            if (purchaseListPage <= ${resultPage.maxPage}) {
            	purchaseListPage++;
                console.log('purchaseListPage : ' + purchaseListPage);
                //alert("rewardListPage : " + rewardListPage);

                $.ajax({
                    url: "/reward/rest/listPurchaseCheck",
                    method: "POST",
                    dataType: "json",
                    data: JSON.stringify({
                        currentPage: purchaseListPage
                    }),
                    headers: {
                        "Accept": "application/json",
                        "Content-Type": "application/json"
                    },
                    success: function(data) {
                    	//alert("ajax purchase 성공한거임");
                    	var list = data.list;
                    	var resultContents = null;
                    	//console.log("ajax 진입");
                    	console.log("purchaseListInfiniteScroll data.totalPoint : " +data.list[0].totalPoint);
                    	console.log("purchaseListInfiniteScroll list : " +list[0].totalPoint);
                    	console.log("purchaseListInfiniteScroll list : " + data.list.length);
                    	console.log("purchaseListInfiniteScroll list : " + list[0].purchaseItemCategory);
                    	//alert("purchaseListInfiniteScroll list[i].purchase.itemCategory; : " + list[0].purchaseItem.itemCategory); 
                        
                    	for (var i = 0; i < data.list.length; i++) {
                       	//alert("data.list[i].schoolRank : " + data.list[i].schoolRank)
	                    	var itemCategory = list[i].purchaseItem.itemCategory;
                       		//alert(list[i].itemCategory);
                       		//alert("넘어온 아이템카테고리 값 : " + itemCategory)
                        	var contentFirst = "<tbody>"
			                    	+ "<tr>"
			                  	    +  "<th scope='row'>" + list[i].rowSeq + "</th>"
			                  	    +  "<td>"
	               			 //아이템 뷰를 구분짓는 거.
                 	    	 if ( itemCategory == 1) {
                 	    		//alert("창 if문에 접속함")
		                		itemCategory = "창";
							}else if (itemCategory == 2) {
                 	    		//alert("방패 if문에 접속함")
			                	itemCategory = "방패";
							} 
			                  
			            var contentSecond = itemCategory + "</td>"
		           						 + "<td>" + numberWithCommas(list[i].variablePoint) + "</td>" 
		           						 + "<td>" + numberWithCommas(list[i].totalPoint) + "</td>" 
		           						 + "<td>" + list[i].variableDate + "</td>"
			                  	    	 + "</tr>"
			                  	  	+ "</tbody>"
                       	
				         
				        resultContents = contentFirst + contentSecond;
				                	
                           $("#purchaseList").append(resultContents);
             							
                           setTimeout(function() {
                               myScroll.refresh();
                           }, 0);
                       }  //end of for 
                    }
                });
            }
        } //end of purchaseListInfiniteScroll  
        
        
    	
    	var sessionUserId = "${user.userId}";
        var myScroll = null;
        

        $(function() { 
        	
        	//var rewardPoint = $("input[class='rewardPoint']").val();
        	//alert(rewardPoint);
        	//var purchasePoint = $("input[class='puchasePoint']").val();
        	//alert(purchasePoint);
        	
            myScroll = new IScroll('#wrapper', {
                mouseWheel: true,
                scrollbars: true
            });

            setTimeout(function() {
                myScroll.refresh();
            }, 0);
            
          	//iscroll infinite scroll
            myScroll.on('scrollEnd', function() {
            	//alert("스크롤앤드에 접근")
                var wrapperHeight = $('#wrapper').height();
                var ulHeight = $('#wrapper ul').height();
                var evtHeight = wrapperHeight - ulHeight;

                if (this.y <= evtHeight + 100) {
                    console.log('wrapperHeight', wrapperHeight);
                    console.log('ulHeight', ulHeight);
                    console.log('evtHeight', evtHeight);
                    console.log('this.y', this.y);
					
                    //구매와 아닐떄를 나누기
                     if( $(".updateProfile").hasClass("on") ){
						//alert("updateProfile on에 들어옴");
						rewardListInfiniteScroll();
					}else if ( $(".updatePassword").hasClass("on") ){
						//alert("updatePassword on에 들어옴")
                    	purchaseListInfiniteScroll();
					} 
                    
                }
            });
        });

						
          
       $(function() {
            $('div.leftNavigation li a').on('click', function() {
            	//alert("li a 작동중 ㅋㅋ")
                $('div.leftNavigation li').removeClass('on');
                $(this).parent().addClass('on');
                var index = $(this).parent().index();
                
                
                $('div.updateUser > div').removeClass('on');
                $('div.updateUser > div').eq(index + 1).addClass('on');
            });
            
            $(".listPurchaseBtn").on("click", function() {
				$.redirect("/purchase/getPurchaseList",{userId : sessionUserId});
			});
        });
       
     

    </script>
    <style type="text/css">
        div.updateUser {
            overflow: hidden;

        }

        div.leftNavigation {

            width: 30%;
            float: left;
        }

        div.leftNavigation ul li a {

            line-height: 45px;
            display: block;
            padding: 0 30px;
            border-left: 3px solid transparent;
        }

        div.updateProfile,
        div.updatePassword {
            padding-top: 20px;
            width: 70%;
            float: right;
            border-left: 1px solid #eee;
            min-height: 100vh;
        }


        div.publicStatus {

            width: 70%;
            float: right;
            border-left: 1px solid #eee;
            min-height: 100vh;
        }

        div.updateProfile {
            display: none;
        }

        div.updatePassword {
            display: none;
        }

        div.publicStatus {
            display: none;
        }

        div.updateProfile.on {
            display: block;
        }

        div.updatePassword.on {
            display: block;
        }

        div.publicStatus.on {
            display: block;
        }

        p {
            margin: 0;
            padding: 0;
        }

        div.leftNavigation li.on a {
            border-left: 3px solid;
        }

        /* 아이콘 색 지정*/
        .fa-coins {
            color: #ffc811;
        }
        
        .fa-won-sign {
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
        
        .fa-credit-card {
            color: #2a7fe2;
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
        
        /* div 설정 */
        .out{
        	width: 96%;
        	text-align: center;
        	/* border: 1px solid black;  */
        	padding: 20px;
        	margin: 15px;
        	border-bottom: 2px solid #eee;
        }
        
        .in{
        	display: inline-block;
        	width: 80%;
        	/* border: 1px solid red; */ 
        	height: 200px;
        }
        
        
        .introOut{
        	width: 96%;
        	text-align: center;
        	/* border: 1px solid black;   */
        	padding: 20px;
        	margin-bottom: 30px;
        }
        
        .introIn{
        	display: inline-block;
        	width: 80%;
        	/* border-bottom: 3px solid #ebad7a;  */
        	height: 80px;
        } 
        
        h3 {
        	background: #fff;
        }
        
        h3.forBottomline:after {
        	content: '';
        	width: 450px;
        	height: 3px;
        	background-color: #ebad7a;
        	display: block;
        	position: absolute;
        	bottom: -30px;
        	left: 50%;
        	transform: translateX(-50%);
        }
        .card-img-top{
        	border-bottom: 1px solid gray;
        }
        
        /* 총 카운트 또르르 올라가는거*/
        .section4 {
            /* background: url(/images/trophy_complete.png) center top no-repeat; */
            background-size: cover;
            /*height: 621px;*/
            width: 100%;
        }

        .section4 .inner {
            width: 70%;
            margin: 0 auto;
            text-align: center;
        }

        .section4 .text p:nth-child(1) {
            font-weight: bold;
            color: #2b8ad9;
            margin-bottom: 10px;
        }

        .section4 .text p:nth-child(2) {
            font-size: 30px;
            margin-bottom: 40px;
        }

        .section4 .text p:nth-child(2) span {
            font-weight: bold;
            color: #3c3c3c;
        }

        .keyword {
            width: 100%;
            text-align: center;
          	padding-bottom: 50px; 
        }

        .section4 .keyword > span {
            width: 100px;
            text-align: center;
            border: 5px solid #e38c48;
            height: 120px;
            
            border-radius: 50%;
            display: inline-block;
            vertical-align: text-top;
            margin: 30px;
        }

        .keyword p {
            /* color: #e38c48; */
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .keyword span {
            font-weight: normal;
            color: #898989;
            font-size: 16px;
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
               	<div class="header out">
				    <div class="header in" style="position:relative;">
			        	<h3 class="forBottomline" style="position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);">
			        		<b>${user.name} 님의 내역
			        		</b>
			        	</h3> 
				    </div>
				</div>
            	
                <div class="updateUser">
					
                    <div class="leftNavigation">
                        <ul>
                            <li class="on"><a href="#"><i class="fas fa-coins"></i> 포인트 적립내역</a></li>
                            <li><a href="#"><i class="fas fa-credit-card"></i> 포인트 사용내역</a></li>
                        </ul>
                    </div>


                    <!--첫번째 탭에 나오는 부분-->
                    <div class="updateProfile on">
					 <!-- 총 도전과제 완료 갯수 -->
						<div class="section4">
					        <div class="inner">
					            
					            <div class="keyword">
					                <!-- 포인트 -->
					                <span>
					                	<br>
					                	<br>
				                        <img src="/images/gold_coins.png" style="width: 80px; height: 80px;">
				                        <br>
					                    <p style="font-size: 15px">
				                       		<c:if test="${totalPointReward eq null}">
			                                	0 점
			                                </c:if>
			                                <c:if test="${totalPointReward ne null}">
			                            		<fmt:formatNumber value="${totalPointReward.recentlyTotalPoint}" pattern="#,###,###" />점
			                                </c:if>
					                    </p>
					                </span>
					                <!-- 활동점수 -->
					                <span>
					                	<br>
					                	<br>
				                        <img src="/images/piggy-bank.png" style="width: 80px; height: 80px;">
				                        <br>
					                    <p style="font-size: 15px">
				                       		<c:if test="${totalPointReward eq null}">
			                                	0 점
			                                </c:if>
			                                <c:if test="${totalPointReward ne null}">
			                               		<fmt:formatNumber value="${totalPointReward.recentlyTotalPoint}" pattern="#,###,###" /> 점
			                                </c:if>
					                    </p>
					                </span>
					            </div>
					        </div>
					    </div> <!-- end of section -->
					    
					    <!-- 적립한 내역이 없으면  -->
					    <c:if test="${totalPointReward ne null}">
					    <!-- list시작 -->
					    <table class="table" id = "rewardList">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">포인트</th>
						      <th scope="col">총 점수</th>
						      <th scope="col">날짜</th>
						    </tr>
						  </thead>
						  <c:set var="i" value="0" />
						   <c:forEach var="reward" items="${list}">
							<c:set var="i" value="${i+1 }" />
						 <!--  <tbody id="rewardList"> -->
						  <tbody>
						    <tr>
						      <th scope="row">${reward.rowSeq}</th>
						      <td>+ <fmt:formatNumber value="${reward.variableActivityPoint}" pattern="#,###,###" /></td>
						      <td><fmt:formatNumber value="${reward.totalPoint}" pattern="#,###,###" /></td>
						      <td>${reward.variableDate}</td>
						      <input type="hidden" class="rewardPoint" name="purchaseItem" value="${reward.purchaseItem}">
						    </tr>
						  </tbody>
						  </c:forEach>
						</table>
						</c:if> <!-- end of not null point -->
						
						<!-- 총 포인트가 0이라면 보이는 것 -->
                        <c:if test="${totalPointReward eq null}">
                            <div class="row">
                                <div class="col-sm-8" style="text-align: center;">
                                    <h3>적립한 내용이 없습니다.</h3>
                                </div>
                            </div>
                        </c:if> 
                    </div> <!-- end of first -->


                    <!--두번째 탭에 나오는 부분-->
                    <div class="updatePassword">
                    	
                    	<!-- 총 도전과제 완료 갯수 -->
						<div class="section4">
					        <div class="inner">
					            
					            <div class="keyword">
					                <!-- 포인트 -->
					                <span>
					                	<br>
					                	<br>
				                        <img src="/images/gold_coins.png" style="width: 80px; height: 80px;">
				                        <br>
					                    <p style="font-size: 15px">
				                       		<c:if test="${totalPointReward eq null}">
			                                	0 점
			                                </c:if>
			                                <c:if test="${totalPointReward ne null}">
			                            		<fmt:formatNumber value="${totalPointReward.recentlyTotalPoint}" pattern="#,###,###" />점
			                                </c:if>
					                    </p>
					                </span>
					                <!-- 활동점수 -->
					                <span>
					                	<br>
					                	<br>
				                        <img src="/images/piggy-bank.png" style="width: 80px; height: 80px;">
				                        <br>
					                    <p style="font-size: 15px">
				                       		<c:if test="${totalPointReward eq null}">
			                                	0 점
			                                </c:if>
			                                <c:if test="${totalPointReward ne null}">
			                               		<fmt:formatNumber value="${totalPointReward.recentlyTotalPoint}" pattern="#,###,###" /> 점
			                                </c:if>
					                    </p>
					                </span>
					            </div>
					        </div>
					    </div> <!-- end of section -->
					    
					     <!-- 구매한게 아무것도 없다면 -->
                        <c:if test="${purchaseList eq '[]'}">
                            <div class="row">
                                <div class="col-sm-8" style="text-align: center;">
                                    <h3>적립한 내용이 없습니다.</h3>
                                </div>
                            </div>
                        </c:if>
                        
					    <!-- list시작 -->
					    <table class="table" id = "purchaseList">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">구매아이템</th>
						      <th scope="col">차감 포인트</th>
						      <th scope="col">총 점수</th>
						      <th scope="col">날짜</th>
						    </tr>
						  </thead>
						  <c:set var="i" value="0" />
						   <c:forEach var="purchase" items="${purchaseList}">
							<c:set var="i" value="${i+1 }" />
						 <!--  <tbody id="rewardList"> -->
						  <tbody>
						    <tr>
						      <th scope="row">${purchase.rowSeq}</th>
						      <td>
						      	 <c:if test="${purchase.purchaseItem.itemCategory eq '1'}">
						      	 	창
						      	 </c:if>
						      	 <c:if test="${purchase.purchaseItem.itemCategory eq '2'}">
						      	 	방패
						      	 </c:if>
						      </td>
						      <td><fmt:formatNumber value="${purchase.variablePoint}" pattern="#,###,###" /></td>
						      <td><fmt:formatNumber value="${purchase.totalPoint}" pattern="#,###,###" /></td>
						      <td>${purchase.variableDate}</td>
						       <input type="hidden" class="puchasePoint" name="purchaseItem" value="${purchase.purchaseItem}">
						    </tr>
						  </tbody>
						  </c:forEach>
						</table>
                        
                    
                    
                    
						
						 <!-- 토탈포인트가 0이 아니라면 작동 -->
                      <%--   <c:if test="${totalPointReward ne null}"> --%>
                       <%--  <div class="row">
                            <c:forEach var="purchase" items="${purchaseList}">
                                <div class="col-sm-10">
                                    <div class="card">

                                        <div class="card-body">
                                            <h5 class="card-title">
                                                <!-- 카테고리가 Map 일 때 -->
                                                <c:if test="${purchase.purchaseItem.itemCategory eq '1'}">
                                                    <div class="col-sm-9">
                                                        구매아이템 : <img src="/images/spear.png" style="width: 50px; height: 50px; align-content: right;">
                                                    </div>
                                                </c:if>

                                                <!-- 카테고리가 Vsion 일 때 -->
                                                <c:if test="${purchase.purchaseItem.itemCategory eq '2'}">
                                                    <div class="col-sm-9">
                                                        구매아이템 : <img src="/images/shield.png" style="width: 50px; height: 50px; align-content: right;">
                                                    </div>
                                                </c:if>
                                                <br>
                                            </h5>
                                            <p class="card-text">
                                                <i class="fas fa-coins col-sm-4" style="font-size: 25px; text-align: center;">
                                                    <font size="4px" color="black"> ${purchase.variablePoint}</font>
                                                </i>
                                                <i class="fas fa-piggy-bank col-sm-4" style="font-size: 25px; text-align: center;">
                                                    <font size="4px" ; color="black" ;> ${purchase.totalPoint}</font>
                                                </i>
                                            </p>
                                            <p class="card-text" style="text-align: right;">
                                                <i class="far fa-calendar-check col-sm-4" style="font-size: 25px; text-align: left;">
                                                    <font size="3px" ; color="black" ;>
                                                        <fmt:formatDate var="variableDate" value="${purchase.variableDate}" pattern="yy-MM-dd" />${variableDate}</font>
                                                </i>
                                            </p>
                                        </div>
                                    </div>

                                    <br>
                                </div> <!-- end of card -->
                            </c:forEach>
                        </div> <!-- end of class row -->
                        </c:if>
                    </div> --%>

                    <div class="publicStatus">
                        <!--세번째 탭에 나오는 부분-->
                        
                    </div>
                </div>
            </ul>
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>


</body>

</html>
