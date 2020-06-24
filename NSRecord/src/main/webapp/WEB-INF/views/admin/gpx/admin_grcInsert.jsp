<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp" %>

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
					GpxRanking Course Register <small>GPX 코스 등록</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="javascript:location.href='<c:url value=" /" />adminHome'"><i
							class="fa fa-home"></i>Home</a></li>
					<li class="">GpxRanking List</li>
					<li class="active">GpxRanking Course Register</li>
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
									<!-- /.box-header -->
									<div class="box-body">
										<dl class="dl-horizontal">
											<dt>출발 좌표</dt>
											<dd id="grcStartPoint"></dd>
											<br>
											<dt>도착 좌표</dt>
											<dd id="grcEndPoint"></dd>
											<br>
											<dt>총 거리</dt>
											<dd id="polylineLength"></dd>
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
										<h3 class="box-title">GPX 코스 등록</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<form id="grcInsertFrn" action="<%= contextPath %>/adminGpx/adminGrcInsertEnd" method="post" enctype="multipart/form-data">
											<div class="form-group">
												<label>제목</label>
												<input name="grc_title" type="text" class="form-control" placeholder="입력하세요.." required="required">
											</div>
											<div class="form-group">
												<label>내용</label>
												<textarea id="grc_content" name="grc_content"required="required"></textarea>
											</div>
											<script>
												$(function () {
													CKEDITOR.replace('grc_content', ckeditor_config);
												})
											</script>
											<div class="form-group">
												<div class='row'>
													<div class="col-md-6">
														<label for="inputFileImg">이미지 첨부</label>
														<input type="file" id="inputFileImg" name="upFileImg" accept="image/*" onchange="" required="required">
														<p class="help-block">메인 이미지를 등록해주세요.</p>
													</div>
													<div class="col-md-6">
														<div class="timeline-body">
                  											<img id="previewImg" src="http://placehold.it/150x100" alt="..." class="margin" style="width: 150px; height: 100px;">
                										</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6">
														<label for="inputFile">GPX 첨부</label>
														<input type="file" id="inputFile" name="upFile" accept=".gpx" onchange="fileChangeFn()" required="required">
														<p class="help-block">코스가 기록된 gpx파일을 등록해주세요.</p>
													</div>
												</div>
											</div>
											<div class="form-group flexBox" style="justify-content: space-between;">
												<div class="checkbox" style="padding: 0 10px;">
								                  <label>
								                    <input type="checkbox" name="grc_status" value="M" checked="checked"/>메인페이지에 표시하기 (한 코스만 등록 가능합니다)
								                  </label>
								                </div>
												<div>
													<input type="hidden" name="grc_start"/>
													<input type="hidden" name="grc_end"/>
													<input type="hidden" name="grc_length"/>
													<input type="submit" class="btn btn-primary" value="작성완료" />
												</div>
											</div>>
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
			
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27d568fdc342b750d023d721195a14ac"></script>
			<script src="https://cdn.rawgit.com/eligrey/FileSaver.js/5ed507ef8aa53d8ecfea96d96bc7214cd2476fd2/FileSaver.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.5.0-beta4/html2canvas.js"></script>
			<script>

				// 파일 임시 저장 이후 gpx 정보 가져오기
				function fileChangeFn() {
					var formLoc = $('#grcInsertFrn')[0]; // javascript 방식으로 파일 위치 저장.
					var fileData = new FormData(formLoc); // 파일 값 가져오기
					
					$.ajax({
						url: '<%= contextPath %>/grcFileChange',
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
				
				// 등록된 이미지 미리보기 ------------------------------------------------------- start
			    function readURL(input) {
			        if (input.files && input.files[0]) {
			            var reader = new FileReader();
			            reader.onload = function(e) {
			                $('#previewImg').attr('src', e.target.result);
			            }
			            reader.readAsDataURL(input.files[0]);
			        }
			    }

			    $("#inputFileImg").change(function() {
			        readURL(this);
			    });
			 	// 등록된 이미지 미리보기 ------------------------------------------------------- end

			    
			    
			    
				// html2canvas test
				<%-- 
				function testFn() {
					
					html2canvas($('#gpxMap')[0]).then(function(canvas) {
						var image = canvas.toDataURL("image/png");
					    var imgDataUrl = image.replace("image/png", "image/octet-stream");
					    $('#test').attr('src',imgDataUrl);
					    var blobBin = atob(imgDataUrl.split(',')[1]);	// base64 데이터 디코딩
					    var array = [];
					    for (var i = 0; i < blobBin.length; i++) {
					        array.push(blobBin.charCodeAt(i));
					    }
					    var file = new Blob([new Uint8Array(array)], {type: 'image/jpeg'});	// Blob 생성
					    var formdata = new FormData();	// formData 생성
					    formdata.append("file", file);	// file data 추가
					    
					    $.ajax({
					        type : 'post',
					        url : '<%= contextPath %>/saveImage',
					        data : formdata,
					        processData : false,	// data 파라미터 강제 string 변환 방지!!
					        contentType : false,	// application/x-www-form-urlencoded; 방지!!
					        success : function (data) {
					        	alert(data);
					        }
					    });
					    
					});
 				

				}
				--%>				


			</script>



		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@ include file="../common/admin_main_footer.jsp" %>

	</div>
	<!-- ./wrapper -->

</body>

</html>