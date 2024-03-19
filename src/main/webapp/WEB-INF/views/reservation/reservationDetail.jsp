<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<jsp:include page="../layout/header.jsp"></jsp:include>


<script>
	var coupons = [];
</script>
<body>
	<sec:authentication property="principal.mdto.mvo.userSerialNo"
		var="userSerialNo" />
	<sec:authentication property="principal.mdto.mvo.isTrainer"
		var="isTrainer" />
	<form action="/reservation/submit" method="get">
		<div class="programCon" style="margin-top: 0; padding-top: 5px;">
			<input type="text" class="form-control" name="userSerialNo"
				id="userSerialNo" readonly="readonly" value="${rvo.userSerialNo}"
				hidden="hidden"> <input type="text" class="form-control"
				name="rno" id="rno" readonly="readonly" value="${rvo.rno}"
				hidden="hidden"> <input name="trainerNo"
				value="${userSerialNo}" hidden="hidden"> <input name="rno"
				value="${rvo.rno}" hidden="hidden"> <input id="useCpNum"
				name="useCpNum" value="0" hidden="hidden">
			<div class="writeForm writeForm_top chg_writeForm">
				<h2 class="rsv_h2">계약자 정보</h2>
				<table>
					<colgroup>
						<col class="writeForm_col01">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th style="background: #fff; padding: 0 30px"><span
								class="col01"></span>
								<p style="margin-left: 10px;">작성자</p></th>
							<td><input name="userName" type="text" readonly="readonly"
								id="clinic_fk" value="${rvo.userName}"
								class="inputTxt inputName wh420" style="color: grey;"> <span
								style="font-size: 14px; color: #181818; font-family: 'S-CoreDream-5Medium'; padding: 0 30px"
								class="col01">작성자 연락처</span><input name="phoneNum" type="text"
								readonly="readonly" id="clinic_fk" value="${rvo.phoneNum}"
								style="color: grey;" class="inputTxt inputName wh420"></td>

						</tr>
						<tr>
							<th style="background: #fff; padding: 0 30px"><span
								class="col01"></span>
								<p style="margin-left: 10px;">트레이너명</p></th>
							<td><input name="trainerName" type="text"
								readonly="readonly" id="clinic_fk" value="${rvo.trainerName}"
								class="inputTxt inputName wh420" style="color: grey;"> <span
								style="font-size: 14px; color: #181818; font-family: 'S-CoreDream-5Medium'; padding: 0 23px"
								class="col01">트레이너 연락처</span><input name="trainerPhoneNum"
								type="text" readonly="readonly" id="clinic_fk"
								value="${rvo.trainerPhoneNum}" style="color: grey;"
								class="inputTxt inputName wh420"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="writeForm writeForm_top chg_writeForm">
				<h2 class="rsv_h2">예약 정보</h2>
				<table>
					<colgroup>
						<col class="writeForm_col01">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th style="background: #fff; padding: 0 30px"><span
								class="col01"></span>
								<p style="margin-left: 10px;">작성일</p></th>
							<td><input name="rvRegdate" type="text" readonly="readonly"
								id="clinic_fk" value="${rvo.rvRegdate}"
								class="inputTxt inputName wh420" style="color: grey;"></td>
						</tr>
						<tr>
							<th style="background: #fff; padding: 0 30px"><span
								class="col01"></span>
								<p style="margin-left: 10px;">작성자</p></th>
							<td><input name="rvTitle" type="text" readonly="readonly"
								id="rvTitle" value="${rvo.rvTitle}"
								class="inputTxt inputName wh420" style="color: grey;"> <span
								style="font-size: 14px; color: #181818; font-family: 'S-CoreDream-5Medium'; padding: 0 30px"
								class="col01">작성자 연락처</span><input name="rvAddress" type="text"
								readonly="readonly" id="clinic_fk" value="${rvo.rvAddress}"
								style="color: grey;" class="inputTxt inputName wh420"></td>
						</tr>
						<tr>
							<th style="background: #fff; padding: 0 30px"><span
								class="col01"></span>
								<p style="margin-left: 10px;">예약상태</p></th>
							<td><input name="rvStatus" type="text" readonly="readonly"
								id="rvStatus" value="${rvo.rvStatus}"
								class="inputTxt inputName wh420" style="color: grey;"></td>
						</tr>
						<tr>
							<th style="background: #fff; padding: 0 30px"><span
								class="col01"></span>
								<p style="margin-left: 10px;">예약일자</p></th>
							<td><input name="rvReservdate" type="text"
								readonly="readonly" id="rvReservdate"
								value="${rvo.rvReservdate}" class="inputTxt inputName wh420"
								style="color: grey;"> <span
								style="font-size: 14px; color: #181818; font-family: 'S-CoreDream-5Medium'; padding: 0 30px; width: 144px; text-align: center;"
								class="col01">예약시간</span><input name="rvTime" type="text"
								readonly="readonly" id="rvTime" value="${rvo.rvTime}"
								style="color: grey;" class="inputTxt inputName wh420"></td>
						</tr>
						<tr>
							<th style="background: #fff; padding: 0 30px"><span
								class="col01"></span>
								<p style="margin-left: 10px;">기타 세부사항</p></th>

							<td>
								<div class="note-editing-area">
									<textarea class="note-codable" id="rvContent" name="rvContent"
										readonly="readonly" style="color: grey;">${rvo.rvContent}</textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th style="background: #fff; padding: 0 30px"><span
								class="col01"></span>
								<p style="margin-left: 10px;">가격</p></th>
							<td><input id="rvSuggestPrice" name="rvSuggestPrice"
								type="text" id="clinic_fk" value="${rvo.rvSuggestPrice}"
								class="inputTxt inputName wh420"
								${isTrainer == 'Y' and rvo.trainerNo eq '0' ? 'style="color: black;"' : 'style="color: grey;"'}
								${isTrainer == 'Y' and rvo.trainerNo eq '0' ? '' : 'readonly="readonly"'}>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="container-md" style="margin-top: 50px">
				<c:if
					test="${rvo.trainerNo ne '' and rvo.rvPayment eq '0' and isTrainer eq 'N'}">
					<button id="purchase" type="button" class="btn btn-success">결제하기</button>
				</c:if>
				<c:if test="${isTrainer eq 'Y' and rvo.trainerNo eq '0'}">
					<button type="submit" class="btn btn-success">예약 확정</button>
				</c:if>
				<a href="/reservation/cancel?rno=${rvo.rno}"><button
						type="button" class="btn btn-danger">예약 취소</button></a> <a
					href="/reservation/list"><button type="button"
						class="btn btn-warning">목록</button></a>
				<c:if
					test="${rvo.trainerNo ne '' and rvo.rvPayment eq '0' and isTrainer eq 'N'}">
					<div class="modal">
						<div class="modal_body">
							<div class="row">
								<!-- 쿠폰라인 (현재는 더미) -->
								<c:forEach var="cvo" items="${cList }" varStatus="status">
									<script>
										coupons.push(`${cvo.cpNum}`);
									</script>
									<div class="col-lg-4 mb-5">
										<button type="button" id="coupon${cvo.cpNum}">
											<div class="card h-100 shadow border-0">
												<div class="card-body p-4">
													<div class="badge bg-primary bg-gradient rounded-pill mb-2">${cvo.cpLimitdate}</div>
													<c:if test="${cvo.cpValue > 99}">
														<h5 class="card-title mb-3">${cvo.cpValue}원할인쿠폰</h5>
													</c:if>
													<c:if test="${cvo.cpValue < 100}">
														<h5 class="card-title mb-3">${cvo.cpValue}%할인쿠폰</h5>
													</c:if>
												</div>
											</div>
										</button>
									</div>
								</c:forEach>
							</div>
							<button type="button" class="btn-close-modal btn btn-danger">닫기</button>
						</div>
					</div>
					<button type="button" class="btn-open-modal btn btn-primary">쿠폰사용</button>
				</c:if>
			</div>
		</div>
	</form>

	<script src="/resources/js/coupon.js"></script>

	<!-- Bootstrap core JS-->
	<script src="/resources/js/purchase.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/resources/js/scripts.js"></script>

</body>
<jsp:include page="../layout/footer.jsp"></jsp:include>
