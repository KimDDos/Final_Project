<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="../layout/header.jsp"></jsp:include>
<link href="/resources/css/memberlogin.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>
<style>
div {
	border: 1px solid black;
}

.login-container {
	border: 3px solid blue;
}
</style>

<div class="container-md" style="height: 100%">
	<div id="container" class="container text-center login-container"
		style="border: 1px solid black;">
		<!-- FORM SECTION -->
		<div class="row">
			<!-- SIGN UP -->
			<div class="col align-items-center flex-col sign-up">
				<div class="form-wrapper align-items-center">
					<div class="form sign-up">
						<form action="/member/Login" method="post">
							<div class="input-group">
								<input type="email" name="userEmail" id="userEmail"
									placeholder="Email">
							</div>
							<div class="input-group">
								<input type="password" name="userPwd" id="userPwd"
									placeholder="Password">
							</div>
							<button type="submit">로그인</button>
						</form>
						<p style="margin-top: 20px;">
							<b> Forgot password? </b>
						</p>
						<p style="margin-top: 20px;">
							<span> 아직 계정이 없으신가요? </span> <br> <a
								href="/member/memberRegister"><b onclick="toggle()"
								class="pointer"> 회원가입하기 </b></a> <br> <a href="/login/google"><button
									id="googleLoginBtn" type="button" style="margin-top: 10px;">Google로
									로그인하기</button></a> <br> <a href="/login/naver"><button
									id="naverLoginBtn" type="button" style="margin-top: 10px;">Naver로
									로그인하기</button></a> <br> <a href="#"><button id="googleLoginBtn"
									type="button" style="margin-top: 10px; margin-bottom: 20px">Kakao로
									로그인하기</button></a>
						</p>
					</div>
				</div>

			</div>
			<!-- END SIGN UP -->
			<!-- SIGN IN -->
		</div>
		<!-- END FORM SECTION -->
		<!-- CONTENT SECTION -->
		<div class="row content-row">
			<!-- SIGN IN CONTENT -->
			<div class="col align-items-center flex-col">
				<div class="text sign-in">
					<h2>Join with us</h2>

				</div>
				<div class="img sign-in"></div>
			</div>
			<!-- END SIGN IN CONTENT -->
		</div>
		<!-- END CONTENT SECTION -->
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
<!-- <script src="/resources/js/memberLogin.js"></script>-->
<script src="https://accounts.google.com/gsi/client"
	onload="console.log('TODO: add onload function')">
	
</script>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/resources/js/scripts.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>