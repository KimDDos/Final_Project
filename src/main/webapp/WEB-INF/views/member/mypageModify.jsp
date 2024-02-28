<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

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
					<sec:authentication property="principal.mdto.mvo.userSerialNo"
						var="userSerialNo" />
					<sec:authentication property="principal.mdto.mvo.userName"
						var="userName" />
					<sec:authentication property="principal.mdto.mvo.userNickName"
						var="userNickName" />
					<sec:authentication property="principal.mdto.mvo.userEmail"
						var="userEmail" />
					<sec:authentication property="principal.mdto.mvo.userPhoneNum"
						var="userPhoneNum" />
					<sec:authentication property="principal.mdto.mvo.isTrainer"
						var="isTrainer" />
					<p>회원정보를 수정해주세요.</p>
					<form action="/member/memberModify" method="post">
						<input class="form-control" id="userSerialNo" name="userSerialNo"
							type="hidden" value="${userSerialNo}" />
						<div class="form-floating mb-3">
							<input class="form-control" id="userName" type="text" name="userName"
								value="${userName}" placeholder="Enter your name..." /> <label
								for="Uname">이름</label>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="userNickName" type="text" name="userNickName"
								value="${userNickName}" placeholder="Enter your Nickname..." /> <label
								for="name">닉네임</label>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="userEmail" type="email" name="userEmail"
								placeholder="name@example.com" value="${userEmail}" /> <label
								for="email">이메일</label>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="userPhoneNum" type="tel" name="userPhoneNum"
								value="${userPhoneNum }" placeholder="(123) 456-7890" /> <label
								for="phone">연락처</label>
						</div>
						<button type="submit" class="btn btn-success">확인</button>
						<a href="/member/mypage"><button type="button"
								class="btn btn-danger">뒤로가기</button></a>
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
