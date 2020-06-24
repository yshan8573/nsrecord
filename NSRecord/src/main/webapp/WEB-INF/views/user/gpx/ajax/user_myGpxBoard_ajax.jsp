<%@page import="com.nsrecord.service.GpxServiceImpl"%>
<%@page import="com.nsrecord.dto.GpxDto"%>
<%@page import="com.nsrecord.dto.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%String contextPath = request.getContextPath();%>
<script>


</script>
<div class="row">
	<div class="col-sm-12">
		<table id="gpxBoard" class="table table-bordered table-hover dataTable" role="grid">
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
				<c:forEach var="myGpxList" items="${myGpxList }">
					<c:choose>
					<c:when test="${myGpxList.u_seq eq user.u_seq }">
					<tr role="row">
						<td class="">${myGpxList.g_seq }</td>
						<td onclick="javascript:location.href='<c:url value="/ "/>gpx/gpxBoardSelectOne?g_seq=${myGpxList.g_seq }'">
						 
						 <c:set var="g_title" value="${myGpxList.g_title }"></c:set>
							<c:choose>
								<c:when test="${fn:length(g_title) > 20}">
									${fn:substring(g_title,0,20) }
								</c:when>
								<c:otherwise>
									${g_title }
								</c:otherwise>
							</c:choose>
						 
						 </td>
						<td>${myGpxList.u_nickname }</td>
						<td>${myGpxList.g_count }</td>
						<td>${myGpxList.g_recommand }</td>
					</tr>
					</c:when>
					<c:otherwise>
					작성한 게시물이 없습니다.
					</c:otherwise>
					</c:choose>
				</c:forEach>

			</tbody>
		</table>
	</div>
</div>
<div class="row">
	<div class="col-sm-5">
		<div class="dataTables_info" id="example1_info" role="status" aria-live="polite"></div>
	</div>
	<div class="col-sm-7">
		<div class="dataTables_paginate paging_simple_numbers">
			<ul class="pagination">
				<c:if test="${boardPager.curBlock > 1 }">
					<li class="paginate_button previous disabled"><a
							href="javascript:myGpxBoardAjaxfn(${boardPager.prevPage})">Previous</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${boardPager.blockBegin }" end="${boardPager.blockEnd }">
					<c:choose>
						<c:when test="${num == boardPager.curPage }">
							<li class="paginate_button active"><a href="#">${num }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="paginate_button"><a href="javascript:myGpxBoardAjaxfn(${num})">${num}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${boardPager.curBlock <= boardPager.totBlock }">
					<li class="paginate_button next" id="example1_next">
						<a href="javascript:myGpxBoardAjaxfn(${boardPager.nextPage})">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</div>