<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
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

        div.listCoupleTimelinePost {
            padding-top: 10px;
            width: 100%;
            margin: 0 auto;
            background: #fff;
        }

        div.listCoupleTimelinePost div.coupleTimelineHeader {

            position: relative;
            width: 100%;
            height: 90px;
        }

        div.coupleTimelineHeader div.firstUser2 {

            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            left: 10px;
        }

        div.coupleTimelineHeader div.dDay {

            font-weight: bold;
            display: inline-block;
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        div.coupleTimelineHeader div.dDay div:nth-child(2) {
            font-size: 20px;

        }

        div.coupleTimelineHeader div.dDay div:nth-child(3) {
            font-size: 16px;
        }

        div.coupleTimelineHeader div.dDay div:nth-child(3) i {
            color: #dd2d2d;
            margin: 0 5px;
        }

        div.coupleTimelineHeader div.secondUser2 {

            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
        }

        div.coupleTimelineHeader div.userProfileImage {

            overflow: hidden;
            width: 80px;
            height: 80px;
            border-radius: 50%;
            position: relative;
            display: inline-block;
            vertical-align: middle;
        }

        div.coupleTimelineHeader div.userProfileImage img {
            height: 100%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        div.coupleTimelineHeader div.weather {

            font-size: 30px;
            display: inline-block;
            width: 50px;
            text-align: center;
            display: inline-block;
            vertical-align: middle;
			
        }

        div.coupleTimelineMain {

            overflow: hidden;
        }

        div.coupleTimelineMain div.coupleTimelinePost {

            overflow: hidden;
            width: calc(33.3333% - 4px);
            float: left;
            height: calc(710px / 3);
            vertical-align: middle;
            margin-right: 6px;
            margin-top: 6px;
            position: relative;
        }
        
        div.coupleTimelineMain div.coupleTimelinePost:last-child {
        	margin-bottom: 50px;
        }

        div.coupleTimelineMain div.coupleTimelinePost:nth-child(3n) {
            margin-right: 0;
        }

        div.coupleTimelinePost div.uploadImage img {
            width: 100%;
        }

        div.coupleTimelinePost div.imageHover {
            background-color: rgba(0, 0, 0, 0.5);

            position: absolute;
            width: 100%;
            height: 100%;

            top: 0;
            left: 0;
            opacity: 0;
            transition: all 0.1s;
        }

        div.coupleTimelinePost div.imageHover:hover {
            opacity: 1;
        }

        div.coupleTimelinePost div.imageHover div.uploadDate {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 100%;
            text-align: center;
            color: #fff;
        }

		div.coupleTimelinePost div.imageHover div.uploadDate > div {
			padding: 0 10px;
		}
		div.coupleTimelinePost div.imageHover div.uploadDate > div:nth-child(1) {
			font-weight: bold;
		}


        

        

        

        

        

        

        

        

        

        

        

        

        

        

        

        

        

        

        

        

        

        



        



        

        

        

        

        

        

        

        

        a.addCoupleTimelinePostFixedButton {
            position: absolute;
            right: 10px;
            bottom: -50px;
            background-color: #eee;
            line-height: 35px;
            padding: 0 10px;
            border-radius: 30px;
            font-weight: bold;
            display: inline-block;
            z-index: 1;
        }

        a.uploadFileName {
            display: block;
            position: relative;

            overflow: hidden;

            height: 300px;
        }

        a.uploadFileName img {
            width: 100%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        a.uploadFileName>div {
            width: 100%;
            background-color: rgba(0, 0, 0, 0.3);
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            color: #fff;
        }



        div.addCoupleTimelinePost a.uploadFileName div.postDate div {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
			
        }

        div.addCoupleTimelinePost div.postContent textarea {
            width: 100%;
            margin: 0;
            padding: 0;
            vertical-align: middle;
            resize: none;
            padding: 4px 8px;
            border: 1px solid #898989;
            border-radius: 5px;

        }

        p {
            margin: 0;
            padding: 0;
        }

        div.addCoupleTimelinePost div.place {
            margin-top: 10px;


        }

        div.addCoupleTimelinePost div.place i {
            display: inline-block;
            width: 30px;
            text-align: center;
            background-color: #fff;
            line-height: 30px;
            float: left;
            vertical-align: middle;
            border-top: 1px solid #898989;
            border-left: 1px solid #898989;
            border-bottom: 1px solid #898989;

            border-radius: 5px 0 0 5px;
        }
		
        div.addCoupleTimelinePost div.place input {
            line-height: 30px;
            float: left;
            vertical-align: middle;
            border: none;
            border-top: 1px solid #898989;
            border-right: 1px solid #898989;
            border-bottom: 1px solid #898989;
            margin-bottom: 10px;
            width: calc(100% - 30px);
            border-radius: 0 5px 5px 0;
            
        }

        div.addCoupleTimelinePost div.postDate input {


            border: none;

            
            line-height: 30px;
            
            
            
			display: block;
			width: 100%;

        }
        

        *:focus {
            outline: none;
        }

    </style>
    
    <script>
    
    function resetCoupleTimelineModal() {
    	$('div.addCoupleTimelinePostModalBody input[name="place"]').val('');
		$('div.addCoupleTimelinePostModalBody textarea[name="postContent"]').val('');
		$('div.addCoupleTimelinePostModalBody img').attr('src', '');
		$('div.addCoupleTimelinePostModalBody div.postDate p.place').text('');
		$('div.addCoupleTimelinePostModalBody div.postDate p.postContent').text('');
		$('div.addCoupleTimelinePost div.modal-footer button:nth-child(1)').css({
			'display' : 'block'
		});
		$('div.addCoupleTimelinePost div.modal-footer button:nth-child(2)').css({
			'display' : 'none'
		});
		$('div.addCoupleTimelinePost div.modal-footer button:nth-child(3)').css({
			'display' : 'block'
		});
		$('div.addCoupleTimelinePost div.modal-footer button:nth-child(4)').css({
			'display' : 'none'
		});
		$('div.addCoupleTimelinePost input[name="postNo"]').val('');
		$('div.addCoupleTimelinePost input[type="file"]').val('');
		$("#addCoupleTimelinePostDatepicker").datepicker({
            dateFormat: 'yy-mm-dd'

        }); 
            $('#addCoupleTimelinePostDatepicker').datepicker('setDate', 'today');
		
    }
    
    function prependCoupleTimelinePost(post) {
        var postNo = post.postNo;
        var userId = post.userId;
        var uploadFileName = post.uploadFileName;
        var postDate = post.postDate;
        var place = post.place;
        var postTitle = post.postTitle;
        var postContent = post.postContent;

        var post = '<div class="coupleTimelinePost">' +
            '<a href="#" data-toggle="modal" data-target="#exampleModal2">' +
            '<input type="hidden" name="postNo" value="' + postNo + '">' +
            '<div class="uploadImage">' +
            '<img src="/images/' + uploadFileName + '" alt="">' +
            '</div>' +
            '<div class="imageHover">' +
            '<div class="uploadDate">' +
            '<div>' + postDate + '</div>' +
            '<div>' + place + '</div>' +
            '<div>' + postContent + '</div>' +
            '</div>' +
            '</div>' +
            '</a>' +
            '</div>';

        $('div.coupleTimelineMain').prepend(post);
    }
    
    function appendCoupleTimelinePost(post) {
        var postNo = post.postNo;
        var userId = post.userId;
        var uploadFileName = post.uploadFileName;
        var postDate = post.postDate;
        var place = post.place;
        var postTitle = post.postTitle;
        var postContent = post.postContent;

        var post = '<div class="coupleTimelinePost">' +
            '<a href="#" data-toggle="modal" data-target="#exampleModal2">' +
            '<input type="hidden" name="postNo" value="' + postNo + '">' +
            '<div class="uploadImage">' +
            '<img src="/images/' + uploadFileName + '" alt="">' +
            '</div>' +
            '<div class="imageHover">' +
            '<div class="uploadDate">' +
            '<div>' + postDate + '</div>' +
            '<div>' + place + '</div>' +
            '<div>' + postContent + '</div>' +
            '</div>' +
            '</div>' +
            '</a>' +
            '</div>';

        $('div.coupleTimelineMain').append(post);
    }
    
    
    
    function refreshCoupleTimelinePostList() {
    	var userId = $('input[name="userId"]').val();
    	$.ajax({
            url: '/couple/rest/getCoupleTimelinePostList',
            method: 'POST',
            dataType: 'json',
            data: JSON.stringify({
            }),
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            success: function(data) {
            	//alert('성공ㅋㅋ');
            	coupleTimelinePage = 1;
            	console.log("리프레시 커타라페이지 ㅋㅋ", coupleTimelinePage);
                for (var i = 0; i < data.list.length; i++) {
                    appendCoupleTimelinePost(data.list[i]);
                    //alert(data.list[i].postNo);
                }
                
                setTimeout(function() {
                    myScroll.refresh();
                }, 0);
            },
            error: function(request, status, error) {
                alert("refresh 할 때 code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    	
    	
    	
    }
    
    
    function createRoom() {
    	var formData = new FormData();
    	formData.append('place', $('div.addCoupleTimelinePostModalBody input[name="place"]').val());
    	formData.append('postContent', $('div.addCoupleTimelinePostModalBody textarea[name="postContent"]').val());
    	formData.append('file', $('div.addCoupleTimelinePostModalBody input[name="file"]')[0].files[0]);
    	
    	$.ajax({
    		type: 'POST',
    		enctype: 'multipart/form-data',
    		url: '/couple/rest/addCoupleTimelinePost2',
    		data: formData,
    		processData: false,
    		contentType: false,
    		cache: false,
    		timeout: 600000,
    		success: function() {
    			console.log('파일업로드성공ㅋㅋ');
    			$('#exampleModal2 button.close').click();
    			$('div.coupleTimelineMain').empty();
    			refreshCoupleTimelinePostList();
    			resetCoupleTimelineModal();
    		},
    		error: function(request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
    	});
    }
    
    
    function updateCoupleTimelinePost() {
    	var userId = $('input[name="userId"]').val();
    	var postNo = $('div.addCoupleTimelinePost input[name="postNo"]').val();
    	console.log('postNo : ' + postNo);
    	var postContent = $('div.addCoupleTimelinePostModalBody textarea[name="postContent"]').val();
    	var place = $('div.addCoupleTimelinePostModalBody input[name="place"]').val();
    	
    	var formData = new FormData();
    	formData.append('place', $('div.addCoupleTimelinePostModalBody input[name="place"]').val());
    	formData.append('postContent', $('div.addCoupleTimelinePostModalBody textarea[name="postContent"]').val());
    	formData.append('file', $('div.addCoupleTimelinePostModalBody input[name="file"]')[0].files[0]);
    	
    	console.log($('div.addCoupleTimelinePostModalBody input[name="place"]').val());
    	console.log($('div.addCoupleTimelinePostModalBody textarea[name="postContent"]').val());
    	console.log($('div.addCoupleTimelinePostModalBody input[name="file"]')[0].files[0]);
    	
    	$.ajax({
    		type: 'POST',
    		enctype: 'multipart/form-data',
    		url: '/couple/rest/updateCoupleTimelinePost2/' + userId + '/' + postNo,
    		data: formData,
    		processData: false,
    		contentType: false,
    		cache: false,
    		timeout: 600000,
    		success: function(data) {
    			console.log('파일업로드수정성공ㅋㅋ');
    			$('#exampleModal2 button.close').click();
    			data.post.uploadFileName
    			$("input[value='"+postNo+"']").next().children("img").attr("src", "/images/"+data.post.uploadFileName);
    			$("input[value='"+postNo+"']").parent().find('div.uploadDate div:nth-child(2)').text(place);
    			$("input[value='"+postNo+"']").parent().find('div.uploadDate div:nth-child(3)').text(postContent);
    			//$('div.coupleTimelineMain').empty();
    			//refreshCoupleTimelinePostList();
    			resetCoupleTimelineModal();
    		},
    		error: function(request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
    	});
    }
    
    function deleteCoupleTimelinePost() {
    	var postNo = $('div.addCoupleTimelinePost input[name="postNo"]').val();
    	$.ajax({
            url: '/couple/rest/deleteCoupleTimelinePost2/' + postNo,
            method: 'GET',
            data: JSON.stringify({
                postNo: postNo
            }),
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            success: function() {
            	console.log('성공ㅋㅋ');
            	$('#exampleModal2 button.close').click();
            	$("input[value='"+postNo+"']").parent().parent().remove();
    			//$('div.coupleTimelineMain').empty();
    			//refreshCoupleTimelinePostList();
    			resetCoupleTimelineModal();
    			
    			setTimeout(function() {
                    myScroll.refresh();
                }, 0);
            },
            error: function(request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }
    
    /* function uploadFile(){
        var form = $('#FILE_FORM')[0];
        var formData = new FormData(form);
        formData.append("fileObj", $("#input_img")[0].files[0]);
		var place = $('div.addCoupleTimelinePostModalBody input[name="place"]').val();
		var postContent = $('div.addCoupleTimelinePostModalBody textarea[name="postContent"]').val();
		console.log('place : ' + place);
		console.log('postContent : ' + postContent);
        $.ajax({
            url: '/couple/rest/addCoupleTimelinePost2',
                    processData: false,
                    contentType: false,
                    data: formData,
                    type: 'POST',
                    success: function(result){
                        alert("업로드 성공!!");
                    }
            });
    } */
    
    
    	var coupleTimelineMaxPage;
    
        $(function() {
            var userId = $('input[name="userId"]').val();
			var sessionUserRole = "${user.role}";

            

            $(document).ready(function() {
				//alert('온로드ㅋㅋ');
                //alert('userId : ' + userId);
                
                
                if (sessionUserRole == 3) {
					//console.log("role ajax start");
                $.ajax({
                    url: '/couple/rest/getCoupleTimelinePostList',
                    method: 'POST',
                    dataType: 'json',
                    data: JSON.stringify({
                    	
                    }),
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    success: function(data) {
                    	console.log('성공ㅋㅋ');
                    	coupleTimelineMaxPage = data.resultPage.maxPage;
                        for (var i = 0; i < data.list.length; i++) {
                            appendCoupleTimelinePost(data.list[i]);
                            //alert(data.list[i].postNo);
                        }
                        $('div.firstUser2 .userProfileImage img').attr('src', '/images/' + data.firstUser.profileName);
                        $('div.secondUser2 .userProfileImage img').attr('src', '/images/' + data.secondUser.profileName);
                        $('span.firstUserName').text(data.firstUser.name);
                        $('span.secondUserName').text(data.secondUser.name);
                        console.log(data.firstUser.profileName);
                        console.log(data.secondUser.profileName);
                        console.log(data.firstUser.name);
                        console.log(data.secondUser.name);
                        
                        $('div.dDay div:nth-child(2)').text(data.calDateDays + '일째');
                    },
                    error: function(request, status, error) {
                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
				}
                
                
                
            });
            
            

            


            
        });

        var sel_file;

        $(document).ready(function() {
        	$("#input_img").on("change", handleImgFileSelect);
        });

        function handleImgFileSelect(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);

            filesArr.forEach(function(f) {
                if (!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }

                sel_file = f;

                var reader = new FileReader();
                reader.onload = function(e) {
                    $("#img").attr("src", e.target.result);
                }
                
                
                reader.readAsDataURL(f);
            });
        }

        $(function() {
            $('div.addCoupleTimelinePost a.uploadFileName').on('click', function() {
            	$('div.addCoupleTimelinePostModalBody input[type="file"]').click();
            });

            
            
            
			
            

            
        
        
         $("#addCoupleTimelinePostDatepicker").datepicker({
            dateFormat: 'yy-mm-dd'

        }); 
            $('#addCoupleTimelinePostDatepicker').datepicker('setDate', 'today');
            
            $('div.addCoupleTimelinePost p.postDate').text($('#addCoupleTimelinePostDatepicker').val());

            $('div.addCoupleTimelinePost input[name="place"]').on('keyup', function() {
                var place = $('div.addCoupleTimelinePost input[name="place"]').val();
                $('div.addCoupleTimelinePost p.place').text(place);
            });
            
            
            $('div.addCoupleTimelinePost div.postContent textarea').on('keyup', function() {
            	var postContent = $('div.addCoupleTimelinePost div.postContent textarea').val();
            	
            	$('div.addCoupleTimelinePost p.postContent').text(postContent);
            });




        });
		
        $(document).on('click', 'div.coupleTimelinePost > a', function() {
        	console.log('클릭ㅋㅋ');
        	resetCoupleTimelineModal();
        	var userId = $('input[name="userId"]').val();
        	var postNo = $(this).find('input[name="postNo"]').val();
        	$.ajax({
        		url: '/couple/rest/getCoupleTimelinePost/' + userId + '/' + postNo,
        		method: 'GET',
        		dataType: 'json',
                data: JSON.stringify({
                    userId: userId,
                    postNo: postNo
                }),
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                success: function(data) {
                	console.log('성공ㅋㅋ');
                    var postDate = data.post.postDate;
                    var uploadFileName = data.post.uploadFileName;
                    var place = data.post.place;
                    var postContent = data.post.postContent;
                    
                    $('#addCoupleTimelinePostDatepicker').val(postDate);
                    $('div.addCoupleTimelinePostModalBody input[name="place"]').val(place);
            		$('div.addCoupleTimelinePostModalBody textarea[name="postContent"]').val(postContent);
            		
            		$('div.addCoupleTimelinePostModalBody img').attr('src', '/images/' + uploadFileName);
            		$('div.addCoupleTimelinePostModalBody div.postDate p.postDate').text(postDate);
            		$('div.addCoupleTimelinePostModalBody div.postDate p.place').text(place);
            		$('div.addCoupleTimelinePostModalBody div.postDate p.postContent').text(postContent);
            		
            		$('div.addCoupleTimelinePost div.modal-footer button:nth-child(1)').css({
            			'display' : 'none'
            		});
            		$('div.addCoupleTimelinePost div.modal-footer button:nth-child(2)').css({
            			'display' : 'block'
            		});
            		$('div.addCoupleTimelinePost div.modal-footer button:nth-child(3)').css({
            			'display' : 'none'
            		});
            		$('div.addCoupleTimelinePost div.modal-footer button:nth-child(4)').css({
            			'display' : 'block'
            		});
            		$('div.addCoupleTimelinePost input[name="postNo"]').val(postNo);
            		
            		
                },
                error: function(request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
        	})
        });
        
    </script>
    
</head>

<body>
    <input type="hidden" name="userId" value="${user.userId}">
    <div class="listCoupleTimelinePost">
        <div class="coupleTimelineHeader">
            <div class="firstUser2">
                <div class="userProfileImage">
                    <img src="/images/bonobono.jpg" alt="">
                </div>
                
                
               <!--  <div class="weather">
                    <img src="/images/031-cloud.png" alt="" width="30px" style="vertical-align:middle">
                </div> -->
                
                
            </div>
            <div class="dDay">
                <div>처음 만난 날</div>
                <div>172일째</div>
                <div>
                    <span class="firstUserName">김근덕</span><i class="fas fa-heart"></i><span class="secondUserName">주형진</span>
                </div>
            </div>
            <div class="secondUser2">
            
            
                <!-- <div class="weather">
                    <img src="/images/031-sun.png" alt="" width="30px" style="vertical-align:middle">
                </div> -->
                
                
                <div class="userProfileImage">
                    <img src="/images/bonobono.jpg" alt="">
                </div>
            </div>
            <a href="#" class="addCoupleTimelinePostFixedButton" data-toggle="modal" data-target="#exampleModal2" onclick="resetCoupleTimelineModal()">
            <i class="fas fa-plus"></i> 게시글 등록
        </a>
        </div>
        <div class="coupleTimelineMain">
            
        </div>
        
    </div>

    <!-- Button trigger modal -->


    <!-- Modal -->
    <!-- <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
            <div class="modal-content addCoupleTimelinePost">
                <div class="modal-header">
                    <div class="postDate" style="width: 100%">
                        <input type="text" value="" name="postDate" id="addCoupleTimelinePostDatepicker">
                    </div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="resetCoupleTimelineModal()">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    










                        


						<form id="addCoupleTimelinePostForm" enctype="multipart/form-data" accept-charset="euc-kr">
                            <div class="addCoupleTimelinePostModalBody">
                            <a href="#" class="uploadFileName">
								<img src="/images/81289090_165505291382436_7785460071330541719_n(1).jpg" alt="" id="img">
                                <div class="postDate">
                                    <div>
                                        <p class="postDate" style="margin: 0;"></p>
                                        <p class="place" style="margin: 0;"></p>
                                        <p class="postContent" style="margin:0;"></p>
                                    </div>
                                </div>
                            </a>
                            <div>
                                <input type="file" id="input_img" name="file" style="display: block"/>
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
    </div> -->


    
</body>

</html>
