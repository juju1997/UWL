var sessionUserId = null;

$(function() {
	rightLoad();
})

//	우측툴바 load 
function rightLoad() {
	sessionUserId = $('input#sessionUserId').val();
	$.ajax({
		url : "/friend/rest/getFriendListForSearch",
		method : "POST",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			userId : sessionUserId
		}),
		success : function(d) {
			for (var i = 0; i < d.list.length; i++) {
				var html = "<li><a href='#'><img src='/images/"+d.list[i].profileName+"'>"+d.list[i].name+"<span></span></a>"
				+"<input type='hidden' value='"+d.list[i].userId+"'></li>";
				$(html).appendTo("div.friendList ul");
			}
		}
	})
}


//	우측툴바 프로필 이동 event
$(document).on("click", "div.friendList ul li a", function() {
	var targetUserId = $(this).next().val();
	console.log("targetUserId", targetUserId);
	
	$.redirect("/user/getProfile/"+targetUserId+"",{}, "GET");
});

//	우측툴바 검색 event
$(document).on("keypress", "div.search2 input", function(e) {
	var searchKeyword = $(this).val();
	var searchCondition = $(this).next().val();
	if (e.which == 13) {
		console.log("searchKeyword", searchKeyword);
		if (searchKeyword == null || searchKeyword.length < 1 ) {
			alert("검색어를 입력해주세요");
			return;
		}
		
		$.redirect("/friend/getSearchFriendList", {searchCondition : searchCondition, searchKeyword : searchKeyword, userId : sessionUserId})
		
	}
});

//	친구요청 Modal Event
$(document).on("click", "div.friendList ul i", function() {
	$("div#askedFriendModal").modal();
	
	$.ajax({
		url : "/friend/rest/getAskedList",
		method : "POST",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			
		}),
		success : function(d) {
			$("div.addAskedFriendData").remove();
			for (var i = 0; i < d.list.length; i++) {
			var addData = "<div id='"+d.list[i].userId+"' class='row addAskedFriendData'>"+
								"<div class='col-sm-1'><img src='../../images/"+d.list[i].profileName+"'/></div>"+
								 "<div class='col-sm-7'> &nbsp; "+d.list[i].name+" &nbsp; "+d.list[i].schoolName+" &nbsp;</div>"+
								 "<div class='col-sm-4 addTarget"+d.list[i].userId+"'><button type='button' class='btn btn-primary btn"+d.list[i].userId+"' id='acceptModalButton'>수락</button>"+
								 "<button type='button' class='btn btn-danger btn"+d.list[i].userId+"' id='deleteModalButton'>거절</button></div>"+
								 "<input type='hidden' value='"+d.list[i].userId+"'/>"+
							"</div>";
			
			$(addData).appendTo("div.addAskedFriendTarget");
			}
		}
});
})

//	친구요청 Modal 수락 event
$(document).on("click", "#acceptModalButton", function() {
	var userId = $(this).parent().next().val();
	console.log("userId", userId);
	
	$.ajax({
		url : "/friend/rest/acceptFriend",
		method : "POST",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			firstUserId : sessionUserId,
			secondUserId : userId
		}),
		success : function() {
			var html = "<button type='button' class='btn btn-success'>친구</button>";
			$(html).appendTo("div.addTarget"+userId+"");
			$(".btn"+userId+"").remove();
			$("div.friendList ul").html("");
			
			var li = "<li>친구 목록<i class='fas fa-cog'></i></li>";
			$(li).appendTo("div.friendList ul");
			rightLoad();
			
		}
	})
});

//	친구요청 Modal 거절 event
$(document).on("click", "#deleteModalButton", function() {
	var userId = $(this).parent().next().val();
	
	$.ajax({
		url : "/friend/rest/deleteFriend",
		method : "POST",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			firstUserId : sessionUserId,
			secondUserId : userId
		}),
		success : function() {
			var html = "<button type='button' class='btn btn-secondary'>거절됨</button>";
			$(html).appendTo("div.addTarget"+userId+"");
			$(".btn"+userId+"").remove();
			
		}
	})

});
