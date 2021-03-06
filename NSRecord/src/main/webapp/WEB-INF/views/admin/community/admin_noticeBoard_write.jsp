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
					Notice Board Write<small>공지사항 글쓰기</small>
				</h1>
				<ol class="breadcrumb">
					<li><a
						href="javascript:location.href='<c:url value="/" />adminHome'"><i
							class="fa fa-home"></i>Home</a></li>
					<li><a
						href="javascript:location.href='<c:url value="/" />adminCommunity/adminNoticeBoard'">Notice
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
								<form action="<c:url value='/'/>adminCommunity/adminNoticeBoardWriteEnd" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label>제목</label> <input name="n_title" type="text"
											class="form-control" placeholder="입력하세요.."
											required="required">
									</div>
									<div class="form-group">
										<textarea id="n_content" name="n_content" required="required"></textarea>
									</div>
									<script>
										$(function() {
											CKEDITOR.replace('n_content')
										})
									</script>
									<div class="form-group">
										<label for="inputFile">첨부 파일</label>
										<input type="file" id="inputFile" name="upFile">
										<p class="help-block">파일 첨부 공간입니다.</p>
									</div>
									<div class="form-group" style="text-align: right;">
										<input type="submit" class="btn btn-primary" value="작성완료" />
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