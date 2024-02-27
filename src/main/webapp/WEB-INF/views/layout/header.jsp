<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html>
<<<<<<< HEAD
    
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="./assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <link href="/resources/css/test.css" rel="stylesheet" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    </head>
        <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">
                    <a class="navbar-brand" href="/">득근득근</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="about.html"></a></li>
                            <li class="nav-item dropdowns">
                                <a class="nav-link " id="navbarDropdownBlog" href="#" role="button"  aria-expanded="false">예약(test)</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="/reservation/register">예약 하기</a></li>
                                    <li><a class="dropdown-item" href="/notice/list">예약 문의</a></li>
                                    <li><a class="dropdown-item" href="#">예약일정 확인</a></li>
                                </ul>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="pricing.html">Pricing</a></li>
                            <li class="nav-item"><a class="nav-link" href="faq.html">FAQ</a></li>
                            <li class="nav-item"><a class="nav-link" href="/member/mypage">MYPAGE</a></li>
                            <li class="nav-item dropdowns">
                                <a class="nav-link " id="navbarDropdownBlog" href="#" role="button"  aria-expanded="false">고객지원</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="/notice/register">공지사항 등록</a></li>
                                    <li><a class="dropdown-item" href="/notice/list">공지사항</a></li>
                                    <li><a class="dropdown-item" href="#">일반 문의</a></li>
                                    <li><a class="dropdown-item" href="#">트레이너 문의</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdowns">
                                <a class="nav-link " id="navbarDropdownPortfolio" href="#" role="button"  aria-expanded="false">Portfolio</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                                    <li><a class="dropdown-item" href="portfolio-overview.html">Portfolio Overview</a></li>
                                    <li><a class="dropdown-item" href="portfolio-item.html">Portfolio Item</a></li>
                                </ul>
                            </li>
                            
                            <li class="nav-item"><a class="nav-link" href="/member/memberRegister">Sign up</a></li>
                            <li class="nav-item"><a class="nav-link" href="/member/memberLogin">Log in</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
         </main>
=======

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
<link href="/resources/css/reservation.css" rel="stylesheet" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script defer src="/resources/js/script.js"></script>
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container px-5">
				<a class="navbar-brand" href="/">득근득근</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link" href="about.html"></a></li>
						<li class="nav-item"><a class="nav-link" href="pricing.html">Pricing</a></li>
						<li class="nav-item"><a class="nav-link" href="faq.html">FAQ</a></li>
						<li class="nav-item dropdowns"><a class="nav-link "
							id="navbarDropdownBlog" href="#" role="button"
							aria-expanded="false">고객지원</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdownBlog">
								<li><a class="dropdown-item" href="/notice/list">공지사항</a></li>
								<li><a class="dropdown-item" href="#">일반 문의</a></li>
								<li><a class="dropdown-item" href="#">트레이너 문의</a></li>
							</ul></li>
						<li class="nav-item dropdowns"><a class="nav-link "
							id="navbarDropdownPortfolio" href="#" role="button"
							aria-expanded="false">Portfolio</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdownPortfolio">
								<li><a class="dropdown-item" href="portfolio-overview.html">Portfolio
										Overview</a></li>
								<li><a class="dropdown-item" href="portfolio-item.html">Portfolio
										Item</a></li>
							</ul></li>

						<li class="nav-item"><a class="nav-link" href="/admin/index"
							target="_blank">어드민페이지</a></li>
						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal.mdto.mvo.userNickName"
								var="userNickName" />
							<sec:authentication property="principal.mdto.mvo.userEmail"
								var="userEmail" />
							<li class="nav-item dropdowns"><a class="nav-link "
								id="navbarDropdownBlog" href="#" role="button"
								aria-expanded="false">예약(test)</a>
								<ul class="dropdown-menu dropdown-menu-end"
									aria-labelledby="navbarDropdownBlog">
									<li><a class="dropdown-item" href="/reservation/register">예약
											하기</a></li>
									<li><a class="dropdown-item" href="/notice/list">예약 문의</a></li>
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
								style="color: white;" href="#">${userNickName}님
									안녕하세요.</a></li>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<li class="nav-item"><a class="nav-link"
								href="/member/memberRegister">Sign up</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/member/memberLogin">Log in</a></li>
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
    </script>
	</main>
>>>>>>> main
