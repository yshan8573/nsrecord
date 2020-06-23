<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp"%>

<style>
	.gpxMapDiv {
		display: flex;
		justify-content: center;
		align-items: center;
		border: 1px solid black;
		border-radius: 5px;
	}

	.gpxMapDiv>img {
		height: 50%;
	}
	
</style>
<script>
var doubleSubmitFlag = false;
function doubleSubmitCheck() {
	
	if(doubleSubmitFlag) {
		
		return doubleSubmitFlage;
		
	} else {
		
		doubleSubmitFlag = true;
		return false;
		
	}
	
}//function end

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
					GPX<small>GPX 글쓰기</small>
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

										<div id="gpxMap">
											<div class="gpxMapDiv" style="width: 100%; height: 350px;">
												<img alt="지도 아이콘" src="<%= contextPath %>/img/map_icon.png">
											</div>
										</div>

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

								</div>
							</div>
						</div>
					</div>
				<div class="row">
					<div class="col-xs-6">
						<div class="box">
							<div class="box-body">
								<form id="gpxInsertResult" action="<c:url value='/'/>gpx/gpxInsertResult" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label>제목</label>
										<input name="g_title" type="text" class="form-control" placeholder="입력하세요.." required="required">
									</div>
									<div class="form-group">
										<label>내용</label>
										<textarea id="g_content" name="g_content" required="required"></textarea>
									</div>
									<!-- 파일 업로드 -->
									<div class="form-group">
                 					 <label for="inputFile">GPX 첨부파일</label>
										<input type="file" id="inputFile" name="gpxFile" accept=".gpx" onchange="fileChangeFn()">
										<p class="help-block">gpx파일 첨부 공간입니다.</p>
               					 </div>
									<script>
										$(function () {
											CKEDITOR.replace('g_content', ckeditor_config)
										})
									</script>
									<div class="form-group" style="text-align: right;">
										<input type="submit" class="btn btn-primary" value="작성완료" onclick="doubleSubmitCheck()"/>
										<input type="reset">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

			</section>
			<!-- /.content -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27d568fdc342b750d023d721195a14ac"></script>
			<script src="https://cdn.rawgit.com/eligrey/FileSaver.js/5ed507ef8aa53d8ecfea96d96bc7214cd2476fd2/FileSaver.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.5.0-beta4/html2canvas.js"></script>
			<script>

				// 파일 임시 저장 이후 gpx 정보 가져오기
				function fileChangeFn() {
					var formLoc = $('#gpxInsertResult')[0]; // javascript 방식으로 파일 위치 저장.
					var fileData = new FormData(formLoc); // 파일 값 가져오기
					
					$.ajax({
						url: '<%= contextPath %>/gpxFileChange',
						type: 'POST',
						enctype: 'multipart/form-data',
						processData: false,
						contentType: false,
						data: fileData,
						dataType: 'html',
						success: function (data) {
							$('#gpxMap').html('');
							$('#gpxMap').html(data);
						}
					});

				}

</script>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		  <%@ include file="../common/user_main_footer.jsp" %>

	</div>
	<!-- ./wrapper -->

</body>

</html>