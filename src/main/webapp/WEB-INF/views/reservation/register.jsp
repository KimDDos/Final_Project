<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>



<jsp:include page="../layout/header.jsp"></jsp:include>

<!--[if lt IE 9]>
<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
<![endif]-->




<div class="sub_tit_v1">
	<strong>온라인예약</strong> <span>Consult</span>
</div>


<div id="res_text">
	<p>
		상담원과 통화 후 상담 및 PT 예약이 확정됩니다. <br> 빠른 예약을 원하실 경우 <strong>02.
			1234.5678</strong>으로 전화 부탁드립니다.
	</p>
</div>
<div id="content">
	<!-- 프로그램시작 -->
	<form method="post" name="frm" id="frm" action="/reservation/register">
		<sec:authentication property="principal.mdto.mvo.userSerialNo"
			var="userSerialNo" />
		<input class="form-control" id="userSerialNo" name="userSerialNo"
			type="hidden" value="${userSerialNo}" />
		<!--form method="post" name="frm" id="frm" action="https://naturalface.co.kr/nconsult/reserve/process.php" onsubmit="return goSave(this);"-->
		<div class="programCon" style="margin-top: 0; padding-top: 5px;">
			<div class="writeForm writeForm_top chg_writeForm">
				<h2 class="rsv_h2">선택한 헬스장 위치</h2>
				<table>
					<colgroup>
						<col class="writeForm_col01">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th style="background: #fff;"><span class="col01"></span>헬스장
								이름</th>
							<td><input name="rvTitle" type="text" readonly="readonly"
								id="clinic_fk" value="${ppTitle}"
								class="inputTxt inputName wh420" style="color: silver;">
							</td>
						</tr>
						<tr>
							<th style="background: #fff;"><span class="col01"></span>헬스장
								주소</th>
							<td><input name="rvAddress" type="text" readonly="readonly"
								id="clinic_fk" value="${ppAddress}" style="color: silver;"
								class="inputTxt inputName wh420"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- //join -->
			<div class="writeForm writeForm_top chg_writeForm">
				<h2 class="rsv_h2">1. 트레이닝 종목 선택</h2>
				<table>
					<colgroup>
						<col class="writeForm_col01">
						<col width="*">
					</colgroup>
					<tbody>
						<tr style="border-bottom: none;">

							<th style="background: #fff;"><span class="col01">*</span>운동목적</th>
							<td><select name="ppTitle" id="clinic_fk"
								data-value="운동목적을 선택해주세요." class="chg_sec">
									<option value="">운동목적을 선택해주세요.</option>
									<option value="체중감소" data-hospital="1">체중감소</option>
									<option value="체중증가" data-hospital="1">체중증가</option>
									<option value="근성장" data-hospital="1">근성장</option>
									<option value="체형교정" data-hospital="1">체형교정</option>
									<option value="체지방집중관리" data-hospital="1">체지방집중관리</option>
									<option value="체중관리" data-hospital="1">체중관리</option>
									<option value="건강목적" data-hospital="1">건강목적</option>
									<option value="기타운동" data-hospital="1">기타운동</option>
							</select></td>
						</tr>
						<input type="hidden" id="doctor_fk" value="1">
					</tbody>
				</table>
			</div>
			<div class="schedule_wrap chg_schedule_wrap">
				<div class="fl">
					<h2 class="rsv_h2">2.&nbsp; 예약일 선택</h2>
					<div class="schedule">
						<div class="calender_wrap">
							<table id="calendar" style="width: 100%;">
								<colgroup>
									<col width="16%">
									<col width="14%">
									<col width="14%">
									<col width="14%">
									<col width="14%">
									<col width="14%">
									<col width="14%">
								</colgroup>
								<thead>
									<tr>
										<th><a name="preMon"><img
												src="/resources/img/chevron-left.jpg"></a></th>
										<th colspan="5" class="year_mon"></th>
										<th><a name="nextMon"><img
												src="/resources/img/chevron-right.jpg"></a></th>
									</tr>
									<tr>
										<th>일</th>
										<th>월</th>
										<th>화</th>
										<th>수</th>
										<th>목</th>
										<th>금</th>
										<th>토</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							<div class="under_wrap">
								<p>
									<span class="cal_check"></span><label for="cal_check"
										class="coredr_rg">상담가능날짜</label>
								</p>
								<div class="sr_wrap">
									<input type="hidden" name="resermonth" id="resermonth">
									<p class="coredr_rg">
										예약선택일 <input type="text" class="reserDate_input"
											id="reserdate" name="rvReservdate" value=""> 일
									</p>
									<i></i>
									<p class="coredr_rg">
										예약선택시간 <input type="text" class="no02" id="resertime"
											name="rvTime" value="">시
									</p>
								</div>
							</div>
						</div>
					</div>
					<p class="if">
						<img src="" alt="">
					</p>
				</div>
				<h2 class="rsv_h2 fr_h2">3.&nbsp;예약시간 선택</h2>
				<div class="schedule_time">
					<div>
						<p>오전</p>
						<ul>
							<li data-value="10:00" class="data-value"
								; style="cursor: pointer !important;"
								onclick="timeSelectedValue(this);">10:00<!--(예약가능)--></li>
							<li data-value="10:30" style="cursor: pointer;"
								onclick="timeSelectedValue(this);">10:30<!--(예약가능)--></li>
							<li data-value="11:00" style="cursor: pointer;"
								onclick="timeSelectedValue(this);">11:00<!--(예약가능)--></li>
							<li data-value="11:30" style="cursor: pointer;"
								onclick="timeSelectedValue(this);">11:30<!--(예약가능)--></li>
						</ul>
					</div>
					<div>
						<p>오후</p>
						<ul>
							<li data-value="13:00" style="cursor: pointer;"
								onclick="timeSelectedValue(this);">13:00<!--(예약가능)--></li>
							<li data-value="13:30" style="cursor: pointer;"
								onclick="timeSelectedValue(this);">13:30<!--(예약가능)--></li>
							<li data-value="14:00" style="cursor: pointer;"
								onclick="timeSelectedValue(this);">14:00<!--(예약가능)--></li>
							<li data-value="14:30" style="cursor: pointer;"
								onclick="timeSelectedValue(this);">14:30<!--(예약가능)--></li>
							<li data-value="15:00" style="cursor: pointer;"
								onclick="timeSelectedValue(this);">15:00<!--(예약가능)--></li>
							<li data-value="15:30" style="cursor: pointer;"
								onclick="timeSelectedValue(this);">15:30<!--(예약가능)--></li>
							<li data-value="16:00" style="cursor: pointer;"
								onclick="timeSelectedValue(this);">16:00<!--(예약가능)--></li>
							<li data-value="16:30" style="cursor: pointer;"
								onclick="timeSelectedValue(this);">16:30<!--(예약가능)--></li>
							<li data-value="17:00" style="cursor: pointer;"
								onclick="timeSelectedValue(this);">17:00<!--(예약가능)--></li>
							<li data-value="17:30" style="cursor: pointer;"
								onclick="timeSelectedValue(this);">17:30<!--(예약가능)--></li>
							<li data-value="18:00" style="cursor: pointer;"
								onclick="timeSelectedValue(this);">18:00<!--(예약가능)--></li>
							<li data-value="18:30" style="cursor: pointer;"
								onclick="timeSelectedValue(this);">18:30<!--(예약가능)--></li>
						</ul>
					</div>
					<div>
						<p>야간</p>
						<ul>
							<li data-value="19:00" style="cursor: pointer;"
								onclick="timeSelectedValue(this);">19:00<!--(예약가능)--></li>
							<li data-value="19:30" style="cursor: pointer;"
								onclick="timeSelectedValue(this);">19:30<!--(예약가능)--></li>
							<li data-value="20:00" style="cursor: pointer;"
								onclick="timeSelectedValue(this);">20:00<!--(예약가능)--></li>
							<li data-value="20:30" style="cursor: pointer;"
								onclick="timeSelectedValue(this);">20:30<!--(예약가능)--></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="writeForm chg_writeForm">
				<h2 class="rsv_h2">4.&nbsp;예약자 정보 이름</h2>
				<table>
					<colgroup>
						<col class="writeForm_col01">
						<col width="*">
					</colgroup>
					<sec:authentication property="principal.mdto.mvo.userName"
						var="userName" />
					<sec:authentication property="principal.mdto.mvo.userEmail"
						var="userEmail" />
					<sec:authentication property="principal.mdto.mvo.userPhoneNum"
						var="userPhoneNum" />
					<tbody>
						<tr>
							<th><span class="col01">*</span>이름</th>
							<td><input data-value="작성자을 입력하세요." id="name" name="name"
								class="inputTxt inputName wh420" type="text" readonly="readonly"
								value="${userName }" placeholder="이름을 입력하세요" maxlength="20"></td>
						</tr>
						<tr>
							<th><span class="col01">*</span>휴대폰</th>
							<td><input type="text" name="phoneNum" id="cell"
								value="${userPhoneNum }" readonly="readonly"></td>
						</tr>
						<tr>
							<th><span class="col01">*</span>이메일</th>
							<td class="mail_type"><input data-value="이메일을 입력하세요."
								name="email1" id="email1" class="inputEmail wh420" type="text"
								value=${userEmail } maxlength="70" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th><span class="col01">*</span>방문경로</th>
							<td><select id="route" name="route" title="방문경로를 선택해주세요."
								data-value="방문경로를 선택해주세요." class="wh420">
									<option>경로를 선택해주세요.</option>
									<option value="1">인터넷</option>
									<option value="2">간판</option>
									<option value="3">소개</option>
									<option value="4">현수막/전단지</option>
									<option value="5">버스</option>
									<option value="6">지하철</option>
									<option value="7">신문</option>
									<option value="8">TV</option>
									<option value="9">잡지</option>
									<option value="10">기타</option>
							</select></td>
						</tr>
						<tr valign="top">
							<th style="padding-top: 30px;"><span class="col01">*</span>내용</th>
							<td>
								<div class="note-editing-area">
									<textarea class="note-codable" name="rvContent"></textarea>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="join chg_join">
				<h2 class="rsv_h2">5.&nbsp;개인정보처리방침동의</h2>
				<div class="joinTop">
					<div class="ScrollLy">
						<h5>간소</h5>

						<p>득근득근은 귀하의 개인정보보호를 매우 중요시하며, 개인정보보호방침을 통하여 귀하께서 제공하시는 개인정보가
							어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</p>

						<h6>[개인정보 수집에 대한 동의]</h6>
						<p>득근득근은 귀하께 회원가입시 개인정보보호방침 또는 이용약관의 내용을 공지하며 회원가입버튼을 클릭하면
							개인정보 수집에 대해 동의하신 것으로 봅니다.</p>

						<h6>[개인정보의 수집목적 및 이용목적]</h6>
						<p>득근득근은 다음과 같은 목적을 위하여 개인정보를 수집하고 있습니다 .</p>
						<p>
							- 득근득근 및 제휴사이트 서비스를 위한 회원 가입 및 이용아이디 발급<br>- 서비스의 이행(경품 등
							우편물 배송 및 예약에 관한 사항)<br>- 장애처리 및 개별 회원에 대한 개인 맞춤서비스<br>-
							서비스 이용에 대한 통계수집<br>- 기타, 새로운 서비스 및 정보 안내<br>단, 이용자의 기본적
							인권침해의 우려가 있는 민감한 개인정보는 수집하지 않습니다.<br>득근득근은 상기 범위 내에서 보다 풍부한
							서비스를 제공하기 위해 이용자의 자의에 의한 추가정보를 수집합니다.
						</p>

						<h6>[수집하는 개인정보 항목]</h6>
						<p>득근득근은 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.</p>

						<p>
							-수집항목: 이름, 생년월일, 성별, 로그인 ID, 비밀번호, 자택 전화번호, 자택 주소, 휴대전화번호, 이메일,
							서비스이용기록, 접속로그, 쿠키, 접속 IP 정보 , 결제기록<br>-개인정보 수집방법: 홈페이지(회원가입,
							게시판, 온라인상담, 온라인예약 등)<br>쿠키에 의한 개인정보 수집<br>득근득근은 귀하에 대한
							정보를 저장하고 수시로 찾아내는 '쿠키 (cookie)' 를 사용합니다. 쿠키는 웹사이트가 귀하의 컴퓨터
							브라우저(넷스케이프, 인터넷 익스플로러 등)로 전송하는 소량의 정보입니다. 귀하가 웹사이트에 접속을 하면 득근득근
							웹서버는 귀하의 브라우저에 있는 쿠키의 내용을 읽고, 귀하의 추가정보를 귀하의 컴퓨터에서 찾아 접속에 따른 아이디
							등의 추가 입력없이 서비스를 제공할 수 있습니다. 쿠키는 귀하의 컴퓨터는 식별하지만 귀하를 개인적으로 식별하지는
							않습니다.<br>또한 귀하는 쿠키에 대한 선택권이 있습니다. 웹브라우저의 옵션을 조정함으로써 모든 쿠키를 다
							받아들이거나, 쿠키가 설치될 때 통지를 보내도록 하거나 아니면 모든 쿠키를 거부할 수 있는 선택권을 가질 수
							있습니다.
						</p>

						<h6>[개인정보의 제3자에 대한 제공]</h6>
						<p>득근득근은 귀하의 개인정보를 &lt;개인정보의 수집목적 및 이용목적&gt;에서 고지한 범위 내에서
							사용하며, 동 범위를 초과하여 이용하거나 타인 또는 타기업/기관에 제공하지 않습니다. 그러나 보다 나은 서비스 제공을
							위하여 귀하의 개인정보를 제휴사에게 제공하거나 또는 제휴사와 공유할 수 있습니다. 단, 개인정보를 제공하거나 공유할
							경우에는 사전에 귀하께 고지하여 드립니다.</p>

						<h6>[개인정보의 열람/정정]</h6>
						<p>
							귀하는 언제든지 등록되어 있는 귀하의 개인정보를 열람하거나 정정하실 수 있습니다. 개인정보 열람 및 정정을 하고자 할
							경우에는 &lt;회원정보수정&gt;을 클릭하여 직접 열람 또는 정정하거나 개인정보관리책임자에게 E-mail로
							연락하시면 조치하여 드립니다.<br>귀하가 개인정보의 오류에 대한 정정을 요청한 경우, 정정을 완료하기
							전까지 당해 개인정보를 이용하지 않습니다.
						</p>

						<h6>[개인정보 수집, 이용, 제공에 대한 동의철회]</h6>
						<p>회원가입 등을 통해 개인정보의 수집, 이용, 제공에 대해 귀하께서 동의하신 내용을 귀하는 언제든지 철회할
							수 있습니다. 동의철회는 웹사이트 및 개인정보관리책임자에게 E-mail 등으로 연락하시면 즉시 개인정보의 삭제 등
							필요한 조치를 하겠습니다.</p>

						<h6>[개인정보의 보유기간 및 이용기간]</h6>
						<p>귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다.</p>

						<p>
							-회원 가입정보의 경우, 회원 가입을 탈퇴하거나 회원에서 제명된 때<br>-예약의 경우, 예약에 따른 처리
							및 진료가 완료된 때<br>위 보유기간에도 불구하고 계속 보유하여야 할 필요가 있을 경우에는 귀하의 동의를
							받습니다.
						</p>

						<h6>[개인정보보호를 위한 기술적 대책]</h6>
						<p>
							득근득근은 귀하의 개인정보를 취급함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전성 확보를
							위하여 다음과 같은 기술적 대책을 강구하고 있습니다.<br>귀하의 개인정보는 비밀번호에 의해 보호되며, 파일
							및 전송 데이터를 암호화하거나 파일 잠금기능(Lock)을 사용하여 중요한 데이터는 별도의 보안기능을 통해 보호되고
							있습니다.<br>득근득근은 회원인증과 관련 암호알고리즘을 이용하여 네트워크 상의 개인정보를 안전하게 전송할
							수 있는 인증 및 보안장치를 채택하고 있으며, 시스템상 사정에 의해 미시행시 도우미에 의한 의사 확인을 시행하고
							있습니다.<br>해킹 등에 의해 귀하의 개인정보가 유출되는 것을 방지하기 위해 외부로부터의 침입을 차단하는
							장치를 이용하고 있으며, 각 서버마다 침입탐지시스템을 설치하여 24시간 침입을 감시하고 있습니다.
						</p>

						<h6>[의견수렴 및 불만처리]</h6>
						<p>득근득근은 개인정보보호와 관련하여 귀하가 의견과 불만을 제기할 수 있는 창구를 개설하고 있습니다.
							개인정보와 관련한 불만이 있으신 분은 득근득근의 개인정보 관리책임자에게 의견을 주시면 접수 즉시 조치하여 처리결과를
							통보해 드립니다.</p>

						<h6>[14세 미만 어린이들에 대한 보호정책]</h6>
						<p>득근득근은 14세 미만 어린이들에 대한 회원 미가입 정책과 함께 개인정보를 부모의 동의 없이 제3자와
							공유하지 않으며 사용자에 관한 정보를 매매하거나 대여하지 않습니다.</p>

						<h6>[개인정보 관리책임자]</h6>
						<p>득근득근은 개인정보에 대한 의견수렴 및 불만처리의 정책을 담당하는 개인정보정책 담당 관리책임자를 지정하고
							있습니다. 본 정책에 대한 불만사항이 있으시다면 아래 연락처로 문의 하시면 친절히 처리하여 드리겠습니다.</p>

						<h6>[개인정보정책 책임자]</h6>
						<p>성명 : 유은화</p>
						<p>부서 : 홍보총괄</p>
						<p>이메일 : kimotti@naver.com</p>
						<p>
							<br>
						</p>
						<p>
							시행일<br>본 개인정보보호정책은 2010년 10월 26일부터 시행합니다.
						</p>
						<!-- //policy -->
					</div>
					<div class="jcheck">
						<input type="checkbox" data-value="개인정보취급방침에 동의하세요." id="agree02"
							name="agree02" value="" title="개인정보취급방침에 동의합니다 체크해주세요."
							class="hide"> <label for="agree02"> <span></span>
							개인정보취급방침에 동의합니다.
						</label>
					</div>
					<!-- //jcheck -->
				</div>
			</div>
			<div class="writeForm_btn chg_writeForm_btn">
				<a href="write.php" class="cancel coredr_rg"
					style="font-size: 16px;">취소</a> <a href="javascript:;" id="w_btn"
					onclick="$('#frm').submit()" class="res coredr_md"
					style="background: #a77bca; font-size: 16px;">상담예약하기</a>
			</div>
			<input type="hidden" name="cmd" id="cmd" value="write"> <input
				type="hidden" name="email" id="email" value=""> <input
				type="hidden" name="curMonth" id="curMonth" value=""> <input
				type="hidden" name="hospital_fk" id="hospital_fk" value="1">

		</div>
	</form>
	<!-- 프로그램끝 -->
