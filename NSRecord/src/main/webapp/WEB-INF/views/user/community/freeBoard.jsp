<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp" %>


<style>

h1{
	text-align: center;
}

.tStyle{
	text-align: center;
	width: 1000px;
	margin: auto;
}

.tStyle tr {
	height: 30px;

}

tr, td {
  border-bottom: 1px solid #ddd;
}

.writebtn {
  background-color: #5F9EA0; 
  color: white;
  border-radius: 4px;
  position: relative;
  left: 1200px;
  font-size: 12px; 
  padding: 10px 12px;
}


</style>
<script>
	var searchSort = "";
	var searchVal = "";

	$(function(){
		//페이지 처음 접근시 리스트 표시 좌표
		freeBoardAjaxfn(1);
	})

	//리스트 Ajax 처리
	function freeBoardAjaxfn(cPage){
		$.ajax({
			url: "<%=contextPath%>/community/freeBoardAjax", <%-- 가져올 Ajax의 위치--%>
			<%-- url에 같이 보낼 data --%>
			data: {		
				"cPage": cPage,
				"searchSort": searchSort,
				"searchVal": searchVal
			},
			dataType: "html", 
			success: function (data) {  <%-- controller에서 리턴해온 값이 data에 담겨 옴 --%>
				$('#freeBoardId').html(data); <%-- 가져온 Ajax를 어디에 넣을지 id로 위치 지정 --%>
			}
		})
	}

	//검색
	function searchBoxFn() {
		searchSort = $('#searchSort').val();
		searchVal = $('#searchVal').val();
		freeBoardAjaxfn(1);
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

		<h1>자유 게시판</h1>
		
<hr width=80%>


<div id="freeBoardId"></div>


<br>
<div class="box-body">

								<div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
									<div class="row">
										<div class="col-sm-6"></div>
										<div class="col-sm-6">
											<div id="example1_filter" class="dataTables_filter">
												<form action="javascript:searchBoxFn()">
													<div class="box-tools">
<!--                     				요기가 검색-->		<select class="form-control" name="searchSort" id="searchSort">
															<option value="b_seq">번호</option>
															<option value="b_title">제목</option>
															<option value="u_nickname">닉네임</option>
														</select>
														<div class="input-group input-group-sm" style="width: 150px;">
															<input type="text" name="searchVal" id="searchVal" class="form-control pull-right" placeholder="Search">
															<div class="input-group-btn">
<!--                                    요기까지     -->				<button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
															</div>
														</div>
													</div>
												</form>
											</div>

										</div>
									</div>
								</div>
							</div>
<a href="<%=contextPath%>/community/freeBoardWriter" class="writebtn">글쓰기</a>

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