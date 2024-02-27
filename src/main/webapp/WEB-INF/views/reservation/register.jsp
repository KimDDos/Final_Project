<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../layout/header.jsp"></jsp:include>

<link href="/resources/css/reservationmodal.css" rel="stylesheet" />

<div class="container px-1 my-5">
	<div class="row gx-5">
		<jsp:include page="../reservation/reservationLayout.jsp"></jsp:include>
		<div class="col-lg-9">
			<header class="mb-4">
				<h1 class="fw-bolder mb-1">온라인 예약</h1>
			</header>
			<form class="rvForm">
				<label class="rvLabel" for="rvName">이름:</label> <input
					class="rvInput" type="text" name="name" required> <label
					class="rvAddress" for="rvAddress">예약지 주소:</label> <input
					class="rvInput" type="text" value="${address}" readonly="readonly"
					name="rvAddress" required> <label class="rvAddress"
					for="rvAddress">예약지 명:</label> <input class="rvInput" type="text"
					value="${title}" readonly="readonly" name="rvAddress" required>
				<label class="rvLabel" for="rvContact">연락처:</label> <input
					class="rvInput" type="text" name="contact" required> <label
					class="rvLabel" for="rvEmail">이메일:</label> <input class="rvInput"
					type="email" name="email" required> <label for="rvDate">날짜
					선택:</label> <input type="text" class="rvInput" id="rvDate" name="date"
					required> <label class="rvLabel" for="rvTime">시간
					선택:</label> <input class="rvInput" type="time" name="time" required>
				<div class="rvSelectedItemsContainer">
					<label class="rvLabel" for="rvItem">예약 항목:</label>
					<div class="rvCheckboxGroup">
						<label> <img class="fit-picture"
							src="/resources/img/circle.svg" id="checkImg_1"
							style="margin-right: 2px" /><input type="checkbox"
							name="reservationItems" class="form-check-input" id="checkBox"
							value="item1" style="display: none">체중감소/증가/관리
						</label> <label><img class="fit-picture"
							src="/resources/img/circle.svg" id="checkImg_2"
							style="margin-right: 2px" /><input type="checkbox"
							name="reservationItems" class="form-check-input" id="checkBox"
							value="item2" style="display: none">근성장</label> <label><img
							class="fit-picture" src="/resources/img/circle.svg"
							style="margin-right: 2px" id="checkImg_3" /><input
							type="checkbox" name="reservationItems" class="form-check-input"
							id="checkBox" value="item3" style="display: none">체형교정</label> <label><img
							class="fit-picture" src="/resources/img/circle.svg"
							style="margin-right: 2px" id="checkImg_4" /><input
							type="checkbox" name="reservationItems" class="form-check-input"
							id="checkBox" value="item4" style="display: none">건강</label> <label><img
							class="fit-picture" src="/resources/img/circle.svg"
							style="margin-right: 2px" id="checkImg_5" /><input
							type="checkbox" name="reservationItems" class="form-check-input"
							id="checkBox" value="item5" style="display: none">체지방
							집중관리</label> <label><img class="fit-picture" id="checkImg_6"
							src="/resources/img/circle.svg" style="margin-right: 2px" /><input
							type="checkbox" name="reservationItems" class="form-check-input"
							id="checkBox" value="item6" style="display: none">재활치료</label>
					</div>
				</div>
		</div>
	</div>
	<button class="rvButton" type="submit">예약 확인</button>
	</form>
</div>

<script src="/resources/js/reservation.js"></script>

<script>
	$(function() {
		$("#rvDate").datepicker({
			dateFormat : "yy-mm-dd", // 날짜 형식 설정
			minDate : 0, // 과거 날짜 선택 불가
			maxDate : "+1Y", // 최대 1년 후까지만 선택 가능
			showButtonPanel : true
		// 하단 패널에 오늘 날짜와 닫기 버튼 표시
		});
	});
</script>
<script>
	$(function() {
		$("#rvDate").datepicker({
			dateFormat : "yy-mm-dd", // 날짜 형식 설정
			minDate : 0, // 과거 날짜 선택 불가
			maxDate : "+1Y", // 최대 1년 후까지만 선택 가능
			showButtonPanel : true
		// 하단 패널에 오늘 날짜와 닫기 버튼 표시
		});
	});
</script>

<jsp:include page="../layout/footer.jsp"></jsp:include>