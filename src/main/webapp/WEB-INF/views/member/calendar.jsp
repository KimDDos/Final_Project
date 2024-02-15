<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../layout/header.jsp"></jsp:include>

<!DOCTYPE html>
<!-- Page Content-->
<section class="py-5">
	<div class="container px-1 my-5">
		<div class="row gx-5">
			<jsp:include page="../member/mypageLayout.jsp"></jsp:include>
			<div class="col-lg-9">
				<article>
					<header class="mb-4">
						<h1 class="fw-bolder mb-1">CALENDAR</h1>
					</header>
					<form name="frm" method="post">
						<select name="year">
							<option value="2024">2024</option>
							<option value="2025">2025</option>
						</select> <select name="month">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select> <input type="button" value="보기" onclick="checkmonth()"></input>
					</form>
					<div class="calendar"></div>
				</article>
			</div>
		</div>
	</div>
</section>
</main>
<jsp:include page="../layout/footer.jsp"></jsp:include>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/js/scripts.js"></script>
<script src="/resources/js/calendar.js"></script>
</body>
</html>
