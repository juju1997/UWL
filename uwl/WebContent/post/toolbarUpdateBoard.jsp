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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>


    <!--썸머노트 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
    <!--썸머노트 -->



    <title>Insert title here</title>

    <style type="text/css">
        #inputPostTitle {
            border: none;
            border-bottom: none solid;
            background: none;
            outline: none;
        }



        @import url(https://fonts.googleapis.com/css?family=Quicksand:300,400);

        *,
        *:before,
        *:after {
            padding: 0;
            margin: 0;
            border: none;
            outline: none;
            -moz-box-sizing: border-box;
            box-sizing: border-box
        }

        body {
            font-size: 100%;
            font-family: 'Quicksand', sans-serif;
        }

        p.heading {
            line-height: 1.2;
            font-size: 2em;
            text-align: left;
        }

        .wrapper {
            margin: 15px auto;
            max-width: 700px;
        }

        .dropdownbox {
            margin: 0 auto;
            width: 200px;
            margin-top: 40px;
            background: #FFFFFF;
            color: #000000;
            cursor: pointer;
        }

        .dropdownbox>p {
            padding: 5px 10px;
            font-size: 1.25em;
            line-height: 1.4em;
            user-select: none;
            -moz-user-select: none;
            /* Safari */
            -khtml-user-select: none;
        }

        ul.menu {
            position: relative;
            margin: 0 -20px;
            width: 185px;
            overflow: hidden;
            max-height: 0;
            margin-top: 10px;
            -webkit-transition: all 0.3s ease-in;
            -moz-transition: all 0.3s ease-in;
            -o-transition: all 0.3s ease-in;
            transition: all 0.3s ease-in;
            /*-moz-transform:scale(0); */
            background: #FFFFFF;
            color: #000000;
            cursor: pointer;
            user-select: none;
            -moz-user-select: none;
            /* Safari */
            -khtml-user-select: none;
        }

        ul.menu li {
            padding: 2px 10px;
            font-size: 1.25em;
            line-height: 1.4em;
            -webkit-transition: all 0.3s ease-in;
            -moz-transition: all 0.3s ease-in;
            -o-transition: all 0.3s ease-in;
            transition: all 0.3s ease-in;
            border-bottom: 1px dotted #000000;
        }
		ul.menu li:last-child {
            border-bottom: none;
        }
        ul.menu li:hover {
            padding-left: 20px;
            color: #000000;
            background: #FFFFFF;
        }

        .menu.showMenu {
            /*-moz-transform:scale(1);*/
            max-height: 255px;
            padding-top: 15px;
        }

        

        .wrapper {
            text-align: left;
        }

        .dropdownbox {
            text-align: left;
            width: 100%;
            margin: -20px;
            margin-left: -30px;
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
    });
    
    
        var gatherCategoryNo = null;

        $(document).ready(function() {
            $(".dropdownbox").click(function() {
                $('#choiceCategory').removeClass();
                $(".menu").toggleClass("showMenu");
                $(".menu > li").click(function() {
                    $(".dropdownbox > p").html($(this).html());
                    $(".menu").removeClass("showMenu");
                });
            });
        });


        //썸머노트--------------------------------------------------------------------------------

        $(document).ready(function() {


            $('#summernote').summernote({
                height: 300,
                minHeight: 370,
                maxHeight: null,
                focus: true,
                toolbar: [
                    // [groupName, [list of button]]
                    ['toolbar', ['picture', 'video', 'bold']],
                    ['size', ['fontsize']],
                    ['color', ['color']],
                    ['remove', ['clear']]
                ],
                lang: 'ko-KR',
                callbacks: {
                    onImageUpload: function(files, editor, welEditable) {
                        sendFile(files[0], editor, welEditable);
                        //editor가 누군지 welEditable이 누군지 알아보자 ㅅㅂㅋㅋ
                    }
                }
            });
        });

        function sendFile(file, editor, welEditable) {
            data = new FormData();
            data.append("file", file);
            console.log('시작')
            $.ajax({
                data: data,
                url: '/post/rest/addSummerNoteFile', //리턴을 url로 해줘야함 ㅋㅋ
                type: "POST",
                cache: false,
                contentType: false,
                enctype: 'multipart/form-data',
                processData: false,
                success: function(data) {
                            var file = "/images/" + data;
                            $('#summernote').summernote('insertImage', file);
                },
                error: function() {
                    alert("에러냐 ㅋㅋ");
                }
            });
        }
        //썸머노트--------------------------------------------------------------------

        $(document).ready(function() {
            $('#complete').on('click', function() {

                $(document).ready(function() {
                    $('#complete').on('click', function() {
                        var gatherCategoryNo = $('#gatherCategoryNo').val();
                        var postTitle = $('#inputPostTitle').val();
                        var postContent = $('#summernote').val();
                        var thumbNail = $('#fileInput').val();


                        console.log(gatherCategoryNo, postTitle, postContent, thumbNail)
                        if (gatherCategoryNo == '' || gatherCategoryNo == null) {
                            Swal.fire({
                                icon: 'error',
                                title: '카테고리를 정해주시죠?',
                                showConfirmButton: false,
                                timer: 800
                            });
                            return 0;
                        } else if (postTitle == '' || postTitle == null) {
                            Swal.fire({
                                icon: 'error',
                                title: '제목을 적어주시죠?',
                                showConfirmButton: false,
                                timer: 800
                            });
                            return 0;
                        } else if (postContent == '' || postContent == null) {
                            Swal.fire({
                                icon: 'error',
                                title: '내용을 적어주시죠??',
                                showConfirmButton: false,
                                timer: 800
                            });
                            return 0;
                        } else if (thumbNail == '' || thumbNail == null) {
                            Swal.fire({
                                title: '정말?',
                                text: "썸네일을 등록 안하셨는데.. 등록하실래요?",
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#cb4414',
                                cancelButtonColor: '#3c3c3c',
                                cancelButtonText: '아 맞다!',
                                confirmButtonText: '그냥 올릴래!',
                            }).then((result) => {
                                if (result.value) {
                                    Swal.fire({
                                        icon: 'success',
                                        title: '수정완료!',
                                        showConfirmButton: false,
                                        timer: 800
                                    }).then((result) => {
                                        $('form').attr('method', 'POST').attr('action', '/post/updateBoard').submit();
                                    });
                                }
                            });
                            return 0;
                        }
                        Swal.fire({
                            icon: 'success',
                            title: '수정완료!',
                            showConfirmButton: false,
                            timer: 800
                        }).then((result) => {
                            $('form').attr('method', 'POST').attr('action', '/post/updateBoard').submit();
                        })
                    })
                });
            });


            $('li').on('click', function() {
                gatherCategoryNo = $(this).val();
                $('#gatherCategoryNo').val(gatherCategoryNo);
            });
        });



        $(document).ready(function() {

            $("#fileInput").on('change', function() { // 값이 변경되면

                if (window.FileReader) { // modern browser

                    var filename = $(this)[0].files[0].name;

                } else { // old IE

                    var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출

                }



                // 추출한 파일명 삽입

                $("#userfile").val(filename);
            });






            if ("${post.gatherCategoryNo}" == '201') {
                $('.gatherCategoryName').html('진학상담');
            }
            if ("${post.gatherCategoryNo}" == '202') {
                $('.gatherCategoryName').html('사랑과 이별');
            }
            if ("${post.gatherCategoryNo}" == '203') {
                $('.gatherCategoryName').html('남자끼리');
            }
            if ("${post.gatherCategoryNo}" == '204') {
                $('.gatherCategoryName').html('여자끼리');
            }
            if ("${post.gatherCategoryNo}" == '205') {
                $('.gatherCategoryName').html('데이트 자랑');
            }
            if ("${post.gatherCategoryNo}" == '206') {
                $('.gatherCategoryName').html('대나무 숲');
            }
        });
        
        $(function() {
    		$('.modal').appendTo("body");
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
                        게시글 수정
                    </div>
                    <div class="right2">
                        <a href="#"><i class="far fa-star"></i></a>
                    </div>
                </div>
            <form enctype="multipart/form-data">
                <div>
                    <div></div>
                    <div style="padding-bottom:10px;">
                        <!-- <br><br><br> -->
                        <div class="wrapper" style="margin-top:25px">
                            <div class="dropdownbox">
                                <p class="gatherCategoryName">어디에 글 쓸래? <i class="fas fa-sort-down" id="choiceCategory"></i></p>
                            </div>
                            <ul class="menu">
                                <li value="201"><i class="fas fa-graduation-cap"></i> 진학상담</li>
                                <li value="202"><i class="fas fa-heart"></i> 사랑과 이별 <i class="fas fa-heart-broken"></i></li>
                                <li value="203"><i class="fas fa-male"></i> 남자끼리</li>
                                <li value="204"><i class="fas fa-female"></i> 여자끼리</li>
                                <li value="205"><i class="far fa-kiss-wink-heart"></i> 데이트 자랑</li>
                                <li value="206"><i class="fas fa-bullhorn"></i> 대나무 숲</li>
                            </ul>
                            <input type="hidden" name="gatherCategoryNo" value="${post.gatherCategoryNo }" id="gatherCategoryNo">
                            <input type="hidden" name="postNo" value="${post.postNo }">
                        </div>
                        <div class="table table-responsive">
                            <table class="table" style="margin-bottom:10px;border-bottom:1px solid #eee">
                                <tr>
                                    <th class="success">
                                        <input type="text" name="postTitle" id="inputPostTitle" placeholder="제목을 입력하세요" style="width:570px" value="${post.postTitle }" />
                                    </th>
                                </tr>
                                
                            </table>
                            <div style="padding:0 10px">
                            <textarea id="summernote" name="postContent">${post.postContent }</textarea>
                            </div>
                            <br>


                        </div>

                        <div class="form-group" style="padding:0 10px">

                            <label for="InputSubject1" style="color: #d75e0f; font-weight: bold;">썸네일 등록</label>

                            <input name="file" id="fileInput" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">

                            <div class="bootstrap-filestyle input-group">

                                <input type="text" id="userfile" class="form-control" name="userfile" disabled="">

                                <span class="group-span-filestyle input-group-btn" tabindex="0">

                                    <label for="fileInput" class="btn btn-default ">

                                        <span class="glyphicon fa fa-upload"></span>

                                    </label>

                                </span>

                            </div>

                        </div>








                        <div style="text-align:right;width:100%;padding-right:10px">
                            <div class="form-group">
                                <button type="button" class="btn btn-outline-secondary" id="complete" style="width:150px">수정</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </ul>
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
</body></html>