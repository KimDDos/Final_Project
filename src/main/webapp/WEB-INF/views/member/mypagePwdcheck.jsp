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
					<c:if test="${delete eq '1'}">회원탈퇴다 ${delete}</c:if>
					<p>비밀번호를 입력해주세요.</p>
					<form action="/member/checkPwd" method="get">
						<input class="form-control" id="userSerialNo" name="userSerialNo"
							type="hidden" value="${userSerialNo}" />
						<div class="form-floating mb-3">
							<input class="form-control" id="userPwd" name="userPwd"
								type="password" /> <label for="userPwd">패스워드</label>
						</div>
						<input class="form-control" id="delete" name="delete"
							type="hidden" value="${delete}" />
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
