<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>Modern Business - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="./assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/styles.css" rel="stylesheet" />
<link href="/resources/css/test.css" rel="stylesheet" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="/resources/css/modal.css">
<script defer src="/resources/js/script.js"></script>
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container px-5">
				<a class="navbar-brand" href="/"> <img
					src="/resources/img/logo3_th_removebg_re.png" alt="404 not found">
					득근득근
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item dropdowns"><a class="nav-link "
							id="navbarDropdownBlog" href="#" role="button"
							aria-expanded="false">고객지원</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdownBlog">
								<li><a class="dropdown-item" href="/notice/list">공지사항</a></li>
								<li><a class="dropdown-item" href="#">일반 문의</a></li>
								<li><a class="dropdown-item" href="#">트레이너 문의</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link" href="/admin/index"
							target="_blank">어드민페이지</a></li>
						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal.mdto.mvo.userSerialNo"
								var="userSerialNo" />
							<sec:authentication property="principal.mdto.mvo.userNickName"
								var="userNickName" />
							<sec:authentication property="principal.mdto.mvo.userEmail"
								var="userEmail" />
							<sec:authentication property="principal.mdto.mvo.userPhoneNum"
								var="userPhoneNum" />
							<sec:authentication property="principal.mdto.mvo.isTrainer"
								var="isTrainer" />
							<sec:authentication property="principal.mdto.avo" var="avos" />
							<li class="nav-item dropdowns"><a class="nav-link "
								id="navbarDropdownBlog" href="#" role="button"
								aria-expanded="false">예약(test)</a>
								<ul class="dropdown-menu dropdown-menu-end"
									aria-labelledby="navbarDropdownBlog">
									<c:if test="${isTrainer eq 'N'}">
										<li><a class="dropdown-item"
											href="/reservation/gymSelect">예약 하기</a></li>
									</c:if>
									<li><a class="dropdown-item" href="/reservation/list">예약
											게시판</a></li>
									<li><a class="dropdown-item" href="#">예약일정 확인</a></li>
								</ul></li>
							<li class="nav-item"><a class="nav-link"
								href="/member/mypage">MYPAGE</a></li>
							<li class="nav-item"><a class="nav-link" id="logoutLink"
								href="#">Logout</a></li>
							<form action="/member/memberLogout" method="post" id="logoutForm">
								<input type="hidden" name="email" value="${userEmail}">
							</form>
							<li class="nav-item"><a class="nav-link"
								style="color: white;" href="#">${userNickName} <c:if
										test="${isTrainer eq 'Y'}">트레이너</c:if>님 안녕하세요.
							</a></li>
							<li class="nav-item"><button id="alarmBtn" type="button"
									style="background-color: transparent;">
									<img alt="" src="/resources/img/bell.svg">
									<c:if test="${avos.size() > 0}">
										<span class="badge rounded-pill text-bg-danger">${avos.size()}</span>
										<div
											style="overflow: auto; position: absolute; width:500px; right: 180px;
											visibility: hidden; color: white; background-color: blue; height: 150px;"
											id="alarmLists">
											<c:forEach var="alarm" items="${avos}">
												<c:choose>
													<c:when test="${alarm.alarmType eq '예약'}">
														<a
															href="/member/alarmCheck?alarmNo=${alarm.ano }&rno=${alarm.rno}&userNo=${userSerialNo}"><div
																style="font-size: large;">${alarm.content}</div></a>
													</c:when>
													<c:otherwise>
														<div style="">${alarm.content}</div>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</div>
									</c:if>
								</button></li>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<li class="nav-item"><a class="nav-link"
								href="/member/memberRegister">회원가입</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/member/memberLogin">로그인</a></li>
						</sec:authorize>
					</ul>
				</div>
			</div>
		</nav>
		<script type="text/javascript">
	console.log("JS WORKS WELL!!!!!!!!!!");
	document.getElementById("logoutLink").addEventListener('click',(e)=>{
    e.preventDefault();
    document.getElementById("logoutForm").submit();
    })
    document.getElementById("alarmBtn").addEventListener('click',(e)=>{
    	var alarmListStatus = document.getElementById("alarmLists").style.visibility;
		if (alarmListStatus == "hidden") document.getElementById("alarmLists").style.visibility = "visible";
		else if (alarmListStatus == "visible") document.getElementById("alarmLists").style.visibility = "hidden";
		console.log(alarmListStatus);
    })
    </script>
	</main>