</div>


<div class="quick" style="top: 170px;">
	<div class="left">
		<ul>

			<li><a href="javascript:;" data-target="quick_online_cont">
					<img src="/resources/img/quick_online.png" class="off"> <img
					src="/resources/img/quick_online.png" class="on"><br>
			</a></li>
			<li><a href="http://pf.kakao.com/_xmBxoYV/chat" target="_blank">
					<img src="/resources/img/quick_kakao.png" class="off"><img
					src="/resources/img/quick_kakao.png" class="on"><br>
			</a></li>

			<li><a href="javascript:;" data-target="quick_cost_cont"> <img
					src="/resources/img/quick_cost.png" class="off"><img
					src="/resources/img/quick_cost.png" class="on"><br>
			</a></li>
			<li><a href="javascript:;" data-target="quick_review_cont">
					<img src="/resources/img/quick_review.png" class="off"><img
					src="/resources/img/quick_review.png" class="on"><br>
			</a></li>
			<li><a href="javascript:;"> <img
					src="/resources/img/quick_reserve.png" class="off"><img
					src="/resources/img/quick_reserve.png" class="on"><br>
			</a></li>
			<li><a href="https://blog.naver.com/running8806" target="_blank">
					<!-- 210802 공식블로그 바로가기 추가 --> <img
					src="/resources/img/quick_blog.png" class="off"><img
					src="/resources/img/quick_blog.png" class="on"><br>
			</a></li>
			<li><a href="javascript:;"> <img
					src="/resources/img/quick_road.png" class="off"><img
					src="/resources/img/quick_road.png" class="on"><br>
			</a></li>
		</ul>
		<div class="top_btn">TOP</div>
	</div>

	<div class="right" style="width: 0px;">
		<div class="quick_cont">
			<div class="quick_box h30" id="quick_online_cont">
				<div class="q_close">
					<a href="javascript:;"> <img
						src="/resources/img/close_icon.png">닫기
					</a>
				</div>
				<div class="q_title">
					<p>전문트레이너 온라인상담</p>
					<span>득근득근 온라인상담예약입니다.</span>
				</div>
				<form name="frmQProfessoional" id="frmQProfessoional"
					action="/process.php" method="post">
					<div class="q_box">
						<div class="q_name">
							<input type="text" class="name" name="name"
								data-value="이름을 입력해주세요." maxlength="50" title="이름"
								placeholder="이름">
						</div>
						<div class="q_phone">
							<input type="text" placeholder="핸드폰 번호" class="phone" name="cell"
								data-value="연락처를 입력해주세요." maxlength="13"
								onkeyup="isNumberOrHyphen(this);"
								onblur="cvtUserPhoneNumber(this);" value="" title="핸드폰 번호">
							<label for="p1"> <input type="checkbox" id="p1"
								name="iscall" value="1"> 수신
							</label>
						</div>
						<div class="q_email">
							<input type="text" placeholder="이메일" class="email" name="email"
								data-value="이메일을 입력해주세요." maxlength="100" value="" title="이메일">
							<label for="e1"> <input type="checkbox" id="e1"
								name="ismail" value="1"> 수신
							</label>
						</div>
						<div class="q_atten">
							<select name="clinic_fk" title="운동종목 선택"
								data-value="관심분야를 선택해 주십시오.">
								<option value="">관심분야를 선택해주세요</option>
								<option value="체중감소" data-hospital="1">체중감소</option>
								<option value="체중증가" data-hospital="1">체중증가</option>
								<option value="근성장" data-hospital="1">근성장</option>
								<option value="체형교정" data-hospital="1">체형교정</option>
								<option value="체지방관리" data-hospital="1">체지방관리</option>
								<option value="건강목적" data-hospital="1">건강목적</option>
								<option value="체중집중관리" data-hospital="1">체중집중관리</option>
								<option value="기타운동" data-hospital="1">기타운동</option>
							</select>
						</div>
						<div class="q_content">
							<textarea placeholder="상담받으실 내용" name="contents" class="not_vali"
								title="내용" data-value="내용을 입력해주세요."></textarea>
						</div>
						<div class="q_recaptcha">
							<div class="g-recaptcha"
								data-sitekey="6Lcvz94gAAAAANUD2KOfsCKXKCCQ4z5O9GARTiPE">
								<div style="width: 304px; height: 78px;">
									<div>
										<iframe title="reCAPTCHA" width="304" height="78"
											role="presentation" name="a-5459ofiisco0" frameborder="0"
											scrolling="no"
											sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation"
											src="https://www.google.com/recaptcha/api2/anchor?ar=2&amp;k=6Lcvz94gAAAAANUD2KOfsCKXKCCQ4z5O9GARTiPE&amp;co=aHR0cHM6Ly9uYXR1cmFsZmFjZS5jby5rcjo0NDM.&amp;hl=ko&amp;v=yiNW3R9jkyLVP5-EEZLDzUtA&amp;size=normal&amp;cb=yxjw08k7b14c"></iframe>
									</div>
									<textarea id="g-recaptcha-response" name="g-recaptcha-response"
										class="g-recaptcha-response"
										style="width: 250px; height: 40px; border: 1px solid rgb(193, 193, 193); margin: 10px 25px; padding: 0px; resize: none; display: none;"></textarea>
								</div>
								<iframe style="display: none;"></iframe>
							</div>
						</div>
						<div class="q_agree">
							<label for="agree1"> <input type="checkbox" id="agree1"
								name="agree" data-value="개인정보 수집에 동의해주세요."> 개인정보취급방침에
								동의합니다.
							</label>
						</div>
					</div>
					<input type="hidden" name="cmd" value="write"> <input
						type="hidden" name="setTablename" value="q_professional">
				</form>
				<div class="q_btn">
					<a>상담하기</a>
				</div>
			</div>
			<div class="quick_box">
				<div class="q_close">
					<a href="javascript:;"> <img
						src="/resources/img/close_icon.png">닫기
					</a>
				</div>
				<div class="q_title">
					<p>카톡상담</p>
					<span>득근득근 온라인상담예약입니다.</span>
				</div>
				<div class="kakao_box">
					<p>kakaoTalk ID :</p>
					<b>naturalps<i></i></b>
					<div class="q_posK">
						<img src="">
					</div>
					<span>친구로 추가하시면 실시간으로 상담 받아보실 수 있습니다!</span>
				</div>
				<form name="frmQKakao" id="frmQKakao" action="/process.php"
					method="post">
					<div class="q_box">
						<div class="q_name">
							<input type="text" placeholder="이름" class="name" name="name"
								data-value="이름을 입력해주세요." maxlength="50" value="" title="이름">
						</div>
						<div class="q_phone">
							<input type="text" placeholder="핸드폰 번호" class="phone" name="cell"
								data-value="연락처를 입력해주세요." maxlength="13"
								onkeyup="isNumberOrHyphen(this);"
								onblur="cvtUserPhoneNumber(this);" value="" title="핸드폰 번호">
							<label for="p2"> <input type="checkbox" id="p2"
								name="iscall" value="1"> 수신
							</label>
						</div>
						<div class="q_atten">
							<select name="clinic_fk" title="진료과목 선택"
								data-value="진료과목을 선택해 주십시오.">
								<option value="">전체</option>
								<option value="1" data-hospital="1">눈성형</option>
								<option value="2" data-hospital="1">코성형</option>
								<option value="4" data-hospital="1">가슴성형</option>
								<option value="5" data-hospital="1">안티에이징</option>
								<option value="3" data-hospital="1">안면윤곽</option>
								<option value="8" data-hospital="1">남자성형</option>
								<option value="6" data-hospital="1">바디성형</option>
								<option value="7" data-hospital="1">기타성형</option>
							</select>
						</div>
						<div class="q_content">
							<textarea placeholder="내용" name="contents" class="not_vali"
								title="내용"></textarea>
						</div>
						<div class="q_agree">
							<label for="agree2"> <input type="checkbox" id="agree2"
								name="agree2" data-value="개인정보 수집에 동의해주세요."> 개인정보취급방침에
								동의합니다.
							</label>
						</div>
					</div>
					<input type="hidden" name="cmd" value="write"> <input
						type="hidden" name="setTablename" value="q_kakao">
				</form>
				<div class="q_btn">
					<a href="javascript:;" class="mt5"
						onclick="goSaveQuick(document.frmQKakao);">상담하기</a>
				</div>
			</div>
			<div class="quick_box h30" id="quick_cost_cont">
				<div class="q_close">
					<a href="javascript:;"> <img
						src="/resources/img/close_icon.png">닫기
					</a>
				</div>
				<div class="q_title">
					<p>실시간 비용상담</p>
					<span>득근득근 온라인상담예약입니다.</span>
				</div>
				<form name="frmQCost" id="frmQCost" action="/process.php"
					method="post">
					<div class="q_box">
						<div class="q_name">
							<input type="text" placeholder="이름" class="name" name="name"
								data-value="이름을 입력해주세요." maxlength="50" value="" title="이름">
						</div>
						<div class="q_phone">
							<input type="text" placeholder="핸드폰 번호" class="phone" name="cell"
								data-value="연락처를 입력해주세요." maxlength="13"
								onkeyup="isNumberOrHyphen(this);"
								onblur="cvtUserPhoneNumber(this);" value="" title="핸드폰 번호">
							<label for="p3"> <input type="checkbox" id="p3"
								name="iscall" value="1"> 수신
							</label>
						</div>
						<div class="q_atten">
							<select name="clinic_fk" title="진료과목 선택"
								data-value="진료과목을 선택해 주십시오.">
								<option value="">전체</option>
								<option value="1" data-hospital="1">눈성형</option>
								<option value="2" data-hospital="1">코성형</option>
								<option value="4" data-hospital="1">가슴성형</option>
								<option value="5" data-hospital="1">안티에이징</option>
								<option value="3" data-hospital="1">안면윤곽</option>
								<option value="8" data-hospital="1">남자성형</option>
								<option value="6" data-hospital="1">바디성형</option>
								<option value="7" data-hospital="1">기타성형</option>
							</select>
						</div>
						<div class="q_atten">
							<select name="area" data-value="거주지역을 선택해주세요.">
								<option value="">거주지역</option>
								<option value="서울">서울</option>
								<option value="부산">부산</option>
								<option value="대구">대구</option>
								<option value="인천">인천</option>
								<option value="광주">광주</option>
								<option value="대전">대전</option>
								<option value="울산">울산</option>
								<option value="강원">강원</option>
								<option value="경기">경기</option>
								<option value="경남">경남</option>
								<option value="경북">경북</option>
								<option value="전남">전남</option>
								<option value="전북">전북</option>
								<option value="제주">제주</option>
								<option value="충남">충남</option>
								<option value="충북">충북</option>
							</select>
						</div>
						<div class="q_atten">
							<select name="sex" data-value="성별을 선택해주세요.">
								<option value="">성별</option>
								<option value="1">남자</option>
								<option value="2">여자</option>
							</select>
						</div>
						<div class="q_atten">
							<select name="age" data-value="연령을 선택해주세요.">
								<option value="">연령</option>
								<option value="10대">10대</option>
								<option value="20대 초반">20대 초반</option>
								<option value="20대 중반">20대 중반</option>
								<option value="20대 후반">20대 후반</option>
								<option value="30대 초반">30대 초반</option>
								<option value="30대 중반">30대 중반</option>
								<option value="30대 후반">30대 후반</option>
								<option value="40대">40대</option>
								<option value="50대">50대</option>
								<option value="60대 이상">60대 이상</option>
							</select>
						</div>
						<div class="q_agree">
							<label for="agree3"> <input type="checkbox" id="agree3"
								name="agree3" data-value="개인정보 수집에 동의해주세요."> 개인정보취급방침에
								동의합니다.
							</label>
						</div>
					</div>
					<input type="hidden" name="cmd" value="write"> <input
						type="hidden" name="setTablename" value="q_cost">
				</form>
				<div class="q_btn">
					<a href="javascript:;" onclick="goSaveQuick(document.frmQCost);">상담하기</a>
				</div>
			</div>
			<div class="quick_box" id="quick_review_cont">
				<div class="q_close">
					<a href="javascript:;"> <img
						src="/resources/img/close_icon.png">닫기
					</a>
				</div>
				<div class="q_title">
					<p>수술후기</p>
					<span>득근득근 온라인상담예약입니다.</span>
				</div>
				<div class="q_table">
					<table>
						<colgroup>
							<col width="65px">
							<col width="135px">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>번호</th>
								<th>이미지</th>
								<th>제목</th>
							</tr>
							<tr style="cursor: pointer;"
								onclick="location.href='/review/review/read.php?no=559'">
								<td>447</td>
								<td><img src="" style="width: 135px; height: 80px;">
								</td>
								<td>뒤밑재수술 너무 잘해주셔서 감사해요 ㅎㅎㅎ</td>
							</tr>
							<tr style="cursor: pointer;"
								onclick="location.href='/review/review/read.php?no=558'">
								<td>446</td>
								<td><img src="" style="width: 135px; height: 80px;">
								</td>
								<td>어떤가용?!! 이정도면 잘 자리잡은거죠?</td>
							</tr>
							<tr style="cursor: pointer;"
								onclick="location.href='/review/review/read.php?no=557'">
								<td>445</td>
								<td><img src="" style="width: 135px; height: 80px;">
								</td>
								<td>복코 수술 받앗어요!</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="q_btn add">
					<a href="/review/review/index.php">더보기</a>
				</div>
			</div>
			<div class="quick_box">
				<div class="q_close">
					<a href="javascript:;"> <img
						src="/resources/img/close_icon.png">닫기
					</a>
				</div>
				<div class="q_title">
					<p>온라인예약</p>
					<span class="pb10">득근득근 온라인상담예약입니다.</span>
				</div>
				<div class="q_online">
					<h4>상담문의</h4>
					<p class="font_B">02. 1234. 5678</p>
					<div class="online_pos">
						<img src="">
					</div>
					<span>온라인예약 후 방문해주시면,<br> <b>원하시는 날짜와 시간에 상담을 받으실 수
							있습니다!</b></span>
					<div class="q_online_Box">
						<p>
							<b class="letter745">평<i>일</i></b><span><u>AM. </u><b>10:00
							</b><u>~ PM. </u><b>7:00</b></span>
						</p>
						<p>
							<b>금요일</b><span><u>AM. </u><b>10:00 </b><u>~ PM. </u><b>9:00</b></span>
						</p>
						<p>
							<b>토요일</b><span><u>AM. </u><b>10:00 </b><u>~ PM. </u><b>4:00</b></span>
						</p>
						<span>*일요일, 공휴일 휴진</span>
					</div>
				</div>
				<div class="q_btn">
					<a href="/nconsult/reserve/write.php" class="mt15">온라인예약</a>
				</div>
			</div>
			<div class="quick_box"></div>
			<div class="quick_box">
				<div class="q_close">
					<a href="javascript:;"> <img
						src="/resources/img/close_icon.png">닫기
					</a>
				</div>
				<div class="q_title">
					<p>오시는길</p>
					<span class="pb5 mb20">득근득근 온라인상담예약입니다.</span>
				</div>
				<div class="q_map">
					<div id="daumRoughmapContainer1517375074018"
						class="root_daum_roughmap root_daum_roughmap_landing"></div>

				</div>
				<div class="q_map_txt">
					<p>
						서울시 강남구 논현동 1 (강남대로 606)<br>삼주빌딩 11층
					</p>
					<div class="bar"></div>
					<span>3호선 신사역 2, 3번 출구 바로 앞</span>
				</div>
				<div class="q_btn">
					<a href="/intro/information.php" class="mt17">진료안내 및 오시는길</a>
				</div>
			</div>
		</div>
	</div>
