<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp"%>
<html>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<%@ include file="../common/user_main_header.jsp"%>

		<!-- Left side column. contains the logo and sidebar -->
		<%@ include file="../common/user_left_column.jsp"%>


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

			<!-- Main content -->
			<section class="content container-fluid">
			
			<h2>회원 탈퇴</h2>
			<form action="<%=contextPath %>/user/userDelete" method="post" >
				<p>
					<label for="u_email">아이디</label>
					<input type="text" id="u_email" name="u_email" value="${loginUser.u_email }"/>
				</p>
				<p>
					<label for="u_pwd">비밀번호</label>
					<input type="password" id="u_pwd" name="u_pwd" />
				</p>
				<p>
					<button type="submit">회원탈퇴</button>
				</p>
			</form>
			<c:if test="${msg == false }">
				<p>
					비밀번호가 일치하지 않습니다.
				</p>
			</c:if>
			
			</section>
			<!-- /.content -->

		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@ include file="../common/user_main_footer.jsp"%>

	</div>
	<!-- ./wrapper -->
	
</body>

</html>