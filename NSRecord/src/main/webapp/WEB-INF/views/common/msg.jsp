<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>msg</title>
<script
	src="<c:url value='/'/>bower_components/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
	alert("${msg}");
	location.href = '${pageContext.request.contextPath}${loc}';
</script>
</head>
<body>

</body>
</html>