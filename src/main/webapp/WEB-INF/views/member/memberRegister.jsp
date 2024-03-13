<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../layout/header.jsp"></jsp:include>
<style>
	@font-face {
	    font-family: 'Noto-Sans-Regular';
	    font-style: normal;
	    src: url('../font/Noto_Sans_KR/static/NotoSansKR-Regular.ttf') format('truetype');
	}
	
	*{
		font-family: 'Noto-Sans-Regular', sans-serif, 'Noto-Sans-Extra_Bold', 'Noto-Sans-Regular', 'Noto-Sans-Bold';
	}

	#memberRegisterForm{
		font-size: 20px;
		font-weight: 700;
	}

	label {
		font-size: 20px;
		font-weight: 700;
	}
	
	.container-md .memberRegisterForm form div {
		font-size: 15px
	}
	
	.row{
		margin-top: 35px;
		margin-bottom: 35px;
	}
	
</style>
<div class="py-5 bg-light">
	<div class="container-md px-5 my-5">
		<div>
			<!-- 여기에 뭔가 들어가서 Sign up 페이지라고 표현해줘야함. 로고? 사이트명? 아니면 크게 회원가입? -->
			<h1 style="text-align: center; margin-top: 30px; font-size: 65px; color: black;"><span><img src="/resources/img/logo3_footer_th_removebg.png" alt="logo" alt=""></span> 득근득근 회원가입</h1>
		</div>
		<br> <br>
		<div id="memberRegisterForm" style="padding: 25px">
			<form action="/member/memberRegister" method="post" style="width: 100%; border: 1px solid #adb5bd; border-radius: 5px">
				<div class="row align-items-center justify-content-center">
					<label for="userEmail" class="col-sm-2 col-form-label text-center">계정
						유형</label>
					<div class="col-sm-4">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="isTrainer"
								id="inlineCheckbox1" value="N" checked="checked"
								onclick="checkOnlyOne(this)"> <label
								class="form-check-label" for="inlineCheckbox1" style="position: relative; top: 7px;">일반사용자</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="isTrainer"
								id="inlineCheckbox2" value="Y" onclick="checkOnlyOne(this)">
							<label class="form-check-label" for="inlineCheckbox2" style="position: relative; top: 7px;">트레이너</label>
						</div>
					</div>
				</div>
				<div class="row align-items-center justify-content-center">
					<div class="col-sm-2 text-center">
						<label for="userEmail" class="col col-form-label" style="margin-bottom: 10px">Email</label>
						<div><input type="text" class="form-control" style="visibility: hidden;"></div>
					</div>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="userEmailPrev"
							id="userEmailPrev" placeholder="E-Mail을 입력해주세요." style="margin-bottom: 10px" maxlength='30'>
						<div><input type="text" class="form-control" style="visibility: hidden;"></div>
					</div>
					<div class="col-sm-1" style="padding: 0 0; width: 43px;">
						<span class="input-group-text" style="margin-bottom: 10px">@</span>
						<div><input type="text" class="form-control" style="visibility: hidden;"></div>
					</div>
					<div class="col-sm-3">
						<select class="form-select" aria-label="Default select example"
							id="emailSelect" name="emailSelect" style="margin-bottom: 10px">
							<option selected>이메일을 선택해주세요.</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="gitHub.com">gitHub.com</option>
							<option value="input" onclick="emailDirectInputActive()">직접입력</option>
						</select> 
						<div><input type="text" class="form-control" name="userEmailNext"
							id="userEmailNext" style="visibility: hidden;" placeholder="직접입력"
							maxlength='20'> <input type="hidden" id="userEmail"
							name="userEmail" value=""></div>
					</div>
					<!-- 셀렉트로 자동입력 과 셀프 입력 -->
				</div>
				<div class="row align-items-center justify-content-center">
					<div class="col-sm-2 text-center">
						<button type="button" class="btn btn-dark" id="isEmailDuplicateBtn">이메일 중복체크</button>
					</div>
					<div class="col-sm-5">
						<span id="isDupleEmailResult">
							
						</span>
					</div>
				</div>
				<div class="row align-items-center justify-content-center">
					<label for="userPwdCheck"
						class="col-sm-2 col-form-label text-center">Password</label>
					<div class="col-sm-5">
						<input type="password" class="form-control" id="userPwdCheck"
							name="userPwdCheck" placeholder="Password를 입력해주세요." maxlength='35'>
						<p style="margin-top: 8px; font-size: 15px;"> * 10 글자 이상, 특수문자 '@$!%*#?&' 포함</p>
					</div>
				</div>
				<div class="row align-items-center justify-content-center">
					<label for="userPwd" class="col-sm-2 col-form-label text-center">Password
						확인</label>
					<div class="col-sm-5">
						<input type="password" class="form-control" id="userPwd"
							name="userPwd" placeholder="Password를 입력해주세요." maxlength='35'>
					</div>
				</div>
				<div class="row align-items-center justify-content-center">
					<div class="col-sm-4"></div>
					<div class="col-sm-5">
						<span id="userPwdCheckeResultPrint"></span>
					</div>
				</div>
				<div class="row align-items-center justify-content-center">
					<label for="userName" class="col-sm-2 col-form-label text-center">
						이 름 </label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="userName"
							name="userName" maxlength='10'>
					</div>
				</div>
				<div class="row align-items-center justify-content-center">
					<label for="userNickName"
						class="col-sm-2 col-form-label text-center"> 닉 네 임 </label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="userNickName"
							name="userNickName" maxlength='20'>
					</div>
				</div>
				<div class="row align-items-center justify-content-center">
					<label for="userBirthDate"
						class="col-sm-2 col-form-label text-center"> 생년월일 </label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="datepicker"
							name="userBirthDate" readonly="readonly">
					</div>
				</div>
				<div class="row align-items-center justify-content-center">
					<label for="userGender" class="col-sm-2 col-form-label text-center">
						성별 </label>
					<div class="form-check form-check-inline col-sm-2 text-center"
						style="margin-left: 10px;">
						<input class="form-check-input" type="radio" name="userGender"
							id="inlineRadio1" value="M"> 
						<label class="form-check-label" for="inlineRadio1" style="position: relative; top: 7px;">남</label>
					</div>
					<div class="form-check form-check-inline col-sm-2 text-center"
						style="margin-left: -15px;">
						<input class="form-check-input" type="radio" name="userGender"
							id="inlineRadio2" value="F"> <label
							class="form-check-label" for="inlineRadio2" style="position: relative; top: 7px;">여</label>
					</div>
				</div>
				<div class="row align-items-center justify-content-center">
					<label for="userPhoneNum"
						class="col-sm-2 col-form-label text-center"> 전화번호 </label>
					<div class="col-sm-5">
						<input type="text"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
							class="form-control" id="userPhoneNum" name="userPhoneNum"
							maxlength='15' placeholder="'-' 는 제외하고 입력해주세요. ">
					</div>
				</div>
				<div class="row align-items-center justify-content-center">
					<label for="userItrs" class="col-sm-2 col-form-label text-center">
						목 적 </label>
					<div class="col-sm-5">
						<textarea class="form-control" id="userItrs" name="userItrs"
							style="resize: none; height: 120px;"
							placeholder="내용을 입력하세요. &#13;&#10; (예시 1) 저는 다이어트에 관심이 많아요. &#13;&#10; (예시 2) 저는 마른체구가 고민이라 큰체구를 가지고 싶어요."></textarea>
						<!-- 크기 변환 설정 필요. -->
					</div>
				</div>
				<div class="row align-items-center justify-content-center">
					<div class="col-sm-7 align-items-center justify-content-center text-center">
					</div>
					<div class="col-sm-2 align-items-center justify-content-center text-center">
						<button type="submit" id="regBtn" style="display: none;"></button>
						<button type="button" class="btn btn-secondary" id="memberRegisterBtn">제출</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"></script>
<script>
			$(document).ready(function(){
			    $('#datepicker').datepicker({
			        language: 'ko', // 한글 설정
			        autoclose: true // 날짜 선택 후 자동으로 닫힘
			    });
			    
			 	// 오늘 날짜를 기본값으로 설정
			    $('#datepicker').datepicker('setDate', new Date());
			});
		</script>

<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/resources/js/scripts.js"></script>
<script src="/resources/js/member/memberRegister.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>