<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>


<meta charset="utf-8" />
<sec:authentication property="principal.mdto.mvo.isTrainer"
	var="isTrainer" />
<sec:authentication property="principal.mdto.mvo.userSerialNo"
	var="userSerialNo" />
<div class="col-lg-3">
	<a href="/member/mypage" style="text-decoration: none; color: black;">
		<div class="d-flex align-items-center mt-lg-5 mb-4 py-3">
			<img class="img-fluid rounded-circle"
				src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
			<div class="ms-3">
				<div class="fw-bold">마이페이지</div>
			</div>
		</div>
	</a>
	<hr>
	<a href="/member/calendar?userSerialNo=${userSerialNo}"
		style="text-decoration: none; color: black;">
		<div class="d-flex align-items-center mt-lg-5 mb-4 py-3">
			<img class="img-fluid rounded-circle"
				src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
			<div class="ms-3">
				<div class="fw-bold">캘린더</div>
			</div>
		</div>
	</a>
	<c:if test="${isTrainer eq 'N'}">
		<hr>
		<a href="/member/coupon?UserNo=${userSerialNo}"
			style="text-decoration: none; color: black;">
			<div class="d-flex align-items-center mt-lg-5 mb-4 py-3">
				<img class="img-fluid rounded-circle"
					src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
				<div class="ms-3">
					<div class="fw-bold">쿠폰</div>
				</div>
			</div>
		</a>
		<hr>
	</c:if>
	<hr>
</div>