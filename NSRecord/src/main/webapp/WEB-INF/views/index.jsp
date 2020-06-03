<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%
	String contextPath = request.getContextPath();
%>
<html>
<head>
	<title>NamSanRecord</title>
</head>
<body>
<h1>
	NamSanRecord welcome!!
</h1>

<P>  The time on the server is ${serverTime}. </P>
<div>
	<input type="button" value="stravaSample Page" onclick="javascript:location.href='<%=contextPath%>/staravaSample'"/>
</div>
<div>
	<input type="button" value="main Page" onclick="javascript:location.href='<%=contextPath%>/home'"/>
</div>
</body>
</html>