</div>



</body>
<script>
				window.addEventListener('scroll', function () {
					var quickMenu = document.querySelector('.quick'); // .quick 클래스 요소 선택
					var currentScroll = window.pageYOffset; // 현재 스크롤 위치 가져오기

					if (currentScroll >= 100) { // 스크롤이 100px 이상일 때
						quickMenu.style.position = 'fixed'; // 위치를 고정시킨다
						quickMenu.style.top = '100px'; // 상단으로부터 100px 떨어진 곳에 위치
					} else {
						quickMenu.style.position = 'absolute'; // 원래의 위치 방식으로 돌아간다
						quickMenu.style.top = '170px'; // 처음 설정된 top 위치로 되돌린다
					}
				});
			</script>

<script>
				document.addEventListener('DOMContentLoaded',function () {
							document.querySelectorAll('.quick ul li a').forEach(function (link) {
										link.addEventListener('click',function (e) {
													e.preventDefault();
													// 모든 .quick_cont 요소에서 active 클래스 제거
													document.querySelectorAll('.quick_cont').forEach(function (cont) {
																cont.classList.remove('active');
															});
													// 모든 .quick ul li a 요소에서 'active' 클래스 제거 및 이미지 전환
													document.querySelectorAll('.quick ul li a').forEach(
															function (
																lnk) {
																lnk.classList
																	.remove('active');
																lnk
																	.querySelector('img.on').style.display = 'none';
																lnk
																	.querySelector('img.off').style.display = 'inline-block';
															});

													// 클릭된 링크에 'active' 클래스 추가 및 이미지 전환
													this.classList
														.add('active');
													this
														.querySelector('img.on').style.display = 'inline-block';
													this
														.querySelector('img.off').style.display = 'none';


													// 클릭된 요소의 data-target 값을 기반으로 해당하는 .quick_cont 요소를 활성화
													$(".quick_box").removeClass("active");
													var targetId = this
														.getAttribute('data-target');
													var activeContent = document
														.getElementById(targetId);
													if (activeContent) {
														activeContent.classList
															.add('active');
														$(".quick_cont.active").removeClass("active");
														$(".quick.active").removeClass("active");

														$(".right").addClass("active")
														$(".quick_cont").addClass("active")
														$(".quick").addClass("active")

													}
												});
									});
						});
				$(".quick_cont .q_close a").click(function () {

					$(".quick_box").removeClass("active");
					$(".right").removeClass("active");
					$(".quick_cont").removeClass("active");
					$(".quick").removeClass("active");
				});


			</script>

