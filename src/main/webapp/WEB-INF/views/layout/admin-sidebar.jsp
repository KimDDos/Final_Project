<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="" />
<meta name="author" content="" />



<title>SB Admin 2 - Dashboard</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">
	<form action="/admin/index" method="get">
		<!-- Page Wrapper -->
		<div id="wrapper">

			<!-- Sidebar -->
			<ul
				class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
				id="accordionSidebar">

<<<<<<< HEAD
            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/index">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
            </a>
=======
				<!-- Sidebar - Brand -->
				<a
					class="sidebar-brand d-flex align-items-center justify-content-center"
					href="#">
					<div class="sidebar-brand-icon rotate-n-15">
						<i class="fas fa-laugh-wink"></i>
					</div>
					<div class="sidebar-brand-text mx-3">
						SB Admin <sup>2</sup>
					</div>
				</a>
>>>>>>> origin/KJH

				<!-- Divider -->
				<hr class="sidebar-divider my-0">

<<<<<<< HEAD
            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="/admin/index">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>
=======
				<!-- Nav Item - Dashboard -->
				<li class="nav-item active"><a class="nav-link"
					href="index.html"> <i class="fas fa-fw fa-tachometer-alt"></i>
						<span>Dashboard</span></a></li>
>>>>>>> origin/KJH

				<!-- Divider -->
				<hr class="sidebar-divider">

				<!-- Heading -->
				<div class="sidebar-heading">Interface</div>

				<!-- Nav Item - Pages Collapse Menu -->
				<li class="nav-item"><a class="nav-link collapsed" href="#"
					data-toggle="collapse" data-target="#collapseTwo"
					aria-expanded="true" aria-controls="collapseTwo"> <i
						class="fas fa-fw fa-cog"></i> <span>Components</span>
				</a>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
						data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<h6 class="collapse-header">Components:</h6>
							<a class="collapse-item" href="/admin/register">공지사항 작성</a> <a
								class="collapse-item" href="/admin/list">공지사항 목록</a>
						</div>
					</div></li>

				<!-- Nav Item - Utilities Collapse Menu -->
				<li class="nav-item"><a class="nav-link collapsed" href="#"
					data-toggle="collapse" data-target="#collapseUtilities"
					aria-expanded="true" aria-controls="collapseUtilities"> <i
						class="fas fa-fw fa-wrench"></i> <span>Utilities</span>
				</a>
					<div id="collapseUtilities" class="collapse"
						aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<h6 class="collapse-header">Custom Utilities:</h6>
							<a class="collapse-item" href="utilities-color.html">Colors</a> <a
								class="collapse-item" href="utilities-border.html">Borders</a> <a
								class="collapse-item" href="utilities-animation.html">Animations</a>
							<a class="collapse-item" href="utilities-other.html">Other</a>
						</div>
					</div></li>

				<!-- Divider -->
				<hr class="sidebar-divider">

				<!-- Heading -->
				<div class="sidebar-heading">Addons</div>

				<!-- Nav Item - Pages Collapse Menu -->
				<li class="nav-item"><a class="nav-link collapsed" href="#"
					data-toggle="collapse" data-target="#collapsePages"
					aria-expanded="true" aria-controls="collapsePages"> <i
						class="fas fa-fw fa-folder"></i> <span>Pages</span>
				</a>
					<div id="collapsePages" class="collapse"
						aria-labelledby="headingPages" data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<h6 class="collapse-header">Login Screens:</h6>
							<a class="collapse-item" href="login.html">Login</a> <a
								class="collapse-item" href="register.html">Register</a> <a
								class="collapse-item" href="forgot-password.html">Forgot
								Password</a>
							<div class="collapse-divider"></div>
							<h6 class="collapse-header">Other Pages:</h6>
							<a class="collapse-item" href="404.html">404 Page</a> <a
								class="collapse-item" href="blank.html">Blank Page</a>
						</div>
					</div></li>

				<!-- Nav Item - Charts -->
				<li class="nav-item"><a class="nav-link" href="charts.html">
						<i class="fas fa-fw fa-chart-area"></i> <span>Charts</span>
				</a></li>

				<!-- Nav Item - Tables -->
				<li class="nav-item"><a class="nav-link" href="tables.html">
						<i class="fas fa-fw fa-table"></i> <span>Tables</span>
				</a></li>

				<!-- Divider -->
				<hr class="sidebar-divider d-none d-md-block">

				<!-- Sidebar Toggler (Sidebar) -->
				<div class="text-center d-none d-md-inline">
					<button class="rounded-circle border-0" id="sidebarToggle"></button>
				</div>

				<!-- Sidebar Message -->
				<div class="sidebar-card d-none d-lg-flex">
					<img class="sidebar-card-illustration mb-2"
						src="/resources/img/undraw_rocket.svg" alt="...">
					<p class="text-center mb-2">
						<strong>SB Admin Pro</strong> is packed with premium features,
						components, and more!
					</p>
					<a class="btn btn-success btn-sm"
						href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade
						to Pro!</a>
				</div>

			</ul>
			<!-- End of Sidebar -->