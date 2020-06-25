<%@page import="com.nsrecord.dto.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp" %>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	//게시글 수정 및 삭제
	$(document).ready(function(){
		$("#updateFreeBoardContent").click(function(){
			var url = "<%=contextPath%>" + "/community/updateFreeBoardContent";
			$("#freeBoardUpdate").attr("action", url);
			$("#freeBoardUpdate").submit();
		});
		$("#deleteFreeBoardContent").click(function(){
			var url = "<%=contextPath%>" + "/community/deleteFreeBoardContent";
			$("#freeBoardUpdate").attr("action", url);
			$("#freeBoardUpdate").submit();
		});
		$("#returnToIndex").click(function(){
			var url ="<%=contextPath%>" + "/community/freeBoard";
			$("#freeBoardUpdate").attr("action", url);
			$("#freeBoardUpdate").submit();
		});
	});
	
	
	//댓글 수정 기능
	function updateReplyFn(r_seq, r_content, b_seq) {
		var location = '#rContent_' + r_seq;
		$(location).html("<textarea id='"+location+"' name='r_content' rows='1' cols='50' style='width: 990px'>" + r_content + "</textarea>");
		var btnLocation = '.replyUpdateTool' + r_seq;
		$(btnLocation).html('<input type="button" class="btn btn-primary" style="padding: 0px 5px" value="수정 완료" onclick="replyUpdateEnd(' + r_seq+', \''+r_content+'\', '+b_seq + ')">')
	}
	function replyUpdateEnd(r_seq, r_content, b_seq){
		var loc = '#rContent_' + r_seq;
		var value = document.getElementById(loc).value;
		location.href="<%=contextPath%>/community/updateReplyEnd?r_seq=" + r_seq + "&r_content=" + value + "&b_seq=" + b_seq;
	}
	
	
	//댓글 삭제 기능
	function deleteReplyFn(r_seq, b_seq){
		location.href="<%=contextPath%>/community/deleteReply?r_seq=" + r_seq + "&b_seq=" + b_seq;
	}
	
	//댓글 더블 서브밋 중복 방지
	var doubleSubmitFlag = false;
	function doubleSubmitCheck(){
		if(doubleSubmitFlag){
			return doubleSubmitFlag;
		} else {
			doubleSubmitFlag = true;
			return false;
		}	
	}
	
	//댓글 등록
	$(document).ready(function(){
		$("#replySubmit").click(function(){
			if(doubleSubmitCheck()){ return;}//더블 서브밋 중복 방지
											//값이 true가 안 되면 return이 작동하지 않음. 이후 코드로 넘어감
											//값이 true가 되면 return이 작동해 이후 코드로 넘어가지 않고 그 자리에서 끝남.
			
			var url = "<%=contextPath%>" + "/community/reply";
			$("#replySubmitEnd").attr("action", url);
			$("#replySubmitEnd").submit();
		});
	});	
	

	
</script>

<style>
	.boardCol {
		max-width: 150px;
	}
