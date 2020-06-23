<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp" %>
<style>
h1 {
	text-align:center;
}
table{
	margin: auto;
	text-align:center;
}

</style>
<script>
	var searchSort = "";	//변수 초기화
	var searchVal = "";		//변수 초기화

	$(function () {
		// 페이지 처음 접근시 리스트 표시 좌표
		adminUserListAjaxfn(1);	//현재 page =1 ->기본시작, 접근하는 순간 시작
	})

	// 리스트 Ajax 처리
	function adminUserListAjaxfn(cPage) {
		$.ajax({
			url: "<c:url value="/"/>adminUser/adminUserListAjax",
			data: {
				"cPage": cPage,
				"searchSort": searchSort,
				"searchVal": searchVal,
			},
			dataType: "html",
			success: function (data) {
				$('#admin_userList').html(data);
			}
		})
	}

	//search ----------------------
	function searchBoxFn() {
		searchSort = $('#searchSort').val();
		searchVal = $('#searchVal').val();
		adminUserListAjaxfn(1);
	}

</script>

<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

    <!-- Main Header -->
    <%@ include file="../common/admin_main_header.jsp" %>

    <!-- Left side column. contains the logo and sidebar -->
    <%@ include file="../common/admin_left_column.jsp" %>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
    
	

	<section class="content-header">
      		<h1>
				User List <small>회원 정보 확인</small>
			</h1>

      <ol class="breadcrumb">
					<li><a href="javascript:location.href='<c:url value=" /" />userHome"><i class="fa fa-home"></i>
						Home</a></li>
					<li><a href="javascript:location.href='<c:url value=" /" />nsrecord/adminUser/adminUserList'">User List</a></li>
				</ol>
    </section>
      <!-- Main content -->
      <section class="content container-fluid">
	
			   <div id="admin_userList"></div>
          </section>
      <!-- /.content -->
    
    </div>
    
    
 
    <!-- /.content-wrapper -->


      
    <!-- Main Footer -->
    <%@ include file="../common/admin_main_footer.jsp" %>

  </div>
  <!-- ./wrapper -->

</body>

</html>