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
			var url = "<%=contextPath%>"+"/gpx/gpxUpdateForm";
			$("#gpxBoardJquery").attr("action",url);
			$("#gpxBoardJquery").submit();
			})	
			<%-- 목록 버튼 --%>
			$("#gpxBoard").click(function() {
				var url = "<%=contextPath%>"+"/gpx/gpxBoard";
				$("#gpxBoardJquery").attr("action",url);
				$("#gpxBoardJquery").submit();
				})	
				<%-- 삭제 버튼 --%>
			$("#deleteGpxBoard").click(function() {
					var url = "<%=contextPath%>"+"/gpx/gpxDelete";
					$("#gpxBoardJquery").attr("action",url);
					$("#gpxBoardJquery").submit();
					})	
			})//function end

//댓글 수정			
function gpxReplyUpdate(gr_seq, gr_content, g_seq) {
 				//alert("접근 = ["+'.'+gr_seq+"]["+gr_content+"]["+g_seq+"]");
		  var location =  '#'+gr_seq;
		  $(location).html("<textarea id='"+location+"' name='gr_content' rows='1' cols='50'>" + gr_content + "</textarea>");
		  
		  var btnLocation = '.GpxreplyUpdateButton' + gr_seq;
		$(btnLocation).html('<input type="button" class="rBtnStyle" value="수정 완료" onclick="replyUpdateEnd(' + gr_seq+', \''+gr_content+'\', '+g_seq + ')">')
	 }
 function replyUpdateEnd(gr_seq, gr_content, g_seq){
	var loc = '#'+gr_seq;
	var value = document.getElementById(loc).value;
	location.href = '<%=contextPath%>/gpx/gpxUpdateReply?gr_seq=' + gr_seq + '&gr_content=' + value + '&g_seq=' + g_seq;
				   }

 
 //댓글 삭제
function deleteGpxReply(gr_seq, g_seq) {
	alert("접근 = "+gr_seq)

	location.href = '<c:url value="/"/>gpx/gpxDeleteReply?gr_seq='+gr_seq+ '&g_seq=' + g_seq;
}
 
 //파일 다운로드
function fileDownload(path,oName,rName) {
	oName=encodeURIComponent(oName);
	location.href="<%= contextPath %>/fileDownload.do?path="+path+"&oName="+oName+"&rName="+rName;	
	}
 
 
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
					GPX 게시글 조회<small>GPX 게시글 조회</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="javascript:location.href='<c:url value=" /" />nsrecord/gpx/gpxBoard'"><i
							class="fa fa-home"></i>Home</a></li>
					<li><a href="javascript:location.href='<c:url value=" /" />nsrecord/gpx/gpxInsertForm'">GPX Board</a></li>
					<li class="active">Write</li>
				</ol>
			</section>


			<!-- Main content -->
			<%-- Form에 JQuery 함수 적용중 --%>
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

											// 지도를 표시하는 div 크기를 변경하는 함수입니다
											function resizeMap() {
											    var mapContainer = document.getElementById('map');
											    mapContainer.style.width = '650px';
											    mapContainer.style.height = '650px'; 
											}

											function relayout() {    
											    
											    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
											    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
											    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
											    map.relayout();
											}

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
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-body">
								<form id="gpxBoardJquery" method="post">
								<input type="hidden"  name="u_seq" value="${GpxDto.u_seq }">
								<input type="hidden" name="g_seq" value="${GpxDto.g_seq }">
								<input type="hidden" name="u_nickname" value="${GpxDto.u_nickname }">
									<div class="form-group">
										<label>제목</label>
									<input name="g_title" type="text" class="form-control" value="${GpxDto.g_title }" readonly>
									</div>
									<div class="form-group">
									
									<textarea id="g_content" name="g_content" readonly="readonly">${GpxDto.g_content }</textarea>
								
								<c:choose>
									<c:when test="${user.u_seq eq GpxDto.u_seq }">
									<input type="button" value="수정" id="updateGpxBoard">
									<input type="button" value="삭제" id="deleteGpxBoard">
									<input type="button" value="목록" id = "gpxBoard">
									</c:when>
									<c:otherwise>
									<input type="button" value="목록" id = "gpxBoard">
									</c:otherwise>
									</c:choose>
									
									
									
									</div>
									
									<!-- this row will not appear when printing -->
				<div class="row no-print">
					<div class="col-xs-6 flexBox" style="justify-content: flex-start;">
					
						<div>
							<b >첨부파일 :</b>${GpxDto.g_ori }&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<button type="button" class="btn btn-primary pull-right"
							style="margin-right: 5px;"
							onclick="fileDownload('gpx','${GpxDto.g_ori}','${GpxDto.g_re}');">
							<i class="fa fa-download"></i> Download
						</button>
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
				
				
<form class="form-horizontal" id="gpxReplyUpdateJquery" method="post">
<div class="post clearfix">
<c:forEach var="GpxReply" items="${GpxReply }">
                  <div class="user-block">
                        <span class="username" >${GpxReply.u_nickname }	
                        <input type="hidden" name="gr_seq" value="${GpxReply.gr_seq }">
                        <input type="hidden" name="u_seq" value="${GpxReply.u_seq }">
                         <p id = "grBox${gr_seq}">
	                         	<div id='${GpxReply.gr_seq }' >${GpxReply.gr_content }</div>
				                 <div class="GpxreplyUpdateButton${GpxReply.gr_seq }">
				              
				                <%--<c:if test="${user eq GpxReply.u_seq }"> --%>
				                <input type="button"  value="수정"  onclick="gpxReplyUpdate(${GpxReply.gr_seq },'${GpxReply.gr_content }',${GpxDto.g_seq })">
				                </div>
				                <input type="button" class="gpxReplyDeleteButton"  value="삭제" onclick="deleteGpxReply(${GpxReply.gr_seq}, ${GpxDto.g_seq })">	
	                  			
	                  			<%--</c:if>--%>
	                  		</p>	
                        </span>
                    <span class="description">${ GpxReply.gr_date}</span>
                  </div>
                </c:forEach>	
              
                  </div>	
</form>	



		
<form class="form-horizontal" action=" <c:url value='/'/>gpxBoardReply"  method="post">
					<input type="hidden" name="g_seq" value="${GpxDto.g_seq }">
                    <input type="hidden" name="u_seq" value="${user.u_seq }">
                    <input type="hidden" name="u_nickname" value="${user.u_nickname }">
                    <div class="form-group margin-bottom-none">
                      <div class="col-sm-9">
                        <input class="form-control input-sm" placeholder="Response" id="gr_conetent" name="gr_content">
                      </div>
                      <div class="col-sm-3">
                        <button type="submit" class="btn btn-danger pull-right btn-block btn-sm">댓글 등록</button>
                      </div>
                    </div>
                  </form>
			</section>
			<!-- /.content -->



		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		  <%@ include file="../common/user_main_footer.jsp" %>

	</div>
	<!-- ./wrapper -->

</body>

</html>