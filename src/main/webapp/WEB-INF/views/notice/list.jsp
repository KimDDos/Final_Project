<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp"></jsp:include>

<body>
<div class="container-md" style="margin-top: 50px">
<table class="table table-hover" >
  <thead class="table-primary">
    <tr>
      <th scope="col" style="width: 100px">NO.</th>
      <th scope="col">제목</th>
      <th scope="col" style="width: 100px">작성일</th>
    </tr>
  </thead>
<tbody>
  <c:forEach var="nvo" items="${list }">
    	<tr>
          	<c:choose>
				<c:when test="${nvo.noticeCategory eq '2' }">
					<th scope="row"> 공지 </th>
				</c:when>
				<c:when test="${nvo.noticeCategory eq '1' }">
					 <th scope="row"> 이벤트 </th>
				</c:when>
				<c:otherwise>
					<th scope="row"> ${nvo.noticeNo } </th>
				</c:otherwise>
			 </c:choose>
      <td onclick="location.href='/notice/detail?notice_no=${nvo.noticeNo }'"> ${nvo.noticeTitle }</td>
      <td>${nvo.noticeRegDate }</td>
    </tr>
    
    </c:forEach>
    
    


  </tbody>
</table>
        <nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
  
<!-- 이전 페이지 -->
<c:if test="${ph.prev }">
    <li class="page-item">
      <a class="page-link" href="/notice/list/?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&" aria-label="Prev">
      <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
</c:if>
<!-- 페이지번호 -->
<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i"> 
    <li class="page-item"><a class="page-link" href="/notice/list/?pageNo=${i}&qty=${ph.pgvo.qty}">${i }</a></li>
</c:forEach>
   
<!-- 다음 페이지 -->
<c:if test="${ph.next }">
    <li class="page-item">
      <a class="page-link" href="/notice/list/?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}" aria-label="Next">
      <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
</c:if>

</ul>
</nav>
</div>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>



</body>
<jsp:include page="../layout/footer.jsp"></jsp:include>


