<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../layout/header.jsp"></jsp:include>


<form class="row g-3" method="get">
  <div class="col-md">
    <label for="title" class="form-label">제목</label>
    <input type="text" class="form-control" id="title" name="title">
  </div>
  <div class="col-md">
    <label for="writer" class="form-label">작성자</label>
    <input type="text" class="form-control" id="writer" name="writer">
  </div>
  <div class="col-12">
    <label for="content" class="form-label">내 용</label>
    <textarea class="form-control" id="content" name="content" cols="30" rows="10"></textarea>
  </div>
<button type="submit">등록</button>
</form>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>

</body>

<jsp:include page="../layout/footer.jsp"></jsp:include>