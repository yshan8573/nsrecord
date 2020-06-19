<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp"%>
			
			
			<!-- JQUERY 함수 편집중 함수 편집중 -->
			<script>
			<%-- 업데이트 버튼 --%>
			$(document).ready(function() {
			$("#updateGpxBoard").click(function() {
			var url = "<%=contextPath%>"+"/gpx/gpxUpdateForm";
			$("#gpxBoardJquery").attr("action",url);
			$("#gpxBoardJquery").submit();
			})	
			<%-- 목록 버튼 --%>
			$("#gpxBoard").click(function() {
				var url = "<%=contextPath%>"+"/gpx/gpxBoard";
				$("#gpxBoardJquery").attr("action",url);
				$("#gpxBoardJquery").submit();
				})	
				<%-- 삭제 버튼 --%>
			$("#deleteGpxBoard").click(function() {
					var url = "<%=contextPath%>"+"/gpx/gpxDelete";
					$("#gpxBoardJquery").attr("action",url);
					$("#gpxBoardJquery").submit();
					})	
			})//function end

//댓글 수정			
function gpxReplyUpdate(gr_seq, gr_content, g_seq) {
 				//alert("접근 = ["+'.'+gr_seq+"]["+gr_content+"]["+g_seq+"]");
		  var location =  '#'+gr_seq;
		  $(location).html("<textarea id='"+location+"' name='gr_content' rows='1' cols='50'>" + gr_content + "</textarea>");
		  
		  var btnLocation = '.GpxreplyUpdateButton' + gr_seq;
		$(btnLocation).html('<input type="button" class="rBtnStyle" value="수정 완료" onclick="replyUpdateEnd(' + gr_seq+', \''+gr_content+'\', '+g_seq + ')">')
	 }
 function replyUpdateEnd(gr_seq, gr_content, g_seq){
	var loc = '#'+gr_seq;
	var value = document.getElementById(loc).value;
	location.href = '<%=contextPath%>/gpx/gpxUpdateReply?gr_seq=' + gr_seq + '&gr_content=' + value + '&g_seq=' + g_seq;
				   }

 
 //댓글 삭제
function deleteGpxReply(gr_seq, g_seq) {
	alert("접근 = "+gr_seq)

	location.href = '<c:url value="/"/>gpx/gpxDeleteReply?gr_seq='+gr_seq+ '&g_seq=' + g_seq;
}
 
 //파일 다운로드
function fileDownload(path,oName,rName) {
	oName=encodeURIComponent(oName);
	location.href="<%= contextPath %>/fileDownload.do?path="+path+"&oName="+oName+"&rName="+rName;	
	}
 
 
			</script>
			
			
			
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
	<%@ include file="../common/user_main_header.jsp" %>

		<!-- Left side column. contains the logo and sidebar -->
		<%@ include file="../common/user_left_column.jsp" %>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					GPX 게시글 조회<small>GPX 게시글 조회</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="javascript:location.href='<c:url value=" /" />nsrecord/gpx/gpxBoard'"><i
							class="fa fa-home"></i>Home</a></li>
					<li><a href="javascript:location.href='<c:url value=" /" />nsrecord/gpx/gpxInsertForm'">GPX Board</a></li>
					<li class="active">Write</li>
				</ol>
			</section>


			<!-- Main content -->
			<%-- Form에 JQuery 함수 적용중 --%>
			<section class="content container-fluid">

				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-body">
								<form id="gpxBoardJquery" method="post">
								<input type="hidden"  name="u_seq" value="${GpxDto.u_seq }">
								<input type="hidden" name="g_seq" value="${GpxDto.g_seq }">
								<input type="hidden" name="u_nickname" value="${GpxDto.u_nickname }">
									<div class="form-group">
										<label>제목</label>
									<input name="g_title" type="text" class="form-control" value="${GpxDto.g_title }" readonly>
									</div>
									<div class="form-group">
									<textarea id="g_content" name="g_content" readonly="readonly">${GpxDto.g_content }</textarea>
									<input type="button" value="수정" id="updateGpxBoard">
									<input type="button" value="삭제" id="deleteGpxBoard">
									<input type="button" value="목록" id = "gpxBoard">
									</div>
									<!-- this row will not appear when printing -->
				<div class="row no-print">
					<div class="col-xs-6 flexBox" style="justify-content: flex-start;">
					
						<div>
							<b >첨부파일 :</b>${GpxDto.g_ori }&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<button type="button" class="btn btn-primary pull-right"
							style="margin-right: 5px;"
							onclick="fileDownload('gpx','${GpxDto.g_ori}','${GpxDto.g_re}');">
							<i class="fa fa-download"></i> Download
						</button>
					</div>
									<script>
										$(function () {
											CKEDITOR.replace('g_content')
										})
									</script>
									<div class="form-group" style="text-align: right;">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				
				
<form class="form-horizontal" id="gpxReplyUpdateJquery" method="post">
<div class="post clearfix">
<c:forEach var="GpxReply" items="${GpxReply }">
                  <div class="user-block">
                        <span class="username" >${GpxReply.u_nickname }	
                        <input type="hidden" name="gr_seq" value="${GpxReply.gr_seq }">
                         <p id = "grBox${gr_seq}">
	                         	<div id='${GpxReply.gr_seq }' >${GpxReply.gr_content }</div>
				                 <div class="GpxreplyUpdateButton${GpxReply.gr_seq }">
				                <input type="button"  value="수정"  onclick="gpxReplyUpdate(${GpxReply.gr_seq },'${GpxReply.gr_content }',${GpxDto.g_seq })">
				                </div>
				                <input type="button" class="gpxReplyDeleteButton"  value="삭제" onclick="deleteGpxReply(${GpxReply.gr_seq}, ${GpxDto.g_seq })">	
	                  		</p>	
                        </span>
                    <span class="description">${ GpxReply.gr_date}</span>
                  </div>
                </c:forEach>	
              
                  </div>	
</form>	



		
<form class="form-horizontal" action=" <c:url value='/'/>gpxBoardReply"  method="post">
					<input type="hidden" name="g_seq" value="${GpxDto.g_seq }">
                    <input type="hidden" name="u_seq" value="${user.u_seq }">
                    <input type="hidden" name="u_nickname" value="${user.u_nickname }">
                    <div class="form-group margin-bottom-none">
                      <div class="col-sm-9">
                        <input class="form-control input-sm" placeholder="Response" id="gr_conetent" name="gr_content">
                      </div>
                      <div class="col-sm-3">
                        <button type="submit" class="btn btn-danger pull-right btn-block btn-sm">댓글 등록</button>
                      </div>
                    </div>
                  </form>
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