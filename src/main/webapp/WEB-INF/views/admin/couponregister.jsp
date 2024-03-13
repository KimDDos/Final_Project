<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<jsp:include page="../layout/admin-sidebar.jsp"></jsp:include>

<jsp:include page="../layout/admin-topbar.jsp"></jsp:include>


<form action="/admin/couponregister" class="row g-3" method="post">
<div class="container-md">
<div class="col-12">
<h2> 쿠폰 등록</h2>
</div>

<div>
  <div>
  	<table border="1">
  		<tr>
  			<th >
	      		<label for="title" class="form-label">쿠폰명</label>
  			</th>
			<th>     	 
     	  		<input type="text" id="cpTitle" name="cpTitle">
	    	</th>
  		</tr>
  		<tr>
  			<td>
  				<label for="cotent" class="form-label">쿠폰 유효 기간</label>
  			</td>
  			<td> 
     			 <input type="date" name="cpReceivedate" id="cpReceivedate" required> 
     			 ~ 
     			 <input type="date" name="cpLimitdate" id="cpLimitdate" required>
   			</td>
  		</tr>
  		<tr>
  			<td>
  				<label for="cotent" class="form-label">할인 유형</label>
  			</td>
  			<td> 
     			 <div class="btn-group-sm" role="group-sm" aria-label="Basic radio toggle button group">
					  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" value="1" checked >
					  <label class="btn btn-outline-primary" for="btnradio1">비율 할인</label>
					  
					  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" value="2">
					  <label class="btn btn-outline-primary" for="btnradio2">금액 할인</label>
				  </div>
   			</td>
  		</tr>
   			<tr>
   			<td>
   				<div>
   					<label for="cotent" class="form-label">할인율 </label>
   				</div>
   			</td>
   			<td>
   					<input type="text" name="cpValue">
   			</td>
   			</tr>
  	</table>
      
      
    <button type="submit">등록</button>
  </div>
  </div>
  </div>
</form>

<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/resources/js/scripts.js"></script>


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

