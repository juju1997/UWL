<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="shortcut icon" href="/images/favicon1.ico" type="image/x-icon">
    <link rel="icon" href="/images/favicon1.ico" type="image/x-icon">
    <title>어울림</title>
    <style type="text/css">
    	
    </style>
    <meta charset="UTF-8">
    <!-- 참조 : http://getbootstrap.com/css/   참조 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>

    <title>Insert title here</title>

    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
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

        body {
            font-size: 16px;
            color: #333;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;
        }

        div.wrap {


            overflow: hidden;
        }





        div.mainHeader {

            margin-bottom: 30px;
            padding-top: 2px;
        }

        div.mainHeader span:nth-child(1) {

            font-size: 23px;
            font-weight: bold;
            margin-right: 10px;
        }

        div.mainHeader div {

            font-size: 14px;
            font-weight: bold;
            margin-right: 10px;
            text-align: right;
        }


        div.noticeList div.addNotice {
            text-align: right;
        }

        div.noticeList div.addNotice a {
            background-color: #EBAD7A;
            display: inline-block;
            line-height: 25px;
            padding: 0 40px;
            color: #fff;
            font-weight: bold;
            margin: 20px 0;

        }




        div.noticeList table {

            border-top: 2px solid #EBAD7A;
            border-bottom: 2px solid #EBAD7A;
            border-collapse: collapse;
            width: 100%;
        }

        div.noticeList table tr {

            border-bottom: 1px solid #ddd;
            line-height: 50px;
        }

        div.noticeList table tr:nth-child(1) {
            font-weight: bold;
            background-color: #fdfdfd;
        }

        div.noticeList table tr td {

            text-align: center;
        }

        div.noticeList table tr td:nth-child(4),
        div.noticeList table tr td:nth-child(5) {
            color: #898989;
        }

        div.noticeList table tr:nth-child(n + 2) td:nth-child(2) {
            text-align: left;
        }



        div.searchpoint {
            text-align: center;
        }

        div.work div.ul {
            text-align: center;
        }
        div.form-inline{
        	text-align: center;
        	}
        	
        	#goMore {
            transition: max-height 1s;
            max-height: 500px;
            padding-top: 10px;
        }
        #goMore ul li:nth-child(1) {
        	color: #EBAD7A;
        }
    </style>

    <style>
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
        div.mainHeader2 {

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
        div.mainHeader2 div.left2 {
            width: 90%;
            float: left;
        }
		div.mainHeader2 div.left2 span {
			font-weight: normal;
			font-size: 13px;
			margin-left: 10px;
		}
        div.mainHeader2 div.right2 {
            text-align: right;
            width: 10%;
            float: right;
        }

        div.mainHeader2 div.right2 i {
            vertical-align: baseline;
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
        
        $('#more').find('i:nth-child(3)').removeClass('fa-caret-down').addClass('fa-caret-up');
    });
    
    //=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method","POST").attr("action","/post/listNotice").submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 
			 
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 
			 $("input[name=searchKeyword]").focus();
			 	
				$("input[name=searchKeyword]").keydown(function(key){
			    	if(key.keyCode == 13){
		    			fncGetList(1);
			    	}
			    } );
			 $( ".btn-default:contains('검색')" ).on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
					fncGetList(1);
				});
			 
			 
		 });
		 
		 </script>
</head>

