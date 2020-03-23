$(document).ready(function () {


    //밑으로 내려오는 이벤트들
    $('#master').on('mouseenter', function () {
        $('#goMaster').addClass('on');
        $('#master').find('i:nth-child(2)').removeClass('fa-caret-down').addClass('fa-caret-up');
    });
    $('#master').on('mouseleave', function () {
        $('#goMaster').removeClass('on');
        $('#master').find('i:nth-child(2)').removeClass('fa-caret-up').addClass('fa-caret-down');
        $('#goMaster').on('mouseenter', function () {
            $('#goMaster').addClass('on');
            $('#master').find('i:nth-child(2)').removeClass('fa-caret-down').addClass('fa-caret-up');
        });
        $('#goMaster').on('mouseleave', function () {
            $('#goMaster').removeClass('on');
            $('#master').find('i:nth-child(2)').removeClass('fa-caret-up').addClass('fa-caret-down');
        });
    });
    $('#community').on('mouseenter', function () {
        $('#goCommunity').addClass('on');
        $('#community').find('i:nth-child(2)').removeClass('fa-caret-down').addClass('fa-caret-up');
    });
    $('#community').on('mouseleave', function () {
        $('#goCommunity').removeClass('on');
        $('#community').find('i:nth-child(2)').removeClass('fa-caret-up').addClass('fa-caret-down');
        $('#goCommunity').on('mouseenter', function () {
            $('#goCommunity').addClass('on');
            $('#community').find('i:nth-child(2)').removeClass('fa-caret-down').addClass('fa-caret-up');
        });
        $('#goCommunity').on('mouseleave', function () {
            $('#goCommunity').removeClass('on');
            $('#community').find('i:nth-child(2)').removeClass('fa-caret-up').addClass('fa-caret-down');
        });
    });
    $('#challenge').on('mouseenter', function () {
        $('#goChallenge').addClass('on');
        $('#challenge').find('i:nth-child(2)').removeClass('fa-caret-down').addClass('fa-caret-up');
    });
    $('#challenge').on('mouseleave', function () {
        $('#goChallenge').removeClass('on');
        $('#challenge').find('i:nth-child(2)').removeClass('fa-caret-up').addClass('fa-caret-down');
        $('#goChallenge').on('mouseenter', function () {
            $('#goChallenge').addClass('on');
            $('#challenge').find('i:nth-child(2)').removeClass('fa-caret-down').addClass('fa-caret-up');
        });
        $('#goChallenge').on('mouseleave', function () {
            $('#goChallenge').removeClass('on');
            $('#challenge').find('i:nth-child(2)').removeClass('fa-caret-up').addClass('fa-caret-down');
        });
    });
    $('#more').on('mouseenter', function () {
        $('#goMore').addClass('on');
        $('#more').find('i:nth-child(2)').removeClass('fa-caret-down').addClass('fa-caret-up');
    });
    $('#more').on('mouseleave', function () {
        $('#goMore').removeClass('on');
        $('#more').find('i:nth-child(2)').removeClass('fa-caret-up').addClass('fa-caret-down');
        $('#goMore').on('mouseenter', function () {
            $('#goMore').addClass('on');
            $('#more').find('i:nth-child(2)').removeClass('fa-caret-down').addClass('fa-caret-up');
        });
        $('#goMore').on('mouseleave', function () {
            $('#goMore').removeClass('on');
            $('#more').find('i:nth-child(2)').removeClass('fa-caret-up').addClass('fa-caret-down');
        });
    });
});


$(document).ready(function () {
    //마우스가 엔터되는 모든 것들

    /*	$('#master').on("mouseenter", function(){
        		console.log('들어왔다.')
        	});
        	$('#master').on('mouseleave', function(){
        		console.log('나왔다')
        	});
        	
        	$('#home').on("mouseenter", function(){
        		console.log('들어왔다')
        	});
        	$('#home').on('mouseleave', function(){
        		console.log('나왔다')
        	});
        	
        	$('#myProfile').on("mouseenter", function(){
        		console.log('들어왔다')
        	});
        	$('#myProfile').on('mouseleave', function(){
        		console.log('나왔다')
        	});
        	
        	$('#community').on("mouseenter", function(){
        		console.log('들어왔다')
        	});
        	$('#community').on('mouseleave', function(){
        		console.log('나왔다')
        	});
        	
        	$('#challenge').on("mouseenter", function(){
        		console.log('들어왔다')
        	});
        	$('#challenge').on('mouseleave', function(){
        		console.log('나왔다')
        	});
        	
        	$('#more').on("mouseenter", function(){
        		console.log('들어왔다')
        	});
        	$('#more').on('mouseleave', function(){
        		console.log('나왔다')
        	}); */


    //실제로 들어갈 수 있는 경로
    $("#userList").on("click", function () { //전체 회원 목록
        $(location).attr('href', "#");
    });

    $("#challengeControl").on("click", function () { //도전과제 관리
        $(location).attr('href', "#");
    });

    $("#reportList").on("click", function () { //신고목록
        $(location).attr('href', "/report/listReport");
    });

    $("#home").on("click", function () { // 홈
        $(location).attr('href', "#");
    });

    $("#myProfile").on("click", function () { //내 프로필
        $(location).attr('href', "#");
    });

    $("#201").on("click", function () { //진학상담
        $(location).attr('href', "/post/listBoard?gatherCategoryNo=201");
    });
    $("#202").on("click", function () { //사랑과 이별
        $(location).attr('href', "/post/listBoard?gatherCategoryNo=202");
    });
    $("#203").on("click", function () { //남자끼리
        $(location).attr('href', "/post/listBoard?gatherCategoryNo=203");
    });
    $("#204").on("click", function () { //여자끼리
        $(location).attr('href', "/post/listBoard?gatherCategoryNo=204");
    });
    $("#205").on("click", function () { //데이트 자랑
        $(location).attr('href', "/post/listBoard?gatherCategoryNo=205");
    });
    $("#206").on("click", function () { //대나무 숲
        $(location).attr('href', "/post/listBoard?gatherCategoryNo=206");
    });
    $("#doChallenge").on("click", function () { //진행중인 도전과제
        $(location).attr('href', "#");
    });
    $("#completeChallenge").on("click", function () { //완료한 도전과제
        $(location).attr('href', "#");
    });
    $("#checkSchoolRanking").on("click", function () { //학교별 랭킹
        $(location).attr('href', "#");
    });
    $("#notice").on("click", function () { //공지사항
        $(location).attr('href', "/post/listNotice");
    });
    $("#question").on("click", function () { //문의사항
        $(location).attr('href', "#");
    });
});
