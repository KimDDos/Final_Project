<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../layout/header.jsp"></jsp:include>

<!DOCTYPE html>
<!-- Page Content-->
<section class="py-5">
	<div class="container px-1 my-5">
		<div class="row gx-5">
			<div class="col-lg-3">
				<a href="#" style="text-decoration: none; color: black;">
					<div class="d-flex align-items-center mt-lg-5 mb-4 py-3">
						<img class="img-fluid rounded-circle"
							src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
						<div class="ms-3">
							<div class="fw-bold">마이페이지</div>
						</div>
					</div>
				</a>
				<hr>
				<a href="#" style="text-decoration: none; color: black;">
					<div class="d-flex align-items-center mt-lg-5 mb-4 py-3">
						<img class="img-fluid rounded-circle"
							src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
						<div class="ms-3">
							<div class="fw-bold">캘린더</div>
						</div>
					</div>
				</a>
				<hr>
				<a href="#" style="text-decoration: none; color: black;">
					<div class="d-flex align-items-center mt-lg-5 mb-4 py-3">
						<img class="img-fluid rounded-circle"
							src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
						<div class="ms-3">
							<div class="fw-bold">쿠폰 / 마일리지</div>
						</div>
					</div>
				</a>
				<hr>
				<a href="#" style="text-decoration: none; color: black;">
					<div class="d-flex align-items-center mt-lg-5 mb-4 py-3">
						<img class="img-fluid rounded-circle"
							src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
						<div class="ms-3">
							<div class="fw-bold">내가 쓴 리뷰</div>
						</div>
					</div>
				</a>
				<hr>
				<a href="#" style="text-decoration: none; color: black;">
					<div class="d-flex align-items-center mt-lg-5 mb-4 py-3">
						<img class="img-fluid rounded-circle"
							src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
						<div class="ms-3">
							<div class="fw-bold">고객센터</div>
						</div>
					</div>
				</a>
				<hr>
			</div>
			<div class="col-lg-9">
				<!-- Post content-->
				<article>
					<!-- Post header-->
					<header class="mb-4">
						<!-- Post title-->
						<h1 class="fw-bolder mb-1">MY PAGE</h1>
					</header>
					<form id="contactForm" data-sb-form-api-token="API_TOKEN">
						<!-- Name input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="name" type="text" readonly="readonly"
								value="NAME" placeholder="Enter your name..." data-sb-validations="required" />
							<label for="name">Full name</label>
						</div>
						<!-- Email address input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="email" type="email" readonly="readonly"
								placeholder="name@example.com" value="ABCD@naver.com"
								data-sb-validations="required,email" /> <label for="email">Email
								address</label>
						</div>
						<!-- Phone number input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="phone" type="tel" readonly="readonly" value="000-1111-2222"
								placeholder="(123) 456-7890" data-sb-validations="required" />
							<label for="phone">Phone number</label>
						</div>
						<!-- Submit success message-->
						<!---->
						<!-- This is what your users will see when the form-->
						<!-- has successfully submitted-->
						<div class="d-none" id="submitSuccessMessage">
							<div class="text-center mb-3">
								<div class="fw-bolder">Form submission successful!</div>
								To activate this form, sign up at <br /> <a
									href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
							</div>
						</div>
						<!-- Submit error message-->
						<!---->
						<!-- This is what your users will see when there is-->
						<!-- an error submitting the form-->
						<div class="d-none" id="submitErrorMessage">
							<div class="text-center text-danger mb-3">Error sending
								message!</div>
						</div>
					</form>
					<!-- Post content-->
					<section class="mb-5">
						<p class="fs-5 mb-4">Science is an enterprise that should be
							cherished as an activity of the free human mind. Because it
							transforms who we are, how we live, and it gives us an
							understanding of our place in the universe.</p>
						<p class="fs-5 mb-4">The universe is large and old, and the
							ingredients for life as we know it are everywhere, so there's no
							reason to think that Earth would be unique in that regard.
							Whether of not the life became intelligent is a different
							question, and we'll see if we find that.</p>
						<p class="fs-5 mb-4">If you get asteroids about a kilometer in
							size, those are large enough and carry enough energy into our
							system to disrupt transportation, communication, the food chains,
							and that can be a really bad day on Earth.</p>
						<h2 class="fw-bolder mb-4 mt-5">I have odd cosmic thoughts
							every day</h2>
						<p class="fs-5 mb-4">For me, the most fascinating interface is
							Twitter. I have odd cosmic thoughts every day and I realized I
							could hold them to myself or share them with people who might be
							interested.</p>
						<p class="fs-5 mb-4">Venus has a runaway greenhouse effect. I
							kind of want to know what happened there because we're twirling
							knobs here on Earth without knowing the consequences of it. Mars
							once had running water. It's bone dry today. Something bad
							happened there as well.</p>
					</section>
				</article>
			</div>
		</div>
	</div>
</section>
</main>
<!-- Footer-->
<!-- Bootstrap core JS-->
<jsp:include page="../layout/footer.jsp"></jsp:include>

<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/resources/js/scripts.js"></script>
</body>
</html>
