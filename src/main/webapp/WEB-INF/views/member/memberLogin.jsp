<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<jsp:include page="../layout/header.jsp"></jsp:include>
<link href="/resources/css/memberlogin.css" rel="stylesheet" />

<div class="container-md" style="height: 100%">
	<div id="container" class="container text-center">
		<!-- FORM SECTION -->
		<div class="row">
			<!-- SIGN UP -->
			<div class="col align-items-center flex-col sign-up">
				<div class="form-wrapper align-items-center">
					<div class="form sign-up">
						<div class="input-group">
							<i class='bx bx-mail-send'></i> <input type="email"
								placeholder="Email">
						</div>
						<div class="input-group">
							<i class='bx bxs-lock-alt'></i> <input type="password"
								placeholder="Password">
						</div>
						<button id="tLoginBtn">Trainer Sign in</button>
						<p>
							<b> Forgot password? </b>
						</p>
						<p>
							<span> 아직 계정이 없으신가요? </span> <br>
							<b onclick="toggle()" class="pointer"> 회원가입하기 </b>
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
							<button type="submit">User Sign in</button>
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
	let container = document.getElementById('container');

	function toggle(() => {
	  container.classList.toggle('sign-in')
	  container.classList.toggle('sign-up')
	}

	setTimeout(() => {
	  container.classList.add('sign-in')
	}, 200)
</script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="/resources/js/scripts.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>