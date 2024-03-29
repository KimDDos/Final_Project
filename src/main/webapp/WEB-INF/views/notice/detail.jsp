<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
 %>
<jsp:include page="../layout/header.jsp"></jsp:include>


<body>
	<div class="container-md" style="margin-top: 50px">
				<div class="mb-3">
					<label class="form-label">제목</label> 
					<input type="text" class="form-control" name="notice_title" id="notice_title" readonly="readonly"
						value="${nvo.noticeTitle}">
				</div>
				
				<div>
					<label class="form-label">내용</label> 
					<div class="form-control" readonly="readonly" style="height: auto">
						<c:out value="${nvo.noticeContent}" escapeXml="false"/>
					</div>
				</div>
				
				<div class="mb-3">
					<label class="form-label">작성일</label> 
					<input type="text" class="form-control" name="notice_reg_at" id="notice_reg_at" readonly="readonly"
						value="${nvo.noticeRegDate}">
				</div>
			<a href="/notice/list"><button type="button">목록</button></a>
	</div>	
	
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>


</body>
<jsp:include page="../layout/footer.jsp"></jsp:include>
