<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../common/head.jsp"%>

<style>
	.slideImgBox>.item {
	    width: 100%;
	    text-align: center;
	}
	.slideImgBox img {
		display: inline-block !important;
		max-height: 400px;
	}
	.mainImg {
		max-height: 400px;
	}
</style>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<%@ include file="common/user_main_header.jsp"%>

		<!-- Left side column. contains the logo and sidebar -->
		<%@ include file="common/user_left_column.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">



			<!-- Main content -->
			<section class="content container-fluid">

				<div class="row">
					<div class="col-md-6">
						<div class="box box-solid">
							<div class="box-body">
								<div id="carousel-example-generic" class="carousel slide"
									data-ride="carousel">
									<ol class="carousel-indicators">
										<li data-target="#carousel-example-generic" data-slide-to="0"
											class=""></li>
										<li data-target="#carousel-example-generic" data-slide-to="1"
											class="active"></li>
										<li data-target="#carousel-example-generic" data-slide-to="2"
											class=""></li>
									</ol>
									<div class="slideImgBox carousel-inner">
										<div class="item">
											<img
												src="<%= contextPath %>/img/main_slide1.PNG"
												alt="First slide">

											<div class="carousel-caption">First Slide</div>
										</div>
										<div class="item active">
											<img
												src="<%= contextPath %>/img/main_slide2.jpg"
												alt="Second slide">

											<div class="carousel-caption">Second Slide</div>
										</div>
										<div class="item">
											<img
												src="<%= contextPath %>/img/main_slide3.jpg"
												alt="Third slide">

											<div class="carousel-caption">Third Slide</div>
										</div>
									</div>
									<a class="left carousel-control"
										href="#carousel-example-generic" data-slide="prev"> <span
										class="fa fa-angle-left"></span>
									</a> <a class="right carousel-control"
										href="#carousel-example-generic" data-slide="next"> <span
										class="fa fa-angle-right"></span>
									</a>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
					</div>
					<div class="col-md-6">
						<div class="box">
							<div class="box-body">
								<img class="mainImg img-responsive" src="<%= contextPath %>/img/bike_main.jpg" alt="Photo">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">공지사항</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table class="table table-condensed">
									<tbody>
										<tr>
											<th style="width: 50px">NO</th>
											<th>제목</th>
											<th style="width: 60px;">작성자</th>
											<th>등록일시</th>
										</tr>
										<c:forEach var="selectAdminNoticeList" items="${selectAdminNoticeList }">
										<tr>
											<td>${selectAdminNoticeList.n_seq }</td>
											<td onclick="javascript:location.href='<c:url value="/ "/>community/noticeBoard'">${selectAdminNoticeList.n_title }</td>
											<td>${selectAdminNoticeList.u_email }</td>
											<td>${selectAdminNoticeList.n_date }</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
					</div>
					<div class="col-md-4">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">GPX공유게시판</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table class="table table-condensed">
									<tbody>
										<tr>
											<th style="width: 50px">NO</th>
											<th>제목</th>
											<th>닉네임</th>
											<th>등록일시</th>
										</tr>
										<c:forEach var="adminList" items="${adminList }">
										<tr>
											<td>${adminList.g_seq }</td>
											<td onclick="javascript:location.href='<c:url value="/ "/>gpx/gpxBoard'">${adminList.g_title }</td>
											<td>${adminList.u_nickname }</td>
											<td>${adminList.g_date }</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
					</div>
					<div class="col-md-4">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">자유게시판</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table class="table table-condensed">
									<tbody>
										<tr>
											<th style="width: 50px">NO</th>
											<th>제목</th>
											<th style="width: 60px;">작성자</th>
											<th>등록일시</th>
										</tr>
										<c:forEach var="selectAdminFreeList" items="${selectAdminFreeList }">
										<tr>
											<td>${selectAdminFreeList.b_seq }</td>
											<td onclick="javascript:location.href='<c:url value="/ "/>community/freeBoard'">${selectAdminFreeList.b_title }</td>
											<td>${selectAdminFreeList.u_nickname }</td>
											<td>${selectAdminFreeList.b_date }</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
					</div>
				</div>





			</section>
			<!-- /.content -->



		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@ include file="common/user_main_footer.jsp"%>

	</div>
	<!-- ./wrapper -->

</body>

</html>