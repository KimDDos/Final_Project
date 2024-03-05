<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
	
<jsp:include page="../layout/admin-sidebar.jsp"></jsp:include>


<jsp:include page="../layout/admin-topbar.jsp"></jsp:include>


<form action="/admin/modify" class="row g-3" method="post" onsubmit="return sendForm(this);">
<div class="container-md">

<div class="col-12">
<input type="radio" class="btn-check" name="noticeCategory" id="option1" autocomplete="off" value="2">
<label class="btn" for="option1">공지사항</label>

<input type="radio" class="btn-check" name="noticeCategory" id="option2" autocomplete="off" value="0">
<label class="btn" for="option2">일반공지</label>

<input type="radio" class="btn-check" name="noticeCategory" id="option3" autocomplete="off" value="1">
<label class="btn" for="option3">이벤트</label>

	<div class="md-3">
		<label for="no" class="form-label">번호</label>
		<input type="text" class="form-control" id="noticeNo" value="${nvo.noticeNo }" name="noticeNo" readonly="readonly">
	</div>
	<div class="md-3">
		<label for="title" class="form-label">제목</label>
		<input type="text" class="form-control" id="noticeTitle" value="${nvo.noticeTitle }" name="noticeTitle">
	</div>
		<label for="cotent" class="form-label">내용</label>
		<div id="editor">${nvo.noticeContent }</div>
        <textarea style="display:none;" id="noticeContent"name="noticeContent"></textarea>
	<button type="submit">수정</button>
	<a><button type="button">삭제</button></a> 
	<a href="/admin/list"><button type="button">목록</button></a>
</div>
</div>
</form>


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
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	
	<script src="/resources/js/toastui.js"></script>
	<script>
		function sendForm(form){
			form.noticeContent.innerText = editor.getMarkdown();
			form.submit();
			return false;
		}	
	</script>
