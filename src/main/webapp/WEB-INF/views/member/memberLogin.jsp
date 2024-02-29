<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="../layout/header.jsp"></jsp:include>
<link href="/resources/css/memberlogin.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>
<link href="/resources/css/memberlogin.css" rel="stylesheet" />
<!-- col-lg-8 col-xl-8 col-xxl-10 -->
<style>
	.py-5{
		background-image: url("/resources/img/gym-LoginBG_1920.jpg");
		background-color: rgba(255, 255, 255, 0.5);
		background-size: cover;
		background-position: center;
	}
	
	.py-5 > * {
		background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVQImWNgAAAAHAAAFCACigAAAAASUVORK5CYII=");
	}
	
	
</style>
<div class="py-5 bg-light">
	<div class="container-md px-5 my-5" style="margin: 0 0 0 0;">
		<div class="form-container sign-up row align-items-center justify-content-center"
			style="width: 70%;">
			<div id="memberloginForm" class="col-sm-9 text-center">
				<form action="/member/login" method="post" class="row align-items-center justify-content-center">
					<div class="row align-items-center justify-content-center" >
						<div class="col-lg-8 col-xl-8 col-xxl-10" style="padding-top: 10px; padding-bottom: 15px;">
							<strong><img src="/resources/img/logo3_footer_th_removebg.png" alt="logo"
								alt=""></strong>
						</div>
					</div>
					<!-- 로고? 정중앙에 위치 -->
					<div class="row align-items-center justify-content-center">
						<input type="email" class="col-lg-8 col-xl-8 col-xxl-10" name="userEmail"
							id="userEmail" placeholder="Email">
					</div>
					<div class="row align-items-center justify-content-center">
						<input type="password" class="col-lg-8 col-xl-8 col-xxl-10" name="userPwd"
							id="userPwd" placeholder="Password">
					</div>
					<button type="submit" class="btn btn-secondary col-lg-8 col-xl-8 col-xxl-10">로그인</button>
				</form>
				<div class="input-group row align-items-center justify-content-center">
					<div class="col-lg-8 col-xl-8 col-xxl-10 text-center" style="margin-top: 10px;">
						<!-- Modal 창으로 password 찾기? 아니면 찾는 페이지로? -->
						<b> 비밀번호를 잊으셨나요? </b> <br> <a href="/member/memberRegister"
							style="text-decoration: none;" id="sign-up-go"><b> 회원가입 </b></a>
					</div>
				</div>
				<div class="row align-items-center justify-content-center">
					<div class="col-sm-10 text-center">
						<p style="margin-top: 20px;">
							<b> 또는 SNS 아이디로 로그인 </b>
						</p>
					</div>
					<div class="col-sm-4 social-icons text-center align-items-center justify-content-center">
						<button type="button" class="custom-google" onclick="googleLogin()"></button>
						<!-- <a href="/login/google" class="social">
						</a>  -->
					</div>
					<div class="col-sm-4 social-icons text-center align-items-center justify-content-center">
						<button type="button" class="custom-naver" onclick="naverLogin()"></button>
						<!-- <a href="/login/naver" class="social"></a> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	function onSignIn(googleUser) {
		var profile = googleUser.getBasicProfile();
		console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		console.log('Name: ' + profile.getName());
		console.log('Image URL: ' + profile.getImageUrl());
		console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
	
</script>
<script src="/resources/js/member/memberLogin.js"></script>
<!-- <script src="/resources/js/memberLogin.js"></script>-->
<script src="https://accounts.google.com/gsi/client"
	onload="console.log('TODO: add onload function')">
	
</script>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/resources/js/scripts.js"></script>
</body>