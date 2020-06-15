<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp" %>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
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
	$(document).ready(function(){
		$("#updateReply").click(function(){
			var url = "<%=contextPath%>" + "/community/updateReply";
			$("#replyUpdate").attr("action", url);
			$("#replyUpdate").submit();
		});
		$("#deleteReply").click(function(){
			var url = "<%=contextPath%>" + "/community/deleteReply";
			$("#replyUpdate").attr("action", url);
			$("#replyUpdate").submit();
		});
	});
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
<form id="freeBoardUpdate">
<table border="1" >
	<tr>
		<td>글 번호: ${FreeBoardDto.b_seq}</td>
		<td rowspan=2>글 제목: ${FreeBoardDto.b_title}</td>
		<td>글쓴이: ${FreeBoardDto.u_nickname}</td>
	<tr>	
	<tr>
		<td>조회수: ${FreeBoardDto.b_count}</td>
		<td></td>
		<td>작성일: ${FreeBoardDto.b_date}</td>
	</tr>
	<tr>
		<td colspan=3>${FreeBoardDto.b_content}</td>
	</tr>
	<tr>
		<td>
			<input type="hidden" name="b_seq" value="${FreeBoardDto.b_seq}">
			<input type="hidden" name="b_title" value="${FreeBoardDto.b_title}">
			<input type="hidden" name="u_nickname" value="${FreeBoardDto.u_nickname}">
			<input type="hidden" name="b_count" value="${FreeBoardDto.b_count}">
			<input type="hidden" name="b_date" value="${FreeBoardDto.b_date}">
			<input type="hidden" name="b_content" value="${FreeBoardDto.b_content}">
			<input type="hidden" name="u_seq" value="${FreeBoardDto.u_seq}">
			<input type="button" id="updateFreeBoardContent" value="수정">
			<input type="button" id="deleteFreeBoardContent" value="삭제">
		</td>	
	</tr>		
</table>
</form>

<form id="replyUpdate">
<table>
	<c:forEach var="replyDto" items="${replyDto}"> 
	<tr>
		<td>${replyDto.u_nickname}</td>
		<td>${replyDto.r_content}</td>
		<td>${replyDto.r_date}</td>
		<td>
			<input tyep="hidden" name="r_seq" value="${replyDto.r_seq}">
			<input type="hidden" name="b_seq" value="${replyDto.b_seq}">
			<input type="hidden" name="u_seq" value="${replyDto.u_seq}">
			<input type="hidden" name="r_content" value="${replyDto.r_content}">
			<input type="hidden" name="u_nickname" value="${replyDto.u_nickname}">
			<input type="hidden" name="r_date" value="${replyDto.r_date}">
			<input type="button" id="updateReply" value="수정">
			<input type="button" id="deleteReply" value="삭제">
		</td>
	</tr>
	</c:forEach>
</table>
</form>


<form action="<%=contextPath%>/community/reply">
<table>
	<tr>
	<td><textarea id="r_content" name="r_content" required></textarea></td>
	<td><input type='submit' value='등록'></td>
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