</style>

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
						<h3 class="box-title">자유 게시판</h3>
					</div>
				</div>
			</div>
			<div class="box-body">
				<div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
					<div class="row" style="margin-bottom: 10px; min-height: 425px;">
						<div class="col-sm-12">
							<table class="table table-bordered table-hover dataTable" role="grid">
								<thead>	
									<tr role="row">
										<th class="boardCol" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
											aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">글 번호: ${FreeBoardDto.b_seq}</th>
										<th class="" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
											aria-label="Browser: activate to sort column ascending" style="width: 50%;">글 제목: ${FreeBoardDto.b_title}</th>
										<th class="boardCol" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
											aria-label="Platform(s): activate to sort column ascending">글쓴이: ${FreeBoardDto.u_nickname}</th>
									</tr>
									<tr role="row">		
										<th class="boardCol" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
											aria-label="Engine version: activate to sort column ascending">조회수: ${FreeBoardDto.b_count}</th>
										<th class="boardCol" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending"></th>
										<th class="boardCol" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending">작성일: ${FreeBoardDto.b_date}</th>
									</tr>
								</thead>
							</table>
							${FreeBoardDto.b_content}
						</div>
					</div>
				</div>
			</div>
			<hr width=100%>
			<form id="replyUpdate">
				<table class="table table-bordered table-hover dataTable" role="grid">
					<tr role="row">
						<td colspan=5>댓글</td>
					</tr>
					<c:forEach var="replyDto" items="${replyDto}"> 
						<tr role="row">
							<td class="boardCol" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
											aria-label="Platform(s): activate to sort column ascending" style="text-align: center">${replyDto.u_nickname}</td>
							<td class="" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
											aria-label="Browser: activate to sort column ascending" style="width: 65%;" id="rContent_${replyDto.r_seq}">${replyDto.r_content}</td>
							<td class="boardCol" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending" style="text-align: center; width: 150px">${replyDto.r_date}</td>
							<td>
							<c:if test="${replyDto.u_seq == User.u_seq}"> 
								<input type="hidden" name="r_seq" value="${replyDto.r_seq}">
								<input type="hidden" name="b_seq" value="${replyDto.b_seq}">
								<input type="hidden" name="u_seq" value="${replyDto.u_seq}">
								<input type="hidden" name="r_content" value="${replyDto.r_content}">
								<input type="hidden" name="u_nickname" value="${replyDto.u_nickname}">
								<input type="hidden" name="r_date" value="${replyDto.r_date}">
								<div class='replyUpdateTool${replyDto.r_seq}' style="padding: 0px 10px; text-align: center" >
								<input type="button"  class="btn btn-primary" style="padding: 0px 5px" value="수정" onclick="updateReplyFn(${replyDto.r_seq}, '${replyDto.r_content}', ${replyDto.b_seq})">
								<input type="button"  class="btn btn-primary" style="padding: 0px 5px" value="삭제" onclick="deleteReplyFn(${replyDto.r_seq}, ${replyDto.b_seq})"></div>
							</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
			</form>
			<div>
				<form id='replySubmitEnd'>
					<textarea id="r_content" name="r_content" rows="3" cols="150" style="margin: 10px; width: 95%; height: 90px" required></textarea>
					<input type='button' id='replySubmit' class="btn btn-primary" style="padding: 2px 5px; margin-top: -6.5%" value='등록'>
					<input type="hidden" name="b_seq" value="${FreeBoardDto.b_seq}">
					<input type="hidden" name="u_seq" value="${User.u_seq}">
					<input type="hidden" name="u_nickname" value="${User.u_nickname}">
				</form>
			</div>
		</div>
	</div>
</div>
										
<form id="freeBoardUpdate">
	<div class="form-group" style="text-align: right; padding: 0 30px">
		<c:if test="${FreeBoardDto.u_seq == User.u_seq}">
			<input type="hidden" name="b_seq" value="${FreeBoardDto.b_seq}">
			<input type="hidden" name="b_title" value="${FreeBoardDto.b_title}">
			<input type="hidden" name="u_nickname" value="${FreeBoardDto.u_nickname}">
			<input type="hidden" name="b_count" value="${FreeBoardDto.b_count}">
			<input type="hidden" name="b_date" value="${FreeBoardDto.b_date}">
			<input type="hidden" name="b_content" value="${FreeBoardDto.b_content}">
			<input type="hidden" name="u_seq" value="${FreeBoardDto.u_seq}">
			<input type="hidden" name="b_status" value="${FreeBoardDto.b_status}">
			<input type="button" class="btn btn-primary"  id="updateFreeBoardContent" style="border: none;" value="수정">
			<input type="button" class="btn btn-primary"  id="deleteFreeBoardContent" style="border: none;" value="삭제">		
		</c:if>		
			<input type="button" class="btn btn-primary" id="returnToIndex" value="목록">
	</div>
</form>

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