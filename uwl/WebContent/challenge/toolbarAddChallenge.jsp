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
    <script src="/javascript/iscroll.js"></script>
    <!-- sweetalert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/4b823cf630.js" crossorigin="anonymous"></script>


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



        

        *,
        *:before,
        *:after {
            padding: 0;
            margin: 0;
            border: none;
            outline: none;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
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
            width: 200px;
            overflow: hidden;
            height: 0;
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

        ul.menu li:hover {
            padding-left: 20px;
            color: #000000;
            background: #FFFFFF;
        }

        .menu.showMenu {
            /*-moz-transform:scale(1);*/
            height: 200px;
        }

        

        .wrapper {
            text-align: left;
        }

        .dropdownbox {
            text-align: left;
            width: 100%;
            margin: -20px;
        }
        /* 재이수정 */
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
        
        #challReward,
        #postCommentComplete {
        	padding-right: 0;
        }
    </style>


    <script type="text/javascript">
    	
	    var myScroll = null;
	    
	    $(function() {
	    	
	    	/* 재이수정 */
        	
	    	
	        myScroll = new IScroll('#wrapper', {
	            mouseWheel: true,
	            scrollbars: true
	        });
	        
	        setTimeout(function() {
	    		myScroll.refresh();
	    		}, 0);
	        
	        $('#master').find('i:nth-child(3)').removeClass('fa-caret-down').addClass('fa-caret-up');
		});
    
        function fncAddChallenge() {

            //Form 유효성 검증
            var challTitle = $("#challTitle").val();
            var challCategory = $("input[name='challCategory']").val();
            var challContent = $("input[name='challContent']").val();
            var challReward = $("#challReward").val();
            console.log("challNo : " + challNo + "challCategory : " + challCategory +
                "challTitle : " + challTitle + "challContent : " + challContent);

            if (challTitle == null || challTitle.length < 1) {
                alert("제목 입력하셈 (^오^)/ ");
                return;
            }

            if (challContent == null || challContent.length < 1) {
                alert("내용 입력하셈 (^오^)/ ");
                return;
            }

            if (challReward == null || challReward.length < 1) {
                alert("점수 입력하셈 (^오^)/ ");
                return;
            } else if (challReward.length > 4) {
                alert("점수가 너무커요! 최대 천단위까지 가능합니다.");
                return;
            }


            $("form").attr("method", "POST").attr("action", "/challenge/addChallenge").submit();
        }


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
                placeholder: '내용을 입력하세요',
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
            $.ajax({
                data: data,
                url: '/challenge/rest/addSummerNoteFile', //리턴을 url로 해줘야함 ㅋㅋ
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

                //Form 유효성 검증
                var challTitle = $("#challTitle").val();
                var challCategory = $("select[name='challCategory']").val();
                var challContent = $("#summernote").val();
                var challReward = $("input[name='challReward']").val();
                var postCommentComplete = $("input[name='postCommentComplete']").val();

                console.log("challCategory : " + challCategory +
                    "challTitle : " + challTitle + "challContent : " + challContent +
                    "challReward : " + challReward + "challReward 타입오브 : " + typeof(challReward) + "postCommentComplete : " + postCommentComplete);

                if (challTitle == null || challTitle.length < 1) {
                    Swal.fire({
                        icon: 'error',
                        title: '제목을 입력해주세요!'
                    })
                    return;
                }
                if (challCategory == '3') {
                    if (postCommentComplete == null || postCommentComplete.length < 1 || postCommentComplete.length >= 3 || isNaN(postCommentComplete) || (postCommentComplete <= 0 || postCommentComplete > 99)) {
                        Swal.fire({
                            icon: 'error',
                            text: '	달성조건은 1~99 사이의 값만 입력이 가능합니다.'
                        })
                        return;
                    }
                }

                if (challCategory == '카테고리') {
                    Swal.fire({
                        icon: 'error',
                        title: '카테고리를 선택해주세요!'
                    })
                    return;
                }

                if (challContent == null || challContent.length < 1) {
                    Swal.fire({
                        icon: 'error',
                        title: '내용을 입력해주세요'
                    })
                    return;
                }

                if (challReward == null || challReward.length < 1 || isNaN(challReward) || (challReward <= 0 || challReward > 9999)) {
                    Swal.fire({
                        icon: 'error',
                        title: '점수를 입력해주세요!',
                        text: '점수는 천단위(1 ~ 9,999)까지 가능합니다.'
                    })
                    return;
                } else if (challReward.length > 4) {
                    Swal.fire({
                        icon: 'error',
                        title: '점수를 입력해주세요!',
                        text: '점수는 천단위(1 ~ 9,999)까지 가능합니다.'
                    })
                    return;
                }

                Swal.fire({
                    icon: 'success',
                    title: '등록이 완료 되었습니다.',
                    showConfirmButton: false,
                    timer: 700
                }).then((result) => {
                    $('form').attr('method', 'POST').attr('action', '/challenge/addChallenge').submit();
                })
            });


            $('#cancle').on('click', function() {

                Swal.fire({
                    title: '작성을 중단하시겠습니까?',
                    text: "작성중인 글은 초기화 됩니다.",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#cb4414',
                    cancelButtonColor: '#3c3c3c',
                    confirmButtonText: '나가기',
                }).then((result) => {
                    if (result.value) {
                        Swal.fire({
                            icon: 'success',
                            title: '목록으로 돌아갑니다.',
                            showConfirmButton: false,
                            timer: 800
                        }).then((result) => {
                            history.back()
                        })
                    }
                })

            }); //end of cancle


            // 직접 index 값을 주어 selected 속성 주기
            /* $("#셀렉트ID option:eq(1)").attr("selected", "selected"); */

            /* if ( $( "#challCategory option: eq (3)" )) { }*/

            /* alert($("#challCategory option:selected").val());
			if ($("#challCategory option:selected").val() == "게시판활동") {
				
			alert($("#challCategory option:selected").val());
			}
			
		 $( test ).appendTo("#reward");  */

            $('#challCategory').on("change", function() {
                console.log($(this).val())
                var detailCategory = $(this).val();
                var complete = null;
                var challReward = null;
                console.log("detailCategory : " + detailCategory);
                
                $.ajax({
    				url : "/challenge/rest/listDetailCetegory",
    				method : "POST",
    				headers : {
    					"Accept" : "application/json",
    					"Content-Type" : "application/json"
    				},
    				data : JSON.stringify({
    					detailCategory : detailCategory
    				}),
    				success : function(data) {
    					//alert("여기 성공임 ㅋㅋ");
    					
    					var detailSelect = null;
    					var detailView = null;
    					var challCategory = null;
    					var detailCategory = null;
    					var appendDetail = null;
    					var startSelect = "<select class='custom-select col-2' name='detailCategory' id='detailCategory'>"
											+ "<option selected>세부카테고리</option>";
    					
    					for (var i = 0; i < data.length; i++) {
	    					//challCategory 1: map, 2: vision, 3: 게시판활동
	    					challCategory = data[i].challCategory;
	    					detailCategory = data[i].detailCategory;
	    					appendDetail = "<option value=" + detailCategory  + ">" +  detailCategory +"</option>";
	    					
	    					if (challCategory == '3') {
		    					
		    					//해당 카테고리에 해당하면 view를 바꿔줌 
		    					if (detailCategory == '201') {
		    						detailView = '진학상담';
			    					appendDetail = "<option value=" + detailCategory  + ">" +  detailView +"</option>";
								}else if(detailCategory == '202') {
									detailView = '사랑과이별';
								}else if(detailCategory == '203') {
									detailView = '남자끼리';
								}else if(detailCategory == '204') {
									detailView = '여자끼리';
								}else if(detailCategory == '205') {
									detailView = '데이트자랑';
								}else if(detailCategory == '206') {
									detailView = '대나무숲';
								}else if(detailCategory == '댓글') {
									detailView = '댓글';
								}
			    					appendDetail = "<option value=" + detailCategory  + ">" +  detailView +"</option>";
	    					}
	    					
	    					//append해줌
  							startSelect += appendDetail;
    						//alert("detailCategory : " + detailCategory + "challCategory : " + challCategory);
    						//alert("appendDetail : " + appendDetail + "data 사이즈 : " + data.length );
						} //end of for 
						
						//긁어온 정보를 최종 append
						startSelect += "</select>";
   					 	$("#reward").append(startSelect);
   					 	
   					 	
   					}
    				
    				
    			}); //end of ajax
    			
   				 $("#detailCategory").remove();
    			
   				 setTimeout(function(){
	    			challReward = "<div class='input-group col-3' id='challReward'>"
	                     		+	"<div class='input-group-prepend'>"
	                       		+  "<span class='input-group-text' style='width: 35px; height: 38px;'><i class='fas fa-coins'></i></span>"
	                   			+  "</div>"
	                     		+	"<input type='text' class='form-control' name='challReward' placeholder='점수';>"
	                     		+	"<div class='input-group-append'>"
	                      		+   "<span class='input-group-text' style='width: 35px; height: 38px;'>점</span>"
	                    		+ "</div>"
	                 			+"</div>";
	                 			
            		$("#reward").append(challReward);
   				 }, 30)
   				 
   				 	 $("#challReward").remove();
                
	                 if ($(this).val() == 3) {
						setTimeout(function(){
		                    complete = "<div class='input-group col-3' id='postCommentComplete'>" +
		                        "<div class='input-group-prepend'>" +
		                        "<span class='input-group-text' style='width: 35px; height: 38px;'><i class='fas fa-trophy'></i></span>" +
		                        "</div>" +
		                        "<input type='text' class='form-control' name='postCommentComplete' placeholder='완성조건'>" +
		                        "<div class='input-group-append'>" +
		                        "<span class='input-group-text' style='width: 35px; height:38px;'>회</span>" +
		                        "</div>" +
		                        "</div>"
		                    console.log("if문에 들어왔습니다.");
		
		                    $("#reward").append(complete);
							}, 40);
		                } else {
		                    console.log("else if문에 들어왔습니다.");
		                    $("#postCommentComplete").remove();
		                } //end of if 
					
                
            });


            /*  $( "#challCategory option:eq(3)" ).append("33433");  */


            /* 		$( "#challCategory option:eq(3)" ).on('click',function(){
            			var selectValue = $(this).val();
            			console.log("selectValue",selectValue);
            			if (selectValue == 3) {
            				console.log("hello world!");
            			}
            		}); */


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
        
        #goMaster {
            transition: max-height 1s;
            max-height: 500px;
            padding-top: 10px;
        }
        #goMaster ul li:nth-child(1) {
        	color: #EBAD7A;
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
        
        
    </style>
