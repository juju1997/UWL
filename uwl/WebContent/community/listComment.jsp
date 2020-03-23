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
	    </style>
	    
	    <script type="text/javascript">
	    	
	    	var postNo = null;
	    	var commentContent = null;
	    	var commentNo = null;
	    	var content = null;
	    	var userId = null;
	    	var reportCategoryNo = null;
	    	var reportContent = null;
	    	var likeCount = null;	//좋아요 취소시 ajax로 뿌린 값은 못가져와서 그대로 준다
	    	var result = null;	//첫 댓글수 값은 가져올 수 있어서 좋아요 누를 시 여기서 +1
	    
	    	$(document).ready(function(){	//댓글 등록
	    		
	    		$('#addComment').on("click", function(){
	    			postNo = ${post.postNo}
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
	    					var nickname = data.user.nickname;
	    					var userId = data.userId
	    					var commentDate = data.commentDate;
	    					var commentContent = data.commentContent;
	    					var likeCount = data.likeCount;
	    					var commentNo = data.commentNo;
	    					var sessionUserId = "${user.userId}"
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
	    </script>
	    
	<title>Insert title here</title>
</head>

<body>
    <form method="POST" action="community/rest/addComment">
	    <!--for문 돌릴것-->
	    
		
		
		
<div class="row">
    <div class="col-xs-2 col-md-2"></div>
    <div class="col-xs-8 col-md-8">
    <br>
	    <div class="table table-responsive">
	        <table class="table">
	        
	        <h3><i class="fas fa-comment-alt"></i> ${resultPage.totalCount }</h3>
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
			    <div id="forAppend"></div>
	        </table>
	        
	        
			    &nbsp;&nbsp;<input type="text" style="width: 700px; height: 50px" name="commentContent" id="commentContent"></textarea>
			    <button type="button" class="btn btn-primary" id="addComment" style="background-color: #ebad7a; color: #3c3c3c;"><i class="fas fa-pencil-alt"></i> 등록</button>
			    <br><br><br><br>
	    	</div>
    </div>
</div>
		
		
		
		
		
		
		
		
		
		
		
		
		



	</form>
    
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
	<form>
      
      <div class="container">
		 			<div class="modal fade" id="updateCommentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			            <div class="modal-dialog" role="document">
			                <div class="modal-content">
			                    <div class="modal-header">
			                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			                        <h4 class="modal-title" id="myModalLabel"></h4>
			                    </div>
		                    <div class="modal-body">
		                        	<h1>&nbsp;&nbsp;&emsp;&emsp;&emsp;댓글 수정</h1>
		                    </div>
		                    <div class="modal-footer">
								<textarea cols="75" rows="10" name="updateCommentContent" id="updateCommentContent"></textarea>
								<br>
								<span>
								<button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close" id="updateComment"><span aria-hidden="true">수정</span></button>
		                        </span>
		                    </div>
		                </div>
		            </div>
		        </div>
		 	</div>
      
      
	</form>
    
   
 	
 	
 	
</body>
</html>