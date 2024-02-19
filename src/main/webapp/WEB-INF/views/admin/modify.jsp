<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../layout/admin-sidebar.jsp"></jsp:include>


<jsp:include page="../layout/admin-topbar.jsp"></jsp:include>


<form action="/admin/modify" class="row g-3" method="post">
	<div class="container-md">
		<div class="md-3">
			<label for="no" class="form-label">번호</label> <input type="text"
				class="form-control" id="noticeNo" value="${nvo.noticeNo }"
				name="noticeNo" readonly="readonly">
		</div>
		<div class="md-3">
			<label for="title" class="form-label">제목</label> <input type="text"
				class="form-control" id="noticeTitle" value="${nvo.noticeTitle }"
				name="noticeTitle">
		</div>
		<div class="md-3">
			<label for="content" class="form-label">내 용</label>
			<textarea class="form-control" id="noticeContent"
				name="noticeContent" cols="30" rows="10">${nvo.noticeContent }</textarea>
		</div>
		<button type="submit">수정</button>
		<a><button type="button">삭제</button></a> <a href="/admin/list"><button
				type="button">목록</button></a>
</form>
</div>


<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/resources/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="/resources/js/demo/chart-area-demo.js"></script>
<script src="/resources/js/demo/chart-pie-demo.js"></script>
