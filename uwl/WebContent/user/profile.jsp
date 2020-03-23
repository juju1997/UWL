<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>어울림</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/profile.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
    <script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>   
    <script src="/javascript/profile.js"></script>
    <script type="text/javascript">
    // profile.js에 있는데 안되어서 넣었음
    
   		var sessionId;
   		var sessionMail;
   		var sessionName;
   		var sessionPhone; 
   		var currPoint;
   		var price;
   		
    	$(function() {
    		//	IMP init
    		IMP.init('imp12736999');
    		
    		sessionId = $("input#sessionUserId").val();
    		sessionMail = $("input#sessionMail").val();
    		sessionName = $("input#sessionName").val();
    		sessionPhone = $("input#sessionPhone").val();
    		currPoint = $("input#totalPoint").val();
    		price = 100; ///////////////////// controller에서 받은 값으로 변경하기
    	});
    	
    	
    		$(document).on("click",".purchaseBtn", function() {
    			var currPoint = $("input#totalPoint").val();
    			itemCategory = $(this).children("input[type='hidden']").val();
    			itemCount = $(this).children("span").html();
    			console.log("itemCount", itemCount);
    			console.log("itemCategory", itemCategory);
    			if (itemCategory == "1") {
    				itemName = "창";
    			} else if(itemCategory == "2"){
    				itemName = "방패";
    			}
    			
    			$("#purchaseModal").modal();
    		});
    	
    		$(document).on("click", "#cardBtn", function() {
    			var paymentOption = $(this).val();
    			console.log("paymentOption", paymentOption);
    			console.log("itemName", itemName);
    			
    			var pureAlert = $.pureAlert.confirm({
    				title : "알림",
    				content : "현금 구매를 진행하시겠습니까?",
    				okBtn : "구매",
    				cancelBtn : "취소",
    				autoShow : true,
    				closeButton : false
    			});
    			
    			pureAlert.on('ok.pure-alert', function(e) {
    				
    			IMP.request_pay({
    			    pg : 'html5_inicis', //ActiveX 결제창은 inicis를 사용
    			    pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
    			    merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
    			    name : itemName,
    			    amount : price,
    			    buyer_email : sessionMail,
    			    buyer_name : sessionName,
    			    buyer_tel : sessionPhone, //누락되면 이니시스 결제창에서 오류
    			},  function(rsp) {
    			    if ( rsp.success ) {
    			    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    			    	jQuery.ajax({
    			    		url: "/purchase/rest/addPurchase", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
    			    		type: 'POST',
    			    		dataType: 'json',
    			    		headers : {
    							"Accept" : "application/json",
    							"Content-Type" : "application/json"
    						},
    			    		data: JSON.stringify({
    			    			userId : sessionId,
    			    			paymentOption : paymentOption,
    			    			itemCategory : itemCategory,
    			    			importId : rsp.imp_uid,
    			    			price : price
    				    		//기타 필요한 데이터가 있으면 추가 전달
    			    		})
    			    	}).done(function(data) {
    			    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
    			    		if ( rsp.success ) {
    			    			var msg = '결제가 완료되었습니다.';
    			    			/* msg += '\n고유ID : ' + rsp.imp_uid;
    			    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
    			    			msg += '\결제 금액 : ' + rsp.paid_amount;
    			    			msg += '카드 승인번호 : ' + rsp.apply_num; */
    							
    			    			alert(msg);
    			    			$.redirect("/user/getProfile/"+sessionId,{}, "get");
    			    		} else {
    			    			//[3] 아직 제대로 결제가 되지 않았습니다.
    			    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    			    		}
    			    	});
    			    } else {
    			        var msg = '결제에 실패하였습니다.';
    			        //	msg += '에러내용 : ' + rsp.error_msg;
    			        alert(msg);
    			        $("#purchaseModal").modal("hide");
    			        
    			    }
    			});
    			})
    			
    			pureAlert.on('cancel.pure-alert', function(e) {
    				$("#purchaseModal").modal("hide");
    			})
    			
    		});
    		
    		$(document).on("click", "#pointBtn", function() {
    			var paymentOption = $(this).val();
    			console.log("itemName", itemName);
    			console.log("paymentOption", paymentOption);
    			
    			if (currPoint < price) {
    				var pureAlert = $.pureAlert.alert({
        				title : "알림",
        				content : "포인트가 부족합니다.",
        				okBtn : "확인",
        				autoShow : true,
        				closeButton : false
        			});
    				
    				return;
				}
    			
    			var pureAlert = $.pureAlert.confirm({
    				title : "알림",
    				content : "포인트 구매를 진행하시겠습니까?",
    				okBtn : "구매",
    				cancelBtn : "취소",
    				autoShow : true,
    				closeButton : false
    			});
    			
    			pureAlert.on('ok.pure-alert', function(e) {
    			
    			$.ajax({
    				url: "/purchase/rest/addPurchase", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
    	    		type: 'POST',
    	    		dataType: 'json',
    	    		headers : {
    					"Accept" : "application/json",
    					"Content-Type" : "application/json"
    				},
    	    		data: JSON.stringify({
    	    			userId : sessionId,
    	    			paymentOption : paymentOption,
    	    			itemCategory : itemCategory,
    	    			price : price
    				}),
    				success : function(data) {
    					if (data.success) {
    						var msg = '결제가 완료되었습니다.';
    						alert(msg);
    						$.redirect("/user/getProfile/"+sessionId,{}, "get");
    					} else {
    						var msg = '결제에 실패하였습니다.';
    						alert(msg);
    						$("#purchaseModal").modal("hide");
    					}
    					}
    				})
    			})
    			pureAlert.on('cancel.pure-alert', function(e) {
    				$("#purchaseModal").modal("hide");
    			})
    			
    			});
    			
    	
    	$(document).on("click", "#listPurchase", function() {
    		$.redirect("/purchase/getPurchaseList",{userId : sessionId});
    	});
    
    </script>
