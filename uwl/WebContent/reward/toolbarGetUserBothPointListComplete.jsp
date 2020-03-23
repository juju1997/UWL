<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <!-- 참조 : http://getbootstrap.com/css/   참조 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <!-- Bootstrap Dropdown Hover CSS -->
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>


    <!-- jQuery UI toolTip 사용 CSS-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery UI toolTip 사용 JS-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!--  ///////////////////////// CSS ////////////////////////// -->


    <!--  ///////////////////////// JavaScript ////////////////////////// -->
    <script type="text/javascript">
        //=============    검색 / page 두가지 경우 모두  Event  처리 =============	
        function fncGetList(currentPage) {
            $("#currentPage").val(currentPage)
            $("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${param.menu}").submit();
            console.log("menu : ${param.menu}");
        }


        //============= "검색"  Event  처리 =============	
        $(function() {
            //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)

            $("input[name=searchKeyword]").focus();

            $("input[name=searchKeyword]").keydown(function(key) {
                if (key.keyCode == 13) {
                    fncGetList(1);
                }
            });
            $(".btn-default:contains('검색')").on("click", function() {
                //Debug..
                //alert(  $( "td.ct_btn01:contains('검색')" ).html() );
                fncGetList(1);
            });

            $("a:contains('구매')").on("click", function() {
                var prodNo = $(this).parents(".caption").children("input:hidden").val();
                //alert("여기여기 " + prodNo );
                self.location = "/purchase/addPurchase?prodNo=" + prodNo;
            });

        });


        //============= userId 에 회원정보보기  Event  처리(Click) =============	
        $(function() {

            //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
            $("a:contains('상세정보')").on("click", function() {
                var prodNo = $(this).parents(".caption").children("input:hidden").val();
                //alert("prodNo : "+ prodNo);
                self.location = "/product/getProduct?prodNo=" + prodNo + "&menu=${param.menu}";
                console.log("prodNo : " + prodNo);
            });


        });


        //============= userId 에 회원정보보기  Event  처리 (double Click)=============
        $(function() {

            //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
            $("td:nth-child(5) > i").on("click", function() {

                var prodNo = $(this).parent().children("input:hidden").val();
                //alert("prodNo : " + prodNo);
                $.ajax({
                    url: "/product/json/getProduct/" + prodNo,
                    method: "GET",
                    dataType: "json",
                    headers: {
                        "Accept": "application/json",
                        "Content-Type": "application/json"
                    },
                    success: function(JSONData, status) {

                        //Debug...
                        //alert(status);
                        //Debug...
                        //alert("JSONData : \n"+JSONData);

                        var displayValue = "<h6>" +
                            "상품번호 : " + JSONData.prodNo + "<br/>" +
                            "상품명 : " + JSONData.prodName + "<br/>" +
                            "상품이미지 : " + JSONData.fileName + "<br/>" +
                            "상품상세정보 : " + JSONData.prodDetail + "<br/>" +
                            "제조일자 : " + JSONData.manuDate + "<br/>" +
                            "가격 : " + JSONData.price + "<br/>" +
                            "가입일자 : " + JSONData.regDate + "<br/>" +
                            "</h3>";
                        //Debug...									
                        //alert(displayValue);
                        $("h6").remove();
                        $("#" + prodNo + "").html(displayValue);

                    }

                });
                console.log("prodNo : " + prodNo);
            });

            //==> userId LINK Event End User 에게 보일수 있도록 
            $(".ct_list_pop td:nth-child(3)").css("color", "red");
            $("h7").css("color", "red");

            //==> 아래와 같이 정의한 이유는 ??
            $(".ct_list_pop:nth-child(4n+6)").css("background-color", "whitesmoke");
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
            width: 1500px;
            height: 100vh;

            margin: 0 auto;
            overflow: hidden;
        }

        div.leftToolbar2 {

            width: 300px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-right: 1px solid #eee;
        }

        div.work2 {

            width: 900px;
            height: 100vh;
            float: left;
            overflow: hidden;
            overflow-y: scroll;

        }

        div.rightToolbar2 {

            width: 300px;
            height: 100vh;
            float: left;
            background-color: #fff;
            border-left: 1px solid #eee;
        }
    </style>
</head>

<body>
    <div class="layoutWrap2">
        <div class="leftToolbar2">
            <jsp:include page="/layout/left.jsp" />
        </div>
        <div class="work2">
            <div>

                <div class="page-header text-info">
                    <h3>포인트 사용내역조회 </h3>
                </div>

                <!-- table 위쪽 검색 Start /////////////////////////////////////-->
                <div class="row">

                    <div class="col-md-6 text-left">
                        <p class="text-primary">
                            전체 ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage} 페이지
                        </p>
                    </div>

                    <div class="col-md-6 text-right">
                        <form class="form-inline" name="detailForm">

                            <div class="form-group">
                                <select class="form-control" name="searchCondition">
                                    <option value="0" ${!empty searchCondition && searchCondition=="0" ? "selected" : "" }>상품번호</option>

                                    <option value="1" ${!empty searchCondition && searchCondition=="1" ? "selected" : "" }>상품명</option>

                                    <option value="2" ${!empty searchCondition && searchCondition=="2" ? "selected" : "" }>상품가격</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="sr-only" for="searchKeyword">검색어</label>
                                <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색어" value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
                            </div>

                            <button type="button" class="btn btn-default">검색</button>
                            <br />
                            <br />
                            <br />

                            <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
                            <input type="hidden" id="currentPage" name="currentPage" value="" />

                        </form>
                    </div>

                </div>
                <!-- table 위쪽 검색 Start /////////////////////////////////////-->


                <!--  table Start /////////////////////////////////////-->
                <table class="table table-hover table-striped">

                    <tbody>


                        <div class="container">
                            <div class="row">
                                <!--<%-- <c:forEach var="reward" items="${list}"> --%>-->

                                <c:forEach var="purchasePoint" items="${purchaseList}">
                                    <!--<%-- 카테고리 : ${purchasePoint.purchaseItem.itemCategory}
		  		구매번호 : ${purchasePoint.purchaseItem.purchaseNo} 
			 <c:if test="${purchasePoint.purchaseItem.itemCategory == '1'}">
			  	창<br>
			  </c:if>
			  	아이템카테고리 : ${purchasePoint.purchaseItem.itemCategory} <br>
			  	구매번호 : ${purchasePoint.purchaseItem.purchaseNo} <br>
	       		<c:if test=" ${purchasePoint.purchaseItem.purchaseNo ne 0}"> --%>
                                    <div class="col-sm-6 col-md-4">
                                        <div class="thumbnail">
                                            <br />
                                            <div class="caption">
                                                <input type="hidden" value="${purchasePoint.rewardNo}">
                                                <h3>아이템 구매내역 </h3>
                                                <p>
                                                    <c:if test=" ${purchasePoint.purchaseItem.itemCategory == '1'}">
                                                        구매아이템 : 창<br />
                                                    </c:if>
                                                    <c:if test=" ${purchasePoint.purchaseItem.itemCategory == '2'}">
                                                        구매아이템 : 방패<br />
                                                    </c:if>
                                                    사용포인트 : ${purchasePoint.variablePoint}<br />
                                                    총포인트 : ${purchasePoint.totalPoint}<br />
                                                    획득날짜 : ${purchasePoint.variableDate}<br />
                                                </p>

                                                <p><a href="#" class="btn btn-primary" role="button">상세정보</a>
                                            </div>
                                        </div>
                                    </div>
                                    <%-- </c:if> --%>-->
                                </c:forEach>

                                <c:forEach var="reward" items="${list}">
                                    <div class="col-sm-6 col-md-4">
                                        <div class="thumbnail">
                                            <br />
                                            <div class="caption">
                                                <input type="hidden" value="${reward.rewardNo}">
                                                <h3>${reward.challenge.challTitle} </h3>

                                                <c:if test=" ${reward.purchaseItem.purchaseNo == 0}">
                                                    <p>
                                                        <c:if test=" ${reward.purchaseItem.itemCategory == '1'}">
                                                            구매아이템 : 창<br />
                                                        </c:if>
                                                        <c:if test=" ${reward.purchaseItem.itemCategory == '2'}">
                                                            구매아이템 : 방패<br />
                                                        </c:if>
                                                        사용포인트 : - ${reward.variablePoint}<br />
                                                        총포인트 : ${reward.totalPoint}<br />
                                                        획득날짜 : ${reward.variableDate}<br />
                                                    </p>
                                                </c:if>

                                                <p>
                                                    획득포인트 : + ${reward.variablePoint}<br />
                                                    총 포인트 : ${reward.totalPoint}<br />
                                                    획득날짜 : ${reward.variableDate}<br />
                                                </p>
                                                <p><a href="#" class="btn btn-primary" role="button">상세정보</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>


                    </tbody>

                </table>
                <!--  table End /////////////////////////////////////-->

            </div>
            <!--  화면구성 div End /////////////////////////////////////-->


            <!-- PageNavigation Start... -->
            <jsp:include page="../common/pageNavigator_new.jsp" />
        </div>
        <div class="rightToolbar2">
            <jsp:include page="/layout/right.jsp" />
        </div>
    </div>
</body></html>