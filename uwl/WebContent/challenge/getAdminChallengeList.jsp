<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html>
	
<head>
	<meta charset="UTF-8">
		
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
    <!-- Bootstrap Dropdown Hover JS -->
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method","POST").attr("action","/challenge/getAdminChallengeList").submit();
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
		
		
		//============= userId 에 회원정보보기  Event  처리(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
				var challNo = $(this).children("input:hidden").val();
				console.log("challNo : "+ challNo); 
				self.location ="/challenge/getChallengeAdmin?challNo="+challNo;  
			});
			
						
		});	
		
		
		//============= userId 에 회원정보보기  Event  처리 (double Click)=============
		 $(function() {
			 
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(  "td:nth-child(5) > i" ).on("click" , function() {

				var prodNo = $(this).parent().children("input:hidden").val();
				//alert("prodNo : " + prodNo);
				$.ajax(
						{
							url: "/product/json/getProduct/" + prodNo,
							method : "GET",
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status){
								
								//Debug...
								//alert(status);
								//Debug...
								//alert("JSONData : \n"+JSONData);
								
								var displayValue = "<h6>"
															+"상품번호 : "+JSONData.prodNo+"<br/>"
															+"상품명 : "+JSONData.prodName+"<br/>"
															+"상품이미지 : "+JSONData.fileName+"<br/>"
															+"상품상세정보 : "+JSONData.prodDetail+"<br/>"
															+"제조일자 : "+JSONData.manuDate+"<br/>"
															+"가격 : "+JSONData.price+"<br/>"
															+"가입일자 : "+JSONData.regDate+"<br/>"
															+"</h3>";
								//Debug...									
								//alert(displayValue);
								$("h6").remove();
								$( "#"+prodNo+"" ).html(displayValue);
								
							}
					
				});
					 console.log("prodNo : "+ prodNo); 
			});
			
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "blue");
			$("h7").css("color" , "red");
			
			//==> 아래와 같이 정의한 이유는 ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
	
	</script>
	
</head>

<body>
	
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
		<!-- role에 따른 admin user 분류 할것 -->
			<h2>도전과제 리스트</h2>
		<%-- <c:if test="${param.menu == 'manage'}">
	       <h3>상품 관리</h3>
       </c:if> --%>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    	
		    	
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="1" ${!empty searchCondition && searchCondition == "1" ? "selected" : ""} >제목</option>
						
						<option value="2" ${!empty searchCondition && searchCondition == "2" ? "selected" : ""} >내용</option>
					
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  <br/>
				  <br/>
				  <br/>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
		<tbody>
			
		
		<div class="container">
		<div class="row">
			<tr class="ct_list_pop">
						<td align="center">번호</td>
						<td></td>
	
						<td align="left">제목</td>
						<td></td>
						<td align="left">카테고리</td>
						<td></td>
						<td align="left">내용</td>
						<td></td>
						<td align="left">보상점수</td>
						<td></td>
						<td align="left">날짜</td>
						<td align="left">
							</td>
					</tr>
					<tr>
						<td colspan="12" bgcolor="D6D7D6" height="1"></td>
					</tr>
		   <c:set var="i" value="0" />
				<c:forEach var="challenge" items="${list}">
					<c:set var="i" value="${i + 1}" />
						
					<tr class="ct_list_pop">
						<td align="center">${i}</td>
						<td></td>
	
						<td align="left"><input type="hidden" value="${challenge.challNo}"> ${challenge.challTitle}</td>
					
						<td></td>
						<c:if test="${challenge.challCategory == '1'}">
							<td align="left">Map</td>
						</c:if>
						<c:if test="${challenge.challCategory == '2'}">
							<td align="left">Vision</td>
						</c:if>
						<c:if test="${challenge.challCategory == '3'}">
							<td align="left">게시판활동</td>
						</c:if>
						<td></td>
						<td align="left">${challenge.challContent}</td>
						<td></td>
						<td align="left">${challenge.challReward}</td>
						<td></td>
						<td align="left">${challenge.challDate}</td>
						<td align="left"><td>
				</tr>
				<tr>
					<td colspan="12" bgcolor="D6D7D6" height="1"></td>
				</tr>
			</c:forEach>
		</div>
		</div>
			
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>