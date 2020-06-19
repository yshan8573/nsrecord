<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp"%>


<script>
	
	// file 다운로드 클래스로 이동
	function fileDownload(path,oName,rName) {
		oName=encodeURIComponent(oName);
		location.href="<%= contextPath %>/fileDownload.do?path="+path+"&oName="+oName+"&rName="+rName;	
	}
</script>

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
					Notice Board Detail<small>공지사항 상세보기</small>
				</h1>
				<ol class="breadcrumb">
					<li><a
						href="javascript:location.href='<c:url value="/"/>adminHome'"><i
							class="fa fa-home"></i>Home</a></li>
					<li><a
						href="javascript:location.href='<c:url value="/"/>adminCommunity/adminNoticeBoard'">Notice
							Board</a></li>
					<li class="active">Detail</li>
				</ol>
			</section>


			<!-- Main content -->
			<section class="content container-fluid invoice">


				<!-- title row -->
				<div class="row">
					<div class="col-xs-12">
						<h2 class="page-header">
							<!-- <i class="fa fa-exclamation"></i> -->
							${notice.n_title } <small class="pull-right">Date:
								${notice.n_date }</small>
						</h2>
					</div>
					<!-- /.col -->
				</div>

				<!-- info row -->
				<div class="row invoice-info">
					<div class="col-sm-4 invoice-col" id="noticeBoardContent">${notice.n_content }</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->

				<!-- info row -->
				<div class="row invoice-info">
					<div class="col-sm invoice-col"></div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
				<br>
				<hr>
				<br>


				<!-- this row will not appear when printing -->
				<div class="row no-print">
					<div class="col-xs-6 flexBox" style="justify-content: flex-start;">
						<div>
							<b>첨부파일 :</b> ${notice.n_ori } &nbsp;&nbsp;&nbsp;
						</div>
						<button type="button" class="btn btn-primary pull-right"
							style="margin-right: 5px;"
							onclick="fileDownload('notice','${notice.n_ori}','${notice.n_re}');">
							<i class="fa fa-download"></i> Download
						</button>
					</div>
					<div class="col-xs-6">

						<button type="button" class="btn btn-danger pull-right"
							onclick="javascript:location.href='<%=contextPath%>/adminCommunity/adminNoticeBoardDelete?n_seq=${notice.n_seq }'">
							<i class="fa fa-trash"></i> 삭제하기
						</button>
						<button type="button" class="btn btn-success pull-right"
							style="margin-right: 5px;"
							onclick="javascript:location.href='<%=contextPath%>/adminCommunity/adminNoticeBoardUpdate?n_seq=${notice.n_seq }'">
							<i class="fa fa-magic"></i> 수정하기
						</button>

					</div>
				</div>









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