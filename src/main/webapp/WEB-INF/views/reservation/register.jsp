<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp"></jsp:include>


<h1>예약!</h1>
<div class="CenterFixed">
<img data-aos="fade-up" src="/resources/img/reservationregister.jpg" class="aos-init aos-animate">
</div>

<div id="contents">
		<div id="container">
			<div class="InnerContainer">
				<h1 class="Hide">비로그인예약(진료예약)</h1>

				<!-- 비로그인예약 -->
				<div class="reserveTable">
					<form class="form-inline" id="frmReserve" name="frmReserve" method="post" enctype="multipart/form-data" autocomplete="off">
					<input type="hidden" id="blank" name="blank" value="">
					<input type="hidden" id="bID" name="bID" value="9">
					<input type="hidden" id="isAction" name="isAction" value="N">
					<input type="hidden" id="contents" name="contents" value="">
					<input type="hidden" id="isPage" name="isPage" value="reserve">
					<input type="hidden" id="isCateNew" name="isCateNew" value="Y">
					<fieldset>
						<table border="0" cellpadding="0" cellspacing="0" class="">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<thead>
																<tr>
									<th>시술 분류</th>
									<td>
										<!-- 시술선택-->
										<div class="SelectClinicArea">
											<ul>
																								<li class="Depth1">
													<dl>
														<dt><strong>1차 시술 분류</strong></dt>
														<dd>
															<!-- 1차진료과목 --->
																														<label class="Checkbox Radio">
																<input type="radio" id="code1" name="code1" value="2518" class="i_radio" checked="" onclick="getTreatmentCateList('2518','','code2','2차 시술 분류');">
																<div class="Box">
																	<small><em><b>&nbsp;</b><span>●</span></em></small>
																	<big>눈</big>
																</div>
															</label>
																														<label class="Checkbox Radio">
																<input type="radio" id="code1" name="code1" value="2519" class="i_radio" onclick="getTreatmentCateList('2519','','code2','2차 시술 분류');">
																<div class="Box">
																	<small><em><b>&nbsp;</b><span>●</span></em></small>
																	<big>코</big>
																</div>
															</label>
																														<label class="Checkbox Radio">
																<input type="radio" id="code1" name="code1" value="2520" class="i_radio" onclick="getTreatmentCateList('2520','','code2','2차 시술 분류');">
																<div class="Box">
																	<small><em><b>&nbsp;</b><span>●</span></em></small>
																	<big>가슴</big>
																</div>
															</label>
																														<label class="Checkbox Radio">
																<input type="radio" id="code1" name="code1" value="2521" class="i_radio" onclick="getTreatmentCateList('2521','','code2','2차 시술 분류');">
																<div class="Box">
																	<small><em><b>&nbsp;</b><span>●</span></em></small>
																	<big>윤곽</big>
																</div>
															</label>
																														<label class="Checkbox Radio">
																<input type="radio" id="code1" name="code1" value="2522" class="i_radio" onclick="getTreatmentCateList('2522','','code2','2차 시술 분류');">
																<div class="Box">
																	<small><em><b>&nbsp;</b><span>●</span></em></small>
																	<big>동안성형</big>
																</div>
															</label>
																														<label class="Checkbox Radio">
																<input type="radio" id="code1" name="code1" value="2523" class="i_radio" onclick="getTreatmentCateList('2523','','code2','2차 시술 분류');">
																<div class="Box">
																	<small><em><b>&nbsp;</b><span>●</span></em></small>
																	<big>지방흡입</big>
																</div>
															</label>
																														<label class="Checkbox Radio">
																<input type="radio" id="code1" name="code1" value="2524" class="i_radio" onclick="getTreatmentCateList('2524','','code2','2차 시술 분류');">
																<div class="Box">
																	<small><em><b>&nbsp;</b><span>●</span></em></small>
																	<big>특수</big>
																</div>
															</label>
																														<label class="Checkbox Radio">
																<input type="radio" id="code1" name="code1" value="2525" class="i_radio" onclick="getTreatmentCateList('2525','','code2','2차 시술 분류');">
																<div class="Box">
																	<small><em><b>&nbsp;</b><span>●</span></em></small>
																	<big>피부</big>
																</div>
															</label>
																														<label class="Checkbox Radio">
																<input type="radio" id="code1" name="code1" value="2526" class="i_radio" onclick="getTreatmentCateList('2526','','code2','2차 시술 분류');">
																<div class="Box">
																	<small><em><b>&nbsp;</b><span>●</span></em></small>
																	<big>쁘띠</big>
																</div>
															</label>
																														<!-- //1차진료과목 --->
														</dd>
													</dl>
												</li>
												<li class="Depth2">
													<dl>
														<dt><strong>2차 시술 분류</strong><span>세부 항목 선택 / 중복 선택 가능</span></dt>
														<dd>
															<!-- 2차진료과목 --->
															<div id="getCateDiv" class="div_sub SelectedClinic">		<label class="Checkbox Radio">
						<input type="radio" id="code2" name="code2" value="2533" onclick="applyCode('2533', '내시경 가슴확대')">
						<div class="Box">
				<small><em><b>&nbsp;</b><span>●</span></em></small>
				<big>내시경 가슴확대</big>
			</div>
		</label>
		<label class="Checkbox Radio">
						<input type="radio" id="code2" name="code2" value="2534" onclick="applyCode('2534', '가슴축소/하수교정')">
						<div class="Box">
				<small><em><b>&nbsp;</b><span>●</span></em></small>
				<big>가슴축소/하수교정</big>
			</div>
		</label>
		<label class="Checkbox Radio">
						<input type="radio" id="code2" name="code2" value="2535" onclick="applyCode('2535', '가슴재수술/재건수술')">
						<div class="Box">
				<small><em><b>&nbsp;</b><span>●</span></em></small>
				<big>가슴재수술/재건수술</big>
			</div>
		</label>
		<label class="Checkbox Radio">
						<input type="radio" id="code2" name="code2" value="2536" onclick="applyCode('2536', '유두/유륜성형')">
						<div class="Box">
				<small><em><b>&nbsp;</b><span>●</span></em></small>
				<big>유두/유륜성형</big>
			</div>
		</label>
		<label class="Checkbox Radio">
						<input type="radio" id="code2" name="code2" value="2537" onclick="applyCode('2537', '부유방수술')">
						<div class="Box">
				<small><em><b>&nbsp;</b><span>●</span></em></small>
				<big>부유방수술</big>
			</div>
		</label>