<script>
				document
					.addEventListener(
						'DOMContentLoaded',
						function () {
							// 달력 날짜 클릭 이벤트 리스너 추가
							document
								.querySelectorAll(
									'.calendar_table td:not(.first)')
								.forEach(
									function (td) {
										td
											.addEventListener(
												'click',
												function () {
													// 날짜 추출
													var day = this
														.querySelector('span').textContent
														.trim();
													var selectedMonthYear = document
														.querySelector('.calendar_top_table .now').textContent
														.trim();
													var selectedDate = selectedMonthYear
														+ ' '
														+ day;

													// 예약 선택일 input 창에 날짜 입력
													document
														.getElementById('reserdate').value = selectedDate;

													// 예약 시간 선택 창 표시
													showReservationTime();
												});
									});
						});

				// 예약 시간 선택 창 표시 함수
				function showReservationTime() {
					// 시간 선택 창을 표시하는 로직을 여기에 구현합니다.
					// 예를 들어, 시간 선택 창의 display 속성을 'block'으로 설정하여 창을 표시할 수 있습니다.
					document.querySelector('.schedule_time').style.display = 'block';
				}

				// 예약 시간 선택 함수
				function timeSelectedValue(timeElement) {
					var selectedTime = timeElement.getAttribute('data-value');
					document.getElementById('resertime').value = selectedTime;
				}

				function calendarSelectDayConfirm(today) {

					if ($("#clinic_fk").val() == 0) {
						alert('운동종목을 선택해주세요.');
						$("#clinic_fk").focus();
						return false;
					}
					if ($("#doctor_fk").val() == 0) {
						alert('트레이너를 선택해주세요.');
						$("#doctor_fk").focus();
						return false;
					}
					$(".schedule_time").show();
					$('.calendar_table td').removeAttr("id");
					$('.calendar_table td').filter(function () {
						if ($(this).text().trim() == today.substring(8).trim()) {
							return this;
						}
					}).attr("id", "r_click");

					$("#reserdate").val(today);
					$("#resertime").val("");
					reserTimeList($("#hospital_fk").val(), $("#doctor_fk").val(), $("#reserdate").val(), $("#resertime").val(), 0);
				}

			</script>
