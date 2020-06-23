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
	
		<div class="register-box">
 			<div class="register-logo">
				<h2>회원 탈퇴</h2>
			</div>
				<div class="register-box-body">
					<form action="<%=contextPath %>/user/userDelete" method="post" >
						<div class="form-group has-feedback">
							<input type="text" class="form-control" id="u_email" name="u_email" value="${loginUser.u_email }"/>
						</div>
					
						<div class="form-group has-feedback">
							<input type="password" class="form-control" id="u_pwd" name="u_pwd" placeholder="PASSWORD"/>
						</div>
							<button type="submit" class="btn btn-block btn-danger">회원탈퇴</button>
					
					</form>
				</div>
			</div>
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