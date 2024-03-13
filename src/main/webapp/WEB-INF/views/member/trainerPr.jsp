<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="container-md">
	<div>
		    <h1 class="card-title">${userNickName }</h1>
		
	</div>
	<br>
	<br>
	<form action="/member/trainerPr" method="post">
		<div class="card mb-3">
		  <img src="..." class="card-img-top" alt="...">
		  	
		  <div class="card-body">
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