<!-- table script -->
<script>
				$(function () {
					var today = new Date();
					var date = new Date();

					$("a[name=preMon]").click(function () { // 이전달
						$("#calendar > tbody > td").remove();
						$("#calendar > tbody > tr").remove();
						today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
						buildCalendar();
					})

					$("a[name=nextMon]").click(function () { //다음달
						$("#calendar > tbody > td").remove();
						$("#calendar > tbody > tr").remove();
						today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
						buildCalendar();
					})
					function buildCalendar() {
						nowYear = today.getFullYear();
						nowMonth = today.getMonth();
						firstDate = new Date(nowYear, nowMonth, 1).getDate();
						firstDay = new Date(nowYear, nowMonth, 1).getDay(); //1st의 요일
						lastDate = new Date(nowYear, nowMonth + 1, 0).getDate();

						let monthText = nowMonth + 1 < 10 ? "0" + (nowMonth + 1) : nowMonth + 1;

						$(".year_mon").text(nowYear + "년 " + monthText + "월");

						for (i = 0; i < firstDay; i++) { //첫번째 줄 빈칸
							$("#calendar tbody:last").append("<td></td>");
						}
						for (i = 1; i <= lastDate; i++) { // 날짜 채우기
							plusDate = new Date(nowYear, nowMonth, i).getDay();
							if (plusDate == 0) {
								$("#calendar tbody:last").append("<tr></tr>");
							}
							// 현재 달 또는 다음 달의 날짜 비교 로직 수정
							if (nowYear < date.getFullYear() || (nowYear == date.getFullYear() && nowMonth < date.getMonth()) || (nowYear == date.getFullYear() && nowMonth == date.getMonth() && i < date.getDate())) {
								$("#calendar tbody:last").append("<td class='date old_date'>" + i + "</td>");
							} else {
								$("#calendar tbody:last").append("<td class='date' onclick='calendarSelectDayConfirm(\"" + nowYear + "-" + monthText + "-" + i + "\")'" + ">" + i + "</td>");
							}
						}
						if ($("#calendar > tbody > td").length % 7 != 0) { //마지막 줄 빈칸
							for (i = 1; i <= $("#calendar > tbody > td").length % 7; i++) {
								$("#calendar tbody:last").append("<td ></td>");
							}
						}
						$(".date").each(function (index) { // 오늘 날짜 표시
							if (nowYear == date.getFullYear() && nowMonth == date.getMonth() && $(".date").eq(index).text() == date.getDate()) {
								$(".date").eq(index).addClass('colToday');
							}
						})
					}
					buildCalendar();
				})
				/* 예약 선택날짜 받아오기 */
			</script>
<jsp:include page="../layout/footer.jsp"></jsp:include>