<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../common/head.jsp"%>


<style>
	.box {
		/* min-height: 520px; */
	}
</style>


<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<%@ include file="common/admin_main_header.jsp"%>

		<!-- Left side column. contains the logo and sidebar -->
		<%@ include file="common/admin_left_column.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Admin Main <small>Optional description</small>
				</h1>
				<ol class="breadcrumb">
					<li><a
						href="javascript:location.href='<c:url value="/"/>adminHome'"><i
							class="fa fa-home"></i> Home</a></li>
				</ol>
			</section>






			<!-- Main content -->
			<section class="content container-fluid" style="padding: 40px;">

				<div class="row">
					<div class="col-lg-4 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-yellow">
							<div class="inner">
								<h3>3</h3>

								<p>회원 가입 인원수</p>
							</div>
							<div class="icon">
								<i class="ion ion-person-add"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-4 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-aqua">
							<div class="inner">
								<h3>5</h3>

								<p>오늘 GPX공유게시판 게시글 수</p>
							</div>
							<div class="icon">
								<i class="fa fa-map-o"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-4 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-green">
							<div class="inner">
								<h3>53</h3>

								<p>오늘 자유게시판 게시글 수</p>
							</div>
							<div class="icon">
								<i class="fa  fa-file-text-o"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
				</div>
				<br>
				<div class="row">
					<div class="col-md-6">
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
					<div class="col-md-6">
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
					
				</div>
				<div class="row">
				<div class="col-md-6">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">GPX 공유게시판</h3>
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
					<div class="col-md-6">
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
		<%@ include file="common/admin_main_footer.jsp"%>

	</div>
	<!-- ./wrapper -->

</body>

</html>