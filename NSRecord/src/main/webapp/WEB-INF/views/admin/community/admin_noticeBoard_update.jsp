<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp"%>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<%@ include file="../common/admin_main_header.jsp"%>

		<!-- Left side column. contains the logo and sidebar -->
		<%@ include file="../common/admin_left_column.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Notice Board Update<small>공지사항 수정</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="javascript:location.href='<%=contextPath%>/adminHome'"><i class="fa fa-home"></i>Home</a></li>
					<li><a href="javascript:location.href='<%=contextPath%>/adminCommunity/adminNoticeBoard'">Notice Board</a></li>
					<li class="active">Update</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">

				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-body">
								<form action="<%=contextPath%>/adminCommunity/adminNoticeBoardUpdateEnd" method="post">
									<div class="form-group">
										<label>제목</label>
										<input name="n_title" type="text" class="form-control" placeholder="입력하세요.." value="${notice.n_title }" required="required">
									</div>
									<div class="form-group">
										<textarea id="n_content" name="n_content" required="required">${notice.n_content }</textarea>
									</div>
									<script>
										$(function () {
											CKEDITOR.replace('n_content')
										})
									</script>
									<div class="form-group" style="text-align: right;">
										<input type="hidden" name="n_seq" value="${notice.n_seq }"/>
										<input type="submit" class="btn btn-primary" value="수정완료"/>
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
		<%@ include file="../common/admin_main_footer.jsp"%>

	</div>
	<!-- ./wrapper -->

</body>

</html>