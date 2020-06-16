<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp"%>

<script>
	var searchSort = "";
	var searchVal = "";

	$(function () {
		// 페이지 처음 접근시 리스트 표시 좌표
		noticeBoardAjaxfn(1);
	})

	// 리스트 Ajax 처리
	function noticeBoardAjaxfn(cPage) {
		$.ajax({
			url: "<c:url value="/ "/>adminCommunity/adminNoticeBoardAjax",
			data: {
				"cPage": cPage,
				"searchSort": searchSort,
				"searchVal": searchVal,
			},
			dataType: "html",
			success: function (data) {
				$('#admin_noticeBoardId').html(data);
			}
		})
	}

	//search ----------------------
	function searchBoxFn() {
		searchSort = $('#searchSort').val();
		searchVal = $('#searchVal').val();
		noticeBoardAjaxfn(1);
	}

</script>

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
					Notice Board <small>공지사항 관리</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="javascript:location.href='<c:url value="/" />adminHome'">
						<i class="fa fa-home"></i>Home</a>
					</li>
					<li class="active">Notice Board</li>
				</ol>
			</section>


			<!-- Main content -->
			<section class="content container-fluid">

				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<div class="row">
									<div class="col flexBox" style="justify-content: flex-start; padding: 0 16px;">
										<h3 class="box-title">공지사항 리스트</h3>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button" class="btn btn-primary"
											onclick="javascript:location.href='<%=contextPath%>/adminCommunity/adminNoticeBoardWrite'">글쓰기</button>
									</div>
								</div>
							</div>
							<div class="box-body">

								<div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
									<div class="row">
										<div class="col-sm-6"></div>
										<div class="col-sm-6">
											<div id="example1_filter" class="dataTables_filter">
												<form action="javascript:searchBoxFn()">
													<div class="box-tools">
														<select class="form-control" name="searchSort" id="searchSort">
															<option value="n_seq">번호</option>
															<option value="n_title">제목</option>
														</select>
														<div class="input-group input-group-sm" style="width: 150px;">
															<input type="text" name="searchVal" id="searchVal" class="form-control pull-right" placeholder="Search">
															<div class="input-group-btn">
																<button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
															</div>
														</div>
													</div>
												</form>
											</div>

										</div>
									</div>

									<div id="admin_noticeBoardId"></div>

								</div>
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