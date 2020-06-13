<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp" %>

<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

    <!-- Main Header -->
    <%@ include file="../common/user_main_header.jsp" %>

    <!-- Left side column. contains the logo and sidebar -->
    <%@ include file="../common/user_left_column.jsp" %>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

      <!-- Main content -->
      <section class="content container-fluid">







<h1>자유 게시판</h1>
<hr width=80%>

<table>
	<tr>
		<td>${FreeBoardDto.b_seq}</td>
		<td>${FreeBoardDto.b_title}</td>
		<td>${FreeBoardDto.u_nickname}</td>
	<tr>	
	<tr>
		<td>${FreeBoardDto.b_count}</td>
		<td>${FreeBoardDto.b_date}</td>
	</tr>
	<tr>
		<td>${FreeBoardDto.b_content}</td>
	</tr>	


</table>






      </section>
      <!-- /.content -->

    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <%@ include file="../common/user_main_footer.jsp" %>

  </div>
  <!-- ./wrapper -->

</body>

</html>