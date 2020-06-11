<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp" %>
<style>
h1 {
	text-align:center;
}
table{
	margin: auto;
	text-align:center;
}

</style>
<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

    <!-- Main Header -->
    <%@ include file="../common/admin_main_header.jsp" %>

    <!-- Left side column. contains the logo and sidebar -->
    <%@ include file="../common/admin_left_column.jsp" %>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				User List <small>회원 정보 확인</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="javascript:location.href='<c:url value="/"/>adminHome'"><i class="fa fa-home"></i> Home</a></li>
				<li class="active">User List</li>
			</ol>
		</section>


      <!-- Main content -->
      <section class="content container-fluid">

		<table border="1">
			<c:choose>
				<c:when test="${fn:length(list)>0 }">
					<tr>
						<th>회원코드</th>
						<th>이메일</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>전화번호</th>
						<th>등록일</th>
						<th>상태</th>
						<th>자전거 모델</th>
					</tr>
				</c:when>
			</c:choose>
			<c:forEach var="userInfo" items="${list}">
				<tr>
					<td>${userInfo.u_seq }</td>
					<td>${userInfo.u_email }</td>
					<td>${userInfo.u_name }</td>
					<td>${userInfo.u_nickname }</td>
					<td>${userInfo.u_phone }</td>
					<td>${userInfo.u_enrolldate }</td>
					<td>${userInfo.u_status }</td>
					<td>${userInfo.u_cycle}</td>
				</tr>
			
			</c:forEach>
		</table>

      </section>
      <!-- /.content -->



    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <%@ include file="../common/admin_main_footer.jsp" %>

  </div>
  <!-- ./wrapper -->

</body>

</html>