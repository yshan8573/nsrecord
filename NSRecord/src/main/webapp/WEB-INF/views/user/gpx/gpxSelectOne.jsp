<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp"%>
<style>

	#response {
		margin:  auto;
		text-align: center;
	}
	
</style>
			
			
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
					
			<%-- 추천 버튼 --%>
			$("#gpxRC").click(function() {
				var url = "<%=contextPath%>"+"/gpx/gpxRecommand";
				$("#gpxBoardJquery").attr("action",url);
				$("#gpxBoardJquery").submit();
				})	
					
			})//function end

//댓글 수정			
function gpxReplyUpdate(gr_seq, gr_content, g_seq) {
 				//alert("접근 = ["+gr_seq+"]["+gr_content+"]["+g_seq+"]");
		  var location =  '#'+gr_seq;
		  //alert("접근 = "+location);
		  $(location).html("<textarea id='"+location+"' name='gr_content' rows='1' cols='25'>" + gr_content + "</textarea>");
		  
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
	//alert("접근 = "+gr_seq)

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
										<h3 class="box-title">댓글</h3>
									</div>
									<!-- /.box-header -->
									
									<div class="box-body">
				<form class="form-horizontal" action=" <c:url value='/'/>gpxBoardReply"  method="post">
					<input type="hidden" name="g_seq" value="${GpxDto.g_seq }">
                    <input type="hidden" name="u_seq" value="${user.u_seq }">
                    <input type="hidden" name="u_nickname" value="${user.u_nickname }">
                    <div class="form-group margin-bottom-none">
                      <div class="col-xs-5">
                        <input class="col-sm-12" id = "response" placeholder="악플사절" id="gr_conetent" name="gr_content">
                      </div>
                      <div class="col-sm-2">
                        <button type="submit" class="btn btn-block btn-success btn-sm">댓글등록</button>
                      </div>
                    </div>
                </form>
									</div>
									<!-- /.box-body -->
								</div>
			
							</div>
						</div>

					</div>
					
				<div class="row">
					<div class="col-xs-6">
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
									<input type="button" value="수정" id="updateGpxBoard" class="btn btn-success pull-right">
									<input type="button" value="삭제" id="deleteGpxBoard" onclick="confirm('삭제하시겠습니까?')" class="btn btn-danger pull-right">
									<input type="button" value="목록" id = "gpxBoard">
									</c:when>
									<c:otherwise>
									<input type="button" value="목록" id = "gpxBoard" class="btn btn-default">
									<input type="button" value="추천" id="gpxRC" class="btn btn-default">
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
							onclick="fileDownload('gpx/gpx','${GpxDto.g_ori}','${GpxDto.g_re}');">
							<i class="fa fa-download"></i> Download
						</button>
					</div>
					
									<script>
										$(function () {
											CKEDITOR.replace('g_content', ckeditor_config)
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
<div class="col-xs-5" >
<c:forEach var="GpxReply" items="${GpxReply }">
                  <div class="user-block">
                        <span class="username" >${GpxReply.u_nickname }</span>
                        <input type="hidden" name="gr_seq" value="${GpxReply.gr_seq }">
                        <input type="hidden" name="u_seq" value="${GpxReply.u_seq }">
                               	<div class="col-xs-5" id = '${GpxReply.gr_seq }' >
                  <input type="text" class="form-control" value="${GpxReply.gr_content }" readonly="readonly">
                </div>
				 <div class="GpxreplyUpdateButton${GpxReply.gr_seq }">
				 <c:choose>
                <c:when test="${GpxReply.u_seq eq  user.u_seq}">
				<input type="button" class="btn btn-info btn-flat"  value="수정"  onclick="gpxReplyUpdate(${GpxReply.gr_seq },'${GpxReply.gr_content }',${GpxDto.g_seq })">
				 <input type="button" class="btn btn-warning" id="gpxReplyDeleteButton"  value="삭제" onclick="deleteGpxReply(${GpxReply.gr_seq}, ${GpxDto.g_seq })">
				 </c:when>
				 </c:choose> 
				  </div>
             
                  </div>
                </c:forEach>	
              
                  </div>	
</form>	



		

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
		<!-- Main Footer -->
		  <%@ include file="../common/user_main_footer.jsp" %>

	</div>
	<!-- ./wrapper -->

</body>

</html>