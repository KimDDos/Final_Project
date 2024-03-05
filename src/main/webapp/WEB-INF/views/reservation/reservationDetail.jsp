<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<jsp:include page="../layout/header.jsp"></jsp:include>


<body>
	<sec:authentication property="principal.mdto.mvo.userSerialNo"
		var="userSerialNo" />
	<sec:authentication property="principal.mdto.mvo.isTrainer"
		var="isTrainer" />
	<div class="container-md" style="margin-top: 50px">
		<div class="mb-3">
			<label class="form-label">작성자</label> <input type="text"
				class="form-control" name="userName" id="userName"
				readonly="readonly" value="${mvo.userName}">
		</div>
		<div class="mb-3">
			<label class="form-label">계약자</label> <input type="text"
				class="form-control" name="trainerName" id="trainerName"
				readonly="readonly" value="${trainerName}">
		</div>
		<div class="mb-3">
			<label class="form-label">작성일</label> <input type="text"
				class="form-control" name="rvRegdate" id="rvRegdate"
				readonly="readonly" value="${rvo.rvRegdate}">
		</div>
		<div class="mb-3">
			<label class="form-label">예약 장소명</label> <input type="text"
				class="form-control" name="rvTitle" id="rvTitle" readonly="readonly"
				value="${rvo.rvTitle}">
		</div>
		<div class="mb-3">
			<label class="form-label">예약 주소</label> <input type="text"
				class="form-control" name="rvAddress" id="rvAddress"
				readonly="readonly" value="${rvo.rvAddress}">
		</div>

		<div class="mb-3">
			<label class="form-label">예약 상태</label> <input type="text"
				class="form-control" name="rvStatus" id="rvStatus"
				readonly="readonly" value="${rvo.rvStatus}">
		</div>
		<div class="mb-3">
			<label class="form-label">예약 일자</label> <input type="text"
				class="form-control" name="rvReservdate" id="rvReservdate"
				readonly="readonly" value="${rvo.rvReservdate}">
		</div>
		<div class="mb-3">
			<label class="form-label">예약 시간</label> <input type="text"
				class="form-control" name="rvTime" id="rvTime" readonly="readonly"
				value="${rvo.rvTime}">
		</div>
		<div class="mb-3">
			<label class="form-label">기타</label> <input type="text"
				class="form-control" name="rvContent" id="rvContent"
				readonly="readonly" value="${rvo.rvContent}">
		</div>
		<div class="mb-3">
			<label class="form-label">가격</label> <input type="text"
				class="form-control" name="rvSuggestPrice" id="rvSuggestPrice"
				readonly="readonly" value="${rvo.rvSuggestPrice}">
		</div>
		<c:if test="${rvo.trainerNo ne ''}">
			<!-- 여기에 카카오페이 추가. (https://scorpio-mercury.tistory.com/10) -->
		</c:if>
		<c:if test="${isTrainer == 'Y' and rvo.trainerNo eq '0'}">
			<a
				href="/reservation/submit?trainerNo=${userSerialNo}&rno=${rvo.rno}"><button
					type="button" class="btn btn-success">예약 확정</button></a>
		</c:if>
		<a href="/reservation/cancel?rno=${rvo.rno}"><button type="button"
				class="btn btn-danger">예약 취소</button></a> <a href="/reservation/list"><button
				type="button">목록</button></a>
	</div>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

</body>
<jsp:include page="../layout/footer.jsp"></jsp:include>
