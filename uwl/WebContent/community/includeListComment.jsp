<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://kit.fontawesome.com/4b823cf630.js"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
	    
	    <!-- 모달용 -->
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	    
	    <style type="text/css">
	    	a:hover {
	    		text-decoration: none;
	    	}
	    	a {
	    		color: black;
	    	}
	    	
	    	.nickname{
	    		color: #D98844;
	    	}
	    	
	    	textarea{
	    		resize: none;
	    	}
	    	
	    	.commentButton{
	    		display: inline-block;
	    		float: right;
	    	}
	    	
	    	#commentTable {
	    		margin-bottom: 100px;
	    	}
	    </style>
	    
	    <script type="text/javascript">
		    var sessionUserId = "${user.userId}";
			var sessionUserName = "${user.name}";
			var sessionUserNickname = "${user.nickname}";
			var postUserId = "${post.userId}";
	    	var postNo = ${post.postNo};
	    	var commentContent = null;
	    	var commentNo = null;
	    	var content = null;
	    	var userId = null;
	    	var reportCategoryNo = null;
	    	var reportContent = null;
	    	var likeCount = null;	//좋아요 취소시 ajax로 뿌린 값은 못가져와서 그대로 준다
	    	var result = null;	//첫 댓글수 값은 가져올 수 있어서 좋아요 누를 시 여기서 +1
	    
	    	$(document).ready(function(){	//댓글 등록
	    		var sessionUserId = "${user.userId}";
				var sessionUserName = "${user.name}";
				var sessionUserNickname = "${user.nickname}";
				var postUserId = "${post.userId}";
	    		
	    		$('#addComment').on("click", function(){
	    			postNo = ${post.postNo};
	    			console.log("postUserId", postUserId);
	    			console.log("sessionUserId", sessionUserId);
	    			commentContent = $('#commentContent').val();
	    			if(commentContent == '' || commentContent == null){
		    			Swal.fire({
		  				  icon: 'error',
		  				  title: '댓글 내용을 작성해주세요!!!',
		  				  showConfirmButton: false,
		  				  timer: 800
		  				});
		    			return 0;
	    			}
	    			
	    			socketMsg = sessionUserId + "," + postUserId + "," + sessionUserNickname + "," + "1,1";
	    			wsocket.send(socketMsg);
	                addNoti(sessionUserId, postUserId, "1", "1", postNo);
	                
	    			$.ajax({
	    				url : "/community/rest/addComment",
	    				method : "POST",
	    				dataType : "json",
	    				data : JSON.stringify({
	    					postNo : postNo,
	    					commentContent : commentContent
	    				}),
	    				headers : {
		    				"Accept" : "application/json",
		    				"content-Type" : "application/json"
		    			},
	    				success : function(data){
	    					
	    					
	    					setTimeout(function() {
	    			    		myScroll.refresh();
	    			    	}, 0);
	    					
	    					var nickname = data.user.nickname;
	    					var userId = data.userId
	    					var commentDate = data.commentDate;
	    					var commentContent = data.commentContent;
	    					var likeCount = data.likeCount;
	    					var commentNo = data.commentNo;
	    					var sessionUserId = "${user.userId}"
	    					
    						//도전과제 수행을 위한 추가 변수
	    					var postNo = data.postNo;
	    					var gatherCategoryNo = "${post.gatherCategoryNo}"
	    					
	    					$('#commentContent').val("");
	    					var view1 =
	    						"<tr class="+commentNo+">"
			    		            +"<th class='success'>"
			    		            	+"<div class='sl-right'>"
			    							+"<div>"
			    								+"<span class='nickname''>"+nickname+"</span> ｜ "
			    								+"<span class='sl-date'>"
			    									+commentDate
			    								+"</span>"
			    								+"<span style='display:inline-block;float:right;' class='commentButton'>";
			    			var view3 = 						
			    								"</span>"
			    								+"<p class='m-t-10'>"
			    									+"<span id="+commentNo+">"
			    										+commentContent
			    									+"</span>"
			    								+"</p>"
			    							+"</div>"
			    							+"<div class='like-comm m-t-20'"
			    								+"<span id='likeButton'>"
			    								+"<span id='forCommentAppend"+commentNo+"'></span>"
			    								+"<span id='likeButtonClick"+commentNo+"'>"
			    								+"<a href='javascript:void(0)' class='link m-r-10' id='addLiike'"+commentNo+"><i class='far fa-heart' style='color:black'></i> "+likeCount+"</a>"
			    								+"</span>"
			    								+"</span>"
			    								+"<input type='hidden' class='commentNo' value="+commentNo+">"
			    							+"</div>"
			    						+"</div>"
			    		            +"</th>"
	    		       			+"</tr>";
			    			if(sessionUserId == userId){
	    						var view2 = "<span class='updateDelete'>"
	    										+"<a data-toggle='modal' data-target='#updateCommentModal' href='#'>수정 ｜</a>" 
												+"<a href='#'> 삭제</a>"
												+"<input type='hidden' class='commentNo' value="+commentNo+">"
											+"</span>"
	    					}else{
	    						var view2 =	"<span class='onlyReport'>" 
		    									+"<a data-toggle='modal' data-target='#myModalComment' href='#'> 신고</a>"
		    									+"<input type='hidden' class='commentNo' value="+commentNo+">"
												+"<input type='hidden' class='userId' value="+userId+">"
	    									+"</span>";
	    					}
			    			var lastView = view1+view2+view3;
	    					$('#forAppend').append(lastView);
	    					
	    					//도전과제 수행하고 충족시키기 위한 조건 넘기는 부분
    					    $.ajax({
	    						url : "/challenge/rest/completeCommentChallenge",
	    	    				method : "POST",
	    	    				dataType : "json",
	    	    				
	    	    				data : JSON.stringify({
	    	    					userId : userId,
	    	    					postNo : postNo,
	    	    					gatherCategoryNo : gatherCategoryNo
	    	    				}),
	    	    				headers : {
	    		    				"Accept" : "application/json",
	    		    				"content-Type" : "application/json"
	    		    			},
	    		    			success : function(data){
	    		    				//alert("석세스접근한거임 ㅋㅋ")
	    		    				
	    		    				var challReward = data.challenge.challReward;
	    		    				completeResult = data.completeResult;
	    		    				
										//alert(userId + ":: " + challReward + "<<="  + "boolean : " +  completeResult)
	    		    				if (completeResult == true) {
										//alert("축하합니다! 댓글 활동을 통해" + challReward + " 점 획득!" )
										Swal.fire({
			    						  title: '축하합니다! ' + challReward + " 점 획득!",
			    						  width: 600,
			    						  padding: '3em',
			    						  backdrop: `
			    						    rgba(0,0,123,0.4)
			    						    url("/images/Congratulation-cat.gif")
			    						    center top
			    						    no-repeat
			    						  `
			    						})
									}
	    		    				
	    		    			},
	    		    			error : function(){
	    	    					//alert('댓글 포인트부여 에러');
	    	    				}
	    	    					
    	    				}); //challenge 
	    				},
	    				error : function(){
	    					alert('에러 ㅋㅋ');
	    				}
	    			});
	    		});
	    	});
	    	
	    	$(document).ready(function(){
		   		$(document).on("click", "#likeButton", function(){	//좋아요
		    		commentNo = $(this).parent().find(".commentNo").val();
		    		postNo = ${post.postNo}
		    		
		    		$.ajax({
		    			url : "/community/rest/addCommentLike",
		    			method : "POST",
		    			dataType : 'json',
		    			data : JSON.stringify({
		    				refCommentNo : commentNo,
		    				refPostNo : postNo
		    			}),	
		    			headers : {
		    				"Accept" : "application/json",
		    				"content-Type" : "application/json"
		    			},
		    			success : function(data){
		    				if(data == true){
		    					likeCount = Number($('#likeButtonClick'+commentNo).parent().find('a').text().trim());
			    				result = likeCount + 1;
		    					$('#likeButtonClick'+commentNo).remove();
		    					
		    					var view = "<span id='likeButtonClick"+commentNo+"'>"
		    								+"<a href='javascript:void(0)' class='link m-r-10' id='deleteLike"+commentNo+"'><i class='fa fa-heart text-danger'></i> "+result+"</a>"
		    								+"</span>"
		    				$("#forCommentAppend"+commentNo).after(view);
		    				}else{
		    					$.ajax({
		    						url : "/community/rest/deleteLike",
		    						method : "POST",
		    						dataType : 'json',
		    						data : JSON.stringify({
		    							refCommentNo : commentNo,
		    							refPostNo : postNo
		    						}),
		    						headers : {
		    		    				"Accept" : "application/json",
		    		    				"content-Type" : "application/json"
		    		    			},
		    		    			success : function(data){
		    		    				likeCount = Number($('#likeButtonClick'+commentNo).parent().find('a').text().trim());
		    		    				likeCount = likeCount - 1;
		    		    				$('#likeButtonClick'+commentNo).remove();
		    		    				var view = "<span id='likeButtonClick"+commentNo+"'>"
		    		    							+"<a href='javascript:void(0)' class='link m-r-10' id'addLike"+commentNo+"'><i class='far fa-heart' style='color:black'></i> "+likeCount+"</a>"
		    		    							+"<span/>"
		    		    			$("#forCommentAppend"+commentNo).after(view);
		    		    			},
		    		    			error : function(){
		    		    				alert('code='+request.status+' message='+request.responseText+' error='+error);
		    		    			}
		    					});
		    				}
		    			},
		    			error : function(request, status, error){
		    				alert('code='+request.status+' message='+request.responseText+' error='+error);
		    			}
		    		});
		    	}); 
		    	
		    	
		    	
		    	$(document).on("click", ".updateDelete a:nth-child(1)", function(){	//수정
		    		commentNo = $(this).parent().find(".commentNo").val();
		    		content = $("#"+commentNo+"").text();
		    		$("textarea#updateCommentContent").val("");
		    		$("textarea#updateCommentContent").val(content);
		    	});
		   
	    		$(document).on("click", "#updateComment", function(){	//진짜 수정
	    			content = $("textarea#updateCommentContent").val();
	    			$.ajax({
	    				url : "/community/rest/updateComment",
	    				method : "POST",
	    				data : JSON.stringify({
	    					commentNo : commentNo,
	    					commentContent : content
	    				}),
	    				headers : {
		    				"Accept" : "application/json",
		    				"content-Type" : "application/json"
		    			},
		    			success : function(data){
		    				$("#"+commentNo+"").html("");
		    				var view = data.commentContent;
		    				$("#"+commentNo+"").html(view);
		    				$("textarea#updateCommentContent").val("");
		    			},
		    			error : function(){
		    				
		    			}
	    			});
	    		});
		    	
		    	
		    	
		    	
		    	$(document).on("click", ".updateDelete a:nth-child(2)", function() {	//삭제
		    		commentNo = $(this).parent().find(".commentNo").val();
		    		postNo = ${post.postNo}
		    		console.log(commentNo, postNo);
		    		$.ajax({
		    			url : "/community/rest/deleteComment",
		    			method : "POST",
		    			data : JSON.stringify({
		    				commentNo : commentNo,
		    				postNo : postNo
		    			}),
		    			headers : {
		    				"Accept" : "application/json",
		    				"content-Type" : "application/json"
		    			},
		    			success : function(){
		    				$("."+commentNo+"").remove();
		    			},
		    			error : function(){
		    				alert("실패");
		    			}
		    		});
		    	});
		    	
		    	$(document).on("click", ".onlyReport a:nth-child(1)", function(){	//신고
		    		commentNo = $(this).parent().find(".commentNo").val();
		    		userId = $(this).parent().find(".userId").val();
		    		console.log(commentNo)
		    		console.log(userId)
		    	});	
		    	
		    		
	    		$(document).on("click", "#realReport", function(){	//진짜 신고하기 눌렀을 때
		    		var postNo = ${post.postNo};
		    		var reportCategoryNo = $("#reportCategoryNo").val();
		    		var reportContent = $("#reportcontent").val();
		    		$.ajax({
		    			url : "/report/rest/addReportComment",
		    			method : "POST",
		    			data : JSON.stringify({
		    				refPostNo : postNo,
		    				refCommentNo : commentNo,
		    				userId02 : userId,
		    				reportCategoryNo : reportCategoryNo,
		    				reportContent : reportContent
		    			}),
		    			headers : {
		    				"Accept" : "application/json",
		    				"content-Type" : "application/json"
		    			},
		    			success : function(){
		    				$("textarea#reportcontent").val("");
		    			},
		    			error : function(){
		    			}
		    		});
	    		});
    		
	    	});
	    	
	    	
	    	$(function() {
	    		//iscroll infinite scroll
	            myScroll.on('scrollEnd', function() {
	                var wrapperHeight = $('#wrapper').height();
	                var ulHeight = $('#wrapper ul').height();
	                var evtHeight = wrapperHeight - ulHeight;

	                if (this.y <= evtHeight + 100) {
	                    console.log('wrapperHeight', wrapperHeight);
	                    console.log('ulHeight', ulHeight);
	                    console.log('evtHeight', evtHeight);
	                    console.log('this.y', this.y);
	                    
	                    commentScroll();
	                }

	            });
			});
	    	
	    	var page = 1;

            function commentScroll() {
                if (page <= ${resultPage.maxPage}) {
                	page++;
                    console.log('page : ' + page);

                    $.ajax({
                        url: "/community/rest/listComment",
                        method: "POST",
                        dataType: "json",
                        data: JSON.stringify({
                            currentPage: page,
                            postNo : postNo
                        }),
                        headers: {
                            "Accept": "application/json",
                            "Content-Type": "application/json"
                        },
                        success: function(d) {
								
                        	for (var i = 0; i < d.list.length; i++) {
                        		var commentUserId = d.list[i].userId;
                        		var sessionUserId = "${user.userId}";
                        		var sessionUserRole = "${user.role}";
                        		
                        		console.log("commentUserId", commentUserId);
                        		console.log("sessionUserId", sessionUserId);
                        		
		                         var html = "<tr class='"+d.list[i].commentNo+"'>"
			            		            +"<th class='success'>"
			            		            	+"<div class='sl-right'>"
			            							+"<div>"
			            								+"<span class='nickname'>"+d.list[i].user.nickname+"</span> ｜"
			            								+"<span class='sl-date'>"
			            									+d.list[i].commentDate
			            								+"</span>"
			            								+"<span style='display:inline-block;float:right;' class='commentButton'>";
			            								
			            									if (sessionUserId == commentUserId || sessionUserRole == '4') {
				            									html += "<span class='updateDelete'>";
				            										html +="<a data-toggle='modal' data-target='#updateCommentModal' href='#'>수정 ｜</a>" ;
				            											html +="<a href='#'> 삭제</a>";
				            												html +="<input type='hidden' class='commentNo' value='"+d.list[i].commentNo+"'>";
				            												html +="</span>";
															}
			            									if (sessionUserId != commentUserId || sessionUserRole == '4') {
			            										html +="<span class='onlyReport'>";
			            											html +="<a data-toggle='modal' data-target='#myModalComment' href='#'> 신고</a>";
			            												html +="<input type='hidden' class='commentNo' value='"+d.list[i].commentNo+"'>";
			            												html +="<input type='hidden' class='userId' value='"+d.list[i].userId+"'>";
			            												html +="</span>";
															}
			            									html +="</span>"            								
			            										html +="<p class='m-t-10'>";
			            											html +="<span id='"+d.list[i].commentNo+"'>";
			            											html +=d.list[i].commentContent;
			            											html +="</span>";
			            											html +="</p>";
			            												html +="</div>";
			            												html +="<div class='like-comm m-t-20'>";
			            												html +="<span id='likeButton'>";
			            												html +="<span id='forCommentAppend"+d.list[i].commentNo+"'></span>";
			            												html +="<span id='likeButtonClick"+d.list[i].commentNo+"'>";
			            								if(d.list[i].likeStatus == 0){
			            									html +="<a href='javascript:void(0)' class='link m-r-10' id='addLike"+d.list[i].commentNo+"'><i class='far fa-heart' style='color:black'></i> "+d.list[i].likeCount+"</a>";
			            								}
			            								if (d.list[i].likeStatus != 0) {
			            									html +="<a href='javascript:void(0)' class='link m-r-10' id='deleteLike"+d.list[i].commentNo+"'><i class='fa fa-heart text-danger'></i> "+d.list[i].likeCount+"</a>";
														}
			            								html +="</span>";
			            								html +="</span>";
			            								html +="<input type='hidden' class='commentNo' value='"+d.list[i].commentNo+"'>";
			            								html +="</div>";
			            								html +="</div>";
			            								html +="</th>";
			            								html +="</tr>";
                        		
                        		$(html).appendTo("table#commentTable");
							}
                        	
                        	
                                setTimeout(function() {
                                    myScroll.refresh();
                                }, 0);
                        } // end callback
                    });
                }
            }
	    </script>
	    
	<title>Insert title here</title>
