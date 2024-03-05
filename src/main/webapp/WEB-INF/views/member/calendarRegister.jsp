<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<jsp:include page="../layout/header.jsp"></jsp:include>

<!DOCTYPE html>
<!-- Page Content-->
<section class="py-5">
	<div class="container px-1 my-5">
		<div class="row gx-5">
			<jsp:include page="../member/mypageLayout.jsp"></jsp:include>
			<div class="col-lg-9">
				<c:forEach var="rvo" items="${rList}" varStatus="status">
					<table class="table table-hover">
						<thead class="table-primary">
							<tr>
								<th scope="col" style="width: 420px">장소</th>
								<th scope="col">예약일</th>
								<th scope="col" style="width: 120px">예약시간</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td onclick="location.href='/reservation/detail?rno=${rvo.rno}'">
									${rvo.rvTitle}</td>
								<td>${rvo.rvReservdate}</td>
								<td>${rvo.rvTime}</td>
							</tr>
						</tbody>
					</table>
				</c:forEach>
			</div>
		</div>
	</div>
</section>
</main>
<jsp:include page="../layout/footer.jsp"></jsp:include>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/js/scripts.js"></script>
<script src="/resources/js/calendar.js"></script>
</body>
</html>
