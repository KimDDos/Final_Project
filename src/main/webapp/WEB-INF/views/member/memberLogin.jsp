<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<jsp:include page="../layout/header.jsp"></jsp:include>
<link href="/resources/css/memberlogin.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
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
	<div id="container" class="container text-center login-container" style="border: 1px solid black;">
		<!-- FORM SECTION -->
		<div class="row">
			<!-- SIGN UP -->
			<div class="col align-items-center flex-col sign-up">
				<div class="form-wrapper align-items-center">
					<div class="form sign-up">
						<div class="input-group">
							<i class='bx bx-mail-send'></i> 
							<input type="email" name="userName" id="userName" placeholder="Email">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i> <input type="password"
								placeholder="Password">
						</div>
						<button id="tLoginBtn" style="margin-top: 10px">Trainer Sign in</button>
						<p>
							<b> Forgot password? </b>
						</p>
						<p>
							<span> 아직 계정이 없으신가요? </span> <br>
							<b onclick="toggle()" class="pointer"> 회원가입하기 </b>
							<br>
							<a href="/login/google"><button id="googleLoginBtn" type="button">Google로 로그인하기</button></a> <br>
							<a href="/login/naver"><button id="naverLoginBtn" type="button">Naver로 로그인하기</button></a> <br>
							<a href="#"><button id="googleLoginBtn" type="button">Kakao로 로그인하기</button></a>
						</p>
					</div>
				</div>

			</div>
			<!-- END SIGN UP -->
			<!-- SIGN IN -->
			<div class="col align-items-center flex-col sign-in">
				<div class="form-wrapper align-items-center">
					<div class="form sign-in">
						<form action="/member/memberLogin" method="post">
							<div class="input-group">
								<i class='bx bxs-user'></i> <input type="text"
									placeholder="Username">
							</div>
							<div class="input-group">
								<i class='bx bxs-lock-alt'></i> <input type="password"
									placeholder="Password">
							</div>
							<input type="hidden" name="isTrainer">
							<button type="submit"  style="margin-top: 10px">User Sign in</button>
						</form>
						<p>
							<b> Forgot password? </b>
						</p>
						<p>
							<span> Don't have an account? </span> <br>
							 <b> Sign up here </b>
						</p>
					</div>
				</div>
				<div class="form-wrapper"></div>
			</div>
			<!-- END SIGN IN -->
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
			<!-- SIGN UP CONTENT -->
			<div class="col align-items-center flex-col">
				<div class="img sign-up"></div>
				<div class="text sign-up">
					<h2>Enjoy with us</h2>

				</div>
			</div>
			<!-- END SIGN UP CONTENT -->
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
<script src="/resources/js/memberLogin.js"></script>
<script src="https://accounts.google.com/gsi/client" onload="console.log('TODO: add onload function')">  
</script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/resources/js/scripts.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>