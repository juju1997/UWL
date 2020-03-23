<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/4b823cf630.js" crossorigin="anonymous"></script>
    <title>Insert title here</title>
    <style type="text/css">
        body {
            overflow-x: hidden;
        }

        .table {
            overflow-x: hidden;
        }
        
        #goCommunity {
            transition: max-height 1s;
            max-height: 500px;
            padding-top: 10px;
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
	        
	        $('#community').find('i:nth-child(3)').removeClass('fa-caret-down').addClass('fa-caret-up');
			 var category = $('.mainHeader .left2 span').text();
			 
			 console.log(category);
			 $('#goCommunity ul li:contains("' + category + '")').css({
				 'color': '#EBAD7A'
			 });
	    });
    
        $(document).ready(function() {
        	
        	var gatherCategoryNo = ${post.gatherCategoryNo};
        	//alert(gatherCategoryNo);
        	console.log(gatherCategoryNo);
        	
        	$("#boardList").on("click", function() {
                self.location = "/post/listBoard?gatherCategoryNo=" + gatherCategoryNo + "&postChallenge=1";
            }); 
        	
            var refPostNo = ${post.postNo};
            
          	console.log("refPostNo", refPostNo);
            $.ajax({
                url: "/community/rest/getLike",
                method: "POST",
                dataType: 'json',
                data: JSON.stringify({
                    refPostNo: refPostNo
                }),
                headers: {
                    "Accept": "application/json",
                    "content-Type": "application/json"
                },
                success: function(data) {
                    if (data == true) { //좋아요를 누른 게시글일때
                        var view = "<h1><a href='javascript:;'><i class='fas fa-heart' style='color:red' id='likeCancel'></i></a></h1>";
                        $('#forHeartAppend').after(view);
                    } else { //좋아요를 안누른 게시글일때
                        var view = "<h1><a href='javascript:;'><i class='far fa-heart' style='color:black' id='like'></i></a></h1>";
                        $('#forHeartAppend').after(view);
                    }
                },
                error: function() {
                    alert('실패 ㅋㅋ 1');
                }
            });
        });

        $(document).on("click", "#like", function() {
            var refPostNo = ${post.postNo};
            $.ajax({
                url: "/community/rest/addPostLike",
                method: "POST",
                dataType: 'json',
                data: JSON.stringify({
                    refPostNo: refPostNo
                }),
                headers: {
                    "Accept": "application/json",
                    "content-Type": "application/json"
                },
                success: function(data) {
                    if (data != true) { //좋아요를 안누른 게시글일때
                        var view = "<h1><a href='javascript:;'><i class='far fa-heart' style='color:black' id='like'></i></a></h1>";
                    } else { //좋아요를 누른 게시글일때
                        var view = "<h1><a href='javascript:;'><i class='fas fa-heart' style='color:red' id='likeCancel'></i></a></h1>";
                        $('#like').remove();
                        $('#forHeartAppend').after(view);
                    }
                },
                error: function() {
                    alert('실패 ㅋㅋ 2');
                }
            });
        });


        $(document).on("click", "#likeCancel", function() {
            var refPostNo = ${post.postNo};
            $.ajax({
                url: "/community/rest/deleteLike",
                method: "POST",
                dataType: 'json',
                data: JSON.stringify({
                    refPostNo: refPostNo
                }),
                headers: {
                    "Accept": "application/json",
                    "content-Type": "application/json"
                },
                success: function(data) {
                    if (data != true) { //좋아요를 안누른 게시글일때
                        var view = "<h1><a href='javascript:;'><i class='far fa-heart' style='color:black' id='like'></i></a></h1>";
                        $('#likeCancel').remove();
                        $('#forHeartAppend').after(view);
                    } else { //좋아요를 누른 게시글일때
                        var view = "<h1><a href='javascript:;'><i class='fas fa-heart' style='color:red' id='likeCancel'></i></a></h1>";
                        $('#like').remove();
                        $('#forHeartAppend').after(view);
                    }
                },
                error: function() {
                    alert('실패 ㅋㅋ 3');
                }
            });
        });

        $(document).ready(function() {
            $('#deletePost').on("click", function() {
                var gatherCategoryNo = ${post.gatherCategoryNo};
                var postNo = ${post.postNo};

                Swal.fire({
                    title: '정말?',
                    text: "진짜로 삭제하세요??",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#cb4414',
                    cancelButtonColor: '#3c3c3c',
                    cancelButtonText: '아니요!',
                    confirmButtonText: '네!!',
                }).then((result) => {
                    if (result.value) {
                        Swal.fire({
                            icon: 'success',
                            title: '삭제 완료!',
                            showConfirmButton: false,
                            timer: 500
                        }).then((result) => {
                            self.location = "/post/deleteBoard?gatherCategoryNo=" + gatherCategoryNo + "&postNo=" + postNo;
                        });
                    }
                });

            });

            $('#updatePost').on("click", function() {
                var postNo = ${post.postNo};
                self.location = "/post/updateBoard?postNo=" + postNo;
            });
        });
    </script>

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
            color: #333;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;

        }

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
        
        div.back{
        	float:right;
        	border-radius : 10px;
        	background-color: #EBAD7A;
            display: inline-block;
            line-height: 25px;
            padding: 0 40px;
            color: #fff;
            font-weight: bold;
            margin: 20px 0;
        	
        }
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
    </style>
    
    
</head>

