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
					<div class="row gx-5">
						<div class="col-lg-4 mb-5">
							<div class="card h-100 shadow border-0">
								<img class="card-img-top"
									src="https://dummyimage.com/300x150/ced4da/6c757d" alt="..." />
								<div class="card-body p-4">
									<div class="badge bg-primary bg-gradient rounded-pill mb-2">사용기한</div>
									<a class="text-decoration-none link-dark stretched-link"
										href="#!"><h5 class="card-title mb-3">쿠폰이름</h5></a>
									<p class="card-text mb-0">쿠폰설명 및 할인율</p>
								</div>
							</div>
						</div>
					</div>
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
