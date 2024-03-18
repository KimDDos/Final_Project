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
				<article>
					<header class="mb-4">
						<h1 class="fw-bolder mb-1">MY PAGE</h1>
					</header>
					<!-- 쿠폰라인 (현재는 더미) -->
					<c:forEach var="cvo" items="${cList }" varStatus="status">
						<c:if test="${status.count eq '1' or status.count %3 eq '0'}">
							<div class="row gx-5">
						</c:if>
						<div class="col-lg-4 mb-5">
							<div class="card h-100 shadow border-0">
								<img class="card-img-top"
									src="https://dummyimage.com/250x150/ced4da/6c757d" alt="..." />
								<div class="card-body p-4">
									<div class="badge bg-primary bg-gradient rounded-pill mb-2">${cvo.cpLimitdate}</div>
									<c:if test="${cvo.cpValue > 99}">
										<a class="text-decoration-none link-dark stretched-link"
											href="#!"><h5 class="card-title mb-3">${cvo.cpValue}원
												할인쿠폰</h5></a>
									</c:if>
									<c:if test="${cvo.cpValue < 100}">
										<a class="text-decoration-none link-dark stretched-link"
											href="#!"><h5 class="card-title mb-3">${cvo.cpValue}%
												할인쿠폰</h5></a>
									</c:if>
								</div>
							</div>
						</div>
						<c:if test="${(status.count+1) %3 eq '0'}">
			</div>
			</c:if>
			</c:forEach>
			<!-- 쿠폰라인 끝 -->
			</article>
		</div>
	</div>
	</div>
</section>
</main>
<jsp:include page="../layout/footer.jsp"></jsp:include>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/js/scripts.js"></script>
</body>
</html>
