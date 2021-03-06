<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String loginEmail = (String)session.getAttribute("loginEmail");
%>

		<header class="main-header">

			<!-- Logo -->
			<a href="javascript:location.href='<c:url value="/"/>adminHome'" class="logo">
				<!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>NS</b>R</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>NS</b>Record</span>
			</a>

			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button"> <span class="sr-only">Toggle
						navigation</span>
				</a>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li class="user user-menu">
							<a href="#">
								<img src="<c:url value="/"/>dist/img/profile.png" class="user-image" alt="User Image" style="background-color: white;">
								<span class="hidden-xs">${loginUser.u_email }</span>
							</a>
						</li>
						<li>
							<button type="button" class="btn btn-sm bg-gray color-palette" onclick="javascript:location.href='<c:url value="/"/>adminLogout'" style="margin: 10px">Logout</button>
						</li>
					</ul>
				</div>
			</nav>
		</header>