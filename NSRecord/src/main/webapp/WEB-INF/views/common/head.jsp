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
	<link rel="stylesheet" href="<c:url value='/'/>bower_components/bootstrap/dist/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="<c:url value='/'/>bower_components/font-awesome/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="<c:url value='/'/>bower_components/Ionicons/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="<c:url value='/'/>dist/css/AdminLTE.min.css">
	<link rel="stylesheet" href="<c:url value='/'/>dist/css/skins/skin-blue.min.css">
	
	<!-- datatables style -->
	<link rel="stylesheet" href="<c:url value='/'/>bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">

	<!-- Google Font -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

	<!-- REQUIRED JS SCRIPTS -->
	<%@ include file="plugin_js.jsp" %>
	
	<link rel="stylesheet" href="<c:url value="/"/>css/mainCss.css">
	

</head>
