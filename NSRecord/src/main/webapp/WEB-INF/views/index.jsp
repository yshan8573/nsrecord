<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>

<%@ include file="common/head.jsp" %>
<style>
	body {
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
		margin: 0;
		padding: 20px;
	}
	
	.mainBox {
		width: 50%;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}
	
</style>

<body>
	<div class="mainBox">
		<div>
			<h1>NamSanRecord welcome!!</h1>
			<br><hr><br>
			<P>The time on the server is ${serverTime}.</P>
			<br><hr><br>
			<h3>작업 페이지</h3>
			<div>
				<input class="btn btn-lg bg-purple color-palette" type="button" value="사용자 페이지"
					onclick="javascript:location.href='<%=contextPath%>/userHome'" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="btn btn-lg bg-red color-palette" type="button" value="관리자 페이지"
					onclick="javascript:location.href='<%=contextPath%>/adminHome'" />
			</div>
			<br><hr><br>
			<h3>예제 페이지</h3>
			<div>
				<input class="btn btn-info btn-sm" type="button" value="stravaSample Page"
					onclick="javascript:location.href='<%=contextPath%>/staravaSample'" />
			</div>

			<br><hr><br>
			<div>
				<input class="btn btn-primary btn-sm" type="button" value="userHome"
					onclick="javascript:location.href='<%=contextPath%>/userHome'" />
				<input class="btn btn-primary btn-sm" type="button" value="adminHome"
					onclick="javascript:location.href='<%=contextPath%>/adminHome'" />
			</div>
			
			<%@ include file="common/plugin_js.jsp" %>
		</div>
	</div>
</body>

</html>