<body>
    <div class="layoutWrap2">
        <div class="leftToolbar2">
            <jsp:include page="/layout/left.jsp" />
        </div>
        <div class="work2" id="wrapper">
        <ul>
        <div class="mainHeader2">
                 <div class="left2">
                     공지사항
                     <span>어울림의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
                 </div>
                 <div class="right2">
                     <a href="#"><i class="far fa-star"></i></a>
                 </div>
            </div>
            <div class="wrap">

                <div class="main">
                    <div class="mainHeader">
                        
                        <div class="search">
                    <select name="" id="">
                        <option value="">내용</option>
                        <option value="">제목</option>
                        <option value="">제목 + 내용</option>
                        <option value="">작성자</option>
                    </select>
                    <input type="text" placeholder="내용을 입력해주세요">
                    <a href="#">검색</a>
                </div>
                            
                    </div>
                        <div style="text-align: left">
                            <select name="gatherCategoryNo">
                                <option>선택</option>
                                <option value="101" ${post.gatherCategoryNo eq '101' ? "selected" : "" }>매칭</option>
                                <option value="102" ${post.gatherCategoryNo eq '102' ? "selected" : "" }>아이템</option>
                                <option value="103" ${post.gatherCategoryNo eq '103' ? "selected" : "" }>도전과제</option>
                                <option value="104" ${post.gatherCategoryNo eq '104' ? "selected" : "" }>결제</option>
                                <option value="105" ${post.gatherCategoryNo eq '105' ? "selected" : "" }>친구</option>
                                <option value="106" ${post.gatherCategoryNo eq '106' ? "selected" : "" }>타임라인</option>
                                <option value="107" ${post.gatherCategoryNo eq '107' ? "selected" : "" }>ASK</option>
                                <option value="108" ${post.gatherCategoryNo eq '108' ? "selected" : "" }>계정</option>
                                <option value="109" ${post.gatherCategoryNo eq '109' ? "selected" : "" }>알림</option>
                                <option value="110" ${post.gatherCategoryNo eq '110' ? "selected" : "" }>위치</option>
                                <option value="111" ${post.gatherCategoryNo eq '111' ? "selected" : "" }>기타</option>
                                <!-- 기존 카테고리 selected-->
                            </select></div>
                    <div class="noticeList">
                        <table>

                            <div class="addNotice">
                                <c:if test="${user.role eq '4' }">
                                    <a href="/post/addNotice">공지사항 등록</a>
                                </c:if>
                            </div>
                            <colgroup>
                                <col width="10%">
                                <col width="10%">
                                <col width="40%">
                                <col width="15%">
                                <col width="20%">
                                <col width="5%">
                            </colgroup>
                            <tr>
                                <td>번호</td>
                                <td>카테고리</td>
                                <td>제목</td>
                                <td>작성자</td>
                                <td>작성일</td>
                                <td>조회</td>
                            </tr>
                            <c:forEach var="notice" items="${list }">
                                <tr>
                                    <td>${notice.postNo }</td>
                                    <c:if test="${notice.gatherCategoryNo == '101'}">
                                    <td>매칭</td>
                                    </c:if>
                                    <c:if test="${notice.gatherCategoryNo == '102'}">
                                        <td>아이템</td>
                                    </c:if>
                                    <c:if test="${notice.gatherCategoryNo == '103'}">
                                        <td>도전과제</td>
                                    </c:if>
                                    <c:if test="${notice.gatherCategoryNo == '104'}">
                                        <td>결제</td>
                                    </c:if>
                                    <c:if test="${notice.gatherCategoryNo == '105'}">
                                        <td>친구</td>
                                    </c:if>
                                    <c:if test="${notice.gatherCategoryNo == '106'}">
                                        <td>타임라인</td>
                                    </c:if>
                                    <c:if test="${notice.gatherCategoryNo == '107'}">
                                        <td>ASK</td>
                                    </c:if>
                                    <c:if test="${notice.gatherCategoryNo == '108'}">
                                        <td>계정</td>
                                    </c:if>
                                    <c:if test="${notice.gatherCategoryNo == '109'}">
                                        <td>알림</td>
                                    </c:if>
                                    <c:if test="${notice.gatherCategoryNo == '110'}">
                                        <td>위치</td>
                                    </c:if>
                                    <c:if test="${notice.gatherCategoryNo == '111'}">
                                        <td>기타</td>
                                    </c:if>
                                    <td><a href="/post/getNotice?postNo=${notice.postNo }">${notice.postTitle }</a></td>
                                    <td>관리자</td> 
                                    <td>${notice.postDate }</td>
                                    <td>${notice.hitCount }</td>
                                </tr>
                            </c:forEach>

                        </table>
                       
                    </div>
			    <form class="form-inline" name="detailForm">
			    
                 <!-- PageNavigation Start... -->
					<jsp:include page="../common/pageNavigator_new.jsp"/>
				<!-- PageNavigation End... -->
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  </form>
                    
                </div>
            </div>	




         </ul>  
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
        
        
    </div>
</body></html>