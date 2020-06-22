<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String contextPath = request.getContextPath();
%>


	
<table class='tStyle'>
	<thead>
	<c:choose>
		<c:when test="${fn:length(myReplyList) > 0 }">
			<tr>
				<td>번호</td>
				<td>댓글 내용</td>
				<td>글쓴이</td>
				<td>작성일</td>
			</tr>
		</c:when>
	</c:choose>
	</thead>
	<tbody>
	


	<c:forEach var="myReply" items="${myReplyList}">
			<tr>
				<td>${myReply.r_seq}</td>
				<td><a href="<%=contextPath%>/freeBoardContent?b_seq=${myReply.b_seq}">${myReply.r_content}</a>			</td>
				<td>${myReply.u_nickname}</td>
				<td>${myReply.r_date}</td>
			</tr>
	</c:forEach>

	
	</tbody>
</table>
<br>
<div class="row">
	<div class="col-sm-5">
		<div class="dataTables_info" id="example1_info" role="status" aria-live="polite"></div>
	</div>
	<div class="col-sm-7">
		<div class="dataTables_paginate paging_simple_numbers">
			<ul class="pagination">
				<c:if test="${boardPager.curBlock > 1 }">
					<li class="paginate_button previous disabled"><a
							href="javascript:myReplyAjaxfn(${boardPager.prevPage})">Previous</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${boardPager.blockBegin }" end="${boardPager.blockEnd }">
					<c:choose>
						<c:when test="${num == boardPager.curPage }">
							<li class="paginate_button active"><a href="#">${num}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="paginate_button"><a href="javascript:myReplyAjaxfn(${num})">${num}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${boardPager.curBlock <= boardPager.totBlock }">
					<li class="paginate_button next" id="example1_next">
						<a href="javascript:myReplyAjaxfn(${boardPager.nextPage})">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</div>
