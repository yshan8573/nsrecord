<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp"%>
			
			

			
			
			<!-- JQUERY 함수 편집중 함수 편집중 -->
			<script>
			<%-- 업데이트 버튼 --%>
			$(document).ready(function() {
			$("#updateGpxBoard").click(function() {
				
				var g_seq = ${GpxDto.g_seq};
				
			var subject = $("#g_title").val();
			var content = $(".g_content").val();
			
			if(subject == ""){
				alert("제목을 입력해주세요");
				$("#g_title").focus();
				return;
			}
			
			if(content == "") {
				alert("내용을 입력해 주세요");
				$(".g_content").focus();
				return;
			}
			
			var yn = confirm("게시글을 수정하시겠습니까?");
			if(yn) {
				
				var fileCk = $("#inputFile").val();
				if(fileCk == "") {
					$("#inputFile").remove();
				}
				
				var url = "<%=contextPath%>"+"/gpx/gpxUpdate";
				$("#gpxBoardJquery").attr("action",url);
				$("#gpxBoardJquery").submit();
				
			}

			})	
			
			
			<%-- 목록 버튼 --%>
			$("#gpxBoard").click(function() {
				var url = "<%=contextPath%>"+"/gpx/gpxBoard";
				$("#gpxBoardJquery").attr("action",url);
				$("#gpxBoardJquery").submit();
				})	
			
			})//function end
			
			</script>
			
			
			
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
					GPX 게시글 조회<small>GPX 게시글 조회</small></h1>
				<ol class="breadcrumb">
					<li><a href="javascript:location.href='<c:url value=" /" />nsrecord/gpx/gpxBoard'"><i
							class="fa fa-home"></i>Home</a></li>
					<li><a href="javascript:location.href='<c:url value=" /" />nsrecord/gpx/gpxInsertForm'">GPX Board</a></li>
					<li class="active">Write</li>
				</ol>
			</section>


			<!-- Main content -->
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

									</div>
									<!-- /.box-body -->
								</div>
			
							</div>
						</div>

					</div>
			<%-- Form에 JQuery 함수 적용 --%>
			<section class="content container-fluid">

				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-body">
								<form id="gpxBoardJquery" method="post" enctype="multipart/form-data">
								<input type="hidden"  name="u_seq" value="${GpxDto.u_seq }">
								<input type="hidden" name="g_seq" value="${GpxDto.g_seq }">
									<div class="form-group">
										<label>제목</label>
									<input name="g_title" type="text" class="form-control" id="g_title" value="${GpxDto.g_title }" >
									</div>
									<div class="form-group">
									<textarea id="g_content" name="g_content" class="g_content">${GpxDto.g_content }</textarea>
									<input type="hidden" name="preG_ori" value="${GpxDto.g_ori }" />
									<input type="hidden" name="preG_re" value="${GpxDto.g_re }" />
									<input type="button" value="수정완료" id="updateGpxBoard">
									<input type="button" value="목록" id = "gpxBoard">
									</div>
									<!-- 파일 업로드 -->
									<div class="form-group">
                 					 <label for="inputFile">GPX 첨부파일</label>
										<input type="file" id="inputFile" name="gpxFile" value="${GpxDto.g_ori }">이전 파일 이름 : ${GpxDto.g_ori }
										<p class="help-block">파일 첨부 공간입니다.</p>
               					 </div>
									<script>
										$(function () {
											CKEDITOR.replace('g_content')
										})
									</script>
									<div class="form-group" style="text-align: right;">
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
			// gpx 경로 지도 표시 --------------------------------- end

			// LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
			// 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
			map.setBounds(bounds);

		</script>
		<!-- Main Footer -->
		  <%@ include file="../common/user_main_footer.jsp" %>

	</div>
	<!-- ./wrapper -->

</body>

</html>