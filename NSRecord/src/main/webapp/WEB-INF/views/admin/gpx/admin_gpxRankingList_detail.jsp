<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp" %>


<script>

</script>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<%@ include file="../common/admin_main_header.jsp" %>

		<!-- Left side column. contains the logo and sidebar -->
		<%@ include file="../common/admin_left_column.jsp" %>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					GpxRanking Course Detail <small>GPX Ranking Course 상세 정보</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="javascript:location.href='<c:url value=" /" />adminHome'"><i
							class="fa fa-home"></i>Home</a></li>
					<li class="">GpxRanking List</li>
					<li class="active">GpxRanking Course Detail</li>
				</ol>
			</section>


			<!-- Main content -->
			<section class="content container-fluid">




				<div class="row">
					<div class="col-md-6">
						<div class="row-md-6">
							<div class="col">
								<div class="box box-default">
									<div class="box-header with-border">
										<i class="fa fa-map"></i>
										<h3 class="box-title">지도</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<div id="map" style="width: 100%; height: 350px;"></div>

									</div>
									<!-- /.box-body -->
								</div>
							</div>
						</div>
						<div class="row-md-6">
							<div class="col">
								<div class="box box-solid">
									<div class="box-header with-border">
										<i class="fa fa-info-circle"></i>
										<h3 class="box-title">정보</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<dl class="dl-horizontal">
											<dt>출발 좌표</dt>
											<dd id="grcStartPoint">
												위도 : ${fn:split(grc.grc_start,',')[0]} º
												&nbsp;&nbsp;&nbsp;
												경도 : ${fn:split(grc.grc_start,',')[1]} º
											</dd>
											<br>
											<dt>도착 좌표</dt>
											<dd id="grcEndPoint">
												위도 : ${fn:split(grc.grc_end,',')[0]} º
												&nbsp;&nbsp;&nbsp;
												경도 : ${fn:split(grc.grc_end,',')[1]} º
											</dd>
											<br>
											<dt>총 거리</dt>
											<dd id="polylineLength">약 ${grc.grc_length } (km)</dd>
										</dl>
									</div>
									<!-- /.box-body -->
								</div>
			
							</div>
						</div>

					</div>
					<div class="col-md-6">

						<div class="row-md-6">
							<div class="col">
								<div class="box box-default">
									<div class="box-header with-border">
										<i class="fa  fa-file-text"></i>
										<h3 class="box-title">GPX 코스 내용</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<form id="grcDetailFrn" action="#" method="post">
											<div class="form-group">
												<label>제목</label>
												<input name="grc_title" type="text" class="form-control" placeholder="입력하세요.." required="required" value="${grc.grc_title }">
											</div>
											<div class="form-group">
												<label>내용</label>
												<textarea id="grc_content" name="grc_content"required="required">${grc.grc_content }</textarea>
											</div>
											<script>
												$(function () {
													CKEDITOR.replace('grc_content', ckeditor_config);
												})
											</script>
											<div class="form-group" style="text-align: right;">
												<input type="hidden" name="grc_seq" value="${grc.grc_seq }"/>
												<input type="button" class="btn btn-primary" value="수정" onclick="updateGrcFn()"/>
												<input type="button" class="btn btn-danger" value="삭제" onclick="deleteGrcFn()"/>
											</div>
										</form>
									</div>
									<!-- /.box-body -->
								</div>
							</div>
						</div>


					</div>
				</div>



			</section>
			<!-- /.content -->



		</div>
		<!-- /.content-wrapper -->





		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27d568fdc342b750d023d721195a14ac"></script>
		<script>

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
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
			
			var polyline = new kakao.maps.Polyline({
				map: map,
				path: points,
				strokeWeight: 2,
				strokeColor: '#FF00FF',
				strokeOpacity: 1,
				strokeStyle: 'solid'
			});

			polyline.setMap(map);
			// gpx 경로 지도 표시 --------------------------------- end

			// LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
			// 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
			map.setBounds(bounds);

		</script>
		
		<script type="text/javascript">
			function updateGrcFn() {
				var action = '<%= contextPath %>/adminGpx/adminGrcUpdateEnd';
				$('#grcDetailFrn').attr('action', action);
				$('#grcDetailFrn').submit();
				
			}
			
			function deleteGrcFn() {
				var action = '<%= contextPath %>/adminGpx/adminGrcDeleteEnd';
				$('#grcDetailFrn').attr('action', action);
				$('#grcDetailFrn').submit();
				
			}
		</script>







		<!-- Main Footer -->
		<%@ include file="../common/admin_main_footer.jsp" %>

	</div>
	<!-- ./wrapper -->

</body>

</html>