</head>

<body>

	<input type="hidden" id="sessionUserId" value="${user.userId}">
	<input type="hidden" id="targetUserId" value="${targetUserId}">
	<input type="hidden" id="sessionMail" value="${user.mail}">
	<input type="hidden" id="sessionName" value="${user.name}">
	<input type="hidden" id="sessionPhone" value="${user.phone}">
	<input type="hidden" id="totalPoint" value="${reward.recentlyTotalPoint}">



    <!-- Button trigger modal -->


    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>









    <div class="wrap">
        <div class="profileHeader">
            <div class="profileImage">
                <a href="#">
                    <c:if test="${empty user.profileName}">

                        <img src="/images/bonobono.jpg" alt="">
                    </c:if>
                    <c:if test="${!empty user.profileName}">
                        <img src="/images/${user.profileName}" alt="">
                    </c:if>

                </a>
            </div>
            <div class="profile">
                <div class="userId">
                    <div class="user">${targetUser.userId}</div>
                    <%-- ${checkFriend1.friendStatus} ${checkFriend2.friendStatus} --%>
                    <c:if test="${user.userId eq targetUserId }">
                        <div class="profileUpdate"><a href="#">프로필 편집</a></div>
                        <div class="setting"><a href="#"><i class="fas fa-cog"></i></a></div>
                    </c:if>
                    <c:if test="${user.userId ne targetUserId }">
                        <c:if test="${checkFriend1.friendStatus == 2 }">
                            <!-- 친구끊기/친구신청취소, 친구신청(수락) div 추가했음 -->
                            <div class="deleteFriend"><a href="#">친구끊기</a></div>
                        </c:if>
                        <c:if test="${checkFriend1.friendStatus == 1 }">
                            <div class="deleteFriend"><a href="#">친구신청취소</a></div>
                        </c:if>
                        <c:if test="${checkFriend2.friendStatus == 1 }">
                            <div class="acceptFriend"><a href="#">친구신청</a></div>
                        </c:if>
                        <c:if test="${empty checkFriend1.friendStatus and empty checkFriend2.friendStatus}">
                            <div class="addFriend"><a href="#">친구신청</a></div>
                        </c:if>

                        <!--////////////////// 매칭여부 / 꽃보냈는지 여부 추가바람/////////////////////////// -->
                        <c:if test="${checkFriend1.friendStatus == 2 }">








                            <!-- <div class="sendFlower"><a href="#">꽃보내기</a></div> -->



                            <c:if test="${matching.secondUserId ne targetUserId}">

                                <div class="sendFlower"><a href="#" class="addMatching" data-toggle="modal" data-target="#exampleModal">
                                        꽃보내기
                                    </a></div>
                            </c:if>

                            <c:if test="${matching.secondUserId eq targetUserId}">
                                <div class="sendFlower"><a href="#" class="deleteMatching" data-toggle="modal" data-target="#exampleModal">
                                        꽃보내기취소
                                    </a></div>
                            </c:if>





                            <div class="useSpear"><a href="#" data-toggle="modal" data-target="#exampleModal">찔러보기</a></div>
                        </c:if>
                    </c:if>
                </div>
                <div class="post">
                    <div class="totalFlower">
                        <!-- /////////////// totalFlower 추가바람/////////////// -->
                        <img src="/images/love-and-romance.png" width="30px" alt=""> <span>${totalMatching }</span>
                    </div>
                    <!-- /////////////// 활동점수, 포인트 추가바람/////////////// -->
                    
                    
                                        <div class="activityPoint"> 활동점수 <span>
                    <c:if test="${empty reward.recentlyTotalActivityPoint}">
                    0
                    </c:if>
                    <c:if test="${!empty reward.recentlyTotalActivityPoint}">
                    ${reward.recentlyTotalActivityPoint}
                    </c:if>
                    
                    </span>
                    </div>
                    <c:if test="${targetUserId eq user.userId }">
                    <!-- point div 추가했음 -->
                    <div class="point"> 포인트 <span>
                    <c:if test="${empty reward.recentlyTotalPoint}">
                    0
                    </c:if>
                    <c:if test="${!empty reward.recentlyTotalPoint}">
                    ${reward.recentlyTotalPoint}
                    </c:if>
                    </span>
                    </div>
                    
					<div class="totalItem purchaseBtn">
                        <img src="/images/spear.png" width="30px" alt=""> <span>${totalSpear}</span>
                        <input type=hidden class="itemCategory" value="1">
                    </div>
                    <div class="totalItem2 purchaseBtn">
                        <img src="/images/shield.png" width="30px" alt=""> <span>${totalShield}</span>
                        <input type=hidden class="itemCategory" value="2">
                    </div>
                    </c:if>
                </div>
                <div class="name">
                    <div class="userName">
                        ${targetUser.name}
                    </div>
                    <div class="introduction">
                        ${targetUser.selfIntroduction }<br>
                    </div>
                </div>
            </div>
        </div>
        <div class="section">
            <div class="innerSection">
                <ul>
                    <li class="on"><a href="#"><i class="fas fa-th"></i> 타임라인</a></li>
                    <li><a href="#"><i class="fas fa-tv"></i> ASK</a></li>
                    <li><a href="#"><i class="far fa-bookmark"></i> 커플타임라인</a></li>
                    <li><a href="#"><i class="fas fa-user-tag"></i> 커플캘린더</a></li>
                </ul>
            </div>
            <section>
                <div class="list1 on">
                <c:if test="${user.publicStatus == 2 }">
                	비공개 계정입니다.
                </c:if>
                <c:if test="${user.publicStatus == 1 }">
              	</c:if>
                </div>
                <div class="list2">
                <c:if test="${user.publicStatus == 2 }">
                	비공개 계정입니다.
                </c:if>
                <c:if test="${user.publicStatus == 1 }">
                    IGTVㅋㅋ
                </c:if>
                </div>
                <div class="list3">
                <c:if test="${user.publicStatus == 2 }">
                	비공개 계정입니다.
                </c:if>
                <c:if test="${user.publicStatus == 1 }">
              	      저장됨ㅋㅋ
                </c:if>
                </div>
                <div class="list4">
                <c:if test="${user.publicStatus == 2 }">
                	비공개 계정입니다.
                </c:if>
                <c:if test="${user.publicStatus == 1 }">
                	    태그됨ㅋㅋ
                </c:if>	    
                </div>
            </section>
        </div>
    </div>
    
    
    
    <!-- Purchase Modal -->
<div class="modal fade" id="purchaseModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <p class="modal-title" id="exampleModalLabel">아이템 구매</p>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="row">
      <div class="col-sm-12 pointTextDiv">
      <p>현재 포인트 : ${reward.recentlyTotalPoint}</p> <!-- //////////////////////////// 유저포인트로 수정하기 -->
      </div>
      	<div class="col-sm-6">
        <button type="button" class="btn btn-outline-primary btn-lg btn-block" id="cardBtn" value="1">현금 구매<br/>99,000원</button>
        </div>
      	<div class="col-sm-6">
        <button type="button" class="btn btn-outline-primary btn-lg btn-block" id="pointBtn" value="2">포인트 구매<br/>99,000포인트</button>
      	</div>
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
    
</body></html>