</div>
															<script language="javaScript">getTreatmentCateList('2518','','code2','2차 시술 분류')</script>
															<!-- //2차진료과목 --->
														</dd>
													</dl>
												</li>
																								<li class="Depth3"><div class="item select_div2" id="selectCate"><label class="SelectedBtn" id="selectCode_2527"><span>	<input type="hidden" id="selCode" name="selCode" value="2527">쌍꺼풀	<a title="삭제" onclick="reMoveCode(2527)">×</a>	</span></label><label class="SelectedBtn" id="selectCode_2528"><span>	<input type="hidden" id="selCode" name="selCode" value="2528">트임	<a title="삭제" onclick="reMoveCode(2528)">×</a>	</span></label><label class="SelectedBtn" id="selectCode_2529"><span>	<input type="hidden" id="selCode" name="selCode" value="2529">재수술	<a title="삭제" onclick="reMoveCode(2529)">×</a>	</span></label><label class="SelectedBtn" id="selectCode_2530"><span>	<input type="hidden" id="selCode" name="selCode" value="2530">눈밑지방제거	<a title="삭제" onclick="reMoveCode(2530)">×</a>	</span></label></div></li>
											</ul>
										</div>
										<!-- //시술선택-->
										
																			</td>
								</tr>
																
								
								
								<!-- 지점선택 -->
																<input type="hidden" id="branch" name="branch" value="C00182">
								<tr class="BranchName">
									<th>지점</th>
									<td>
										타미성형외과									</td>
								</tr>
																<!-- //지점선택 -->
							</thead>
							<tbody>
								<tr>
									<th>이름</th>
									<td>
										<div class="InputBox">
											<input type="text" id="writerName" name="writerName" value="" maxlength="5">
										</div>
									</td>
								</tr>
								<tr>
									<th>연락처</th>
									<td>
										<div class="InputBox"><input type="tel" id="writerHP" name="writerHP" value=""></div>
									</td>
								</tr>

								
								<tr class="CounselTr">
									<th>상담구분</th>
									<td>
										<label class="Checkbox Radio">
											<input type="radio" id="counselGubun" name="counselGubun" value="초진" checked="true">
											<div class="Box">
												<small><em><b>&nbsp;</b><span>●</span></em></small>
												<big>초진</big>
											</div>
										</label>
										<label class="Checkbox Radio">
											<input type="radio" id="counselGubun" name="counselGubun" value="재진">
											<div class="Box">
												<small><em><b>&nbsp;</b><span>●</span></em></small>
												<big>재진</big>
											</div>
										</label>
									</td>
								</tr>
								<tr>
									<th>원하는 시간</th>
									<td id="dayTimeCommonDiv">
			
			<!--- 예약날짜 --->
			<div class="DayCont">
				<div class="Left">
					<div class="Info">
						<span>예약일 선택</span>
					</div>
				</div>
				<!--- 달력 --->
				<div class="DayDate hasDatepicker" id="lilineDatepicker"><div class="ui-datepicker-inline ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" style="display: block;"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all"><a class="ui-datepicker-prev ui-corner-all ui-state-disabled" title="이전달"><span class="ui-icon ui-icon-circle-triangle-w">이전달</span></a><a class="ui-datepicker-next ui-corner-all" onclick="DP_jQuery_1707802897001.datepicker._adjustDate('#lilineDatepicker', +1, 'M');" title="다음달"><span class="ui-icon ui-icon-circle-triangle-e">다음달</span></a><div class="ui-datepicker-title"><select class="ui-datepicker-year" onchange="DP_jQuery_1707802897001.datepicker._selectMonthYear('#lilineDatepicker', this, 'Y');"><option value="2024" selected="selected">2024</option></select><span>년</span><select class="ui-datepicker-month" onchange="DP_jQuery_1707802897001.datepicker._selectMonthYear('#lilineDatepicker', this, 'M');"><option value="1" selected="selected">2월</option><option value="2">3월</option></select></div></div><table class="ui-datepicker-calendar"><thead><tr><th class="ui-datepicker-week-end"><span title="일">일</span></th><th><span title="월">월</span></th><th><span title="화">화</span></th><th><span title="수">수</span></th><th><span title="목">목</span></th><th><span title="금">금</span></th><th class="ui-datepicker-week-end"><span title="토">토</span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-unselectable ui-state-disabled undefined"><span class="ui-state-default">1</span></td><td class=" ui-datepicker-unselectable ui-state-disabled undefined"><span class="ui-state-default">2</span></td><td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled undefined"><span class="ui-state-default">3</span></td></tr><tr><td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled undefined"><span class="ui-state-default">4</span></td><td class=" ui-datepicker-unselectable ui-state-disabled undefined"><span class="ui-state-default">5</span></td><td class=" ui-datepicker-unselectable ui-state-disabled undefined"><span class="ui-state-default">6</span></td><td class=" ui-datepicker-unselectable ui-state-disabled undefined"><span class="ui-state-default">7</span></td><td class=" ui-datepicker-unselectable ui-state-disabled undefined"><span class="ui-state-default">8</span></td><td class=" ui-datepicker-unselectable ui-state-disabled undefined"><span class="ui-state-default">9</span></td><td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled undefined"><span class="ui-state-default">10</span></td></tr><tr><td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled undefined"><span class="ui-state-default">11</span></td><td class=" ui-datepicker-unselectable ui-state-disabled undefined"><span class="ui-state-default">12</span></td><td class=" ui-datepicker-unselectable ui-state-disabled undefined ui-datepicker-today"><span class="ui-state-default">13</span></td><td class=" ui-datepicker-days-cell-over undefined ui-datepicker-current-day" onclick="DP_jQuery_1707802897001.datepicker._selectDay('#lilineDatepicker',1,2024, this);return false;"><a class="ui-state-default ui-state-active ui-state-hover" href="#">14</a></td><td class=" undefined" onclick="DP_jQuery_1707802897001.datepicker._selectDay('#lilineDatepicker',1,2024, this);return false;"><a class="ui-state-default" href="#">15</a></td><td class=" undefined" onclick="DP_jQuery_1707802897001.datepicker._selectDay('#lilineDatepicker',1,2024, this);return false;"><a class="ui-state-default" href="#">16</a></td><td class=" ui-datepicker-week-end undefined" onclick="DP_jQuery_1707802897001.datepicker._selectDay('#lilineDatepicker',1,2024, this);return false;"><a class="ui-state-default" href="#">17</a></td></tr><tr><td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled undefined"><span class="ui-state-default">18</span></td><td class=" undefined" onclick="DP_jQuery_1707802897001.datepicker._selectDay('#lilineDatepicker',1,2024, this);return false;"><a class="ui-state-default" href="#">19</a></td><td class=" undefined" onclick="DP_jQuery_1707802897001.datepicker._selectDay('#lilineDatepicker',1,2024, this);return false;"><a class="ui-state-default" href="#">20</a></td><td class=" undefined" onclick="DP_jQuery_1707802897001.datepicker._selectDay('#lilineDatepicker',1,2024, this);return false;"><a class="ui-state-default" href="#">21</a></td><td class=" undefined" onclick="DP_jQuery_1707802897001.datepicker._selectDay('#lilineDatepicker',1,2024, this);return false;"><a class="ui-state-default" href="#">22</a></td><td class=" undefined" onclick="DP_jQuery_1707802897001.datepicker._selectDay('#lilineDatepicker',1,2024, this);return false;"><a class="ui-state-default" href="#">23</a></td><td class=" ui-datepicker-week-end undefined" onclick="DP_jQuery_1707802897001.datepicker._selectDay('#lilineDatepicker',1,2024, this);return false;"><a class="ui-state-default" href="#">24</a></td></tr><tr><td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled undefined"><span class="ui-state-default">25</span></td><td class=" undefined" onclick="DP_jQuery_1707802897001.datepicker._selectDay('#lilineDatepicker',1,2024, this);return false;"><a class="ui-state-default" href="#">26</a></td><td class=" undefined" onclick="DP_jQuery_1707802897001.datepicker._selectDay('#lilineDatepicker',1,2024, this);return false;"><a class="ui-state-default" href="#">27</a></td><td class=" undefined" onclick="DP_jQuery_1707802897001.datepicker._selectDay('#lilineDatepicker',1,2024, this);return false;"><a class="ui-state-default" href="#">28</a></td><td class=" undefined" onclick="DP_jQuery_1707802897001.datepicker._selectDay('#lilineDatepicker',1,2024, this);return false;"><a class="ui-state-default" href="#">29</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div></div>
				<input type="hidden" id="counselDate" name="counselDate" value="2024-02-14">
				<!--- //달력 --->
			</div>
			<!--- //예약날짜 --->

			<!--- 예약시간 --->
			<div class="DayCont">
				<div class="Left">
					<div class="Info">
						<span>예약시간 선택</span>
					</div>
				</div>
				<!--- 시간 --->
				<div class="DayTime">
					<!-- 로딩중 -->
					<div class="LoadingArea" id="timeLoading" style="display:none;">
						<div class="LoadingBg"></div>
						<div class="SpinnerBox">
							<div class="Spinner">
								<div class="Bounce1"></div>
								<div class="Bounce2"></div>
								<div class="Bounce3"></div>
								<span>예약 가능 시간 조회 중</span>
							</div>
						</div>
					</div>
					<!-- //로딩중 -->

					<ul class="TimeList">
						
						
						
						
						
												<li id="1000" title="예약가능" onclick="ableTimeCheckApply('1000','10:00','10:30');"><label><b>10:00</b></label></li>
						
						
												<li id="1030" title="예약가능" onclick="ableTimeCheckApply('1030','10:30','11:00');"><label><b>10:30</b></label></li>
						
						
												<li id="1100" title="예약가능" onclick="ableTimeCheckApply('1100','11:00','11:30');"><label><b>11:00</b></label></li>
						
						
												<li id="1130" title="예약가능" onclick="ableTimeCheckApply('1130','11:30','12:00');"><label><b>11:30</b></label></li>
						
						
												<li id="1200" title="예약가능" onclick="ableTimeCheckApply('1200','12:00','12:30');"><label><b>12:00</b></label></li>
						
						
												<li id="1230" title="예약가능" onclick="ableTimeCheckApply('1230','12:30','13:00');"><label><b>12:30</b></label></li>
						
						
						
						
						
						
												<li id="1400" title="예약가능" onclick="ableTimeCheckApply('1400','14:00','14:30');"><label><b>14:00</b></label></li>
						
						
												<li id="1430" title="예약가능" onclick="ableTimeCheckApply('1430','14:30','15:00');"><label><b>14:30</b></label></li>
						
						
												<li id="1500" title="예약가능" onclick="ableTimeCheckApply('1500','15:00','15:30');"><label><b>15:00</b></label></li>
						
						
												<li id="1530" title="예약가능" onclick="ableTimeCheckApply('1530','15:30','16:00');"><label><b>15:30</b></label></li>
						
						
												<li id="1600" title="예약가능" onclick="ableTimeCheckApply('1600','16:00','16:30');"><label><b>16:00</b></label></li>
						
						
												<li id="1630" title="예약가능" onclick="ableTimeCheckApply('1630','16:30','17:00');"><label><b>16:30</b></label></li>
						
						
												<li id="1700" title="예약가능" onclick="ableTimeCheckApply('1700','17:00','17:30');"><label><b>17:00</b></label></li>
						
						
												<li id="1730" title="예약가능" onclick="ableTimeCheckApply('1730','17:30','18:00');"><label><b>17:30</b></label></li>
						
						
												<li id="1800" title="예약가능" onclick="ableTimeCheckApply('1800','18:00','18:30');"><label><b>18:00</b></label></li>
						
						
												<li id="1830" title="예약가능" onclick="ableTimeCheckApply('1830','18:30','19:00');"><label><b>18:30</b></label></li>
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
											</ul>
				</div>
				<!--- 시간 --->
			</div>
			<!--- //예약시간 --->
			<input type="hidden" id="counselHour" name="counselHour" value="">
						<input type="hidden" id="eventGubun" name="eventGubun" value="8">

			<input type="hidden" id="isOnline" name="isOnline" value="Y">
			<input type="hidden" id="chargeDoctor" name="chargeDoctor" value="">
			<input type="hidden" id="chargeDoctorName" name="chargeDoctorName" value="">
			<input type="hidden" id="reservationCharger" name="reservationCharger" value="">
			<input type="hidden" id="charger" name="charger" value="">

			<input type="hidden" id="reservationDate" name="reservationDate" value="2024-02-14">
			<input type="hidden" id="reservationStartTime" name="reservationStartTime" value="">
			<input type="hidden" id="reservationEndTime" name="reservationEndTime" value="">

			<input type="hidden" id="corpCode" name="corpCode" value="C00182">
			<input type="hidden" id="isSale" name="isSale" value="N">


