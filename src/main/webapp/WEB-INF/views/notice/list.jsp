<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp"></jsp:include>

<body>
<table class="table">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">내 용</th>
      <th scope="col">작성일</th>
    </tr>
  </thead>
<tbody>
  <c:forEach var="nvo" items="${list }">
    <tr>
      <th scope="row">${nvo.noticeNo }</th>
      <td><a href="/notice/detail?notice_no=${nvo.noticeNo }"> ${nvo.noticeTitle }</a></td>
      <td>${nvo.noticeContent }</td>
      <td>${nvo.noticeRegDate }</td>
    </tr>
    
    </c:forEach>
    
  </tbody>
</table>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>



</body>
<jsp:include page="../layout/footer.jsp"></jsp:include>


