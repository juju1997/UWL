	var sessionId = null;
	var sessionName = null;
	var sessionMail = null;
	var sessionPhone = null;
	var itemCategory = null;
	var itemName = null;
	var price = null;
	var itemCount = null;


$(document).ready(function () {
    $(document).on('click', 'a[href="#"]', function (e) {
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
    $(document).on("click", "div.addFriend", function () {

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
            success: function () {
            	
            	var html = "<div class='deleteFriend'><a href='#'>친구신청취소</a></div>"
            		$("div.user").after(html);
            	$("div.addFriend").remove();
            	
            	//socket push
				socketMsg = sessionUserId + "," + targetUserId +"," + sessionName +"," + "friend,add";
				console.log(socketMsg)
				socket.send(socketMsg);
            	
            }
        });
    });

    // 친구신청취소, 친구끊기 Btn Event
    $(document).on("click", "div.deleteFriend", function () {
        var text = $(this).children("a").text();

        var pureAlert = $.pureAlert.confirm({
            title: "알림",
            content: text + "를 하시겠습니까?",
            okBtn: "확인",
            cancelBtn: "취소",
            autoShow: true,
            closeButton: false
        });
        pureAlert.on('ok.pure-alert', function (e) {

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
                success: function () {
                    $("div.deleteFriend").remove();
                    $("div.sendFlower").remove();
                    $("div.useSpear").remove();
                    var html = "<div class='addFriend'><a href='#'>친구신청</a></div>"
                    $("div.user").after(html);
                }
            });
        })
    });

    // 친구신청(수락) div.acceptFriend Btn Event
    $(document).on("click", "div.acceptFriend", function () {
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
            success: function () {
            	
            	//socket push
				socketMsg = sessionUserId + "," + targetUserId +"," + sessionName +"," + "friend,add,"+postNo;
				console.log(socketMsg)
				socket.send(socketMsg);
            	
                $("div.acceptFriend").remove();
                var html = "<div class='deleteFriend'><a href='#'>친구끊기</a></div>" +
                    "<div class='sendFlower'><a href=''#' class='addMatching' data-toggle='modal' data-target='#exampleModal'>꽃보내기</a></div>" +
                    "<div class='useSpear'><a href='#'>찔러보기</a></div>";
                $("div.user").after(html);
            }
        });
    });

    //프로필수정 Btn Event
    $(document).on("click", "div.profileUpdate", function () {
        $.redirect("/user/updateProfileView", {
            userId: sessionUserId
        });
    });









    $(function () {
        $(document).on('click', '.addMatching', function () {

            alert('클릭ㅋㅋ');

            alert('userId : ' + sessionUserId);
            alert('secondUserId : ' + targetUserId);
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
                success: function (data) {
                    alert('성공ㅋㅋ');

                    var secondUserId2 = data.secondUserId;
                    alert('secondUserId2 : ' + secondUserId2);
                    var displayValue = '';
                    if (targetUserId == secondUserId2) {

                        displayValue = '<form action="">' +
                            ' <h3>꽃 보내는거 확인</h3>' +
                            ' <input type="text" name="userId" value="' + sessionUserId + '">' +
                            ' <input type="text" name="secondUserId" value="' + targetUserId + '"><br><br>' +
                            ' <input type="text" name="secondUserId" value="' + targetUserId + '">님에게 꽃을 보내시겠습니까? 30일 후 취소가 가능합니다.<br>' +
                            ' <a href="#" class="check">확인</a>' +
                            ' </form>';
                        alert(displayValue);
                    } else {
                        displayValue = '<form action="">' +
                            ' <h3>꽃 보내기 취소 확인</h3>' +
                            ' <input type="text" name="userId" value="' + sessionUserId + '">' +
                            ' <input type="text" name="secondUserId"value="' + secondUserId2 + '"><br><br>' +
                            ' <input type="text" name="secondUserId" value="' + secondUserId2 + '">님에게 보낸 꽃을 취소하시겠습니까?<br>' +
                            ' <a href="#" class="check2">확인</a>' +
                            ' </form>';
                        alert(displayValue);
                    }
                    $('div.modal-body').html(displayValue);
                },
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        });





        $('#myModal').on('shown.bs.modal', function () {
            $('#myInput').trigger('focus');
        });

    });



        $(document).on('click', '.check', function () {
            alert('클릭ㅋㅋ');

            alert('userId : ' + sessionUserId);
            alert('secondUserId : ' + targetUserId);
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
                success: function (data) {
                    alert('성공ㅋㅋ');
                    var displayValue = '<h3>꽃 보냄</h3>' +
                        '꽃을 보냈습니다.';

                    $('div.modal-body').html(displayValue);
                    $('div.totalFlower span').text(data);
                    alert($('div.totalFlower span').text());
                    $('.addMatching').text('꽃보내기취소');
                    $('.addMatching').removeClass('addMatching').addClass('deleteMatching');
                },
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        });





        $(document).on('click', '.deleteMatching', function () {

            alert('클릭ㅋㅋ');

            alert('userId : ' + sessionUserId);
            alert('secondUserId : ' + targetUserId);
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
                success: function (data) {
                    alert('성공ㅋㅋ');
                    var displayValue = '<form action="">' +
                        '<h3>꽃 보내기 취소 확인</h3>' +
                        '<input type="text" name="userId" value="' + sessionUserId + '">' +
                        '<input type="text" name="secondUserId"value="' + targetUserId + '"><br><br>' +
                        '<input type="text" name="secondUserId" value="' + targetUserId + '">님에게 보낸 꽃을 취소하시겠습니까?<br>' +
                        '<a href="#" class="check2">확인</a>' +
                        '</form>';
                    $('div.modal-body').html(displayValue);
                },
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        });



        $(document).on('click', '.check2', function () {
            alert('클릭ㅋㅋ');

            alert('userId : ' + sessionUserId);
            alert('secondUserId : ' + targetUserId);
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
                success: function (data) {
                    alert('성공ㅋㅋ');
                    var displayValue = '';
                    alert('data.result : ' + data.result);
                    if (data.result == false) {
                        displayValue = '<h3>꽃 보내고 30일 안 지남</h3>' +
                            '꽃 보내기 30일 후 취소가 가능합니다.';



                    } else {
                        displayValue = '<h3>꽃 보내기 취소함</h3>' +
                            '보낸 꽃을 취소했습니다.';





                        var totalMatching = data.totalMatching;
                        alert('totalMatching : ' + totalMatching);
                        $('div.totalFlower span').text(totalMatching);
                        $('.deleteMatching').text('꽃보내기');
                        $('.deleteMatching').removeClass('deleteMatching').addClass('addMatching');

                    }

                    $('div.modal-body').html(displayValue);


                },
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        });





        $(document).on('click', 'div.useSpear a', function () {


            alert('클릭ㅋㅋ');

            alert('userId : ' + sessionUserId);
            alert('secondUserId : ' + targetUserId);
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
                success: function (data) {
                    alert('성공ㅋㅋ');
                    var displayValue = '';
                    if (data.result == true) {
                        displayValue = '<form action="">' +
                            '<h3>창 사용 확인</h3>' +
                            '<input type="text" name="userId" value="' + sessionUserId + '">' +
                            '<input type="text" name="secondUserId" value="' + targetUserId + '"><br><br>' +
                            '<input type="text" name="secondUserId" value="' + targetUserId + '">님에게 창을 사용하시겠습니까?<br>' +
                            '<a href="#" class="check3">확인</a>' +
                            '</form>';
                    } else {
                        displayValue = '<h3>창 없음</h3>' +
                            '창이 없습니다.';
                    }


                    $('div.modal-body').html(displayValue);
                },
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        });




        $(document).on('click', 'a.check3', function () {


            alert('클릭ㅋㅋ');

            alert('userId : ' + sessionUserId);
            alert('secondUserId : ' + targetUserId);
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
                success: function (data) {
                    alert('성공ㅋㅋ');
                    var displayValue = '';
                    alert('data.useResult : ' + data.useResult);
                    if (data.useResult == '1') {
                        displayValue = '<form action="">' +
                            '<h3>창 사용 결과 : 꽃 보냄</h3>' +
                            '<input type="text" name="userId" value="' + sessionUserId + '">' +
                            '<input type="text" name="secondUserId" value="' + targetUserId + '"><br><br>' +
                            '<input type="text" name="secondUserId" value="' + targetUserId + '">님이 꽃을 보냈습니다.' +
                            '</form>';
                    } else if (data.useResult == '2') {
                        displayValue = '<form action="">' +
                            '<h3>창 사용 결과 : 꽃 안 보냄</h3>' +
                            '<input type="text" name="userId" value="' + sessionUserId + '">' +
                            '<input type="text" name="secondUserId" value="' + targetUserId + '"><br><br>' +
                            '<input type="text" name="secondUserId" value="' + targetUserId + '">님이 꽃을 보내지 않았습니다.' +
                            '</form>';
                    } else {
                        displayValue = '<form action="">' +
                            '<h3>창 사용 결과 : 방패 씀</h3>' +
                            '<input type="text" name="userId" value="' + sessionUserId + '">' +
                            '<input type="text" name="secondUserId" value="' + targetUserId + '"><br><br>' +
                            '방패가 자동 사용되었습니다.' +
                            '</form>';
                    }


                    $('div.modal-body').html(displayValue);
                },
                error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        });

        
        
    $(function () {
        $('div.section ul li a').on('click', function () {

            var i = $(this).parent().index();
            $('div.section ul li').removeClass('on');
            $('div.section ul li').eq(i).addClass('on');
            $('section > div').removeClass('on');
            $('section > div').eq(i).addClass('on');

        });
    });
});
