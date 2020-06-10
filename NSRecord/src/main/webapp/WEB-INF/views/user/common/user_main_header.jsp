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
			<a href="javascript:location.href='<c:url value="/"/>userHome'" class="logo">
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
				<div class="navbar-custom-menu flexBox">
					<c:choose>
						<c:when test="${loginEmail == null}">
							<button type="button" class="btn btn-sm bg-gray color-palette" onclick="javascript:location.href='<c:url value="/"/>user/userlogin'" style="margin: 10px">Login</button>
					 		<button type="button" class="btn btn-sm bg-gray color-palette" onclick="" style="margin: 10px">SignIn</button>
						</c:when>
						<c:otherwise>
							<div>${loginEmail } 님, 환영합니다.</div>
							<button type="button" class="btn btn-sm bg-gray color-palette" onclick="javascript:location.href='<c:url value="/"/>user/userlogout'" style="margin: 10px">Logout</button>
						</c:otherwise>
					</c:choose>
				</div>
			</nav>
		</header>