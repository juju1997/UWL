<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  	
 <div class="container text-center" style="padding:30px 0">
	<nav aria-label="Page navigation example" >
	  <ul class="pagination justify-content-center" >
		  <!-- 좌측 -->
		  <!-- 현재페이지보다 이전페이지로 가려할때 사용을 막음 disabled-->
		  <c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
	   		 <li class="page-item disabled">
		  </c:if>
		  <!-- 이전페이지로 정상이동 가능 -->
		  <c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
	   		 <li class="page-item">
		  </c:if>
	      <a class="page-link" href="javascript:fncGetList('${ resultPage.currentPage-1}')" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    
	    <!-- 중앙 -->
	    <c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
	    
	    	<c:if test="${ resultPage.currentPage == i }">
		   	 <li class="page-item">
		   	 	<a class="page-link" href="javascript:fncGetList('${ i }');">${ i }<span class="sr-only">(current)</span></a>
		   	 </li>
	    	</c:if>
	    	
	    	<c:if test="${ resultPage.currentPage != i}">
			    <li class="page-item">
			    	<a class="page-link" href="javascript:fncGetList('${ i }');">${ i }</a>
			    </li>
	    	</c:if>
	    	
	    </c:forEach>
	    
	    <!-- 하단 -->
	    <c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
	    	<li class="page-item disabled">
	    </c:if>
	    <c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
		    <li class="page-item">
	    </c:if>
	      <a class="page-link" href="javascript:fncGetList('${resultPage.endUnitPage+1}')" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
	
</div>

