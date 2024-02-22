<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../layout/admin-sidebar.jsp"></jsp:include>


<jsp:include page="../layout/admin-topbar.jsp"></jsp:include>

<body>
	<div class="container-md">
<<<<<<< HEAD
		<div>
			<label class="form-label">번호</label> <input type="text"
				class="form-control" name="notice_no" id="notice_no"
				readonly="readonly" value="${nvo.noticeNo}">
		</div>
		<div>
			<label class="form-label">제목</label> <input type="text"
				class="form-control" name="notice_title" id="notice_title"
				readonly="readonly" value="${nvo.noticeTitle}">
		</div>
		<div>
			<label class="form-label">content</label> <input type="text"
				class="form-control" name="notice_content" id="notice_content"
				readonly="readonly" value="${nvo.noticeContent}">
		</div>
		<div>
			<label class="form-label">작성일</label> <input type="text"
				class="form-control" name="notice_reg_at" id="notice_reg_at"
				readonly="readonly" value="${nvo.noticeRegDate}">
		</div>
	</div>

	<a href="/admin/modify?notice_no=${nvo.noticeNo }"><button
			type="button">수정</button></a>
	<a href="/admin/remove?notice_no=${nvo.noticeNo }"><button
			type="button">삭제</button></a>
=======
				<div >
					<label class="form-label">번호</label> 
					<input type="text" class="form-control" name="notice_no" id="notice_no" readonly="readonly"
						value="${nvo.noticeNo}">
				</div>
				<div >
					<label class="form-label">제목</label> <input type="text"
						class="form-control" name="notice_title" id="notice_title" readonly="readonly"
						value="${nvo.noticeTitle}">
				</div>
				<div >
					<label class="form-label">내용</label> 
					<input type="text"
						class="form-control" name="notice_content" id="notice_content"
						readonly="readonly" value="${nvo.noticeContent}">
				</div>
				<div >
					<label class="form-label">작성일</label> <input type="text"
						class="form-control" name="notice_reg_at" id="notice_reg_at" readonly="readonly"
						value="${nvo.noticeRegDate}">
				</div>
	</div>	
	
	<a href="/admin/modify?notice_no=${nvo.noticeNo }"><button type="button">수정</button></a>
	<a href="/admin/remove?notice_no=${nvo.noticeNo }"><button type="button">삭제</button></a>
>>>>>>> origin/DH
	<a href="/admin/list"><button type="button">목록</button></a>



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


</body>