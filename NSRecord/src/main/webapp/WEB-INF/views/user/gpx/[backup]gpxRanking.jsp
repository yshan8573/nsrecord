<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp"%>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<%@ include file="../common/user_main_header.jsp"%>

		<!-- Left side column. contains the logo and sidebar -->
		<%@ include file="../common/user_left_column.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

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
										<script type="text/javascript"
											src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27d568fdc342b750d023d721195a14ac"></script>
										<script>
										
											var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
												mapOption = {
													center: new kakao.maps.LatLng(37.548541, 126.996463), // 지도의 중심좌표
													level: 5 // 지도의 확대 레벨
												};

											// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
											var map = new kakao.maps.Map(mapContainer, mapOption);


											// gpx 불러오기
											$(function () {
												$.ajax({
													url: '<%=contextPath%>/upload/nansan.gpx',
													dataType : 'xml',
													success: startDataLayer
												});
											})
											
											function startDataLayer(xmlDoc) {

												// gpx -> xml console 분석 ---------------------------------- start
												console.log(xmlDoc);
												var loc = $(xmlDoc).find('trkpt');
												console.log(loc.eq(0).attr('lat'));
												console.log(loc.eq(0).attr('lon'));
												console.log(loc.children('ele').eq(0).text());
												console.log(loc.children('time').eq(0).text());
												// ------------------------------------------------- end

												// gpx 경로 지도 표시 ----------------------------------- start
												var points = [];
												$(xmlDoc).find("trkpt").each(function () {
													var lat = $(this).attr("lat");
													var lon = $(this).attr("lon");
													var p = new kakao.maps.LatLng(lat,lon);
													points.push(p);
												});
												
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
												
												// 그래프 고도 표시
												var eles = []; // 그래프 y축 고도 변수
												var times = []; // 그래프 x축 시간 변수
												var eleCount = 0;
												$(xmlDoc).find("ele").each(function () {
													var ele = Math.abs(Number($(this).text()));
													if(eleCount%60 == 0) {
														eles.push(ele);	
													}
													eleCount++;
												});
												var timeCount = 0;
												$(xmlDoc).find("time").each(function () {
													var time = $(this).text();
													if(timeCount%60 == 0) {
														times.push(timeCount);
													}
													timeCount++;
												});
												areaChart(eles,times);
												
											}
										</script>

									</div>
									<!-- /.box-body -->
								</div>
							</div>
						</div>
						<div class="row-md-6">
							<div class="col">

								<div class="box box-default">
									<div class="box-header with-border">
										<i class="fa fa-area-chart"></i>
										<h3 class="box-title">고도 그래프</h3>
									</div>
									<div class="box-body">
										<div class="chart">
											<canvas id="areaChart" style="height: 250px; width: 528px;" width="528" height="250"></canvas>
										</div>
										<script type="text/javascript">
											function areaChart(eleArray,timeArray) {

												  /* ChartJS
												     * -------
												     * Here we will create a few charts using ChartJS
												     */

												    //--------------
												    //- AREA CHART -
												    //--------------

												    // Get context with jQuery - using jQuery's .get() method.
												    var areaChartCanvas = $('#areaChart').get(0).getContext('2d')
												    // This will get the first returned node in the jQuery collection.
												    var areaChart       = new Chart(areaChartCanvas)

												    var areaChartData = {
												      labels  : timeArray,
												      datasets: [
												        {
												          label               : 'Electronics',
												          fillColor           : 'rgba(210, 214, 222, 1)',
												          strokeColor         : 'rgba(210, 214, 222, 1)',
												          pointColor          : 'rgba(210, 214, 222, 1)',
												          pointStrokeColor    : '#c1c7d1',
												          pointHighlightFill  : '#fff',
												          pointHighlightStroke: 'rgba(220,220,220,1)',
												          data                : eleArray
												        }
												      ]
												    }

												    var areaChartOptions = {
												      //Boolean - If we should show the scale at all
												      showScale               : true,
												      //Boolean - Whether grid lines are shown across the chart
												      scaleShowGridLines      : false,
												      //String - Colour of the grid lines
												      scaleGridLineColor      : 'rgba(0,0,0,.05)',
												      //Number - Width of the grid lines
												      scaleGridLineWidth      : 1,
												      //Boolean - Whether to show horizontal lines (except X axis)
												      scaleShowHorizontalLines: true,
												      //Boolean - Whether to show vertical lines (except Y axis)
												      scaleShowVerticalLines  : true,
												      //Boolean - Whether the line is curved between points
												      bezierCurve             : true,
												      //Number - Tension of the bezier curve between points
												      bezierCurveTension      : 0.3,
												      //Boolean - Whether to show a dot for each point
												      pointDot                : false,
												      //Number - Radius of each point dot in pixels
												      pointDotRadius          : 4,
												      //Number - Pixel width of point dot stroke
												      pointDotStrokeWidth     : 1,
												      //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
												      pointHitDetectionRadius : 20,
												      //Boolean - Whether to show a stroke for datasets
												      datasetStroke           : true,
												      //Number - Pixel width of dataset stroke
												      datasetStrokeWidth      : 2,
												      //Boolean - Whether to fill the dataset with a color
												      datasetFill             : true,
												      //Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
												      maintainAspectRatio     : true,
												      //Boolean - whether to make the chart responsive to window resizing
												      responsive              : true
												    }

												    //Create the line chart
												    areaChart.Line(areaChartData, areaChartOptions)

											}
										</script>
									</div>
									<!-- /.box-body -->
								</div>
								
								
								
								
								
								
								
								<script>
  $(function () {

	   
  })
</script>
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								

							</div>
						</div>

					</div>
					<div class="col-md-6">
						<div class="box box-default">
							<div class="box-header with-border">
								<i class="fa fa-trophy"></i>
								<h3 class="box-title">랭킹</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<button type="button" class="btn btn-info btn-lg" onclick="javascript:location.href='<%= contextPath %>/gpxTestContrller'">gpxReader Test</button>
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
		<%@ include file="../common/user_main_footer.jsp"%>

	</div>
	<!-- ./wrapper -->

</body>

</html>