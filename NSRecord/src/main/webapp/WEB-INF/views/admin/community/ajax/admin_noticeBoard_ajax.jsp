<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>


</script>

<div class="box-body">
	<div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
		<div class="row">
			<div class="col-sm-6"></div>
			<div class="col-sm-6">
				<div id="example1_filter" class="dataTables_filter">
					<form action="javascript:searchBoxFn()">
						<div class="box-tools">
							<select class="form-control" name="searchSort" id="searchSort">
								<option value="n_seq">번호</option>
								<option value="n_title">제목</option>
							</select>
							<div class="input-group input-group-sm" style="width: 150px;">
								<input type="text" name="searchVal" id="searchVal" class="form-control pull-right" placeholder="Search">
								<div class="input-group-btn">
									<button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
								</div>
							</div>
						</div>
					</form>
				</div>

			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<table id="adminNoticeBoard" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
					<thead>
						<tr role="row">
							<th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
								aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending"
								style="width: 185px;">NO</th>
							<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
								aria-label="Browser: activate to sort column ascending" style="width: 228px;">작성일시</th>
							<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
								aria-label="Platform(s): activate to sort column ascending" style="width: 202px;">제목
							</th>
							<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
								aria-label="Engine version: activate to sort column ascending" style="width: 158px;">작성자
							</th>
							<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"
								aria-label="CSS grade: activate to sort column ascending" style="width: 115px;">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="noticeList" items="${noticeList }">
							<tr role="row" class="odd">
								<td class="sorting_1">${noticeList.n_seq }</td>
								<td>${noticeList.n_seq }</td>
								<td>${noticeList.n_title }</td>
								<td>${noticeList.u_email }</td>
								<td>${noticeList.n_count }</td>
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
	</div>
</div>