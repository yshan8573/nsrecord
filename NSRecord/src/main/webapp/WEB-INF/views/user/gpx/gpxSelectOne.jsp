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
					<div class="col-xs-12">
						<div class="box">
							<div class="box-body">
								<form id="gpxBoardJquery" method="post">
								<input type="hidden"  name="u_seq" value="${GpxDto.u_seq }">
								<input type="hidden" name="g_seq" value="${GpxDto.g_seq }">
									<div class="form-group">
										<label>제목</label>
									<input name="g_title" type="text" class="form-control" value="${GpxDto.g_title }" readonly>
									</div>
									<div class="form-group">
									<textarea id="g_content" name="g_content" readonly="readonly">${GpxDto.g_content }</textarea>
									<input type="button" value="수정" id="updateGpxBoard">
									<input type="button" value="삭제" id="deleteGpxBoard">
									<input type="button" value="목록" id = "gpxBoard">
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

		<!-- Main Footer -->
		  <%@ include file="../common/user_main_footer.jsp" %>

	</div>
	<!-- ./wrapper -->

</body>

</html>