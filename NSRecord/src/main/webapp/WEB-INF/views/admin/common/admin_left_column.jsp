<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<aside class="main-sidebar">

		<script type="text/javascript">
		
			$(function() {
				var categoryLoc = "${categoryLoc}";
				if(categoryLoc != null) {
					if(categoryLoc == "home") {
						console.log("loc : " + categoryLoc);
						$('.home').addClass('active');
						
					}
					else if(categoryLoc == "gpx") {
						console.log("loc : " + categoryLoc);
						$('.gpx').addClass('active');
					}
					else if(categoryLoc == "community") {
						console.log("loc : " + categoryLoc);
						$('.community').addClass('active');
					}
					else if(categoryLoc == "basicOp") {
						console.log("loc : " + categoryLoc);
						$('.basicOp').addClass('active');
					}
					else if(categoryLoc == "user") {
						console.log("loc : " + categoryLoc);
						$('.user').addClass('active');
					}
				}
			})
		</script>
		<!-- Sidebar Menu -->
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">MENU</li>
			<!-- Optionally, you can add icons to the links -->
			<li class="home">
				<a href="javascript:location.href='<c:url value="/"/>adminHome'"><i class="fa fa-home"></i><span>HOME</span></a>
			</li>
			<li class="basicOp treeview">
				<a href="#">
					<i class="fa fa-laptop"></i>
					<span>기본운영관리</span>
					<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
				</a>
				<ul class="treeview-menu">
					<li><a href="javascript:location.href='<c:url value="/"/>basicOp/adminMainImg'">메인이미지 설정</a></li>
				</ul>
			</li>
			<li class="user treeview">
				<a href="#">
					<i class="fa fa-user"></i>
					<span>회원관리</span>
					<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
				</a>
				<ul class="treeview-menu">
					<li><a href="javascript:location.href='<c:url value="/"/>adminUser/adminUserList'">회원 리스트</a></li>
					<li><a href="javascript:location.href='<c:url value="/"/>adminUser/adminUserLeaveList'">회원탈퇴 리스트</a></li>
				</ul>
			</li>
			<li class="gpx treeview">
				<a href="#">
					<i class="fa fa-map"></i>
					<span>GPX</span>
					<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
				</a>
				<ul class="treeview-menu">
					<li><a href="javascript:location.href='<c:url value="/"/>adminGpx/adminGpxList'">GPX 리스트</a></li>
					<li><a href="javascript:location.href='<c:url value="/"/>adminGpx/adminGpxRankingList'">GPX Ranking 리스트</a></li>
				</ul>
			</li>
			<li class="community treeview">
				<a href="#">
					<i class="fa fa-commenting"></i>
					<span>커뮤니티 관리</span>
					<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
				</a>
				<ul class="treeview-menu">
					<li><a href="javascript:location.href='<c:url value="/"/>adminCommunity/adminNoticeBoard'">공지사항 관리</a></li>
					<li><a href="javascript:location.href='<c:url value="/"/>adminCommunity/adminQnaBoard'">Q&A 관리</a></li>
					<li><a href="javascript:location.href='<c:url value="/"/>adminCommunity/adminFreeBoard'">자유게시판 관리</a></li>
				</ul>
			</li>
		</ul>
		<!-- /.sidebar-menu -->
	</section>
	<!-- /.sidebar -->
</aside>