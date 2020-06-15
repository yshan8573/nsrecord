<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp" %>

<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

    <!-- Main Header -->
    <%@ include file="../common/user_main_header.jsp" %>

    <!-- Left side column. contains the logo and sidebar -->
    <%@ include file="../common/user_left_column.jsp" %>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
	<script>
			$(document).ready(function() {
			$("#whereGpxBoard").click(function() {
			var url = "<%=contextPath%>"+"/gpx/gpxWhere";
			$("#gpxBoardJquery").attr("action",url);
			$("#gpxBoardJquery").submit();
			})
			
			})//function end
			
		</script>

      <!-- Main content -->
      <section class="content container-fluid">

		<h1>GPX 공유 게시판목록.</h1>

      </section>
      <!-- /.content -->


<section class="content container-fluid">

				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<div class="row">
									<div class="col flexBox" style="justify-content: flex-start; padding: 0 16px;">
										<h3 class="box-title">GPX 리스트</h3>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button" class="btn btn-primary" onclick="javascript:location.href='<c:url value='/'/>gpx/gpxInsertForm'">글쓰기</button>
									</div>
								</div>
							</div>
							<div class="box-body">
								<div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
									<div class="row">
										<div class="col-sm-6">
											<div class="dataTables_length" id="example1_length">
												<label>Show <select name="example1_length" aria-controls="example1"
														class="form-control input-sm">
														<option value="10">10</option>
														<option value="25">25</option>
														<option value="50">50</option>
														<option value="100">100</option>
													</select> entries
												</label>
											</div>
										</div>
										
										<!-- 페이징, 검색기능 작성중 -->
										<div class="col-sm-6">
 						
											<div id="example1_filter" class="dataTables_filter"> -->
											<form action="<c:url value='/'/>gpx/gpxWhere" id="whereGpxBoard" method="post">
 												<label>Search:<input type="search" class="form-control input-sm" 
													placeholder="" aria-controls="example1" name="search"></label> 
 														<button type="submit" class="btn btn-primary" >검색</button> 
											</form> 
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12">
											<table id="example1" class="table table-bordered table-striped dataTable"
												role="grid" aria-describedby="example1_info">
												<thead>
													<tr role="row">
														<th class="sorting_asc" tabindex="0" aria-controls="example1"
															rowspan="1" colspan="1" aria-sort="ascending"
															aria-label="Rendering engine: activate to sort column descending"
															style="width: 185px;">글 번호</th>
														<th class="sorting" tabindex="0" aria-controls="example1"
															rowspan="1" colspan="1"
															aria-label="Browser: activate to sort column ascending"
															style="width: 228px;">제목</th>
														<th class="sorting" tabindex="0" aria-controls="example1"
															rowspan="1" colspan="1"
															aria-label="Platform(s): activate to sort column ascending"
															style="width: 202px;">작성자</th>
														<th class="sorting" tabindex="0" aria-controls="example1"
															rowspan="1" colspan="1"
															aria-label="Engine version: activate to sort column ascending"
															style="width: 158px;">조회수</th>
														<th class="sorting" tabindex="0" aria-controls="example1"
															rowspan="1" colspan="1"
															aria-label="CSS grade: activate to sort column ascending"
															style="width: 115px;">추천수</th>
													</tr>
												</thead>
												
												<tbody>
												<c:forEach var="gpxList" items="${gpxList}" varStatus="i">
												
													<tr role="row" class="odd">
														<td class="sorting_1">${gpxList.g_seq }</td>
														<td><a href="<%=contextPath%>/gpx/gpxBoardSelectOne?g_seq=${gpxList.g_seq }">${gpxList.g_title }</a></td>
														<td>${gpxList.u_nickname }</td>
														<td>${gpxList.g_count }</td>
														<td>${gpxList.g_recommand }</td>
													</tr>
												</c:forEach>
												</tbody>
												<tfoot>
													<tr>
														<th rowspan="1" colspan="1">글 번호</th>
														<th rowspan="1" colspan="1">제목</th>
														<th rowspan="1" colspan="1">작성자</th>
														<th rowspan="1" colspan="1">조회수</th>
														<th rowspan="1" colspan="1">추천수</th>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-5">
											<div class="dataTables_info" id="example1_info" role="status"
												aria-live="polite">Showing 1 to 10 of 57 entries</div>
										</div>
										<div class="col-sm-7">
											<div class="dataTables_paginate paging_simple_numbers"
												id="example1_paginate">
												<ul class="pagination">
													<li class="paginate_button previous disabled"
														id="example1_previous"><a href="#" aria-controls="example1"
															data-dt-idx="0" tabindex="0">Previous</a></li>
													<li class="paginate_button active"><a href="#"
															aria-controls="example1" data-dt-idx="1" tabindex="0">1</a>
													</li>
													<li class="paginate_button "><a href="#" aria-controls="example1"
															data-dt-idx="2" tabindex="0">2</a></li>
													<li class="paginate_button "><a href="#" aria-controls="example1"
															data-dt-idx="3" tabindex="0">3</a></li>
													<li class="paginate_button "><a href="#" aria-controls="example1"
															data-dt-idx="4" tabindex="0">4</a></li>
													<li class="paginate_button "><a href="#" aria-controls="example1"
															data-dt-idx="5" tabindex="0">5</a></li>
													<li class="paginate_button "><a href="#" aria-controls="example1"
															data-dt-idx="6" tabindex="0">6</a></li>
													<li class="paginate_button next" id="example1_next"><a href="#"
															aria-controls="example1" data-dt-idx="7"
															tabindex="0">Next</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</section>




    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <%@ include file="../common/user_main_footer.jsp" %>

  </div>
  <!-- ./wrapper -->

</body>

</html>