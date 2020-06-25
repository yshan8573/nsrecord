<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp"%>

<style>
	.rowBox {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.imgBox {
		border: 1px solid black;
		border-radius: 10px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.mainImg {
		height : 400px;
	}
</style>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<%@ include file="../common/admin_main_header.jsp"%>

		<!-- Left side column. contains the logo and sidebar -->
		<%@ include file="../common/admin_left_column.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Admin Main Img <small>메인이미지 설정</small>
				</h1>
				<ol class="breadcrumb">
					<li><a
						href="javascript:location.href='<c:url value="/"/>adminHome'"><i
							class="fa fa-home"></i> Home</a></li>
					<li class="active">Admin Main Img</li>
				</ol>
			</section>


			<!-- Main content -->
			<section class="content container-fluid">

				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">메인 이미지 설정</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-footer">
						<button type="button" class="btn btn-primary" onclick="fileChangeFn();">수정하기</button>
					</div>

				</div>
				
					<form role="form" id="mainImgFrn">
							<div class="form-group">
								<div class="row margin-bottom">
									<div class="col-sm-4">
										<div class="box box-primary">
											<div class="box-body">
												<div>
													<label for="exampleInputFile">메인 이미지 슬라이드 -1</label>
													<input type="file" id="inputFileImg1" name="upFile1" accept="image/*" onchange="" required="required">
													<p class="help-block"></p>
												</div>
												<div class="imgBox">
													<img id="previewImg1" class="mainImg img-responsive" src="">
												</div>
											</div>
										</div>
									</div>
									<!-- /.col -->
									<div class="col-sm-4">
										<div class="box box-primary">
											<div class="box-body">
												<div>
													<label for="exampleInputFile">메인 이미지 슬라이드 -2</label>
													<input type="file" id="inputFileImg2" name="upFile2" accept="image/*" onchange="" required="required">
													<p class="help-block"></p>
												</div>
												<div class="imgBox">
													<img id="previewImg2" class="mainImg img-responsive fa" src="">
												</div>
											</div>
										</div>
									</div>
									<!-- /.col -->
									<div class="col-sm-4">
										<div class="box box-primary">
											<div class="box-body">
												<div>
													<label for="exampleInputFile">메인 이미지 슬라이드 -3</label>
													<input type="file" id="inputFileImg3" name="upFile3" accept="image/*" onchange="" required="required">
													<p class="help-block"></p>
												</div>
												<div class="imgBox">
													<img id="previewImg3" class="mainImg img-responsive" src="">
												</div>
											</div>
										</div>
									</div>
									<!-- /.col -->
                  				</div>
							</div>
						<!-- /.box-body -->

					</form>

				<script>
				
					function fileChangeFn() {
						var formLoc = $('#mainImgFrn')[0]; // javascript 방식으로 파일 위치 저장.
						var fileData = new FormData(formLoc); // 파일 값 가져오기
						
						$.ajax({
							url: '<%= contextPath %>/imgFileChange',
							type: 'POST',
							enctype: 'multipart/form-data',
							processData: false,
							contentType: false,
							data: fileData,
							dataType: 'html',
							success: function (data) {
								if(data == 'success') {
									alert("이미지 수정 완료");
								}
							}
						});
	
					}
				
					// 등록된 이미지 미리보기 ------------------------------------------------------- start
					function readURL(num,input) {
						if (input.files && input.files[0]) {
							var reader = new FileReader();
							reader.onload = function(e) {
								$('#previewImg'+num).attr('src', e.target.result);
							}
							reader.readAsDataURL(input.files[0]);
						}
					}

					$("#inputFileImg1").change(function() {
						readURL(1,this);
					});
					$("#inputFileImg2").change(function() {
						readURL(2,this);
					});
					$("#inputFileImg3").change(function() {
						readURL(3,this);
					});
					// 등록된 이미지 미리보기 ------------------------------------------------------- end
				</script>




			</section>
			<!-- /.content -->



		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@ include file="../common/admin_main_footer.jsp"%>

	</div>
	<!-- ./wrapper -->

</body>

</html>