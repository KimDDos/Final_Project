<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
		<jsp:include page="../layout/header.jsp"></jsp:include>
			
		<div class="container-md">
			<div>
				<!-- 여기에 뭔가 들어가서 Sign up 페이지라고 표현해줘야함. 로고? 사이트명? 아니면 크게 회원가입? -->
				<h1 style="text-align: center;">회원가입 페이지</h1>
			</div>
			<br>
			<br>
			<div class="memberRegisterForm" style="border: 1px solid black; padding: 20px">
				<form action="/member/memberRegister" method="post">
					<div class="mb-3 row">
						<label for="userEmail" class="col-sm-3 col-form-label text-center">로그인 Email</label>
						<div class="col-sm-9" style="margin-top: 8px;">
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="checkbox" name="isTrainer" id="inlineCheckbox1" value="option1">
							  <label class="form-check-label" for="inlineCheckbox1">일반사용자</label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="checkbox" name="isTrainer" id="inlineCheckbox2" value="option2">
							  <label class="form-check-label" for="inlineCheckbox2">트레이너</label>
							</div>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="userEmail" class="col-sm-3 col-form-label text-center">로그인 Email</label>
						<div class="col-sm-9">
							<input type="email" class="form-control"
								name="userEmail" id="userEmail" placeholder="E-Mail을 입력해주세요.">
						</div>
						<!-- 셀렉트로 자동입력 과 셀프 입력 -->
					</div>
					<div class="mb-3 row">
						<button type="button" id="isEmailDuplicateBtn">이메일 중복체크</button>
					</div>
					<div class="mb-3 row">
						<label for="userPwdCheck" class="col-sm-3 col-form-label text-center">Password</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="userPwdCheck" name="userPwdCheck" placeholder="Password를 입력해주세요.">
						</div>
					</div>
					<div class="mb-3 row">
						<label for="userPwd" class="col-sm-3 col-form-label text-center">Password 확인</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="Password를 입력해주세요.">
						</div>
					</div>
					<div class="mb-3 row">
						<label for="userName" class="col-sm-3 col-form-label text-center"> 이 름 </label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="userName" name="userName">
						</div>
					</div>
					<div class="mb-3 row">
						<label for="userNickName" class="col-sm-3 col-form-label text-center"> 닉 네 임 </label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="userNickName" name="userNickName">
						</div>
					</div>
					<div class="mb-3 row">
						<label for="userBirthDate" class="col-sm-3 col-form-label text-center"> 생년월일 </label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="userBirthDate" name="userBirthDate" placeholder="1994.07.31">
						</div>
						<div class="form-check form-check-inline col-sm-1 text-center" style="margin-left: 10px; padding-top: 8px">
						  <input class="form-check-input" type="radio" name="userGender" id="inlineRadio1" value="M">
						  <label class="form-check-label" for="inlineRadio1">남</label>
						</div>
						<div class="form-check form-check-inline col-sm-1 text-center" style="margin-left: -15px; padding-top: 8px">
						  <input class="form-check-input" type="radio" name="userGender" id="inlineRadio2" value="F">
						  <label class="form-check-label" for="inlineRadio2">여</label>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="userPhoneNum" class="col-sm-3 col-form-label text-center"> 전화번호 </label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="userPhoneNum" name="userPhoneNum">
						</div>
					</div>
					<div class="mb-3 row">
						<label for="userPhoneNum" class="col-sm-3 col-form-label text-center"> 전화번호 </label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="userPhoneNum" name="userPhoneNum">
						</div>
					</div>
					<div class="mb-3 row">
						<label for="userItrs" class="col-sm-3 col-form-label text-center"> 관심사 </label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="userItrs" name="userItrs">
						</div>
					</div>
					<div>
						<button type="submit" style="display: none;"></button>
						<button type="button" class="" id="memberRegisterBtn"> Sign in </button>
					</div>
				</form>
			</div>
		</div>
		
		
		
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
        <script src="/resources/js/member/memberRegister.js"></script>
		<jsp:include page="../layout/footer.jsp"></jsp:include>