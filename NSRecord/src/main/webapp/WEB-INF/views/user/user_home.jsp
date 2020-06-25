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
											<img src="<%= contextPath %>/img/main_slide1.jpg" alt="First slide">
										</div>
										<div class="item active">
											<img src="<%= contextPath %>/img/main_slide2.jpg" alt="Second slide">
										</div>
										<div class="item">
											<img src="<%= contextPath %>/img/main_slide3.jpg" alt="Third slide">
										</div>
									</div>
									<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
										<span class="fa fa-angle-left"></span>
									</a>
									<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
										<span class="fa fa-angle-right"></span>
									</a>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
					</div>
					
					<!-- 랭킹 지도 입력 -->
					<div class="col-md-6">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">랭킹</h3>
							</div>
							<div class="box-body">
							
							<div class="row">
								<div class="col-md-6">
								<div><h5 class="box-title"><b>&nbsp;&nbsp;&nbsp;${grc.grc_title }</b></h5></div>
								<div style="padding: 10px;">
									<div id="gpxMap" class="gpxMapDiv" style="width: 100%; height: 300px;"></div>
								</div>
								</div>
								<div class="col-md-6">
								<div><h5 class="box-title"><b>&nbsp;</b></h5></div>
									<table class="table table-condensed" onclick="javascript:location.href='<c:url value="/"/>gpx/gpxRanking'">
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
													<td>${gurList.u_nickname }</td>
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
							</div>
							
							
							
							
							
							
							
							
							
							
								<%-- <img class="mainImg img-responsive" src="<%= contextPath %>/img/bike_main.jpg" alt="Photo"> --%>
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
											<td onclick="javascript:location.href='<c:url value="/ "/>community/noticeBoard'">
											
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
											<td onclick="javascript:location.href='<c:url value="/ "/>gpx/gpxBoard'">
											
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
											<td onclick="javascript:location.href='<c:url value="/ "/>community/freeBoard'">
											
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
		<%@ include file="common/user_main_footer.jsp"%>

	</div>
	<!-- ./wrapper -->
	
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27d568fdc342b750d023d721195a14ac"></script>
	<script>

		var mapContainer = document.getElementById('gpxMap'), // 지도를 표시할 div 
			mapOption = {
				center: new kakao.maps.LatLng(37.548541, 126.996463), // 지도의 중심좌표
				level: 5 // 지도의 확대 레벨
			};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
		var bounds = new kakao.maps.LatLngBounds();

		// gpx 경로 지도 표시 ----------------------------------- start

		var points = [];
		<c:forEach items="${mapList }" var="map">

			var lat = "${map.lat}";
			var lon = "${map.lon}";
			var p = new kakao.maps.LatLng(lat, lon);
			points.push(p);

			// LatLngBounds 객체에 좌표를 추가합니다
			bounds.extend(p);

		</c:forEach >
		
		//polyline 
		var polyline = new kakao.maps.Polyline({
			map: map,
			path: points,
			strokeWeight: 2,
			strokeColor: '#FF00FF',
			strokeOpacity: 1,
			strokeStyle: 'solid'
		});

		polyline.setMap(map);
		
		// mark 표시 -------------------------------- start
		var startMarker = points[0];
		var endMarker = points[points.length-1];
		
		var startIcon = new kakao.maps.MarkerImage(
			    '<%= contextPath %>/img/start.png',
			    new kakao.maps.Size(31, 35)
			);
		
		var endIcon = new kakao.maps.MarkerImage(
			    '<%= contextPath %>/img/end.png',
			    new kakao.maps.Size(31, 35)
			);
		
		new kakao.maps.Marker({
		    position: startMarker,
		    image: startIcon
		}).setMap(map);
		

		new kakao.maps.Marker({
		    position: endMarker,
		    image: endIcon
		}).setMap(map);
		// mark 표시 -------------------------------- end
		
		// gpx 경로 지도 표시 --------------------------------- end

		// LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
		// 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
		map.setBounds(bounds);

	</script>
	
</body>

</html>