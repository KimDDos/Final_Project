<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="./layout/header.jsp"></jsp:include>

<!-- Header-->
<header class="bg-dark py-5">
	<div class="container px-5">
		<div class="row gx-5 align-items-centerss justify-content-center">
			<div class="col-lg-6 col-xl-7 col-xxl-6">
				<div class="container-md" style="margin-top: 50px">
					<table class="table" style="color: white">
						<thead class="table-primary">
							<tr>
								<!-- <th scope="col">번호</th>-->
								<th scope="col">제목</th>
								<th scope="col" style="width: 100px">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="nvo" items="${list }">
								<tr>
									<!-- <th scope="row">${nvo.noticeNo }</th> -->
									<td
										onclick="location.href='/notice/detail?notice_no=${nvo.noticeNo }'">
										${nvo.noticeTitle }</td>
									<td>${nvo.noticeRegDate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
				<a href="/reservation/register"><img
					class="img-fluid rounded-3 my-5" src="/resources/img/main.jpg"
					alt="..." /></a>
			</div>
		</div>
	</div>
</header>
<!-- Features section-->
<section class="py-5" id="features">
	<div class="container px-5 my-5">
		<div class="row gx-5">
			<div class="col-lg-4 mb-5 mb-lg-0">
				<h2 class="fw-bolder mb-0">A better way to start building.</h2>
			</div>
			<div class="col-lg-8">
				<div class="row gx-5 row-cols-1 row-cols-md-2">
					<div class="col mb-5 h-100">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-collection"></i>
						</div>
						<h2 class="h5">가까운 헬스장 찾기</h2>
						<p class="mb-0">제일 가까운 헬스장이 어디 있을까요?</p>
					</div>
					<div class="col mb-5 h-100">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-building"></i>
						</div>
						<h2 class="h5">Featured title</h2>
						<p class="mb-0">Paragraph of text beneath the heading to
							explain the heading. Here is just a bit more text.</p>
					</div>
					<div class="col mb-5 mb-md-0 h-100">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-toggles2"></i>
						</div>
						<h2 class="h5">Featured title</h2>
						<p class="mb-0">Paragraph of text beneath the heading to
							explain the heading. Here is just a bit more text.</p>
					</div>
					<div class="col h-100">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-toggles2"></i>
						</div>
						<h2 class="h5">Featured title</h2>
						<p class="mb-0">Paragraph of text beneath the heading to
							explain the heading. Here is just a bit more text.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Testimonial section-->
<div class="py-5 bg-light">
	<div class="container px-5 my-5">
		<div class="row gx-5 justify-content-center">
			<div class="col-lg-10 col-xl-7">
				<div class="text-center">
					<div class="fs-4 mb-4 fst-italic">"Working with Start
						Bootstrap templates has saved me tons of development time when
						building new projects! Starting with a Bootstrap template just
						makes things easier!"</div>
					<div class="d-flex align-items-center justify-content-center">
						<img class="rounded-circle me-3"
							src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
						<div class="fw-bold">
							Tom Ato <span class="fw-bold text-primary mx-1">/</span> CEO,
							Pomodoro
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Blog preview section-->
<section class="py-5">
	<div class="container px-5 my-5">
		<div class="row gx-5 justify-content-center">
			<div class="col-lg-8 col-xl-6">
				<div class="text-center" >
					<h1>트레이너 소개</h1>
				</div>
			</div>
		</div>
		<div class="row gx-5">
			<div class="col-lg-4 mb-5">
				<div class="card h-100 shadow border-0">
					<img class="card-img-top" style="height: 350px"
						src="https://img.freepik.com/free-photo/young-athletic-man-using-rowing-machine-while-exercising-health-club_637285-2520.jpg?t=st=1709082566~exp=1709086166~hmac=1c9550aff0216e023eb9b6cf5e9d6596eea599f2a518522d2d51dd9ca01830ef&w=1380" alt="..." />
					<div class="card-body p-4">
						<div class="badge bg-primary bg-gradient rounded-pill mb-2">근성장</div>
						<a class="text-decoration-none link-dark stretched-link" href="#!"><h5
								class="card-title mb-3">Blog post title</h5></a>
						<p class="card-text mb-0">Some quick example text to build on
							the card title and make up the bulk of the card's content.</p>
					</div>
					<div class="card-footer p-4 pt-0 bg-transparent border-top-0">
						<div class="d-flex align-items-end justify-content-between">
							<div class="d-flex align-items-center">
								<img class="rounded-circle me-3" style="width: 40px" "height="60px"
									src="https://img.freepik.com/free-photo/young-athletic-man-using-rowing-machine-while-exercising-health-club_637285-2520.jpg?t=st=1709082566~exp=1709086166~hmac=1c9550aff0216e023eb9b6cf5e9d6596eea599f2a518522d2d51dd9ca01830ef&w=1380" alt="..." />
								<div class="small">
									<div class="fw-bold">Kelly Rowan</div>
									<div class="text-muted">March 12, 2023 &middot; 6 min
										read</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-5">
				<div class="card h-100 shadow border-0">
					<img class="card-img-top" style="height: 350px"
						src="https://img.freepik.com/premium-photo/fitness-exercising-dieting-concept-sporty-woman-with-heavy-steel-dumbbells_380164-59711.jpg?w=1380" alt="..." />
					<div class="card-body p-4">
						<div class="badge bg-primary bg-gradient rounded-pill mb-2">다이어트</div>
						<a class="text-decoration-none link-dark stretched-link" href="#!"><h5
								class="card-title mb-3">Another blog post title</h5></a>
						<p class="card-text mb-0">This text is a bit longer to
							illustrate the adaptive height of each card. Some quick example
							text to build on the card title and make up the bulk of the
							card's content.</p>
					</div>
					<div class="card-footer p-4 pt-0 bg-transparent border-top-0">
						<div class="d-flex align-items-end justify-content-between">
							<div class="d-flex align-items-center">
								<img class="rounded-circle me-3"
									src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
								<div class="small">
									<div class="fw-bold">Josiah Barclay</div>
									<div class="text-muted">March 23, 2023 &middot; 4 min
										read</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-5">
				<div class="card h-100 shadow border-0">
					<img class="card-img-top" style="height: 350px"
						src="https://img.freepik.com/premium-photo/sport-bodybuilding-fitness-people-concept-close-up-young-man-with-dumbbells-flexing-muscles-gym_380164-188945.jpg?w=1380" alt="..." />
					<div class="card-body p-4">
						<div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
						<a class="text-decoration-none link-dark stretched-link" href="#!"><h5
								class="card-title mb-3">The last blog post title is a
								little bit longer than the others</h5></a>
						<p class="card-text mb-0">Some more quick example text to
							build on the card title and make up the bulk of the card's
							content.</p>
					</div>
					<div class="card-footer p-4 pt-0 bg-transparent border-top-0">
						<div class="d-flex align-items-end justify-content-between">
							<div class="d-flex align-items-center">
								<img class="rounded-circle me-3" style="width: 40px" "height="40px"
									src="https://img.freepik.com/premium-photo/sport-bodybuilding-fitness-people-concept-close-up-young-man-with-dumbbells-flexing-muscles-gym_380164-188945.jpg?w=1380" alt="..." />
								<div class="small">
									<div class="fw-bold">Evelyn Martinez</div>
									<div class="text-muted">April 2, 2023 &middot; 10 min
										read</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Call to action-->
		
	</div>
</section>
<!-- Footer-->

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
	let msg_mbrreg = "<c:out value='${msg_mbrreg}'/>";
	let msg_mbrIsTrainer = "<c:out value='${msg_mbrIsTrainer}'/>";
	if(msg_mbrreg == '1'){
		if(msg_mbrIsTrainer == "Y"){
			Swal.fire({
	            icon: 'success',
	            title: '득근득근 회원가입 성공!',
	            text: '(주) 득근득근의 신규 트레이너 회원이 되신것을 환영합니다.'
	        });
		} else {
			Swal.fire({
	            icon: 'success',
	            title: '득근득근 회원가입 성공!',
	            text: '(주) 득근득근의 신규회원이 되신것을 환영합니다.'
	        });
		}
	} else if(msg_mbrreg == '2'){
		Swal.fire({
            icon: 'error',
            title: '득근득근 회원가입 실패!',
            text: '(주) 득근득근의 신규 트레이너 회원 가입에 실패했습니다.<br>다시 시도하시거나 관리자에게 문의해주세요.'
        });
	}
	
</script>
<!-- Bootstrap core JS-->
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/resources/js/scripts.js"></script>
<jsp:include page="./layout/footer.jsp"></jsp:include>
</html>
