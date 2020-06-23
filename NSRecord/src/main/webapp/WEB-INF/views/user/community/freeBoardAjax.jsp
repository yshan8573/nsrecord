<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String contextPath = request.getContextPath();
%>

<style>
	.boardCol {
		max-width: 150px;
	}
</style>

<div class="row" style="margin-bottom: 10px; min-height: 425px;">
	<div class="col-sm-12">
		<table id="userNoticeBoard" class="table table-bordered table-hover dataTable" role="grid">
			<thead>
				<tr role="row">
					<th class="boardCol" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
						aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">번호</th>
					<th class="" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
						aria-label="Browser: activate to sort column ascending" style="width: 50%;">제목</th>
					<th class="boardCol" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
						aria-label="Platform(s): activate to sort column ascending">글쓴이</th>
					<th class="boardCol" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
						aria-label="Engine version: activate to sort column ascending">조회수
					</th>
					<th class="boardCol" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
						aria-label="CSS grade: activate to sort column ascending">댓글수</th>
					<th class="boardCol" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
						aria-label="CSS grade: activate to sort column ascending">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="freeBoard" items="${freeBoardList}">
					<tr>
						<td>${freeBoard.b_seq}</td>
						<td><a href="<%=contextPath%>/preFreeBoardContent?b_seq=${freeBoard.b_seq}">${freeBoard.b_title}</a></td>
						<td>${freeBoard.u_nickname}</td>
						<td>${freeBoard.b_count}</td>
						<td>${freeBoard.b_reply}</td>
						<td>${freeBoard.b_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<div class="row flexBox" style="padding: 0 10px;">
	<div class="col-sm-5">
		<div class="dataTables_info" id="example1_info" role="status" aria-live="polite">
			<button type="button" class="btn btn-primary" onclick="javascript:location.href='<%=contextPath%>/community/freeBoardWriter'">글쓰기</button>
		</div>
	</div>
	<div class="col-sm-7">
		<div class="dataTables_paginate paging_simple_numbers">
			<ul class="pagination">
				<c:if test="${boardPager.curBlock > 1 }">
					<li class="paginate_button previous disabled"><a
							href="javascript:freeBoardAjaxfn(${boardPager.prevPage})">Previous</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${boardPager.blockBegin }" end="${boardPager.blockEnd }">
					<c:choose>
						<c:when test="${num == boardPager.curPage }">
							<li class="paginate_button active"><a href="#">${num }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="paginate_button"><a href="javascript:freeBoardAjaxfn(${num})">${num}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${boardPager.curBlock <= boardPager.totBlock }">
					<li class="paginate_button next" id="example1_next">
						<a href="javascript:freeBoardAjaxfn(${boardPager.nextPage})">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
	
</div>
