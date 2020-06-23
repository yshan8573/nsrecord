<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">회원 정보</h3>
            </div>
            <!-- /.box-header -->
            
          <div class="box-body">
          	<div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
          		<div class="row"><div class="col-sm-6"></div>
          			<div class="col-sm-6"></div>
          		</div>
          		<div class="row">
          		<div class="col-sm-12">
          <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
			<thead>
				<c:choose>
					<c:when test="${fn:length(list)>0 }">
						<tr role="row">
							<th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">회원코드</th>
							<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">이메일</th>
							<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">이름</th>
							<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">닉네임</th>
							<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">전화번호</th>
							<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">등록일</th>
							<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">상태</th>
							<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">자전거 모델</th>
						</tr>
					</c:when>
				</c:choose>
			</thead>
		
			<tbody>
				<c:forEach var="userInfo" items="${list}">
					<tr role="row" class="odd">
						<td>${userInfo.u_seq }</td>
						<td>${userInfo.u_email }</td>
						<td>${userInfo.u_name }</td>
						<td>${userInfo.u_nickname }</td>
						<td>${userInfo.u_phone }</td>
						<td>${userInfo.u_enrolldate }</td>
						<td>${userInfo.u_status }</td>
						<td>${userInfo.u_cycle}</td>
					</tr>
			
				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>
</div>
</div>
</div>
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
							href="javascript:adminUserListAjaxfn(${boardPager.prevPage})">Previous</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${boardPager.blockBegin }" end="${boardPager.blockEnd }">
					<c:choose>
						<c:when test="${num == boardPager.curPage }">
							<li class="paginate_button active"><a href="#">${num}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="paginate_button"><a href="javascript:adminUserListAjaxfn(${num})">${num}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${boardPager.curBlock <= boardPager.totBlock }">
					<li class="paginate_button next" id="example1_next">
						<a href="javascript:adminUserListAjaxfn(${boardPager.nextPage})">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</div>
</section>