<body>
    <div class="layoutWrap2">
        <div class="leftToolbar2">
            <jsp:include page="/layout/left.jsp" />
        </div>
        <div class="work2" id="wrapper">
        	<ul>
        	<div class="mainHeader">
                    <div class="left2">
                        <c:if test="${post.gatherCategoryNo eq '201' }">
                                <i class="fas fa-graduation-cap"></i> <span>진학상담</span>
                            </c:if>
                            <c:if test="${post.gatherCategoryNo eq '202' }">
                                <i class="fas fa-heart"></i> <span>사랑과 이별</span> <i class="fas fa-heart-broken"></i>
                            </c:if>
                            <c:if test="${post.gatherCategoryNo eq '203' }">
                                <i class="fas fa-male"></i> <span>남자끼리</span>
                            </c:if>
                            <c:if test="${post.gatherCategoryNo eq '204' }">
                                <i class="fas fa-female"></i> <span>여자끼리</span>
                            </c:if>
                            <c:if test="${post.gatherCategoryNo eq '205' }">
                                <i class="far fa-kiss-wink-heart"></i> <span>데이트자랑</span>
                            </c:if>
                            <c:if test="${post.gatherCategoryNo eq '206' }">
                                <i class="fas fa-bullhorn"></i> <span>대나무 숲</span>
                            </c:if>
                    </div>
                    <div class="right2">
                        <a href="#"><i class="far fa-star"></i></a>
                    </div>
                </div>
            <form method="POST" action="/report/updateReport">
                <div>
                    <!-- <div></div> -->
                    <div>
                        <%-- <br>
                        <h5>
                            <c:if test="${post.gatherCategoryNo eq '201' }">
                                <i class="fas fa-graduation-cap"></i> 진학상담
                            </c:if>
                            <c:if test="${post.gatherCategoryNo eq '202' }">
                                <i class="fas fa-heart"></i> 사랑과 이별 <i class="fas fa-heart-broken"></i>
                            </c:if>
                            <c:if test="${post.gatherCategoryNo eq '203' }">
                                <i class="fas fa-male"></i> 남자끼리
                            </c:if>
                            <c:if test="${post.gatherCategoryNo eq '204' }">
                                <i class="fas fa-female"></i> 여자끼리
                            </c:if>
                            <c:if test="${post.gatherCategoryNo eq '205' }">
                                <i class="far fa-kiss-wink-heart"></i>데이트 자랑
                            </c:if>
                            <c:if test="${post.gatherCategoryNo eq '206' }">
                                <i class="fas fa-bullhorn"></i> 대나무 숲
                            </c:if>
                        </h5> --%>
                        <h3 style="margin-top:10px;padding-left:10px">${post.postTitle }</h3>
                        <div class="table table-responsive">
                            <table class="table">
                                <tr>
                                    <th class="success" style="vertical-align:middle">
                                        ${post.user.nickname }
                                        ｜
                                        <span><i class="fas fa-heart" style="color:red"></i> ${post.likeCount }</span>
                                        &nbsp;&nbsp;
                                        <span><i class="far fa-eye"></i> ${post.hitCount }</span>
                                        &nbsp;&nbsp;
                                        <span><i class="fas fa-comment-alt"></i> ${post.commentCount }</span>
                                    </th>
                                    <td colspan="3" style="text-align: right">
                                        &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                        <c:if test="${user.userId eq post.userId or user.role eq '4'}">
                                            <span><button type="button" class="btn btn-primary" id="updatePost"><i class="fas fa-pencil-alt"></i> 수정</button></span>
                                            <span><button type="button" class="btn btn-danger" id="deletePost"><i class="fas fa-trash"></i> 삭제</button></span>
                                        </c:if>
                                        <c:if test="${user.userId ne post.userId or user.role eq '4'}">
                                            <span>
                                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">신고</button>
                                            </span>
                                        </c:if>
                                    </td>
                                </tr>


                                <tr>
                                    <td colspan="3">${post.postContent }</td>
                                </tr>

                                <tr>
                                    <td colspan="3">
                                        <div style="text-align:center;width:100%">
                                            <div id="forHeartAppend"></div>
                                        </div>
                                        <div class="back">
							          	  <a href="#" id="boardList">목록으로</a>
							            </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </form>
			<div style="padding:0 10px;">
            	<jsp:include page="../community/includeListComment.jsp"></jsp:include>
			</div>
            </ul>
            <!-- <div class="back">
            <a href="#" id="boardList">목록으로</a>
            </div> -->
                            
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
    <form method="POST" action="/report/addReport">
                <input type="hidden" name="refPostNo" value="${post.postNo }">
                <input type="hidden" name="userId02" value="${post.userId }">

                <div class="container">
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel"></h4>
                                </div>
                                <div class="modal-body">
                                    <h1>&emsp;&emsp;&emsp;게시글 신고</h1>
                                </div>
                                <div class="modal-footer">
                                    <select class="form-control" name="reportCategoryNo">
                                        <option value=1>부적절한 게시글</option>
                                        <option value=2>음란성 게시글</option>
                                        <option value=3>명예훼손/저작권 침해</option>
                                        <option value=4>기타</option>
                                    </select>
                                    <br>
                                    <textarea cols="75" rows="10" placeholder="허위 신고는 처벌의 대상이 됩니다" name="reportContent"></textarea>
                                    <div style="text-align:center;width:100%">
                                        <button type="submit" class="btn btn-danger"><i class="far fa-frown"></i> 신고</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </form>
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
            
</body></html>