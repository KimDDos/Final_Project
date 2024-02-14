<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../layout/admin-sidebar.jsp"></jsp:include>


<jsp:include page="../layout/admin-topbar.jsp"></jsp:include>

<form action="/admin/register" class="row g-3" method="post">
<h2> 공지사항 등록</h2>
<div class="container-md">
  <div class="col-12">
   			 <label for="title" class="form-label">제목</label>
   			 <input type="text" class="form-control" id="noticeTitle" name="noticeTitle">
  	<div >
   			 <label for="content" class="form-label">내 용</label>
   			 <textarea class="form-control" id="noticeContent" name="noticeContent" cols="30" rows="10"></textarea>
  	</div>
	<button type="submit">등록</button>
  </div>
  </div>
  
</form>

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
