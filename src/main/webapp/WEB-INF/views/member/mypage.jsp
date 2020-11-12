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
<title>My Info</title>
<link href="${path}/resources/css/mypage.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>
<script>
	function moveDelete(){
			$.ajax({
				url:"/member/outmember",
				type:"post",
				dataType:"text",
				data:{"userId" : $("#userId").val()},
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(result){
					if(result=='success'){
						alert("탈퇴되었습니다.");
						location.href="/";
					}else{
						alert("관리자에게 문의해주세요.");
					}
				}
			});
		}//end movedelete
		
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
			
			var inval_Arr = new Array(6).fill(false);
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			$('#update_btn').click(function(){
				
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
				
				if(regExp.test($('#mailAddress').val())){
					inval_Arr[6] = true;
				}else{
					inval_Arr[6] = false;
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
					alert('정보를 모두 입력해주세요.');
					return false;
				}
						
			});

		});// end function
		
		
</script>
<style>
.bt1{
	border-bottom:0.1px solid lightgray;
}
</style>
<body>
	<div class="wrap_box">
		<div class="box">
			<h2>개인 정보 수정</h2>
			<form name="update" action="/member/mypage" method="post">
				<p class="bt1">
				<table width="540" height="600">
					<tr>
						<th align="left">아이디</th>
						<td align="center"><input type="text" name="userId" id="userId" value="${member.userId}" readonly></td>
					</tr>
					<tr>
						<th align="left">비밀번호</th>
						<td align="center"><input type="password" name="userPwd" id="userPwd" />
						</td>
					</tr>
					<tr>
						<th align="left">비밀번호 확인<br>
						<span id="rePwdcheck"></span>
						</th>
						<td align="center"><input type="password" name="rePwd" id="rePwd" />
					</tr>
					<tr>
						<th align="left">이름</th>
						<td align="center"><input type="text" name="userName" id="userName" value="${member.userName}"/>
						</td>
					</tr>
					<tr>
						<th align="left">이메일<br>
						<span id="emailcheck"></span>
						</th>
						<td align="center"><input type="text" name="mailAddress" id="mailAddress" value="${member.mailAddress}"/>
						</td>
					</tr>
					<tr>
						<th align="left">주소</th>
						<td align="center"><input type="text" name="address" id="address" value="${member.address}"/>
						</td>
					</tr>
<!-- 					<tr>
						<th align="center"></th>
						<td align="center">
						<input type="submit" value="정보수정" id="update_btn" name="update_btn"/>
						<button type="button" onclick="moveDelete();">회원탈퇴</button>
						</td>
					</tr> -->
					<tr><td><button type="button" onclick="moveDelete();">회원탈퇴</button></td>
					<td align="right"><input type="submit" value="정보수정" id="update_btn" name="update_btn"/></td>
				</table>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</div>
	</div>
	</form>
</body>
</html>