<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
								<h3>${userCount }</h3>
								<p>오늘 회원 가입 인원수</p>
							</div>
							<div class="icon">
								<i class="ion ion-person-add"></i>
							</div>
							<a href="javascript:location.href='<c:url value="/"/>adminUser/adminUserList'" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-4 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-aqua">
							<div class="inner">
								<h3>${gpxCount }</h3>

								<p>오늘 GPX공유게시판 등록 수</p>
							</div>
							<div class="icon">
								<i class="fa fa-map-o"></i>
							</div>
							<a href="javascript:location.href='<c:url value="/"/>adminGpx/adminGpxList'" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-4 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-green">
							<div class="inner">
								<h3>${freeBoardCount }</h3>

								<p>오늘 자유게시판 등록 수</p>
							</div>
							<div class="icon">
								<i class="fa  fa-file-text-o"></i>
							</div>
							<a href="javascript:location.href='<c:url value="/"/>adminCommunity/adminFreeBoard'" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
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
										<c:forEach var="selectAdminNoticeList" items="${selectAdminNoticeList }">
										<tr>
											<td>${selectAdminNoticeList.n_seq }</td>
											<td onclick="javascript:location.href='<c:url value="/ "/>adminCommunity/adminNoticeBoard'">
											<c:set var ="n_title" value="${selectAdminNoticeList.n_title }"></c:set>
												<c:choose>
													<c:when test="${fn:length(n_title) > 20}">
														${fn:substring(n_title,0,20) }
													</c:when>
													<c:otherwise>
														${n_title }
													</c:otherwise>
												</c:choose>	
											</td>
											<td>${selectAdminNoticeList.u_name }</td>
											<td>
											<c:set var ="n_date" value="${selectAdminNoticeList.n_date }"></c:set>
												<c:choose>
													<c:when test="${fn:length(n_date) > 10}">
														${fn:substring(n_date,0,10) }
													</c:when>
													<c:otherwise>
														${n_date }
													</c:otherwise>
												</c:choose>	
											</td>

										</tr>
									</c:forEach>
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
										<c:forEach var="gurList" items="${gurList }">
										<tr>
											<td>${gurList.ranking }</td>
											<td onclick="javascript:location.href='<c:url value="/ "/>adminGpx/adminGpxRankingList'">${gurList.u_nickname }</td>
											<td>${gurList.gur_times }</td>
											<td>
											<c:set var ="gur_date" value="${gurList.gur_date }"></c:set>
												<c:choose>
													<c:when test="${fn:length(gur_date) > 10}">
														${fn:substring(gur_date,0,10) }
													</c:when>
													<c:otherwise>
														${gur_date }
													</c:otherwise>
													</c:choose>
											</td>
										</tr>
									</c:forEach>
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
										<c:forEach var="adminList" items="${adminList }">
										<tr>
											<td>${adminList.g_seq }</td>
											<td onclick="javascript:location.href='<c:url value="/ "/>adminGpx/adminGpxList'">
												<c:set var ="g_title" value="${adminList.g_title }"></c:set>
												<c:choose>
													<c:when test="${fn:length(g_title) > 10}">
														${fn:substring(g_title,0,10) }
													</c:when>
													<c:otherwise>
														${g_title }
													</c:otherwise>
												</c:choose>	
											</td>
											<td>${adminList.u_nickname }</td>
											<td>
											<c:set var ="g_date" value="${adminList.g_date }"></c:set>
												<c:choose>
													<c:when test="${fn:length(g_date) > 10}">
														${fn:substring(g_date,0,10) }
													</c:when>
													<c:otherwise>
														${g_date }
													</c:otherwise>
												</c:choose>	
											
											</td>
										</tr>
										</c:forEach>
										
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
										<c:forEach var="selectAdminFreeList" items="${selectAdminFreeList }">
										<tr>
											<td>${selectAdminFreeList.b_seq }</td>
											<td onclick="javascript:location.href='<c:url value="/ "/>adminCommunity/adminFreeBoard'">
											<c:set var ="b_title" value="${selectAdminFreeList.b_title }"></c:set>
												<c:choose>
													<c:when test="${fn:length(b_title) > 10}">
														${fn:substring(b_title,0,10) }
													</c:when>
													<c:otherwise>
														${b_title }
													</c:otherwise>
												</c:choose>	
											</td>
											<td>${selectAdminFreeList.u_nickname }</td>
											<td>
											<c:set var ="b_date" value="${selectAdminFreeList.b_date }"></c:set>
												<c:choose>
													<c:when test="${fn:length(b_date) > 10}">
														${fn:substring(b_date,0,10) }
													</c:when>
													<c:otherwise>
														${b_date }
													</c:otherwise>
												</c:choose>	
											
											</td>
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
		<%@ include file="common/admin_main_footer.jsp"%>

	</div>
	<!-- ./wrapper -->

</body>

</html>