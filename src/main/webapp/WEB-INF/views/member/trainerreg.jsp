<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="container-md">
	<div>
		<!-- 여기에 뭔가 들어가서 Sign up 페이지라고 표현해줘야함. 로고? 사이트명? 아니면 크게 회원가입? -->
		<h1 style="text-align: center; margin-top: 30px">트레이너 회원가입 페이지</h1>
	</div>
	<br>
	<br>
	<form action="/member/trainerReg" method="post">
		<div class="mb-3">
		  <label for="formGroupExampleInput" class="form-label">Example label</label>
		  <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Example input placeholder">
		</div>
		<div class="mb-3">
		  <label for="formGroupExampleInput2" class="form-label">Another label</label>
		  <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Another input placeholder">
		</div>
		
		
	</form>
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/js/scripts.js"></script>
</body>
</html>