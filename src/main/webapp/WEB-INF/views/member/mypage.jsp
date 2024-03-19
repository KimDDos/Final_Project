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
			<sec:authentication property="principal.mdto.mvo.userName"
				var="userName" />
			<sec:authentication property="principal.mdto.mvo.userNickName"
				var="userNickName" />
			<sec:authentication property="principal.mdto.mvo.userPhoneNum"
				var="userPhoneNum" />
			<div class="col-lg-9">
				<article>
					<header class="mb-4">
						<h1 class="fw-bolder mb-1">MY PAGE</h1>
					</header>
					<div class="form-floating mb-3">
						<input class="form-control" id="userName" type="text"
							name="userName" value="${userName}" readonly="readonly"
							placeholder="Enter your name..." /> <label for="Uname">이름</label>
					</div>
					<div class="form-floating mb-3">
						<input class="form-control" id="userNickName" type="text" readonly="readonly"
							name="userNickName" value="${userNickName}"
							placeholder="Enter your Nickname..." /> <label for="name">닉네임</label>
					</div>

					<div class="form-floating mb-3">
						<input class="form-control" id="userPhoneNum" type="tel" readonly="readonly"
							name="userPhoneNum" value="${userPhoneNum }"
							placeholder="(123) 456-7890" /> <label for="phone">연락처</label>
					</div>
					<a href="/member/mypagePwdcheck?delete=0"><button type="button"
							class="btn btn-warning">회원정보 수정</button></a> <a
						href="/member/trainerPr"><button type="button"
							class="btn btn-danger">회원 탈퇴</button></a>

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
