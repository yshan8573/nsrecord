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
					if(categoryLoc == "home") {
						console.log("loc : " + categoryLoc); //syso
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
				}
			})
		</script>
		<!-- Sidebar Menu -->
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">MENU</li>
			<!-- Optionally, you can add icons to the links -->
			<li class="home">
				<a href="javascript:location.href='<c:url value="/"/>userHome'"><i class="fa fa-home"></i><span>HOME</span></a>
			</li>
			<li class="gpx treeview">
				<a href="#">
					<i class="fa fa-map"></i>
					<span>GPX</span>
					<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
				</a>
				<ul class="treeview-menu">
					<li><a href="javascript:location.href='<c:url value="/"/>gpx/gpxBoard'">GPX공유게시판</a></li>
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
		</ul>
		<!-- /.sidebar-menu -->
	</section>
	<!-- /.sidebar -->
</aside>