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
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Free Board Write<small>자유게시판 글 수정하기</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="javascript:location.href='<c:url value=" /" />adminHome'"><i
							class="fa fa-home"></i>Home</a></li>
					<li><a href="javascript:location.href='<c:url value=" /" />adminCommunity/adminNoticeBoard'">Free
						Board</a></li>
					<li class="active">Write</li>
				</ol>
			</section>


			<!-- Main content -->
			<section class="content container-fluid">

				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-body">
								<form action="<%=contextPath%>/community/updateFreeBoardContentEnd" method="post">
								<input type="hidden" name="b_seq" value="${UpdateContent.b_seq}">
									<div class="form-group">
										<label>제목</label>
										<input name="b_title" type="text" class="form-control" value="${UpdateContent.b_title}" required>
									</div>
									<div class="form-group">
										<textarea id="b_content" name="b_content" required>${UpdateContent.b_content}</textarea>
									</div>
									<script>
										$(function () {
											CKEDITOR.replace('b_content')
										})
									</script>
									<div class="form-group" style="text-align: right;">
												<input type="hidden" name="b_seq" value="${UpdateContent.b_seq}">
												<input type="hidden" name="b_title" value="${UpdateContent.b_title}">
												<input type="hidden" name="u_nickname" value="${UpdateContent.u_nickname}">
												<input type="hidden" name="b_count" value="${UpdateContent.b_count}">
												<input type="hidden" name="b_date" value="${UpdateContent.b_date}">
												<input type="hidden" name="b_content" value="${UpdateContent.b_content}">
												<input type="hidden" name="u_seq" value="${UpdateContent.u_seq}">
										<input type="submit" class="btn btn-primary" value="수정"/>
 									</div> 
								</form>
							</div>
						</div>
					</div>
				</div>

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