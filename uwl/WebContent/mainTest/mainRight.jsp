<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <style type="text/css">
    /* 일단 여기에 박았음 */
        div.addAskedFriendData img {
        	width : 60px;
        	height : 60px;
        	border-radius: 30px;
        }
        
        div.addAskedFriendData div {
        	text-align: center;
        	line-height: 70px;
        }
        div.modal-content {
        	width: 510px;
        }
        div.modal-body {
        	max-height: 500px;
            overflow-y: auto;
            /* prevent horizontal scrollbar */
            overflow-x: hidden;
            /* add padding to account for vertical scrollbar */
            padding-right: 20px;
        }
    </style>
    <title>Document</title>
</head>

<body>
   <input type="hidden" id="sessionUserId" name="sessionUserId" value="${user.userId}">
    <div class="search2">
        <i class="fas fa-search"></i><input type="text" placeholder="어울림 검색">
        <select class="custom-select mr-sm-2" id="inlineFormCustomSelect" name="searchCondition">
	        <option value="0" ${search.searchCondition == 0 ? "selected" : "" }>아이디</option>
	        <option value="1" ${search.searchCondition == 1 ? "selected" : "" }>이름</option>
	        <option value="2" ${search.searchCondition == 2 ? "selected" : "" }>학교명</option>
		</select>
    </div>
    <div class="friendList">
        <ul>
            <li>친구 목록<i class="fas fa-cog"></i></li>
        </ul>
    </div>
    
	<!-- Right AskedFriend Modal -->
	<div class="modal fade" id="askedFriendModal" tabindex="-1" role="dialog" aria-labelledby="askedFriendModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <p class="modal-title" id="askedFriendModalLabel">친구 요청</p>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      <div class="row">
	      	<div class="col-sm-12 addAskedFriendTarget">
	      	
	        </div>
	      </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>   
</body>

</html>
