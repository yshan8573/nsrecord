<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<style>

</style>
<div class="row">
<%-- 
	<div class="col-sm-12">
		<c:forEach var="grcList" items="${grcList }">
			<div class="grcListBox" onclick="javascript:location.href='<c:url value="/ "/>adminGpx/adminGpxRankingListDetail?grc_seq=${grcList.grc_seq }'">
				<div>
					<img alt="" src="">
				</div>
			</div>
		
		
		
							<td class="">${grcList.grc_seq }</td>
							<td>${grcList.grc_title }</td>
							<td>${grcList.grc_date }</td>
						</tr>
		</c:forEach>
	
	</div>
 --%>


	<div class="col-sm-12">
		<table id="adminNoticeBoard" class="table table-bordered table-hover dataTable" role="grid">
			<thead>
				<tr role="row">
					<th class="" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
						aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending"
						style="width: 185px;">NO</th>
					<th class="" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
						aria-label="Platform(s): activate to sort column ascending" style="width: 202px;">제목
					</th>
					<th class="" tabindex="0" aria-controls="adminNoticeBoard" rowspan="1" colspan="1"
						aria-label="Browser: activate to sort column ascending" style="width: 228px;">작성일시</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="grcList" items="${grcList }">
					<tr role="row" onclick="javascript:location.href='<c:url value="/ "/>adminGpx/adminGpxRankingListDetail?grc_seq=${grcList.grc_seq }'">
						<td class="">${grcList.grc_seq }</td>
						<td>${grcList.grc_title }</td>
						<td>${grcList.grc_date }</td>
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
					<li class="paginate_button previous disabled"><a href="javascript:gpxRankingListAjaxfn(${boardPager.prevPage})">Previous</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${boardPager.blockBegin }" end="${boardPager.blockEnd }">
					<c:choose>
						<c:when test="${num == boardPager.curPage }">
							<li class="paginate_button active"><a href="#">${num }</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="paginate_button"><a href="javascript:gpxRankingListAjaxfn(${num})">${num}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${boardPager.curBlock <= boardPager.totBlock }">
					<li class="paginate_button next" id="example1_next">
						<a href="javascript:gpxRankingListAjaxfn(${boardPager.nextPage})">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</div>