<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<aside class="main-sidebar">

	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">

		<!-- Sidebar user panel (optional) -->
		<!-- 
		<div class="user-panel">
			<div class="pull-left image">
				<img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>Alexander Pierce</p>
				Status
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>
		 -->
		
		

		<!-- search form (Optional) -->
		<!-- 
		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control" placeholder="Search..."> <span class="input-group-btn">
					<button type="submit" name="search" id="search-btn" class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		 -->
		<!-- /.search form -->
		<script type="text/javascript">
		
			$(function() {
				var categoryLoc = "${categoryLoc}"; //request.getparam... 
				if(categoryLoc != null) {
					console.log("loc : " + categoryLoc); //syso
					
					switch (categoryLoc) {
						case "home": $('.home').addClass('active'); break;
						case "gpx": $('.gpx').addClass('active'); break;
						case "community": $('.community').addClass('active'); break;
						case "myUser": $('.myPage').addClass('active'); break;
						case "myGpx": {
							$('.myPage').addClass('active');
							$('.myGpx').addClass('menu-open');
							$('.myGpx>ul').css("display","block");
							break;
						}
						case "myCommunity": {
							$('.myPage').addClass('active');
							$('.myCommunity>ul').css("display","block");
							break;
						}
					}
				}
			})
		</script>
		<!-- Sidebar Menu -->
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">Main Menu</li>
			<!-- Optionally, you can add icons to the links -->
			<li class="home">
				<a href="javascript:location.href='<c:url value="/"/>userHome'"><i class="fa fa-home"></i><span>HOME</span></a>
			</li>
			
			<c:choose>
				<c:when test="${loginUser != null}">
					<li class="myPage treeview">
						<a href="#">
							<i class="fa fa-user"></i> <span>마이 페이지</span>
							<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
						</a>
						<ul class="myGpx treeview-menu">
							<li><a href="javascript:location.href='<c:url value="/"/>myPage/myUserInfo'">마이 기본 정보</a></li>
							<li class="myGpx treeview">
								<a href="#">
									<i class="fa fa-circle-o"></i> 마이 GPX 관리
									<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
								</a>
								<ul class="treeview-menu" style="display: none;">
									<li><a href="javascript:location.href='<c:url value="/"/>myPage/myGpxBoard'">마이 GPX 공유 관리</a></li>
									<li><a href="javascript:location.href='<c:url value="/"/>myPage/myGpxRanking'">마이 GPX 랭킹 등록 관리</a></li>
								</ul>
							</li>
							<li class="myCommunity treeview">
								<a href="#">
									<i class="fa fa-circle-o"></i> 마이 게시글&댓글 관리
									<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
								</a>
								<ul class="treeview-menu" style="display: none;">
									<li><a href="javascript:location.href='<c:url value="/"/>myPage/myFreeBoard'">마이 게시글 관리</a></li>
									<li><a href="javascript:location.href='<c:url value="/"/>myPage/myReply'">마이 댓글 관리</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li class="myGpx">
						<a href="#">
							<i class="fa fa-map"></i>
							<span>My GPX</span>
							<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
						</a>
						
					</li>
					<li class="myCommunity treeview">
						<a href="#">
							<i class="fa fa-commenting"></i>
							<span>My Community</span>
							<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
						</a>
						<ul class="treeview-menu">
							
						</ul>
					</li>
				</c:when>
			</c:choose>
			<li class="gpx treeview">
				<a href="#">
					<i class="fa fa-map"></i>
					<span>GPX</span>
					<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
				</a>
				<ul class="treeview-menu">
					<li><a href="javascript:location.href='<c:url value="/"/>gpx/gpxBoard'">GPX공유게시판</a></li>
					<li><a href="javascript:location.href='<c:url value="/"/>gpx/gpxRanking'">GPX랭킹</a></li>
				</ul>
			</li>
			<li class="community treeview">
				<a href="#">
					<i class="fa fa-commenting"></i>
					<span>Community</span>
					<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
				</a>
				<ul class="treeview-menu">
					<li><a href="javascript:location.href='<c:url value="/"/>community/noticeBoard'">공지사항</a></li>
					<li><a href="javascript:location.href='<c:url value="/"/>community/qnaBoard'">Q&A</a></li>
					<li><a href="javascript:location.href='<c:url value="/"/>community/freeBoard'">자유게시판</a></li>
				</ul>
			</li>
			<%-- 
			<c:choose>
				<c:when test="${loginUser != null}">
					<li class="header">My Page</li>
					<li class="myUser">
						<a href="<c:url value="/"/>myPage/myUserInfo"><i class="fa fa-user"></i> <span>마이 정보</span></a>
					</li>
					<li class="myGpx treeview">
						<a href="#">
							<i class="fa fa-map"></i>
							<span>My GPX</span>
							<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
						</a>
						<ul class="treeview-menu">
							<li><a href="javascript:location.href='<c:url value="/"/>myPage/myGpxBoard'">마이 GPX 공유 관리</a></li>
							<li><a href="javascript:location.href='<c:url value="/"/>myPage/myGpxRanking'">마이 GPX 랭킹 등록 관리</a></li>
						</ul>
					</li>
					<li class="myCommunity treeview">
						<a href="#">
							<i class="fa fa-commenting"></i>
							<span>My Community</span>
							<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
						</a>
						<ul class="treeview-menu">
							<li><a href="javascript:location.href='<c:url value="/"/>myPage/myFreeBoard'">마이 게시글 관리</a></li>
							<li><a href="javascript:location.href='<c:url value="/"/>myPage/myReply'">마이 댓글 관리</a></li>
						</ul>
					</li>
				</c:when>
			</c:choose>
			 --%>
		</ul>
		<!-- /.sidebar-menu -->
	</section>
	<!-- /.sidebar -->
</aside>