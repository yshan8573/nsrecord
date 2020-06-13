<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp" %>
<html>
<style>
h1 {
	text-align:center;
}
table{
	margin: auto;
	text-align:center;
}

</style>

<body class="hold-transition skin-blue sidebar-mini">
	
	<!-- Main Header -->
    <%@ include file="../common/user_main_header.jsp" %>

    <!-- Left side column. contains the logo and sidebar -->
    <%@ include file="../common/user_left_column.jsp" %>

	<form action="<%=contextPath%>/user/userSignInResult" method="post">
		<h1>회원가입</h1>
		<br>
		<table border="1">
			<tr>
				<th>프로필</th>
				<td><img src=""><input type="button" name="profile"></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><input type="text" id="id" name="u_email"><input type="button" value="중복검사"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pwd" name="u_pwd"> ※ 6~15자 영문/숫자/특수문자 포함</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" id="checkpwd" name="u_pwdre" maxlength="15"> ※ 6~15자 영문/숫자/특수문자 포함 </td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="u_phone"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="u_name"></td>
			</tr>	
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="u_nickname"><input type="button" value="중복검사"></td>
			</tr>
			<tr>
				<th>자전거 모델</th>
				<td><input type="text" name="u_cycle"></td>
			</tr>
		</table>
		<br>
		<br>
		<table>
			<tr>
				<td><input type="submit" value="회원가입"><input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>