<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script type="text/javascript">


var targetUserId = "${targetUserId}";
var sessionId = "${user.userId}";
var sessionName = "${user.name}";

$(document).on("click", ".addQuestionBtnAsk", function(evt) {
	var content = $("textarea#questionContentAsk").val();
	console.log(content);
	
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
	
	if (content.length > 1000) {
		var pureAlert = $.pureAlert.alert({
			title : "알림",
			content : "최대 1000자 까지 입력가능합니다.",
			okBtn : "확인",
			autoShow : true,
			closeButton : false
		});
		
		return;
	}
	
	$.ajax({
		url : "/social/rest/addQuestion",
		method : "POST",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			userId : targetUserId,
			questionContent : content,
			questionTitle : "ask"
		}),
		success : function() {
			Swal.fire({
				  icon: 'success',
				  title: '등록완료!',
				  showConfirmButton: false,
				  timer: 800
				})
			$("textarea").val("");
			//socket push
			socketMsg = sessionId + "," + targetUserId + "," + sessionUserName + "," + "2,5";
            wsocket.send(socketMsg);
            addNoti(sessionId, targetUserId, "2", "5");
		}
	});

})

	$(document).on("click", ".replyQuestionBtn", function() {
		
		$.ajax({
			url : "/social/rest/getAskQuestionList",
			method : "POST",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
			}),
			success : function(d) {
				$("div.addAsk").html("");
				for (var i = 0; i < d.list.length; i++) {
				var html = "<div class='ask "+d.list[i].questionPostNo+"'>"
				                +"<p><span>익명</span> · <span>"+d.list[i].questionDate+"</span></p>"
				                +"<p><a href='#'><i class='fas fa-ellipsis-h'></i></a></p>"
				                +"<p>"+d.list[i].questionContent+"</p>"
				                +"<p><a href='#' class='rejectBtn'>거절하기</a><a href='#' class='regBtn'><i class='fas fa-pen'></i> 답하기</a></p>"
				                +"<input type='hidden' value='"+d.list[i].questionPostNo+"'>"
				            +"</div>";
				$(html).appendTo("div.addAsk");
				$("p:contains('새 질문')").html("새 질문 : " + d.totalCount +"개");
				setTimeout(function() {
	        		myScroll.refresh();
	        	}, 0);
				}
			}
		});
	});

//스크롤 페이징
/* var page = 1;

 $(function() {
		$(window).data('ajaxready', true).scroll(function() {
			var maxHeight = $(document).height();
			var currentScroll = $(window).scrollTop() + $(window).height();
			var searchCondition = $("select[name='searchCondition']").val();
			var searchKeyword = $("input[name='searchKeyword']").val();
			var listing = $("input[name='listing']").val();
			
			if($(window).data('ajaxready') == false) return;
			if (maxHeight <= currentScroll) {
			if (page <= ${askMap.resultPage.maxPage}) {
				$(window).data('ajaxready', false);
				page++;
				console.log('page : ' + page);
					
				$.ajax({
					url : "/social/rest/getAskList/",
					method : "POST",
					dataType : "json",
					data : JSON.stringify({
						currentPage : page,
						targetUserId : targetUserId
					}),
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success: function(data) {
						for (var i = 0; i < data.list.length; i++) {
							console.log("hello");
							var html = "<div class='ask'>"
							                +"<p>"+data.list[i].questionContent+"</p>"
							                +"<p><span>익명</span> ｜ <span>"+data.list[i].questionDate+"</span></p>"
							                +"<p>"+data.list[i].answerContent+"</p>"
							                +"<p><span>"+data.list[i].user.name+"</span> ｜ <span>"+data.list[i].answerDate+"</span></p>"
							            +"</div>";
							$(html).appendTo("div.askList");
						}
						$(window).data('ajaxready', true);
					}
				});
			}
			}
		});
	}); */

</script>

<style>
        

        

        section div.list2 div.wrap {
            background-color: #EBAD7A;
            padding: 10px;
        }

        div.list2 div.header {
            background-color: #fff;
            border-radius: 20px;
            text-align: center;
            padding: 50px 25px 5px;
			box-shadow: none;
        }

        div.list2 div.header p:nth-child(1) {
            font-weight: bold;
            font-size: 21px;
            margin-bottom: 15px;
        }

        div.list2 div.header p:nth-child(2) {
            margin-bottom: 15px;
            font-size: 13px;
        }

        div.list2 div.header p:nth-child(3) {
            margin-bottom: 15px;
            font-size: 18px;
        }

        section div.list2 textarea {
            width: 100%;
            height: 55px;
            resize: none;
            padding: 2px;
        }

        div.list2 div.header p:nth-child(5) a {
            background-color: #EBAD7A;
            line-height: 38px;
            display: inline-block;
            width: 100px;
            color: #fff;
            margin-bottom: 30px;
        }

        div.list2 div.header p:nth-child(6) {
            font-size: 18px;
            margin-bottom: 40px;
        }

        div.list2 div.header p:nth-child(6) input {
            line-height: 34px;
            border: 1px solid #e3e3e3;
            text-indent: 5px;
            font-size: 14px;
            width: 245px;
        }

        div.list2 div.header p:nth-child(7) a {
            background-color: rgb(121, 134, 203);
            line-height: 38px;
            display: inline-block;
            width: 100px;
            color: #fff;
            margin-bottom: 30px;
        }



        div.list2 div.ask {
            background-color: #fff;
            margin-top: 10px;
            border-radius: 20px;
            padding: 20px 20px 10px;
        }


		div.list2 div.ask:last-child {
			margin-bottom: 30px;
		}
        div.list2 div.ask p:nth-child(2),
        div.list2 div.ask p:nth-child(4) {

            font-size: 12px;
            text-indent: 5px;
            margin-bottom: 10px;
            margin-top: 2px;
        }

        div.list2 div.ask p:nth-child(3),
        div.list2 div.ask p:nth-child(4) {

            text-indent: 15px;
            margin-bottom: 0;
        }
		div.list2 div.ask p:nth-child(1),
		div.list2 div.ask p:nth-child(3) {
			font-weight: bold;
		}
        

    </style>
<title>어울림</title>
</head>
<body>
	<div class="wrap">
        <div class="header">
        <form>
            <p>ASK - 질문&amp;답변</p>
            <p>답변완료 : ${askMap.totalCount}개</p>
            <p>${targetUser.name}님에게 질문합니다.</p>
            <p>
                <textarea name="questionContent" id="questionContentAsk" cols="30" rows="10" placeholder="성희롱 및 욕설은 처벌대상입니다."></textarea>
                <input type="hidden" name="userId" value="${targetUserId}">
                <input type="hidden" name="questionTitle" value="ask">
            </p>
            <p>
                <a href="#" class="addQuestionBtnAsk">질문하기</a>
                <c:if test="${targetUserId eq user.userId }">
                <a href="#" class="replyQuestionBtn">답변하기</a>
                </c:if>
            </p>
        </form>
            <p style="display:none">주소 : <input type="text" value="http://localhost:8080/social/getAskList/${targetUserId}" readonly="readonly"></p>
        </div>
        <div class="askList">
            <c:forEach var="ask" items="${askMap.list}">
            <div class="ask">
                <p>${ask.questionContent}</p>
                <p><span>익명</span> ｜ <span>${ask.questionDate}</span></p>
                <p>${ask.answerContent}</p>
                <p><span>${ask.user.name}</span> ｜ <span>${ask.answerDate}</span></p>
            </div>
            </c:forEach>
        </div>
        
    </div>
</body>
</html>