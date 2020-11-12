<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register page</title>
<link href="${path}/resources/css/register.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>
<style>
.bt1{
	border-bottom:0.1px solid lightgray;
}
</style>

<script>
	function idChe(){
		$.ajax({
			url:"/member/idcheck",
			type:"post",
			dataType:"json",
			data:{"userId" : $("#userId").val()},
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(data){
				if(data==1){
					alert("중복된 아이디 입니다");
				}else if(data == 0){
					$("#idcheck").attr("value","Y");
					alert("사용가능한 아이디입니다");
				}
			}
		})
	}//end idche
	
	$(function(){
		
	    $('#userPwd').keyup(function(){
	      $('#rePwdcheck').html('');
	    });

	    $('#rePwd').keyup(function(){

	        if($('#userPwd').val() != $('#rePwd').val()){
	          $('#rePwdcheck').html('비밀번호 불일치<br><br>');
	        } else{
	          $('#rePwdcheck').html('비밀번호 일치<br><br>');
	        }

	    });
	    
	});//end pwdcheck
	
	
	$(function(){
		
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		$('#mailAddress').blur(function(){
			if($('#mailAddress').val() == ''){
		      	$('#emailcheck').html('');
				}
		    });
	    
		$('#mailAddress').blur(function(){
			if(regExp.test($('#mailAddress').val())){ 
				$('#emailcheck').html('알맞은 형식입니다');
			}else {
				$('#emailcheck').html('다시 입력해주십시오');
			}
		});
	});//end mailcheck
	
	$(function(){
		
		var inval_Arr = new Array(7).fill(false);
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		$('#signup_btn').click(function(){
			
			if($('#userPwd').val() != $('#rePwd').val()){
				inval_Arr[0] = false;
			}else{
				inval_Arr[0] = true;
			}

			if($('#userName').val() == ""){
				inval_Arr[1] = false;
			}else{
				inval_Arr[1] = true;
			}
			
			if($('#address').val() == ""){
				inval_Arr[2] = false;
			}else{
				inval_Arr[2] = true;
			}
			
			if($("#mailAddress").val() == ""){
				inval_Arr[3] = false;
			}else{
				inval_Arr[3] = true;
			}
			
			if($("#userId").val() == ""){
				inval_Arr[4] = false;
			}else{
				inval_Arr[4] = true;
			}
			
			if($("#userPwd").val() == ""){
				inval_Arr[5] = false;
			}else{
				inval_Arr[5] = true;
			}
			
			if($("#idcheck").val() == 'N'){
				inval_Arr[6] = false;
			}else{
				inval_Arr[6] = true;
			}
			
			if(regExp.test($('#mailAddress').val())){
				inval_Arr[7] = true;
			}else{
				inval_Arr[7] = false;
			}
			
			
			var validAll = true;
			for(var i = 0; i < inval_Arr.length; i++){
				if(inval_Arr[i] == false){
					validAll = false;
				}
			}
			
			if(validAll){
				location.href="/registersuccess";
			}else{
				alert('입력한 정보를 다시 확인해주세요.');
				return false;
			}
					
		});

	});// end function

</script>
<body>
	<div class="wrap_box">
		<div class="box">
			<h2>회원가입</h2>
			<div id="sub">*</div>
			<div class="sub2">필수입력사항</div>
			<form name="signup" action="/member/register" method="post">
				<p class="bt1">
				<table width="640" height="600">
					<tr>
						<th align="left">아이디<span>*</span></th>
						<td align="center"><input type="text" name="userId" id="userId" placeholder="아이디를 입력해주세요"/></td>
						<td align="center"><button type="button" id="idcheck" onclick="idChe();" value="N">중복확인</button>
					</tr>
					<tr>
						<th align="left">비밀번호<span>*</span></th>
						<td align="center"><input type="password" name="userPwd" id="userPwd" placeholder="비밀번호를 입력해주세요"/>
						</td>
					</tr>
					<tr>
						<th align="left">비밀번호 확인<span>*</span><br>
						<span id="rePwdcheck"></span></th>
						<td align="center"><input type="password" name="rePwd" id="rePwd" placeholder="비밀번호를 한번 더 입력해주세요"/>
						
					</tr>
					<tr>
						<th align="left">이름<span>*</span></th>
						<td align="center"><input type="text" name="userName" id="userName" placeholder="이름을 입력해주세요"/>
						</td>
					</tr>
					<tr>
						<th align="left">이메일<span>*</span><br>
						<span id="emailcheck"></span>
						</th>
						<td align="center"><input type="text" name="mailAddress" id="mailAddress" placeholder="예:recipe@recipe.com"/>
						</td>
					</tr>
					<tr>
						<th align="left">주소<span>*</span></th>
						<td align="center"><input type="text" name="address" id="address" placeholder="주소를 입력해주세요"/>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center"><input type="submit" value="가입하기" id="signup_btn" /></td>
					</tr>
				</table>
				<input type="hidden" name="authority" value="ROLE_MEMBER" />
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</div>
	</div>
</body>
</html>