<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="shortcut icon" href="/images/favicon1.ico" type="image/x-icon">
    <link rel="icon" href="/images/favicon1.ico" type="image/x-icon">
    <title>어울림</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="/javascript/iscroll.js"></script>
    <script>
        var myScroll = null;

        $(function() {
        	
        	$('a#myProfile span:nth-child(1)').css({
        		'border': '2px solid #EBAD7A'
        	});

            myScroll = new IScroll('#wrapper', {
                mouseWheel: true,
                scrollbars: true
            });

            setTimeout(function() {
                myScroll.refresh();
            }, 0);

            $('div.sectionList ul.sectionNav li a').on('click', function() {
                setTimeout(function() {
                    myScroll.refresh();
                }, 0);
            });




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

                    if ($("section.displaySection div.list1").hasClass('on')) {
                        timelineInfiniteScroll();
                    }
                    if ($("section.displaySection div.list2").hasClass('on')) {
                        askInfiniteScroll();
                    }
                    if ($("section.displaySection div.list3").hasClass('on')) {
                        coupleTimelineInfiniteScroll(coupleTimelineMaxPage);
                    }
                    if ($("section.displaySection div.list5").hasClass('on')) {
                        askQuestionInfiniteScroll();
                    }
                    // list3 , list4 on 일때 추가하기 커플타임라인, 커플캘린더
                }
            });
			
            
            var coupleTimelinePage = 1;
            
            function coupleTimelineInfiniteScroll(coupleTimelineMaxPage) {
            	if (coupleTimelinePage <= coupleTimelineMaxPage) {
            		coupleTimelinePage++;
                    console.log('coupleTimelinePage : ' + coupleTimelinePage);

                    $.ajax({
                        url: "/couple/rest/getCoupleTimelinePostList",
                        method: "POST",
                        dataType: "json",
                        data: JSON.stringify({
                            currentPage: coupleTimelinePage
                        }),
                        headers: {
                            "Accept": "application/json",
                            "Content-Type": "application/json"
                        },
                        success: function(data) {
                            for (var i = 0; i < data.list.length; i++) {
                            	appendCoupleTimelinePost(data.list[i]);
                            }
                                setTimeout(function() {
                                    myScroll.refresh();
                                }, 0);
                        }
                    });
                }
			}
            



            var timelinePage = 1;

            function timelineInfiniteScroll() {
                if (timelinePage <= ${timelineMap.resultPage.maxPage}) {
                    timelinePage++;
                    console.log('timelinePage : ' + timelinePage);

                    $.ajax({
                        url: "/social/rest/getTimelineList/",
                        method: "POST",
                        dataType: "json",
                        data: JSON.stringify({
                            currentPage: timelinePage,
                            targetUserId: targetUserId
                        }),
                        headers: {
                            "Accept": "application/json",
                            "Content-Type": "application/json"
                        },
                        success: function(data) {
                            for (var i = 0; i < data.list.length; i++) {
                                var html = "<li class='" + data.list[i].postNo + "' value='" + data.list[i].postNo + "'>" +
                                    "<a class='float-left text-monospace text-primary'>" + data.list[i].postDate + "</a>";
                                if (data.list[i].viewStatus == '1') {
                                    html += "<a class='float-right font-weight-bold text-secondary postViewStatus" + data.list[i].postNo + "'>전체공개</a><br/>";
                                }
                                if (data.list[i].viewStatus == '2') {
                                    html += "<a class='float-right font-weight-bold text-secondary postViewStatus" + data.list[i].postNo + "'>나만보기</a><br/>";
                                }
                                html += "<div class='postContentDiv " + data.list[i].postNo + "'>" + data.list[i].postContent + "</div>";
                                html += "<button class='btn btn-outline-primary btn-sm commentBtn' value='" + data.list[i].postNo + "'>댓글 "+data.list[i].commentCount+"</button>";

                                if (sessionId == targetUserId) {
                                    html += "<button class='btn btn-outline-secondary btn-sm postUpdateBtn' value='" + data.list[i].postNo + "' data-toggle='modal' data-target='#postUpdateModal'>수정</button>";
                                    html += "<button class='btn btn-outline-secondary btn-sm postDeleteBtn' value='" + data.list[i].postNo + "'>삭제</button>";
                                }
                                html += "</li>";
                                $("ul.timeline").append(html);
                                setTimeout(function() {
                                    myScroll.refresh();
                                }, 0);
                            }
                        }
                    });
                }
            }

            var askPage = 1;

            function askInfiniteScroll() {
                if (askPage <= ${askMap.resultPage.maxPage}) {
                    askPage++;
                    console.log('askPage : ' + askPage);

                    $.ajax({
                        url: "/social/rest/getAskList/",
                        method: "POST",
                        dataType: "json",
                        data: JSON.stringify({
                            currentPage: askPage,
                            targetUserId: targetUserId
                        }),
                        headers: {
                            "Accept": "application/json",
                            "Content-Type": "application/json"
                        },
                        success: function(data) {
                            for (var i = 0; i < data.list.length; i++) {
                                var html = "<div class='ask'>" +
                                    "<p>" + data.list[i].questionContent + "</p>" +
                                    "<p><span>익명</span> ｜ <span>" + data.list[i].questionDate + "</span></p>" +
                                    "<p>" + data.list[i].answerContent + "</p>" +
                                    "<p><span>" + data.list[i].user.name + "</span> ｜ <span>" + data.list[i].answerDate + "</span></p>" +
                                    "</div>";
                                $(html).appendTo("div.askList");
                                setTimeout(function() {
                                    myScroll.refresh();
                                }, 0);
                            }
                        }
                    });
                }
            }

            var askQuestionPage = 1;

            function askQuestionInfiniteScroll() {
                if (askQuestionPage <= ${askQuestionMap.resultPage.maxPage}) {
                    askQuestionPage++;
                    console.log('askQuestionPage : ' + askQuestionPage);

                    $.ajax({
                        url: "/social/rest/getAskQuestionList",
                        method: "POST",
                        dataType: "json",
                        data: JSON.stringify({
                            currentPage: askQuestionPage
                        }),
                        headers: {
                            "Accept": "application/json",
                            "Content-Type": "application/json"
                        },
                        success: function(data) {
                            for (var i = 0; i < data.list.length; i++) {
                                var html = "<div class='ask " + data.list[i].questionPostNo + "'>" +
                                    "<p><span>익명</span> · <span>" + data.list[i].questionDate + "</span></p>" +
                                    "<p><a href='#'><i class='fas fa-ellipsis-h'></i></a></p>" +
                                    "<p>" + data.list[i].questionContent + "</p>" +
                                    "<p><a class='rejectBtn'>거절하기</a><a class='regBtn'><i class='fas fa-pen'></i> 답하기</a></p>" +
                                    "<input type='hidden' value='" + data.list[i].questionPostNo + "'>" +
                                    "</div>";

                                $("div.addAsk").append(html);
                                setTimeout(function() {
                                    myScroll.refresh();
                                }, 0);
                            }
                        }
                    });
                }
            }
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

        a:hover,
        a:focus {
            text-decoration: none;
            color: inherit;
        }

        input,
        i,
        img {
            vertical-align: middle;
        }

        input:focus {
            outline: none;
        }

        body {
            color: #333;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;

        }





        div.profileHeader {

            width: 100%;
            overflow: hidden;
            padding: 50px 0;
        }

        div.profileImage2 {

            width: 35%;
            text-align: center;
            float: left;
        }

        div.profileImage2 a {

            display: inline-block;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            overflow: hidden;
            position: relative;
        }

        div.profileImage2 a img {
            width: 100%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        div.profile {

            width: 65%;
            float: right;
        }

        div.user {

            font-size: 26px;
            display: inline-block;
            vertical-align: middle;
            margin-right: 10px;

        }

        div.profileUpdate,
        div.addFriend,
        div.deleteFriend,
        div.acceptFriend,
        div.sendFlower,
        div.useSpear {

            display: inline-block;
        }

        div.profileUpdate a,
        div.addFriend a,
        div.deleteFriend a,
        div.acceptFriend a,
        div.sendFlower a,
        div.useSpear a {

            line-height: 27px;
            display: inline-block;
            padding: 0 10px;
            border: 1px solid #c6c6c6;
            border-radius: 5px;
            font-weight: bold;
            vertical-align: middle;
            margin-right: 5px;
            font-size: 14px;
        }

        div.setting {

            display: inline-block;

        }

        div.setting a {

            font-size: 25px;
            display: inline-block;
            line-height: 30px;
            vertical-align: middle;
            padding: 0 3px;
        }

        div.setting a i {
            vertical-align: 0;
        }

        div.post {

            margin-top: 15px;
            font-size: 14px;
        }

        div.totalFlower {

            display: inline-block;
            margin-right: 25px;
        }

        div.totalFlower span {
            font-weight: bold;
        }

        div.activityPoint {

            display: inline-block;
            margin-right: 25px;
        }

        div.point {

            display: inline-block;
            margin-right: 25px;
        }

        div.activityPoint span {
            font-weight: bold;
        }

        div.point span {
            font-weight: bold;
        }

        div.totalItem {

            display: inline-block;
            margin-right: 25px;
        }

        div.totalItem span {
            font-weight: bold;
        }

        div.totalItem2 {

            display: inline-block;
        }

        div.totalItem2 span {
            font-weight: bold;
        }

        div.name {

            margin-top: 15px;
            line-height: 1.5;
        }

        div.userName {

            font-weight: bold;
            font-size: 16px;
        }

        div.introduction a {
            color: rgb(0, 53, 105);
            font-weight: bold;
        }

        div.innerSectionList {

            border-top: 1px solid #dddddd;

        }

        div.sectionList ul.sectionNav {

            width: 55%;
            margin: 0 auto;
            text-align: center;
            

        }

        div.sectionList ul.sectionNav li {

            /*float: left;*/
            width: 25%;
            text-align: center;
            line-height: 50px;
            font-size: 12px;
            color: #898989;
            font-weight: bold;
            display: inline-block;
        }
        
        ul.sectionNav.on li {
            float: left;
        }

        div.sectionList ul.sectionNav li.on {
            color: #333;
        }

        div.sectionList ul.sectionNav li a {

            display: block;
            position: relative;

        }

        div.sectionList ul.sectionNav li a:after {
            content: '';
            width: 45%;
            height: 1px;
            background-color: #333;

            position: absolute;
            top: -1px;
            left: 50%;
            transform: translateX(-50%);
            display: none;

        }

        div.sectionList ul.sectionNav li.on a:after {
            display: block;
        }

        div.sectionList ul.sectionNav li a i {

            margin-right: 3px;
        }


        section.displaySection>div {
            display: none;

        }

        section.displaySection>div.on {
            display: block;
        }

        section.displaySection {
            clear: both;
        }

    </style>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
    <script>
        var sessionId = null;
        var sessionName = null;
        var sessionMail = null;
        var sessionPhone = null;
        var itemCategory = null;
        var itemName = null;
        var price = null;
        var itemCount = null;


        $(document).ready(function() {
            $(document).on('click', 'a[href="#"]', function(e) {
                e.preventDefault();
            });


            var sessionUserId = $("input#sessionUserId").val();
            var targetUserId = $("input#targetUserId").val();

            /* pureAlert confirm 주석풀지마셈 
            var pureAlert = $.pureAlert.confirm({
            	title : "알림",
            	content : "친구를 끊으시겠습니까?",
            	okBtn : "삭제",
            	cancelBtn : "취소",
            	autoShow : true,
            	closeButton : false
            });
            pureAlert.on('ok.pure-alert', function(e) {}) 
            */


            //	친구신청 Btn Event
            $(document).on("click", "div.addFriend", function() {

                $.ajax({
                    url: "/friend/rest/requestFriend",
                    method: "POST",
                    headers: {
                        "Accept": "application/json",
                        "Content-Type": "application/json"
                    },
                    dataType: "json",
                    data: JSON.stringify({
                        firstUserId: sessionUserId,
                        secondUserId: targetUserId
                    }),
                    success: function() {

                        var html = "<div class='deleteFriend'><a href='#'>친구신청취소</a></div>"
                        $("div.user").after(html);
                        $("div.addFriend").remove();

                        //socket push
                        socketMsg = sessionUserId + "," + targetUserId + "," + sessionName + "," + "4,3";
                        console.log(socketMsg)
                        wsocket.send(socketMsg);
                        addNoti(sessionUserId, targetUserId, "4", "3");

                    }
                });
            });

            // 친구신청취소, 친구끊기 Btn Event
            $(document).on("click", "div.deleteFriend", function() {
                var text = $(this).children("a").text();
				
                
                var pureAlert = $.pureAlert.confirm({
                    title: "알림",
                    content: text + "를 하시겠습니까?",
                    okBtn: "확인",
                    cancelBtn: "취소",
                    autoShow: true,
                    closeButton: false
                });
                pureAlert.on('ok.pure-alert', function(e) {
                    $.ajax({
                        url: "/friend/rest/deleteFriend",
                        method: "POST",
                        headers: {
                            "Accept": "application/json",
                            "Content-Type": "application/json"
                        },
                        dataType: "json",
                        data: JSON.stringify({
                            firstUserId: sessionUserId,
                            secondUserId: targetUserId
                        }),
                        success: function() {
                            $("div.deleteFriend").remove();
                            $("div.sendFlower").remove();
                            $("div.useSpear").remove();
                            var html = "<div class='addFriend'><a href='#'>친구신청</a></div>"
                            $("div.user").after(html);

                            /* setTimeout(function() {
                                $("input[value='" + targetUserId + "']").parent().remove();
                            }, 0); */
                        }
                    });
                })
            });

            // 친구신청(수락) div.acceptFriend Btn Event
            $(document).on("click", "div.acceptFriend", function() {
                console.log("click");

                $.ajax({
                    url: "/friend/rest/acceptFriend",
                    method: "POST",
                    headers: {
                        "Accept": "application/json",
                        "Content-Type": "application/json"
                    },
                    dataType: "json",
                    data: JSON.stringify({
                        firstUserId: sessionUserId,
                        secondUserId: targetUserId
                    }),
                    success: function() {

                        //socket push
                        socketMsg = sessionUserId + "," + targetUserId + "," + sessionName + "," + "4,4,";
                        console.log(socketMsg)
                        wsocket.send(socketMsg);
                        addNoti(sessionUserId, targetUserId, "4", "4");
                        
                        $("div.acceptFriend").remove();
                        var html = "<div class='deleteFriend'><a href='#'>친구끊기</a></div>" +
                            "<div class='sendFlower'><a href=''#' class='addMatching' data-toggle='modal' data-target='#exampleModal'>꽃보내기</a></div>" +
                            "<div class='useSpear'><a href='#'>찔러보기</a></div>";
                        $("div.user").after(html);
                    }
                });
            });

            //프로필수정 Btn Event
            $(document).on("click", "div.profileUpdate", function() {
                $.redirect("/user/updateProfileView", {
                    userId: sessionUserId
                });
            });









            $(function() {
                $(document).on('click', '.addMatching', function() {

                    //alert('클릭ㅋㅋ');

                    //alert('userId : ' + sessionUserId);
                    //alert('secondUserId : ' + targetUserId);
                    $.ajax({
                        url: '/matching/rest/addMatching2/' + sessionUserId + '/' + targetUserId,
                        method: 'GET',
                        dataType: 'json',
                        data: JSON.stringify({
                            userId: sessionUserId,
                            secondUserId: targetUserId
                        }),
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json'
                        },
                        success: function(data) {
                            //alert('성공ㅋㅋ');

                            var secondUserId2 = data.secondUserId;
                            //alert('secondUserId2 : ' + secondUserId2);

                            var secondUserName = data.secondUserName;
                            //alert('secondUserName : ' + secondUserName);
                            var displayValue = '';
                            if (targetUserId == secondUserId2) {

                                displayValue = '<form action="" style="font-weight:bold;text-align:center">' +
                                    ' <input type="hidden" name="userId" value="' + sessionUserId + '">' +
                                    ' <input type="hidden" name="secondUserId" value="' + targetUserId + '">' +
                                    ' <input type="hidden" name="secondUserId" value="' + secondUserName + '">' + '보낸 꽃은 한달 뒤에 취소할 수 있습니다.<br>🌹🌹' + secondUserName + '님에게 꽃을 보내시겠습니까?🌹🌹' +
                                    ' </form>';
                                //alert(displayValue);

                                $('#exampleModal div.modal-footer').find('button:nth-child(2)').addClass('check');
                            } else {
                                displayValue = '<form action="">' +
                                    ' <input type="hidden" name="userId" value="' + sessionUserId + '">' +
                                    ' <input type="hidden" name="secondUserId"value="' + secondUserName + '">' +
                                    ' <input type="hidden" name="secondUserId" value="' + secondUserName + '">' + secondUserName + '님에게 보낸 꽃을 취소하시겠습니까?😥' +
                                    ' </form>';
                                //alert(displayValue);
                                $('#exampleModal div.modal-footer').find('button:nth-child(2)').addClass('check2');
                            }
                            $('#exampleModal div.modal-body2').html(displayValue);
                            $('#exampleModal div.modal-footer').find('button:nth-child(2)').css({
                                'display': 'block'
                            });
                            $('#exampleModal div.modal-footer').find('button:nth-child(1)').text('취소');
                        },
                        error: function(request, status, error) {
                            //alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                        }
                    });
                });





                $('#myModal').on('shown.bs.modal', function() {
                    $('#myInput').trigger('focus');
                });

            });



            $(document).on('click', '.check', function() {
                $(this).removeClass('check');
                //alert('클릭ㅋㅋ');

                //alert('userId : ' + sessionUserId);
                //alert('secondUserId : ' + targetUserId);
                
                
                
                $.ajax({
                    url: '/matching/rest/addMatching3/' + sessionUserId + '/' + targetUserId,
                    method: 'GET',
                    dataType: 'json',
                    data: JSON.stringify({
                        userId: sessionUserId,
                        secondUserId: targetUserId
                    }),
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    success: function(data) {
                        //alert('성공ㅋㅋ');
                        socketMsg = sessionUserId + "," + targetUserId + "," + sessionName + "," + "6,5";
                        console.log(socketMsg)
                        wsocket.send(socketMsg);
                        addNoti(sessionUserId, targetUserId, "6", "5");
                        
                        var displayValue = '🌹🌹꽃을 보냈습니다🌹🌹';

                        $('#exampleModal div.modal-body2').html(displayValue);
                        $('div.totalFlower span').text(data);
                        //alert($('div.totalFlower span').text());
                        $('.addMatching').text('꽃보내기취소');
                        $('.addMatching').removeClass('addMatching').addClass('deleteMatching');
                        $('#exampleModal div.modal-footer').find('button:nth-child(2)').css({
                            'display': 'none'
                        });
                        $('#exampleModal div.modal-footer').find('button:nth-child(1)').text('확인').on("click",function(){
                        	socket.emit("matchingMe",sessionUserId);
                            socket.emit("matchingYou",targetUserId);
                        });
                    },
                    error: function(request, status, error) {
                        //alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });





            $(document).on('click', '.deleteMatching', function() {

                //alert('클릭ㅋㅋ');

                //alert('userId : ' + sessionUserId);
                //alert('secondUserId : ' + targetUserId);
                $.ajax({
                    url: '/matching/rest/deleteMatching/' + sessionUserId + '/' + targetUserId,
                    method: 'GET',
                    dataType: 'json',
                    data: JSON.stringify({
                        userId: sessionUserId,
                        secondUserId: targetUserId
                    }),
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    success: function(data) {
                        //alert('성공ㅋㅋ');
                        var secondUserName = data.secondUserName;
                        var displayValue = '<form action="">' +
                            '<input type="hidden" name="userId" value="' + sessionUserId + '">' +
                            '<input type="hidden" name="secondUserId"value="' + targetUserId + '">' +
                            '<input type="hidden" name="secondUserId" value="' + targetUserId + '">' + secondUserName + '님에게 보낸 꽃을 취소하시겠습니까?😥' +
                            '</form>';
                        $('#exampleModal div.modal-body2').html(displayValue);
                        $('#exampleModal div.modal-footer').find('button:nth-child(2)').addClass('check2');
                        $('#exampleModal div.modal-footer').find('button:nth-child(2)').css({
                            'display': 'block'
                        });
                        $('#exampleModal div.modal-footer').find('button:nth-child(1)').text('취소');
                    },
                    error: function(request, status, error) {
                        //alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });



            $(document).on('click', '.check2', function() {
                $(this).removeClass('check2');
                //alert('클릭ㅋㅋ');

                //alert('userId : ' + sessionUserId);
                //alert('secondUserId : ' + targetUserId);
                $.ajax({
                    url: '/matching/rest/deleteMatching2/' + sessionUserId + '/' + targetUserId,
                    method: 'GET',
                    dataType: 'json',
                    data: JSON.stringify({
                        userId: sessionUserId,
                        secondUserId: targetUserId
                    }),
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    success: function(data) {
                        //alert('성공ㅋㅋ');
                        var displayValue = '';
                        //alert('data.result : ' + data.result);
                        if (data.result == false) {
                            displayValue = '꽃 보내기 30일 후 취소가 가능합니다.';



                        } else {
                            displayValue = '보낸 꽃을 취소했습니다.';





                            var totalMatching = data.totalMatching;
                            //alert('totalMatching : ' + totalMatching);
                            $('div.totalFlower span').text(totalMatching);
                            $('.deleteMatching').text('꽃보내기');
                            $('.deleteMatching').removeClass('deleteMatching').addClass('addMatching');

                        }

                        $('#exampleModal div.modal-body2').html(displayValue);
                        $('#exampleModal div.modal-footer').find('button:nth-child(2)').css({
                            'display': 'none'
                        });
                        $('#exampleModal div.modal-footer').find('button:nth-child(1)').text('확인');

                    },
                    error: function(request, status, error) {
                        //alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });





            $(document).on('click', 'div.useSpear a', function() {


                //alert('클릭ㅋㅋ');

                //alert('userId : ' + sessionUserId);
                //alert('secondUserId : ' + targetUserId);
                $.ajax({
                    url: '/matching/rest/updateItem/' + sessionUserId + '/' + targetUserId,
                    method: 'GET',
                    dataType: 'json',
                    data: JSON.stringify({
                        userId: sessionUserId,
                        secondUserId: targetUserId
                    }),
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    success: function(data) {
                        //alert('성공ㅋㅋ');
                        var secondUserName = data.secondUserName;
                        var displayValue = '';
                        if (data.result == true) {
                            displayValue = '<form action="">' +
                                '<input type="hidden" name="userId" value="' + sessionUserId + '">' +
                                '<input type="hidden" name="secondUserId" value="' + targetUserId + '">' +
                                '<input type="hidden" name="secondUserId" value="' + targetUserId + '">' + secondUserName + '님에게 창을 사용하시겠습니까?' +
                                '</form>';

                            $('#exampleModal div.modal-footer').find('button:nth-child(2)').css({
                                'display': 'block'
                            });
                            $('#exampleModal div.modal-footer').find('button:nth-child(2)').addClass('check3');
                            $('#exampleModal div.modal-footer').find('button:nth-child(1)').text('취소');
                        } else {
                            displayValue = '사용 가능한 창이 없습니다😥<br>' +
                                secondUserName + '님의 마음을 알고 싶으신가요? 지금 바로 구매하세요😉';

                            $('#exampleModal div.modal-footer').find('button:nth-child(2)').css({
                                'display': 'block'
                            });
                            $('#exampleModal div.modal-footer').find('button:nth-child(1)').text('취소');
                            $('#exampleModal div.modal-footer').find('button:nth-child(2)').text('구매');
                            
                            $('#exampleModal div.modal-footer').find('button:nth-child(2)').on("click", function() {
                            	$("div.modal").hide();
								itemCategory = '1';
								itemName = '창';
								var sessionTotalPoint = $("input#sessionTotalPoint").val();
								console.log(itemCategory, itemName, sessionTotalPoint);
								$("#purchaseModal").modal();
                            });
                        }


                        $('#exampleModal div.modal-body2').html(displayValue);
                    },
                    error: function(request, status, error) {
                        //alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });




            $(document).on('click', '.check3', function() {


                //alert('클릭ㅋㅋ');
                $(this).removeClass('check3');

                //alert('userId : ' + sessionUserId);
                //alert('secondUserId : ' + targetUserId);
                $.ajax({
                    url: '/matching/rest/updateItem3/' + sessionUserId + '/' + targetUserId,
                    method: 'GET',
                    dataType: 'json',
                    data: JSON.stringify({
                        userId: sessionUserId,
                        secondUserId: targetUserId
                    }),
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    success: function(data) {
                        //alert('성공ㅋㅋ');
                        var secondUserName = data.secondUserName;
                        var displayValue = '';
                        //alert('data.useResult : ' + data.useResult);
                        if (data.useResult == '1') {
                            displayValue = '<form action="">' +
                                '<input type="hidden" name="userId" value="' + sessionUserId + '">' +
                                '<input type="hidden" name="secondUserId" value="' + targetUserId + '">' +
                                '<input type="hidden" name="secondUserId" value="' + targetUserId + '">🌹🌹' + secondUserName + '님이 회원님에게 꽃을 보냈습니다🌹🌹' +
                                '</form>';
                        } else if (data.useResult == '2') {
                            displayValue = '<form action="">' +
                                '<input type="hidden" name="userId" value="' + sessionUserId + '">' +
                                '<input type="hidden" name="secondUserId" value="' + targetUserId + '">' +
                                '<input type="hidden" name="secondUserId" value="' + targetUserId + '">' + secondUserName + '님은 꽃을 보내지 않았습니다😥' +
                                '</form>';
                        } else {
                            displayValue = '<form action="">' +
                                '<input type="hidden" name="userId" value="' + sessionUserId + '">' +
                                '<input type="hidden" name="secondUserId" value="' + targetUserId + '">' +
                                '😇' + secondUserName + '님의 방패가 자동 사용되었습니다😇' +
                                '</form>';
                        }


                        $('#exampleModal div.modal-body2').html(displayValue);
                        $('#exampleModal div.modal-footer').find('button:nth-child(2)').css({
                            'display': 'none'
                        });
                        $('#exampleModal div.modal-footer').find('button:nth-child(1)').text('확인');
                    },
                    error: function(request, status, error) {
                        //alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });



            $(function() {
                $('div.sectionList ul.sectionNav li a').on('click', function() {

                    var i = $(this).parent().index();
                    $('div.sectionList ul li').removeClass('on');
                    $('div.sectionList ul li').eq(i).addClass('on');
                    $('section.displaySection > div').removeClass('on');
                    $('section.displaySection > div').eq(i).addClass('on');

                });

                $('.replyQuestionBtn').on("click", function() {
                    var i = $(this).parent().index();
                    $('div.section ul li').removeClass('on');
                    $('div.section ul li').eq(i).addClass('on');
                    $('section > div').removeClass('on');
                    $('section > div').eq(i).addClass('on');
                    setTimeout(function() {
                        myScroll.refresh();
                    }, 0);
                });

                $('.listAskBtn').on("click", function() {
                    var i = $(this).parent().index();
                    $('div.section ul li').removeClass('on');
                    $('div.section ul li').eq(i).addClass('on');
                    $('section > div').removeClass('on');
                    $('section > div').eq(i - 3).addClass('on');
                    setTimeout(function() {
                        myScroll.refresh();
                    }, 0);
                });
            });
        });

    </script>
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
            price = 99000; ///////////////////// controller에서 받은 값으로 변경하기
        });


        $(document).on("click", ".purchaseBtn", function() {
        	////////////재이가 추가함///////////////////
            $('#exampleModal div.modal-footer').find('button:nth-child(2)').removeClass('purchaseBtn'); //확인버튼을 누르면 class 지워짐
            //모달 닫기
            $("#exampleModal").modal("hide");
			////////////재이가 추가함///////////////////
			var currPoint = $("input#totalPoint").val();
            itemCategory = $(this).children("input[type='hidden']").val();
            itemCount = $(this).children("span").html();
            console.log("itemCount", itemCount);
            console.log("itemCategory", itemCategory);
            if (itemCategory == "1") {
                itemName = "창";
            } else if (itemCategory == "2") {
                itemName = "방패";
            }

            $("#purchaseModal").modal();
        });

        $(document).on("click", "#cardBtn", function() {
            var paymentOption = $(this).val();
            console.log("paymentOption", paymentOption);
            console.log("itemName", itemName);

            var pureAlert = $.pureAlert.confirm({
                title: "알림",
                content: "현금 구매를 진행하시겠습니까?",
                okBtn: "구매",
                cancelBtn: "취소",
                autoShow: true,
                closeButton: false
            });

            pureAlert.on('ok.pure-alert', function(e) {

                IMP.request_pay({
                    pg: 'html5_inicis', //ActiveX 결제창은 inicis를 사용
                    pay_method: 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
                    merchant_uid: 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
                    name: itemName,
                    amount: price,
                    buyer_email: sessionMail,
                    buyer_name: sessionName,
                    buyer_tel: sessionPhone, //누락되면 이니시스 결제창에서 오류
                }, function(rsp) {
                    if (rsp.success) {
                        //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                        jQuery.ajax({
                            url: "/purchase/rest/addPurchase", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
                            type: 'POST',
                            dataType: 'json',
                            headers: {
                                "Accept": "application/json",
                                "Content-Type": "application/json"
                            },
                            data: JSON.stringify({
                                userId: sessionId,
                                paymentOption: paymentOption,
                                itemCategory: itemCategory,
                                importId: rsp.imp_uid,
                                price: price
                                //기타 필요한 데이터가 있으면 추가 전달
                            })
                        }).done(function(data) {
                            //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                            if (rsp.success) {
                                var msg = '결제가 완료되었습니다.';
                                /* msg += '\n고유ID : ' + rsp.imp_uid;
                                msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                                msg += '\결제 금액 : ' + rsp.paid_amount;
                                msg += '카드 승인번호 : ' + rsp.apply_num; */

                                alert(msg);
                                $.redirect("/user/getProfile/" + targetUserId, {}, "get");
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
        	if (sessionId != targetUserId) {
				currPoint = $("input#sessionTotalPoint").val();
				//alert(currPoint);
			}
            var paymentOption = $(this).val();
            console.log("itemName", itemName);
            console.log("paymentOption", paymentOption);

            if (currPoint < price) {
                var pureAlert = $.pureAlert.alert({
                    title: "알림",
                    content: "포인트가 부족합니다.",
                    okBtn: "확인",
                    autoShow: true,
                    closeButton: false
                });

                return;
            }

            var pureAlert = $.pureAlert.confirm({
                title: "알림",
                content: "포인트 구매를 진행하시겠습니까?",
                okBtn: "구매",
                cancelBtn: "취소",
                autoShow: true,
                closeButton: false
            });

            pureAlert.on('ok.pure-alert', function(e) {

                $.ajax({
                    url: "/purchase/rest/addPurchase", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
                    type: 'POST',
                    dataType: 'json',
                    headers: {
                        "Accept": "application/json",
                        "Content-Type": "application/json"
                    },
                    data: JSON.stringify({
                        userId: sessionId,
                        paymentOption: paymentOption,
                        itemCategory: itemCategory,
                        price: price
                    }),
                    success: function(data) {
                        if (data.success) {
                            var msg = '결제가 완료되었습니다.';
                            alert(msg);
                            $.redirect("/user/getProfile/" + targetUserId, {}, "get");
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
        
        $(function() {
        	if($('ul.sectionNav').find('li').hasClass('coupleTimeline')) {
        		$('ul.sectionNav').addClass('on');
        	}
        });

    </script>

    <style>





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
            padding: 15px 0 0 15px;d
            position: relative;
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
		a#myProfile {
			color: #EBAD7A;
			
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
                        ${targetUser.name} 프로필
                    </div>
                    <div class="right2">
                        <a href="#"><i class="far fa-star"></i></a>
                    </div>
                </div>
                <input type="hidden" id="sessionUserId" value="${user.userId}">
                <input type="hidden" id="targetUserId" value="${targetUserId}">
                <input type="hidden" id="sessionMail" value="${user.mail}">
                <input type="hidden" id="sessionName" value="${user.name}">
                <input type="hidden" id="sessionPhone" value="${user.phone}">
                <input type="hidden" id="totalPoint" value="${reward.recentlyTotalPoint}">
                <input type="hidden" id="sessionTotalPoint" value="${sessionReward.recentlyTotalPoint}">

                <div>
                    <div class="profileHeader">
                        <div class="profileImage2">
                            <a href="#">
                                <c:if test="${empty askMap.targetUser.profileName}">

                                    <img src="/images/bonobono.jpg" alt="">
                                </c:if>
                                <c:if test="${!empty askMap.targetUser.profileName}">
                                    <img src="/images/${askMap.targetUser.profileName}" alt="">
                                </c:if>

                            </a>
                        </div>
                        <div class="profile">
                            <div class="userId">
                                <div class="user">${targetUser.userId}</div>
                                <%-- ${checkFriend1.friendStatus} ${checkFriend2.friendStatus} --%>
                                <c:if test="${user.userId eq targetUserId }">
                                    <div class="profileUpdate"><a href="#">프로필 편집</a></div>
                                    <div class="setting" style="display:none"><a href="#"><i class="fas fa-cog"></i></a></div>
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
                    <div class="sectionList">
                        <div class="innerSectionList">
                            <ul class="sectionNav">
                                <li class="on"><a href="#"><i class="fas fa-th"></i> 타임라인</a></li>
                                <li><a href="#"><i class="fas fa-tv"></i> ASK</a></li>
                                
                                
                                <c:if test="${user.userId eq targetUserId }">
                                
                                    <c:if test="${!empty couple}">
                                    
                                    	<li class="coupleTimeline"><a href="#"><i class="far fa-bookmark"></i> 커플타임라인</a></li>
                                		<li><a href="#"><i class="fas fa-user-tag"></i> 커플캘린더</a></li>
                                	</c:if>
                                </c:if>
                                
                                
                                
                                
                                
                            </ul>
                        </div>
                        <section class="displaySection">
                            <div class="list1 on">
                                <c:if test="${targetUser.publicStatus == 2 && user.userId ne targetUser.userId}">
                              		<div style="text-align : center">
                              		<img alt="#" src="/images/lock-icon.png" style="width : 30%; height : 30%;">
                              		<h5 style="font-weight : bold"> 비공개 계정입니다.</h5>
                              		</div>
                                </c:if>
                                <c:if test="${targetUser.publicStatus == 1 || user.userId eq targetUser.userId}">
                                    <jsp:include page="/social/includeListTimeline.jsp" />
                                </c:if>
                            </div>
                            <div class="list2">
                                <c:if test="${targetUser.publicStatus == 2 && user.userId ne targetUser.userId}">
                              		<div style="text-align : center">
                              		<img alt="#" src="/images/lock-icon.png" style="width : 30%; height : 30%;">
                              		<h5 style="font-weight : bold"> 비공개 계정입니다.</h5>
                              		</div>
                                </c:if>
                                <c:if test="${targetUser.publicStatus == 1 || user.userId eq targetUser.userId}">
                                    <jsp:include page="/social/includeListAsk.jsp" />
                                </c:if>
                            </div>
                            <div class="list3">
                                    <jsp:include page="/couple/listCoupleTimelinePost2.jsp" />
                            </div>
                            <div class="list4">
                                    <jsp:include page="/couple/listSchedule3.jsp" />
                            </div>
                            <div class="list5">
                                    <jsp:include page="/social/includeListAskQuestion.jsp" />
                            </div>
                        </section>
                    </div>
                </div>
            </ul>
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
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
                            <p>현재 포인트 :
                            <c:if test="${user.userId eq targetUser.userId }">
                                <c:if test="${!empty reward.recentlyTotalPoint}">
                                    ${reward.recentlyTotalPoint}
                                </c:if>
                                <c:if test="${empty reward.recentlyTotalPoint}">
                                    0
                                </c:if>
                            </c:if>
                            <c:if test="${user.userId ne targetUser.userId }">
                                <c:if test="${!empty sessionReward.recentlyTotalPoint}">
                                    ${sessionReward.recentlyTotalPoint}
                                </c:if>
                                <c:if test="${empty sessionReward.recentlyTotalPoint}">
                                    0
                                </c:if>
                            </c:if>
                            </p> <!-- //////////////////////////// 유저포인트로 수정하기 -->
                        </div>
                        <div class="col-sm-6">
                            <button type="button" class="btn btn-outline-primary btn-lg btn-block" id="cardBtn" value="1">현금 구매<br />99,000원</button>
                        </div>
                        <div class="col-sm-6">
                            <button type="button" class="btn btn-outline-primary btn-lg btn-block" id="pointBtn" value="2">포인트 구매<br />99,000포인트</button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Button trigger modal -->
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="border:none">

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body2" style="font-weight:bold;text-align:center">

                </div>
                <div class="modal-footer" style="border:none">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary">확인</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="postUpdateModal" tabindex="-1" role="dialog" aria-labelledby="postUpdateModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="postUpdateModalLabel">수정</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <textarea class="form-control textareaInModal" id="summernote2"></textarea>
                </div>
                <div class="modal-footer">
                    <select class="custom-select float-right viewStatusInModal" name="viewStatus">
                        <option value="1" selected="selected">전체공개</option>
                        <option value="2">나만보기</option>
                    </select>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary confirmUpdateBtn">수정</button>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- 커플타임라인모달 -->
    <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
            <div class="modal-content addCoupleTimelinePost">
                <div class="modal-header">
                    <div class="postDate" style="width: 100%">
                        <input type="text" value="" name="postDate" id="addCoupleTimelinePostDatepicker">
                        <input type="hidden" name="postNo">
                    </div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="resetCoupleTimelineModal()">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    










                        


						<form id="addCoupleTimelinePostForm" enctype="multipart/form-data" accept-charset="euc-kr">
                            <div class="addCoupleTimelinePostModalBody">
                            <a href="#" class="uploadFileName">
								<img src="" alt="" id="img">
                                <div class="postDate">
                                    <div>
                                        <p class="postDate" style="margin: 0;"></p>
                                        <p class="place" style="margin: 0;"></p>
                                        <p class="postContent" style="margin:0;"></p>
                                    </div>
                                </div>
                            </a>
                            <div>
                                <input type="file" id="input_img" name="file" style="display: none"/>
                                <div class="place">
                                    <p>
                                        <i class="fas fa-map-marker-alt"></i>
                                        <input type="text" value="" name="place" placeholder="위치 추가">
                                    </p>
                                </div>
                                <div class="postContent">
                                    <textarea name="postContent" id="" cols="30" rows="3" placeholder="문구 입력..."></textarea>
                                </div>
                            </div>
                        </div>
                        
                       </form>



						
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="resetCoupleTimelineModal()">취소</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="deleteCoupleTimelinePost()" style="display:none">삭제</button>
                    <button type="button" class="btn btn-primary" onclick='createRoom()'>등록</button>
                    <button type="button" class="btn btn-primary" onclick='updateCoupleTimelinePost()' style="display:none">수정</button>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
