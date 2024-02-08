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
      <th scope="col">작성자</th>
      <th scope="col">내 용</th>
    </tr>
  </thead>
<tbody>
  <c:forEach var="item" items="${notice }">
    <tr>
      <th scope="row">${notice.noticeNo }</th>
      <td>${notice.noticeTitle }</td>
      <td>${notice.noticeWriter }</td>
      <td>${notice.noticeContent }</td>
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


