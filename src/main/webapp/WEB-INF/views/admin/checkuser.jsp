<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
 
<jsp:include page="../layout/admin-sidebar.jsp"></jsp:include>

<jsp:include page="../layout/admin-topbar.jsp"></jsp:include>

<body>
<table class="table">
  <thead>
    <tr>
      <th scope="col">이메일</th>
      <th scope="col">이름</th>
      <th scope="col">닉네임</th>
      <th scope="col">생년월일</th>
      <th scope="col">성별</th>
      <th scope="col">전화번호</th>
      <th scope="col">트레이너</th>
    </tr>
  </thead>
<tbody>
  <c:forEach var="mvo" items="${list }">
    <tr>
		<th scope="row"> ${mvo.userEmail } </th>
		<th scope="row"> ${mvo.userName } </th>
		<th scope="row"> ${mvo.userNickName } </th>
		<th scope="row"> ${mvo.userBirthDate } </th>
		<th scope="row"> ${mvo.userGender } </th>
		<th scope="row"> ${mvo.userPhoneNum } </th>
		<th scope="row"> ${mvo.isTrainer } </th>
    </tr>
    </c:forEach>
    
    
    
  </tbody>
</table>
    
	

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>


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
