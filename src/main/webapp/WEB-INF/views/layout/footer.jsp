<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.Company_Area .row .col-3 strong img {
	    position: relative;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	}

	@media (max-width: 992px) {
	    #aboutmap26.aboutmap26 {
	        display: none;
	    }
	}

	.Link ul li {
	    display: flex;
	    justify-content: flex-end;
	}
	
	/* col-6 내의 ul의 li 요소들이 한 줄에 나오도록 스타일 지정 */
	.Link ul li {
	    list-style: none;
	    padding: 0;
	    margin: 0;
	}
	
	.Link ul li {
	    display: inline-block;
	    margin-right: 10px; /* li 요소 사이의 간격 조정을 위한 마진 설정 */
	}
	
	
</style>
<div class="bg-dark py-5 ">
	<div class="row gx-10 justify-content-center" style="color: white">
		<div class="col-lg-4 col-xl-4 col-xxl-3 text-center"
			style="margin-right: 0px">
			<div class="container-md align-items-centerss justify-content-center">
				<div class="col-lg-8 col-xl-8 col-xxl-10">
					<h2>대표번호 및 운영시간</h2>
				</div>
				<!-- 대표전화 -->
				<div class="col-lg-8 col-xl-8 col-xxl-10">
					<a href="tel:032-123-1234">
						<div class="Title Sub">
							<span>대표번호</span>
						</div>
						<p>032-123-2134</p>
					</a>
				</div>
				<br>
				<!-- //대표전화 -->

				<!-- 운영시간 -->
				<div class="col-lg-8 col-xl-8 col-xxl-10">
					<div class="Title Sub">
						<span>운영시간</span>
					</div>
					<table
						class="table align-items-centerss justify-content-center"
						style="color: white">
						<thead class="table-primary">
							<tr>
								<th></th>
								<th scope="col">상담시간</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>월~목요일</td>
								<td>AM 10:00 – PM 07:00</td>
								<td></td>
							</tr>
							<tr>
								<td>금요일</td>
								<td>AM 10:00 – PM 09:00</td>
								<td>야간상담</td>
							</tr>
							<tr>
								<td>토요일</td>
								<td>AM 10:00 – PM 04:00</td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-xl-6 col-xxl-6 align-items-centerss justify-content-center text-center">
			<div class="">
				<h2>위치 안내</h2>
			</div>
			<div class="col Banner26Other">
				<p>
					인천 남동구 구월동 1234-1 도연빌딩 7층<span>(인하로 123-4) </span>
				</p>
				<pre>본원 건물 지하주차장 운영<br>(만차일 경우 예술회관 공영주차장 이용 가능)</pre>
				<!-- 지도 -->
				<div id="aboutmap26" class="aboutmap26" tabindex="0" style="overflow: hidden; background: rgb(248, 249, 250);">
				<!-- 
				<form action="/main/searchMap" style="position: absolute; z-index: 100">
					<input id="address" type="text" name="address" placeholder="검색할 주소" value="불정로 6">
					<button type="submit" value="주소 검색" style="position: absolute; z-index: 100"></button>
				</form>
				 -->
				</div>
				<script type="text/javascript"
					src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=rfx8temqs8"></script>
				<script type="text/javascript" src="/resources/js/footerMap.js"></script>
				<!-- /지도 -->
			</div>
		</div>
	</div>
	<hr>
	<div class="row gx-10 justify-content-center" style="color: white">
		<div class="col-lg-1 col-xl-1 d-none d-xl-block " style="padding-top: 15px">
			<strong><img src="/resources/img/logo3_footer_th_removebg.png" alt="logo"
				alt=""></strong>
		</div>
		<div class="col-lg-5 col-xl-5 col-xxl-5  text-center">
			<!--  링크-->
			<div class="Link">
				<ul style="margin-bottom: 20px">
					<!-- 퀵링크관리 -->
					<li style="border-right: 1px solid white; padding-right: 20px;"><a href="/main/footerPi" alt="개인정보 취급방침">개인정보 취급방침</a></li>
					<li style="border-right: 1px solid white; padding-right: 20px;"><a href="/main/footerSt" alt="이용약관">이용약관</a></li>
					<li><a href="/main/footerRight" alt="소비자의 권리장전">소비자의 권리장전</a>
					</li>
				</ul>
			</div>
			<!--  //링크-->
			<p id="SkipNavAdd">
				<span class="Item01">주소 : 인천 남동구 구월동 1234-1 태빈빌딩 7층</span><br> 
				<span class="Item02">상호명 : 득근득근 / </span> <span class="Item03">	대표자명 :	김지훈 / </span> 
				<span class="Item04"> TEL : 032-123-1234</span><br>
				<span class="Item06">사업자등록번호 : 123-45-67891</span><br> 
				<b>COPYRIGHT©득근득근. ALL RIGHTS RESERVED.</b>
			</p>
		</div>
	</div>
</div>


</body>