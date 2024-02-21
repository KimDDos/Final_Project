<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../layout/admin-sidebar.jsp"></jsp:include>


<jsp:include page="../layout/admin-topbar.jsp"></jsp:include>
<body>
<<<<<<< HEAD
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성일</th>
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
      <td onclick="location.href='/admin/detail?notice_no=${nvo.noticeNo }'"> ${nvo.noticeTitle }</td>
      
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
      <a class="page-link" href="/admin/list/?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&" aria-label="Prev">
      <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
</c:if>
<!-- 페이지번호 -->
<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i"> 
    <li class="page-item"><a class="page-link" href="/admin/list/?pageNo=${i}&qty=${ph.pgvo.qty}">${i }</a></li>
</c:forEach>
   
<!-- 다음 페이지 -->
<c:if test="${ph.next }">
    <li class="page-item">
      <a class="page-link" href="/admin/list/?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}" aria-label="Next">
      <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
</c:if>

</ul>
</nav>

		</tbody>
	</table>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>


	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/resources/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/resources/js/demo/chart-area-demo.js"></script>
	<script src="/resources/js/demo/chart-pie-demo.js"></script>
</body>

