<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../layout/header.jsp"></jsp:include>

<div class="container-md">
	<form action="/notice/modify" class="row g-3" method="post">
		<div class="md-3">
   	 		<label for="no" class="form-label">번호</label>
   	 		<input type="text" class="form-control" id="noticeNo" value="${nvo.noticeNo }" name="noticeNo">
  		</div>
  		<div class="md-3">
   	 		<label for="title" class="form-label">제목</label>
   	 		<input type="text" class="form-control" id="noticeTitle" value="${nvo.noticeTitle }" name="noticeTitle">
  		</div>
  		<div class="col-12">
    		<label for="content" class="form-label">내 용</label>
    		<textarea class="form-control" id="noticeContent" name="noticeContent" cols="30" rows="10">${nvo.noticeContent }</textarea>
  		</div>
			<button type="submit">수정</button>
			<a><button type="button">삭제</button></a>
			<a href="/notice/list"><button type="button">목록</button></a>
	</form>
</div>


<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>

</body>

<jsp:include page="../layout/footer.jsp"></jsp:include>