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
					  <input type="radio" class="btn-check" name="discountType" id="btnradio1" autocomplete="off" value="1">
					  <label class="btn btn-outline-primary" for="btnradio1">비율 할인</label>
					  
					  <input type="radio" class="btn-check" name="discountType" id="btnradio2" autocomplete="off" value="2">
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
   				<div id="ratioInput">
   					<input type="text" name="ratioValue">
   					<label for="cotent" class="form-label">%</label>
   				</div>
   				<div id="amountInput">
   					<input type="text" name="amountValue">
   					<label for="cotent" class="form-label">원</label>
   				</div>
   			</td>
   			</tr>
   			<tr>
				<td>
					<div>
						<label for="cotent" class="form-label">발급인원</label>
					</div>
				</td>
				<td>
					<div class="form-check">
					 	<input class="form-check-input" type="checkbox" checked>
				  		<label class="form-check-label" for="flexCheckChecked"> 일반회원 전체 </label>
				  	</div>
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

<script>
// 페이지 로드 시 실행되는 함수
window.onload = function() {
    // 할인율 input 창 숨기기
    var ratioInput = document.getElementById('ratioInput');
    var amountInput = document.getElementById('amountInput');
    ratioInput.style.display = 'none';
    amountInput.style.display = 'none';
    
    // 라디오 버튼 변경 이벤트 처리
    document.querySelectorAll('input[name="discountType"]').forEach(function(radio) {
        radio.addEventListener('change', function() {
            // 선택된 라디오 버튼의 값 확인
            var selectedValue = document.querySelector('input[name="discountType"]:checked').value;
            
            // 할인율 input 창 보이거나 숨기기
            if (selectedValue === '1') { // 비율 할인 선택 시 보이기
                ratioInput.style.display = 'block';
                amountInput.style.display = 'none';
            } else if (selectedValue === '2') { // 금액 할인 선택 시 보이기
                ratioInput.style.display = 'none';
                amountInput.style.display = 'block';
            } else { // 다른 옵션 선택 시 숨기기
                ratioInput.style.display = 'none';
                amountInput.style.display = 'none';
            }
        });
    });
};
</script>
</body>