</head>

<body>
	    
		
		
		
<div>
    <div></div>
    <div>
    <br>
	    <div class="table table-responsive">
	        <table class="table" id="commentTable">
	        
	        <h3><i class="fas fa-comment-alt"></i> ${resultPage.totalCount }</h3>
	        <input type="text" style="width: calc(100% - 110px); height: 50px;vertical-align: middle;margin: none;float: left;margin-right: 10px" name="commentContent" id="commentContent">
                            <button type="button" class="btn btn-primary" id="addComment" style="background-color: #ebad7a; color: #3c3c3c;width: 100px; height: 50px; padding: none; float: left"><i class="fas fa-pencil-alt"></i> 등록</button>
            <div id="forAppend"></div>                
	        <c:forEach var="comment" items="${list }">
	        
		        <tr class="${comment.commentNo }">
		            <th class="success">
		            	<div class="sl-right">
							<div>
								<span class="nickname">${comment.user.nickname }</span> ｜
								<span class="sl-date">
									${comment.commentDate }
								</span>
								<span style="display:inline-block;float:right;" class='commentButton'>
									<c:if test="${user.userId eq comment.userId or user.role eq '4'}">
									<span class="updateDelete">
										<a data-toggle="modal" data-target="#updateCommentModal" href="#">수정 ｜</a> 
										<a href="#"> 삭제</a>
										<input type="hidden" class="commentNo" value="${comment.commentNo }">
									</span> 
									</c:if>
									<c:if test="${user.userId ne comment.userId or user.role eq '4'}">
									<span class="onlyReport">
										<a data-toggle="modal" data-target="#myModalComment" href="#"> 신고</a>
										<input type="hidden" class="commentNo" value="${comment.commentNo }">
										<input type="hidden" class="userId" value="${comment.userId }">
									</span>	
									</c:if>
								</span>
								
								<p class="m-t-10">
									<span id="${comment.commentNo }">
										${comment.commentContent }
									</span>
								</p>
							</div>
							<div class="like-comm m-t-20">
								<span id="likeButton">
								<span id="forCommentAppend${comment.commentNo }"></span>
								<span id="likeButtonClick${comment.commentNo }">
								<c:if test="${comment.likeStatus eq '0' }">
									<a href="javascript:void(0)" class="link m-r-10" id="addLike${comment.commentNo }"><i class='far fa-heart' style='color:black'></i> ${comment.likeCount }</a>
								</c:if>
								<c:if test="${comment.likeStatus ne '0'}">
									<a href="javascript:void(0)" class="link m-r-10" id="deleteLike${comment.commentNo }"><i class="fa fa-heart text-danger"></i> ${comment.likeCount }</a>
								</c:if>
								</span>
								</span>
								<input type="hidden" class="commentNo" value="${comment.commentNo }">
							</div>
						</div>
		            </th>
		        </tr>
		    </c:forEach>
	        </table>
	        
			    
	    	</div>
    </div>
