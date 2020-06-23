<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String contextPath = request.getContextPath();
%>


<div class="box-body">

	<table class="table table-bordered">
		<thead>
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
		</thead>
		<tbody>
			<c:forEach var="freeBoard" items="${freeBoardList}">
				<tr>
					<td>${freeBoard.b_seq}</td>
					<td><a href="<%=contextPath%>/preFreeBoardContent?b_seq=${freeBoard.b_seq}">${freeBoard.b_title}</a>			</td>
					<td>${freeBoard.u_nickname}</td>
					<td>${freeBoard.b_count}</td>
					<td>${freeBoard.b_reply}</td>
					<td>${freeBoard.b_date}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

			<ul class="pagination">
				<c:if test="${boardPager.curBlock > 1 }">
					<li class="paginate_button previous disabled"><a
							href="javascript:freeBoardAjaxfn(${boardPager.prevPage})">Previous</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${boardPager.blockBegin }" end="${boardPager.blockEnd }">
					<c:choose>
						<c:when test="${num == boardPager.curPage }">
							<li class="paginate_button active"><a href="#">${num}</a>
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
