<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="../layout/header.jsp"></jsp:include>
<link href="/resources/css/memberlogin.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet" type="text/css">
<script src="https://apis.google.com/js/api:client.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap');

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Montserrat', sans-serif;
}

.login-container {
	border: 3px solid blue;
}

.social-icons {
    display: flex; /* 부모 요소를 flex 컨테이너로 설정 */
    justify-content: space-between; /* 자식 요소 사이의 간격을 균등하게 설정 */
    width: 100%; /* 부모 요소의 너비를 100%로 설정 */
}

.social {
    flex: 1; /* 자식 요소를 균등한 비율로 설정 */
}

.social img {
    max-width: 55%; /* 이미지의 최대 너비를 부모 요소에 맞춰 설정 */
    height: 35px; /* 이미지의 높이를 자동으로 조정하여 가로세로 비율 유지 */
}

.col-sm-4, .col-sm-6, .col-sm-10, .input-group {
	margin-top: 10px;
}

input {
	height: 35px;
	margin-bottom: 20px;
}

.py-5.bg-light {
    display: flex; /* 부모 요소를 flex 컨테이너로 설정 */
    justify-content: center; /* 자식 요소를 수평 중앙 정렬 */
    align-items: center; /* 자식 요소를 수직 중앙 정렬 */
    min-height: 92vh; /* 최소 높이를 화면 전체의 높이로 설정 */
}

.container-md {
    width: 70%; /* 원하는 너비로 설정 */
    display: flex; /* 컨테이너를 flex 컨테이너로 설정 */
    justify-content: center; /* 내부 요소를 수평 중앙 정렬 */
    align-items: center; /* 내부 요소를 수직 중앙 정렬 */
    height: 100%; /* 부모 요소의 높이를 100%로 설정 */
}

#memberloginForm {
	border: 1.5px solid #ccc;
	border-radius: 10px; 
	padding: 25px;
	box-shadow: 2px 3px 5px 0px;
}


input 창에 focus와 hover 효과를 추가하는 CSS 코드는 다음과 같이 작성할 수 있습니다:

/* input 요소에 대한 공통 스타일 */
input[type="email"],
input[type="password"] {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    transition: border-color 0.3s ease; /* hover 효과를 위한 transition 설정 */
}

/* input 요소가 focus 되었을 때의 스타일 */
input[type="email"]:focus,
input[type="password"]:focus {
    border-color: dodgerblue;
    background-color: #ced4da;
}

/* input 요소에 hover 효과를 추가 */
input[type="email"]:hover,
input[type="password"]:hover {
    border-color: lightblue;
}
</style>
<!-- col-lg-8 col-xl-8 col-xxl-10 -->
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
							style="text-decoration: none;"><b> 회원가입 </b></a>
					</div>
				</div>
				<div class="row align-items-center justify-content-center">
					<div class="col-sm-10 text-center">
						<p style="margin-top: 20px;">
							<b> 또는 SNS 아이디로 로그인 </b>
						</p>
					</div>
					<div class="col-sm-10 social-icons text-centers">
						<a href="/login/google" class="social">
							<img src="/resources/img/btnGoogle_완성형.png">
						</a> 
					</div>
					<div class="col-sm-10 social-icons text-center">
						<a href="/login/naver" class="social">
							<img src="/resources/img/btnNaver_완성형.png">
						</a>
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