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
						<button type="button" onclick="javascript:location.href='<%= contextPath %>/testGurData'">test</button>
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
										<tr>
											<td>30</td>
											<td>운영정책 안내</td>
											<td>admin</td>
											<td>2020.06.11</td>
										</tr>
										<tr>
											<td>29</td>
											<td>금일 정기 점검 안내</td>
											<td>admin</td>
											<td>2020.06.07</td>
										</tr>
										<tr>
											<td>28</td>
											<td>이용약관 변경 안내</td>
											<td>admin</td>
											<td>2020.06.05</td>
										</tr>
										<tr>
											<td>27</td>
											<td>긴급 임시점검 안내</td>
											<td>admin</td>
											<td>2020.06.01</td>
										</tr>
										<tr>
											<td>26</td>
											<td>홈페이지 개설 안내</td>
											<td>admin</td>
											<td>2020.05.25</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
					</div>
					<div class="col-md-4">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">랭킹</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table class="table table-condensed">
									<tbody>
										<tr>
											<th style="width: 50px">순위</th>
											<th>닉네임</th>
											<th>시간</th>
											<th>등록일시</th>
										</tr>
										<tr>
											<td>1.</td>
											<td>홍길동</td>
											<td>1:20:13</td>
											<td>2020.06.11</td>
										</tr>
										<tr>
											<td>2.</td>
											<td>팔푼이</td>
											<td>1:21:13</td>
											<td>2020.06.01</td>
										</tr>
										<tr>
											<td>3.</td>
											<td>우수수</td>
											<td>1:25:13</td>
											<td>2020.05.21</td>
										</tr>
										<tr>
											<td>4.</td>
											<td>으아악</td>
											<td>1:40:00</td>
											<td>2020.03.01</td>
										</tr>
										<tr>
											<td>5.</td>
											<td>오옷~</td>
											<td>2:20:54</td>
											<td>2020.02.22</td>
										</tr>
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
										<tr>
											<td>101</td>
											<td>우왓 좋은아침</td>
											<td>김말똥</td>
											<td>2020.06.12</td>
										</tr>
										<tr>
											<td>100</td>
											<td>뭔 일인고</td>
											<td>홍길동</td>
											<td>2020.06.11</td>
										</tr>
										<tr>
											<td>99</td>
											<td>옥수수 먹기 좋은날?</td>
											<td>우수수</td>
											<td>2020.06.10</td>
										</tr>
										<tr>
											<td>98</td>
											<td>아 실패다... 너무 느리네..ㅠㅠ</td>
											<td>김말똥</td>
											<td>2020.06.09</td>
										</tr>
										<tr>
											<td>97</td>
											<td>하아 걱정입니다..</td>
											<td>김걱정</td>
											<td>2020.06.07</td>
										</tr>
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