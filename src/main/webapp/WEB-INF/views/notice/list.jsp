<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp"></jsp:include>

<body>
<div class="container-md" style="margin-top: 50px">
<table class="table table-hover" >
  <thead class="table-primary">
    <tr>
    <!-- <th scope="col">번호</th>-->	
      <th scope="col">제목</th>
      <th scope="col" style="width: 100px">작성일</th>
    </tr>
  </thead>
<tbody>
  <c:forEach var="nvo" items="${list }">
    <tr>
      <!-- <th scope="row">${nvo.noticeNo }</th> -->
      <td onclick="location.href='/notice/detail?notice_no=${nvo.noticeNo }'"> ${nvo.noticeTitle }</td>
      <td>${nvo.noticeRegDate }</td>
    </tr>
    
    </c:forEach>
    
  </tbody>
</table>
</div>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>



</body>
<jsp:include page="../layout/footer.jsp"></jsp:include>