</td>
								</tr>
							</tbody>
						</table>

						<!-- 동의 -->
						<div class="AgreeBox">
							<label class="Checkbox">
								<input type="checkbox" id="isHPAgree" name="isHPAgree" value="Y" checked="">
								<div class="Box">
									<i class="bi bi-square icon empty"></i>
									<i class="bi bi-check-square icon fill"></i>
																		<!-- 그외 -->
									<big>시술안내, 공지 등 문자 수신에 동의합니다.(선택)</big>
										
								</div>
							</label>
							<label class="Checkbox">
								<input type="checkbox" id="agree" name="agree" value="Y" checked="">
								<div class="Box">
									<i class="bi bi-square icon empty"></i>
									<i class="bi bi-check-square icon fill"></i>
									<big>개인정보 취급방침에 동의합니다. (필수)</big>
								</div>
							</label>
							<a href="/member/popupPrivacy.php" target="_blank" onclick="window.open(this.href,'','width=500,height=500');return false;">보기</a>
						</div>
						<!-- //동의 -->

						<!-- 버튼 -->
						<div class="BtnBox">
							<button type="button" onclick="formReserve(); gtag('event', '온라인예약', {'event_category': '온라인예약',});">예약신청</button>
						</div>
						<!-- //버튼 -->
					</fieldset>
					</form>
				</div>
				<!-- //비로그인예약 -->
			</div>
		</div>
	</div>





<jsp:include page="../layout/footer.jsp"></jsp:include>