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
	<form action="/member/trainerPr" method="post">
		<div class="card mb-3">
		  <img src="..." class="card-img-top" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">Card title</h5>
		    <input type="text" class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
		  </div>
		</div>
	</form>
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/js/scripts.js"></script>
</body>
</html>