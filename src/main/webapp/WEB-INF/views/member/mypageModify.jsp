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
					<form action="/member/memberModify" method="post">
						<div class="form-floating mb-3">
							<input class="form-control" id="userName" name="userName"
								type="text" value="NAME" placeholder="Enter your name..." /> <label
								for="name">이름</label>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="userEmail" name="userEmail"
								type="email" placeholder="name@example.com"
								value="ABCD@naver.com" /> <label for="email">이메일</label>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="userPhoneNum" name="userPhoneNum"
								type="tel" value="000-1111-2222" placeholder="(123) 456-7890" />
							<label for="phone">연락처</label>
						</div>
						<button type="submit" class="btn btn-success">수정 확인</button>
						<a href="/member/mypage"><button type="button"
								class="btn btn-danger">취소</button></a>
					</form>
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
