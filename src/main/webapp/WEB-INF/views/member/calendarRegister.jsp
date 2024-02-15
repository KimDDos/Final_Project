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
				<form action="/member/calendarRegister?date=${datedata}" method="post">
					<div class="form-floating mb-3">
						<input class="form-control" id="CalScheduleTitle"
							name="CalScheduleTitle" type="text" value="Title"
							placeholder="Schedule title.." /> <label for="CalScheduleTitle">일정
							제목</label>
					</div>
					<div class="form-floating mb-3">
						<input class="form-control" id="CalScheduleDetail"
							name="CalScheduleDetail" type="text" placeholder="Details..."
							value="Detail" /> <label for="CalScheduleDetail">일정 상세내용</label>
					</div>
					<div class="form-floating mb-3">
						<input class="form-control" id="Start"
							name="Start" type="time" value="Start"
							placeholder="12:00" /> <label for="Start">일정
							시작시간</label>
					</div>
					<div class="form-floating mb-3">
						<input class="form-control" id="End" name="End"
							type="time" value="End" placeholder="17:00" />
						<label for="End">일정 끝시간</label>
					</div>
					<button type="submit" class="btn btn-success">수정 확인</button>
					<a href="/member/calendar"><button type="button"
							class="btn btn-danger">취소</button></a>
				</form>
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
