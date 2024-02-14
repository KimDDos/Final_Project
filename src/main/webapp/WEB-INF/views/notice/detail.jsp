<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp"></jsp:include>


<body>
	<div class="container-md">
				<div class="mb-3">
					<label class="form-label">번호</label> 
					<input type="text" class="form-control" name="notice_no" id="notice_no" readonly="readonly"
						value="${nvo.noticeNo}">
				</div>
				<div class="mb-3">
					<label class="form-label">제목</label> <input type="text"
						class="form-control" name="notice_title" id="notice_title" readonly="readonly"
						value="${nvo.noticeTitle}">
				</div>
				<div class="mb-3">
					<label class="form-label">내용</label> 
					<input type="text"
						class="form-control" name="notice_content" id="notice_content"
						readonly="readonly" value="${nvo.noticeContent}">
				</div>
				<div class="mb-3">
					<label class="form-label">작성일</label> <input type="text"
						class="form-control" name="notice_reg_at" id="notice_reg_at" readonly="readonly"
						value="${nvo.noticeRegDate}">
				</div>
	</div>	
	
	<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>

</body>
<jsp:include page="../layout/footer.jsp"></jsp:include>
