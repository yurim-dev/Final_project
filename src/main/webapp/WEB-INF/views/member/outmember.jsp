<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

<script>
	function pwdChe(){
		$.ajax({
			url:"/member/pwdcheck",
			type:"post",
			dataType:"json",
			data:{"userId" : $("#userId").val(), "userPwd" : $("#userPwd").val()},
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(data){
				if(data==0){
					alert("패스워드가 틀렸습니다");
					return;
				}else{
					if(confirm("회원탈퇴하시겠습니까?")){
						$("#outmember").submit();
					}
				}
			}
		});
	}//end idche
</script>
</head>
<body>
<form name="outmember" action="/member/outmember" method="post">
<table>
<tr>
<th>아이디</th>
<td><input type="text" value="${userId}" id="userId" name="userId" readonly/></td>
</tr>
<tr>
<th>패스워드</th>
<td><input type="password" id="userPwd" name="userPwd"/></td>
</tr>
<tr>
<td><button type="button" id="pwdcheck" onclick="pwdChe();">회원탈퇴</button></td>
</tr>
</table>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</body>
</html>