<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>


</script>
<div class="row">
	<div class="col-sm-12">
		<table id="userNoticeBoard" class="table table-bordered table-hover dataTable" role="grid" style="text-align: center;">
			<thead>
				<tr role="row">
					<th class="" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
						aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending"
						style="width: 150px; text-align: center;">NO</th>
					<th class="" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
						aria-label="Platform(s): activate to sort column ascending" style="width: 700px; text-align: center;">제목
					</th>
					<th class="" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
						aria-label="Engine version: activate to sort column ascending" style="width: 150px; text-align: center;">작성자
					</th>
					<th class="" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
						aria-label="CSS grade: activate to sort column ascending" style="width: 150px; text-align: center;">조회수</th>
					<th class="" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
						aria-label="Browser: activate to sort column ascending" style="width: 150px; text-align: center;">작성일시</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="noticeList" items="${noticeList }">
					<tr role="row" onclick="javascript:location.href='<c:url value="/ "/>community/userNoticeBoardDetail?n_seq=${noticeList.n_seq }'" style="cursor: pointer;">
						<td class="">${noticeList.n_seq }</td>
						<td>${noticeList.n_title }</td>
						<td>${noticeList.u_name }</td>
						<td>${noticeList.n_count }</td>
						<td>${noticeList.n_date }</td>
					</tr>
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
							href="javascript:noticeBoardAjaxfn(${boardPager.prevPage})">Previous</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${boardPager.blockBegin }" end="${boardPager.blockEnd }">
					<c:choose>
						<c:when test="${num == boardPager.curPage }">
							<li class="paginate_button active"><a href="#">${num }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="paginate_button"><a href="javascript:noticeBoardAjaxfn(${num})">${num}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${boardPager.curBlock <= boardPager.totBlock }">
					<li class="paginate_button next" id="example1_next">
						<a href="javascript:noticeBoardAjaxfn(${boardPager.nextPage})">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</div>