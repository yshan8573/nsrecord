<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp" %>



<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

<script>

	//더블 서브밋 중복 방지
	var doubleSubmitFlag = false;
	function doubleSubmitCheck(){
		if(doubleSubmitFlag){
			return doubleSubmitFlag;
		} else {
			doubleSubmitFlag = true;
			return false;
		}	
	}
	
	$(document).ready(function(){
		$("#freeBoardWrite").click(function(){
			if(doubleSubmitCheck()) return;//더블 서브밋 중복 방지
			
			var url = "<%=contextPath%>" + "/community/freeBoardWriteEnd";
			$("#freeBoardWriteEnd").attr("action", url);
			$("#freeBoardWriteEnd").submit();
		});
	});	

</script>

    <!-- Main Header -->
    <%@ include file="../common/user_main_header.jsp" %>

    <!-- Left side column. contains the logo and sidebar -->
    <%@ include file="../common/user_left_column.jsp" %>

    <!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Free Board Write<small>자유게시판 글쓰기</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="javascript:location.href='<c:url value=" /" />userHome'"><i
							class="fa fa-home"></i>Home</a></li>
					<li><a href="javascript:location.href='<c:url value=" /" />community/freeBoard'">Free
						Board</a></li>
					<li class="active">Write</li>
				</ol>
			</section>


			<!-- Main content -->
			<section class="content container-fluid">

				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-body">
								<form id="freeBoardWriteEnd" method="post">
									<div class="form-group">
										<label>제목</label>
										<input name="b_title" type="text" class="form-control" placeholder="입력하세요.." required="required">
									</div>
									<div class="form-group">
										<textarea id="b_content" name="b_content" required="required"></textarea>
									</div>
									<script>
										$(function () {
											CKEDITOR.replace('b_content')
										})
									</script>
									<div class="form-group" style="text-align: right;">
										<input type="hidden" name="u_nickname" value="${User.u_nickname}">
										<input type="hidden" name="u_seq" value="${User.u_seq}">
										<input type="button" id="freeBoardWrite" class="btn btn-primary" value="작성완료"/>
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