<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp" %>

<script>
	var searchSort = "";
	var searchVal = "";

	$(function(){
		//페이지 처음 접근시 리스트 표시 좌표
		myReplyAjaxfn(1);
	})

	//리스트 Ajax 처리
	function myReplyAjaxfn(cPage){
		$.ajax({
			url: "<%=contextPath%>/myPage/myReplyAjax", <%-- 가져올 Ajax의 위치--%>
			<%-- url에 같이 보낼 data --%>
			data: {		
				"cPage": cPage,
				"searchSort": searchSort,
				"searchVal": searchVal
			},
			dataType: "html", 
			success: function (data) {  <%-- controller에서 리턴해온 값이 data에 담겨 옴 --%>
				$('#myReplyId').html(data); <%-- 가져온 Ajax를 어디에 넣을지 id로 위치 지정 --%>
			}
		})
	}

	//검색
	function searchBoxFn() {
		searchSort = $('#searchSort').val();
		searchVal = $('#searchVal').val();
		myReplyAjaxfn(1);
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



<!-- Main content -->
<section class="content container-fluid">
<div class="row" style="padding: 20px;">
		<div class="col-xs-12">
			<div class="box" style="padding: 20px;">
				<div class="box-header">
					<div class="row">
						<div class="col flexBox" style="justify-content: center; padding: 0 16px;">
							<h3 class="box-title">마이 댓글 관리</h3>
						</div>
					</div>
				</div>
				<div class="box-body">
					<div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
						<div class="row">
							<div class="col-sm-6"></div>
							<div class="col-sm-6">
								<div id="example1_filter" class="dataTables_filter">
									<form action="javascript:searchBoxFn()">									
										<div class="box-tools">
											<div class="input-group input-group-sm">
												<div class="flexBox">
													<select class="form-control" name="searchSort" id="searchSort">
														<option value="r_seq">번호</option>
														<option value="r_content">댓글</option>
													</select>
													<input type="text" name="searchVal" id="searchVal" class="form-control pull-right" placeholder="Search">
													<div class="input-group-btn">
														<button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
													</div>
												</div>
											</div>
										</div>
									</form>			
								</div>
							</div>
						</div>
						<div id="myReplyId"></div>
					</div>
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