<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<style>
	.grcListBox {
		display: flex;
		justify-content: flex-start;
		align-items: center;
		flex-wrap: wrap;
		background-color: lightgray;
		margin-bottom: 20px;
		padding : 20px;
		
	}
	.grcBox {
		width: 280px;
		margin: 10px 20px;
		
	}
	
</style>
<div class="grcListBox">
	<c:forEach var="grcList" items="${grcList }">
		<div class="grcBox box box-solid" onclick="javascript:location.href='<c:url value="/"/>adminGpx/adminGpxRankingListDetail?grc_seq=${grcList.grc_seq }'">
			<div class="box-header with-border">
				<i class="fa fa-photo"></i>
				<h3 class="box-title">${grcList.grc_title }</h3>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<img class="img-responsive" src="<c:url value='/'/>data/gpxRanking/img/${grcList.grc_imgRe }"
					alt="Photo">
				<hr>
				<dl>
					<dt>등록 일시</dt>
					<dd>${grcList.grc_date }</dd>
				</dl>
			</div>
			<!-- /.box-body -->
		</div>
	</c:forEach>
</div>
<div class="row">
	<div class="col-xs-12" style="text-align: center;">
		<div class="box box-solid">
			<div class="dataTables_paginate paging_simple_numbers">
				<ul class="pagination">
					<c:if test="${boardPager.curBlock > 1 }">
						<li class="paginate_button previous disabled"><a
								href="javascript:gpxRankingListAjaxfn(${boardPager.prevPage})">Previous</a>
						</li>
					</c:if>
					<c:forEach var="num" begin="${boardPager.blockBegin }" end="${boardPager.blockEnd }">
						<c:choose>
							<c:when test="${num == boardPager.curPage }">
								<li class="paginate_button active"><a href="#">${num }</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="paginate_button"><a href="javascript:gpxRankingListAjaxfn(${num})">${num}</a>
								</li>
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
</div>