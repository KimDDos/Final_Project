<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="Company_Area">
	<div class="Inner">
		<!-- 대표전화 -->

		<div class="Tel">
			<a href="tel:032-123-1234">
				<div class="Title Sub">
					<span>대표번호</span>
				</div>
				<p>032-123-2134</p>
			</a>

		</div>
		<!-- //대표전화 -->

		<!-- 운영시간 -->
		<div class="Time">
			<div class="Title Sub">
				<span>상담 시간</span>
			</div>
			<label> <pre class="Left" readonly="readonly">월~목요일
금요일
토요일</pre> <pre class="Right" readonly="readonly">AM 10:00 – PM 07:00
AM 10:00 – PM 09:00
AM 10:00 – PM 04:00</pre> <pre class="last" readonly="readonly">
					<br>(야간상담)</pre>
			</label>
			<p>* 상담은 예약제로 운영됩니다.</p>


			<!-- 27번배너 -->
			<!-- //27번배너  -->
		</div>

		<!-- //운영시간 -->



		<!-- 링크(26번배너) -->
		<div class="Link">
			<div class="Title Sub">
				<span>위치 안내</span>
			</div>
			<!-- 26번배너(없으면지도표기) -->
			<div class="Banner26Other">
				<p>
					인천 남동구 구월동 1234-1 도연빌딩 7층<span>(인하로 123-4) </span>
				</p>
				<pre>본원 건물 지하주차장 운영 (만차일 경우 예술회관 공영주차장 이용 가능)</pre>
				<!-- 지도 -->
				<div id="aboutmap26" class="aboutmap26" tabindex="0"
					style="overflow: hidden; background: rgb(248, 249, 250);">
					<form action="/main/searchMap" style="position: absolute; z-index: 100">
						<input id="address" type="text" name="address" placeholder="검색할 주소" value="불정로 6">
						<button type="submit" value="주소 검색" style="position: absolute; z-index: 100"></button>
					</form>
				</div>

				<script type="text/javascript"
					src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=rfx8temqs8"></script>
				<script type="text/javascript" src="/resources/js/footerMap.js">
					
				</script>
				<!-- /지도 -->


			</div>
			<!-- //26번배너  -->
		</div>
	</div>
</div>

<div class="Bottom_Area">
	<!-- 필수정보 -->
	<div class="Add">
		<div class="Inner">
			<strong><img src="/resources/img/logo3.jpg" alt="logo"
				alt="" style="width: 150px; height: 150px;"></strong>

			<!--  링크-->
			<div class="Link">
				<ul>
					<!-- 퀵링크관리 -->
					<li><a href="/main/footerPi" alt="개인정보 취급방침">개인정보 취급방침</a></li>
					<li><a href="/main/footerSt" alt="이용약관">이용약관</a></li>
					<li><a href="/main/footerRight" alt="소비자의 권리장전">소비자의 권리장전</a>
					</li>
					<!-- //퀵링크관리 -->
					<!--
							<li><a href="/member/privacyInfo.php" title="개인정보취급방침">개인정보취급방침</a></li>
							<li><a href="/member/agreeInfo.php" title="이용약관">이용약관</a></li>
							<li><a href="/member/societyInfo.php" title="소비자권리장전">소비자권리장전</a></li>
							-->
				</ul>

				<!-- 28번배너 -->

				<!-- //28번배너  -->
			</div>
			<!--  //링크-->

			<p id="SkipNavAdd">
				<span class="Item01"> 인천 남동구 구월동 1234-1 도연빌딩 7층 </span> <span
					class="Item02">상호명 : 득근득근</span> <span class="Item03">대표자명 :
					김도연</span> <span class="Item04">TEL : 032-123-1234</span> <span
					class="Item06">사업자등록번호 : 123-45-67891</span> <b>COPYRIGHT©
					득근득근. ALL RIGHTS RESERVED.</b>
				<!--
						<a href="https://www.brainmedi.co.kr/" class="create" target="_blank">헬스장홈페이지제작 <img src="https://www.brainmedi.co.kr/img/logo_C00032_footer.png" alt="브레인메디로고"></a>
						-->
<<<<<<< HEAD
					</p> 
				</div>
			</div>
			<!-- //필수정보 -->
		</div>
		
		</html>
=======
			</p>
		</div>
	</div>
	<!-- //필수정보 -->
</div>
>>>>>>> main
