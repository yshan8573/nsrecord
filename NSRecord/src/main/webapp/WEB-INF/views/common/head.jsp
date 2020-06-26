<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% String contextPath = request.getContextPath(); %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>NSRecord</title>
	
	<!-- favicon.ico -->
	<link rel="shortcut icon" href="<c:url value='/'/>img/favicon.ico" type="image/x-icon">
	
	
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" href="<%= contextPath %>/bower_components/bootstrap/dist/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="<%= contextPath %>/bower_components/font-awesome/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="<%= contextPath %>/bower_components/Ionicons/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="<%= contextPath %>/dist/css/AdminLTE.min.css">
	<link rel="stylesheet" href="<%= contextPath %>/dist/css/skins/skin-blue.min.css">
	
	<!-- datatables style -->
	<link rel="stylesheet" href="<%= contextPath %>/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">

	<!-- Google Font -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

	
	<%-- <%@ include file="plugin_js.jsp" %> --%>
	
	<link rel="stylesheet" href="<%= contextPath %>/css/mainCss.css">
	
	<!-- REQUIRED JS SCRIPTS -->
	<!-- jQuery 3 -->
	<script src="<%= contextPath %>/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="<%= contextPath %>/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="<%= contextPath %>/dist/js/adminlte.min.js"></script>
	<!-- CK Editor -->
	<script src="<%= contextPath %>/bower_components/ckeditor/ckeditor.js"></script>
	<!-- CK Editor config -->
	<script src="<%= contextPath %>/js/ckeditor-config.js"></script>
	<!-- ChartJS -->
	<script src="<%= contextPath %>/bower_components/chart.js/Chart.js"></script>
	<!-- FastClick -->
	<script src="<%= contextPath %>/bower_components/fastclick/lib/fastclick.js"></script>

	<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->
	

</head>
