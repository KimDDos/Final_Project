<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<jsp:include page="../layout/header.jsp"></jsp:include>

<body>
	<sec:authentication property="principal.mdto.mvo.userSerialNo"
		var="userSerialNo" />
	<sec:authentication property="principal.mdto.mvo.isTrainer"
		var="isTrainer" />
	<div class="container-md" style="margin-top: 50px">
		<table class="table table-hover">
			<thead class="table-primary">
				<tr>
					<th scope="col" style="width: 100px">번호</th>
					<th scope="col" style="width: 100px">작성자</th>
					<th scope="col">장소</th>
					<th scope="col" style="width: 120px">시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="rvo" items="${list }">
					<tr>
						<td>${rvo.rno}</td>
						<td>${rvo.userName}</td>
						<c:choose>
							<c:when test="${rvo.userSerialNo == userSerialNo}">
								<td onclick="location.href='/reservation/detail?rno=${rvo.rno}'">
									${rvo.rvTitle}</td>
							</c:when>
							<c:when test="${isTrainer == 'Y'}">
								<td onclick="location.href='/reservation/detail?rno=${rvo.rno}'">
									${rvo.rvTitle}</td>
							</c:when>
							<c:otherwise>
								<td onclick="#">${rvo.rvTitle}</td>
							</c:otherwise>
						</c:choose>
						<td>${rvo.rvReservdate} ${rvo.rvTime}</td>
					</tr>
				</c:forEach>




			</tbody>
		</table>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">

				<!-- 이전 페이지 -->
				<c:if test="${ph.prev }">
					<li class="page-item"><a class="page-link"
						href="/reservation/mylist/?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&uno=${userSerialNo}"
						aria-label="Prev"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<!-- 페이지번호 -->
				<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
					<li class="page-item"><a class="page-link"
						href="/reservation/mylist/?pageNo=${i}&qty=${ph.pgvo.qty}&uno=${userSerialNo}">${i }</a></li>
				</c:forEach>

				<!-- 다음 페이지 -->
				<c:if test="${ph.next }">
					<li class="page-item"><a class="page-link"
						href="/reservation/mylist/?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}&uno=${userSerialNo}"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>

			</ul>
		</nav>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>



</body>
<jsp:include page="../layout/footer.jsp"></jsp:include>