</div>
		
		
		
		
		
		
		
		
		
		
		
		
		



    
    <form>
      <div class="container">
		 			<div class="modal fade" id="myModalComment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			            <div class="modal-dialog" role="document">
			                <div class="modal-content">
			                    <div class="modal-header">
			                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			                        <h4 class="modal-title" id="myModalLabel"></h4>
			                    </div>
		                    <div class="modal-body">
		                        	<h1>&emsp;&emsp;&emsp;&emsp;댓글 신고</h1>
		                    </div>
		                    <div class="modal-footer">
		                        <select class="form-control" name="reportCategoryNo" id="reportCategoryNo">
		                        	  <option value=1>부적절한 댓글</option>
									  <option value=2>음란성 댓글</option>
									  <option value=3>명예훼손/저작권 침해</option>
									  <option value=4>기타</option>
								</select>
								<br>
								<textarea cols="75" rows="10" placeholder="허위 신고는 처벌의 대상이 됩니다" name="reportContent" id="reportcontent"></textarea>
								<br>
								<span>
		                        
		                        <button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close" id="realReport"><span aria-hidden="true">신고하기</span></button>
		                        </span>
		                    </div>
		                </div>
		            </div>
		        </div>
		 	</div>
		</form>
		
	<!-- 수정 모달 -->
    
   
 	
 	
 	
</body>
</html>