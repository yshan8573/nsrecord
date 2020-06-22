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
	});
	
	
	//댓글 수정 기능
	function updateReplyFn(r_seq, r_content, b_seq) {
		var location = '#rContent_' + r_seq;
		$(location).html("<textarea id='"+location+"' name='r_content' rows='1' cols='50'>" + r_content + "</textarea>");
		var btnLocation = '.replyUpdateTool' + r_seq;
		$(btnLocation).html('<input type="button" class="rBtnStyle" style="border: none;" value="수정 완료" onclick="replyUpdateEnd(' + r_seq+', \''+r_content+'\', '+b_seq + ')">')
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
	
</script>

<style>

h1{
	text-align: center;
}

.tStyle{
	text-align: center;
	width: 1000px;
	height: 150px;
	margin: auto;
}

.rStyle{
	text-align: center;
	width: 1000px;
	height: 100px;
	margin: auto;
}

.rBtnStyle{
  background-color: #5F9EA0;
  color: white;
  border-radius: 4px;
  position: relative;
  font-size: 12px; 
}

tr, td {
  border-bottom: 1px solid #ddd;
}

.freeBoardContentUpdateBtn {
  background-color: #5F9EA0;
  color: white;
  border-radius: 4px;
  position: relative;
  left: 1200px;
  font-size: 12px; 
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


<h1>자유 게시판</h1>
<hr width=80%>
<form id="freeBoardUpdate">
<table class="tStyle">
	<tr>
		<td>글 번호: ${FreeBoardDto.b_seq}</td>
		<td>글 제목: ${FreeBoardDto.b_title}</td>
		<td>글쓴이: ${FreeBoardDto.u_nickname}</td>
	<tr>	
	<tr>
		<td>조회수: ${FreeBoardDto.b_count}</td>
		<td></td>
		<td>작성일: ${FreeBoardDto.b_date}</td>
	</tr>
	<tr>
		<td colspan=3 style="text-align: center;">${FreeBoardDto.b_content}</td>
	</tr>
</table>

<br>
<c:if test="${FreeBoardDto.u_seq == User.u_seq}">
	<div>
			<input type="hidden" name="b_seq" value="${FreeBoardDto.b_seq}">
			<input type="hidden" name="b_title" value="${FreeBoardDto.b_title}">
			<input type="hidden" name="u_nickname" value="${FreeBoardDto.u_nickname}">
			<input type="hidden" name="b_count" value="${FreeBoardDto.b_count}">
			<input type="hidden" name="b_date" value="${FreeBoardDto.b_date}">
			<input type="hidden" name="b_content" value="${FreeBoardDto.b_content}">
			<input type="hidden" name="u_seq" value="${FreeBoardDto.u_seq}">
			<input type="button" class="freeBoardContentUpdateBtn" id="updateFreeBoardContent" style="border: none;" value="수정">
			<input type="button" class="freeBoardContentUpdateBtn" id="deleteFreeBoardContent" style="border: none;" value="삭제">		
			</div>
</c:if>		
</form>

<hr width=80%>

<form id="replyUpdate">
<table class="rStyle">
	<tr>
		<td colspan=5>댓글</td>
	</tr>
	<c:forEach var="replyDto" items="${replyDto}"> 
	<tr>
		<td>${replyDto.u_nickname}</td>
		<td id="rContent_${replyDto.r_seq}">${replyDto.r_content}</td>
		<td >${replyDto.r_date}</td>
		<td>
		<c:if test="${replyDto.u_seq == User.u_seq}"> 
			<input type="hidden" name="r_seq" value="${replyDto.r_seq}">
			<input type="hidden" name="b_seq" value="${replyDto.b_seq}">
			<input type="hidden" name="u_seq" value="${replyDto.u_seq}">
			<input type="hidden" name="r_content" value="${replyDto.r_content}">
			<input type="hidden" name="u_nickname" value="${replyDto.u_nickname}">
			<input type="hidden" name="r_date" value="${replyDto.r_date}">
			<div class='replyUpdateTool${replyDto.r_seq}'>
			<input type="button"  class="rBtnStyle" style="border: none;" value="수정" onclick="updateReplyFn(${replyDto.r_seq}, '${replyDto.r_content}', ${replyDto.b_seq})">
			<input type="button"  class="rBtnStyle" style="border: none;" value="삭제" onclick="deleteReplyFn(${replyDto.r_seq}, ${replyDto.b_seq})"></div>
		</c:if>	
		</td>
		
		</tr>
	</c:forEach>
</table>
</form>



<form action="<%=contextPath%>/community/reply">
<table class="tStyle">
	<tr>
	<td><textarea id="r_content" name="r_content" rows="3" cols="150" required></textarea></td>
	<td><input type='submit' class='rBtnStyle' style='border: none;' value='등록'></td>
	</tr>
</table>
	<input type="hidden" name="b_seq" value="${FreeBoardDto.b_seq}">
	<input type="hidden" name="u_seq" value="${User.u_seq}">
	<input type="hidden" name="u_nickname" value="${User.u_nickname}">
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