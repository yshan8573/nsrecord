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
<script>
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
$(function(){
	

	$("#u_email").blur(function() {
		// id = "id_reg" / name = "userId"
		var u_email = $('#u_email').val();
		
		$.ajax({
			url : '${pageContext.request.contextPath}/user/idcheck?u_email='+ u_email,
			type : 'get',
			dataType : 'text',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);	
				
				
				var email = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
				
				if (u_email == "") {
						
						$("#id_check").text("이메일을 입력해주세요");
						$("#id_check").css("color", "red");
						
					} else if(!email.test($("input[id='u_email']").val())){
	
							$('#id_check').text('올바르지않은 이메일 형식입니다');
							$('#id_check').css('color', 'red');
										
							
						} else if(data == '1'){
							
						$('#id_check').text("이미 사용중인 이메일입니다.");
						$('#id_check').css('color', 'red');
						
						} else {
							$('#id_check').text("사용가능한 아이디입니다.");
							$('#id_check').css('color', 'blue');
					}
							
					
					}, error : function() {
							console.log("실패");
				}
			});
		});
});

// 닉네임 중복 검사
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

//패스워드 일치 체크
$(function(){ 
	
	$("#pwd_success").hide(); 
	$("#pwd_fail").hide();
	
	$("input").keyup(function(){
		
		var pwd1=$("#u_pwd").val(); 
		var pwd2=$("#u_pwd2").val();
		
		var password = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,15}$/;
		
			if(!password.test($("input[id='u_pwd']").val())){
			
				$('#pwd_check').text('6~15자 영문/숫자/특수문자 포함 입력해주세요');
				$('#pwd_check').css('color', 'red');
				
				
			} else {
					$("#pwd_check").hide();
					
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
			}
			
			
	}); 
});
// 휴대폰번호 정규식
$(function(){ 
	
	$("#u_name").blur(function(){
		var name = /^[가-힣]{2,6}$/;
	
		if (name.test($("input[id='u_name']").val())) {
	
			$("#name_check").text('');
		} else {
			$('#name_check').text('이름을 확인해주세요');
			$('#name_check').css('color', 'red');
		}		
	}); 
});

//이름 정규식
$(function(){ 
	
	$("#u_phone").blur(function(){
		var phone = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

		if (phone.test($("input[id='u_phone']").val())) {
	
			$("#phone_check").text('');
		} else {
			$('#phone_check').text('번호를 확인해주세요');
			$('#phone_check').css('color', 'red');
		}		
	}); 
});

// onsubmit
function checkSubmit() {
	
	if(form.u_phone.value == "") {
		$('#phone_check').text('번호를 입력해주세요');
		$('#phone_check').css('color', 'red');
		
		return false;
	} 
	
	if(form.u_name.value == "") {
		$('#name_check').text('이름을 입력해주세요');
		$('#name_check').css('color', 'red');
		
		return false;
		
	} 
	
	if(form.u_cycle.value == "") {
		$('#cycle_check').text('보유 자전거 모델을 입력해주세요');
		$('#cycle_check').css('color', 'red');
		return false;
	}
	
	
}

</script>
<body class="hold-transition skin-blue sidebar-mini">
	
	<!-- Main Header -->
    <%@ include file="../common/user_main_header.jsp" %>

    <!-- Left side column. contains the logo and sidebar -->
    <%@ include file="../common/user_left_column.jsp" %>

	<form action="<%=contextPath%>/user/userSignInResult" method="post" name="form" onsubmit="return checkSubmit();">
		<h1>회원가입</h1>
		<br>
		<table border="1">
<!-- 			<tr> -->
<!-- 				<th>프로필</th> -->
<!-- 				<td> -->
<!-- 					<img src=""><input type="button" name="profile"> -->
<!-- 				</td> -->
<!-- 			</tr> -->
			<tr>
				<th>E-mail</th>
				<td>
					<input type="text" id="u_email" name="u_email" placeholder="E_MAIL">
					<div id="id_check"></div>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" id="u_pwd" name="u_pwd" maxlength="15" placeholder="PASSWORD">
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" id="u_pwd2" name="u_pwd2" maxlength="15" placeholder="CONFIRM PASSWORD">
					<div id="pwd_check"></div>
					<div id="pwd_success">비밀번호가 일치합니다</div>
					<div id="pwd_fail">비밀번호가  일치하지 않습니다</div>
				</td>
			</tr>
			<tr>
				<th>휴대전화 ('-'없이 번호만 입력해주세요)</th>
				<td>
					<input type="text" id="u_phone" name="u_phone" placeholder="PHONE NUMBER">
					<div id="phone_check"></div>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" id="u_name" name="u_name" placeholder="NAME">
				</td>
			</tr>	
			<tr>
				<th>닉네임</th>
				<td>
					<input type="text" id="u_nickname" name="u_nickname" placeholder="NICKNAME">
					<div id = "nick_check"></div>
				</td>
			</tr>
			<tr>
				<th>자전거 모델</th>
				<td>
					<input type="text" id="u_cycle" name="u_cycle">
					<div id="cycle_check"></div>
				</td>
			</tr>
		</table>
		<br>
		<br>
		<table>
			<tr>
				<td>
					<input type="submit" id="sumit" name="submit" value="회원가입">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>