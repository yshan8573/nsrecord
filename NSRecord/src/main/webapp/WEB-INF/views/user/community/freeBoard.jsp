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



      <!-- Main content -->
      <section class="content container-fluid">

		<h1>자유 게시판</h1>
<hr width=80%>

<table>
	<c:choose>
		<c:when test="${fn:length(freeBoardList) > 0 }">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>글쓴이</td>
				<td>조회수</td>
				<td>댓글수</td>
				<td>작성일</td>
			</tr>
		</c:when>
	</c:choose>
	<c:forEach var="freeBoard" items="${freeBoardList}">
		<tr>
			<td>${freeBoard.b_seq}</td>
			<td><a href="<%=contextPath%>/freeBoardContent?b_seq=${freeBoard.b_seq}">${freeBoard.b_title}</a>			</td>
			<td>${freeBoard.u_nickname}</td>
			<td>${freeBoard.b_count}</td>
			<td>${freeBoard.b_reply}</td>
			<td>${freeBoard.b_date}</td>
		</tr>
	</c:forEach>
</table>

<a href="<%=contextPath%>/community/freeBoardWriter">글쓰기</a>

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