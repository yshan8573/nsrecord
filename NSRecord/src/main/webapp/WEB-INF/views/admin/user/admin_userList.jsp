<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp" %>

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

		<h1>작업 공간입니다.</h1>

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