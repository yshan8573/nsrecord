<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../../common/head.jsp"%>
<html>
<script>

//패스워드 중복체크
$(function() {
	$("#pwd_success").hide(); 
	$("#pwd_fail").hide();
	
	$("input").keyup(function(){
		
		var pwd1=$("#u_pwd").val(); 
		var pwd2=$("#u_pwd2").val();
		
		if(pwd1 != "" || pwd2 != "") {
			
			if(pwd1 == pwd2){
				
				$("#pwd_success").show(); 
				$("#pwd_success").css("color", "blue"); 
				$("#pwd_fail").hide(); 
				
			} else {
				
				$("#pwd_success").hide(); 
				$("#pwd_fail").show();
				$("#pwd_fail").css("color", "red");
			} 
		} 
	}); 
	
});

$(function(){

	$("#u_nickname").blur(function() {
		// id = "u_nickname" / name = "u_nickname"
		var u_nickname = $('#u_nickname').val();

		$.ajax({
			url : '${pageContext.request.contextPath}/user/nickcheck?u_nickname='+ u_nickname,
			type : 'get',
			dataType : 'text',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);	
				
				
				var nickname = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,7}$/;
				
				if(data == '1'){
					$('#nick_check').text("이미 사용중인 닉네임입니다.");
					$('#nick_check').css('color', 'red');
					
					} else{ 
						
						if(!nickname.test($("input[id='u_nickname']").val())){
						
							$('#nick_check').text('2~7글자의 닉네임을 입력해주세요');
							$('#nick_check').css('color', 'red');
									
						} else if (u_nickname == "") {
							
							$("#nick_check").text("닉네임을 입력해주세요");
							$("#nick_check").css("color", "red");
							
						} else {
							$('#nick_check').text("사용가능한 닉네임입니다.");
							$('#nick_check').css('color', 'blue');
						}
					}
							
					
					}, error : function() {
							console.log("실패");
				}
			});
		});
});

		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/";
					    
			})
		
			$("#submit").on("click", function(){
				if($("#u_pwd").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#u_pwd").focus();
					return false;
				}
				if($("#u_nickname").val()==""){
					alert("닉네임을 입력해주세요.");
					$("#u_nickname").focus();
					return false;
				}
				
				alert("계정 정보가 변경되었습니다. 새로 로그인해주세요 :P")
			});
			
				
			
		})
	</script>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<%@ include file="../common/user_main_header.jsp"%>

		<!-- Left side column. contains the logo and sidebar -->
		<%@ include file="../common/user_left_column.jsp"%>


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

			<!-- Main content -->
			<section class="content container-fluid">
				<h2>${loginUser.u_name }님의 정보</h2>
				<form action="<%=contextPath %>/user/userlogin" method="post">
				
						<label for="u_email">아이디</label>
						<input type="text" id="u_email" name="u_email" value="${loginUser.u_email }" readonly="readonly"/>
						<br>
						<label for="u_pwd">비밀번호</label>
						<input type="password" id="u_pwd" name="u_pwd"/>
						<br>
						<label for="u_pwd2">비밀번호 확인</label>
						<input type="password" id="u_pwd2" name="u_pwd2"/>
						<div id="pwd_success">비밀번호가 일치합니다</div>
						<div id="pwd_fail">비밀번호가  일치하지 않습니다</div>
						<br>
						<label for="u_name">이름</label>
						<input type="text" id="u_name" name="u_name" value="${loginUser.u_name}" readonly="readonly"/>
						<br>
						<label for="u_phone">전화번호</label>
						<input type="text" id="u_phone" name="u_phone" value="${loginUser.u_phone}"/>
						<br>
						<label for="u_nickname">닉네임</label>
						<input type="text" id="u_nickname" name="u_nickname" value="${loginUser.u_nickname}"/>
						<div id = "nick_check"></div>
						<br>
						<label for="u_cycle">자전거 모델</label>
						<input type="text" id="u_cycle" name="u_cycle" value="${loginUser.u_cycle}"/>
						<br>
						<label for="u_enrolldate">회원 등록일</label>
						<input type="text" id="u_enrolldate" name="u_enrolldate" value="${loginUser.u_enrolldate}" readonly="readonly"/>
						<br>
						<br>
						<button type="submit" id="submit">회원정보수정</button>
						<button type="button">취소</button>
				</form>
			</section>
			<!-- /.content -->

		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@ include file="../common/user_main_footer.jsp"%>

	</div>
	<!-- ./wrapper -->

</body>

</html>