</head>

<body>
    <div class="layoutWrap2">
        <div class="leftToolbar2">
            <jsp:include page="/layout/left.jsp" />
        </div>
        <div class="work2" id="wrapper">
        	<ul>
        	<!-- 재이수정 -->
        	<div class="mainHeader">
                    <div class="left2">
                        도전과제 작성
                            <span class="badge badge-danger">New</span>
                    </div>
                    <div class="right2">
                        <a href="#"><i class="far fa-star"></i></a>
                    </div>
                </div>
            <form enctype="multipart/form-data">
                <div>
                    <div></div>
                    <div>

                        

                        <!-- 카테고리 -->
                        <div class="row" id="reward" style="margin-top: 10px; padding-left:10px;">
                            &emsp;<select class="custom-select col-3" name="challCategory" id="challCategory">
                                <option selected>카테고리</option>
                               <!--  <option value="1" id="map">Map</option>
                                <option value="2" id="vison">Vision</option> -->
                                <option value="3" id="post">게시판활동</option>
                            </select>
                            <br>&emsp;
                           

                            <!-- 보상점수 -->
                            <!-- <div class="input-group col-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" style="width: 35px;"><i class="fas fa-coins"></i></span>
                                </div>
                                <input type="text" class="form-control" name="challReward" placeholder="점수를 입력하세요" ;>
                                <div class="input-group-append">
                                    <span class="input-group-text" style="width: 35px;">점</span>
                                </div>
                            </div> -->
                            
                        </div>
                        

                        <div class="table table-responsive">
                            <table class="table" style="border-bottom: 1px solid #eee;">
                                <tr>
                                    <th class="success">
                                        <input type="text" name="challTitle" id="challTitle" placeholder="제목을 입력하세요" style="width:570px;" />
                                    </th>
                                </tr>
                                
                            </table>
                            <div style="padding: 0 10px;">
                            <textarea id="summernote" name="challContent" style="border: none;resize:none"></textarea>
                            </div>


                        </div>

						

                        <div style="text-align:right;width:100%; padding-right:10px;">
                            <div class="form-group">
                                <button type="button" class="btn btn-outline-secondary" id="complete" style="width:150px">등록</button>
                                <button type="button" class="btn btn-outline-secondary" id="cancle" style="width:150px">취소</button>
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