<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
<link href="${path}/resources/css/logincss.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>
<script>
function moveRegister(){
    location.href="../member/register";
}
</script>
<body>

<div class="wrap_box">
<div class="loginbox">
<h3>로그인</h3><p>
<c:out value="${error}"/>
<c:out value="${logout}"/>
<form method='post' action='/login'>
<input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요"/><p>
<input type="password" id="userPwd" name="userPwd" placeholder="비밀번호를 입력해주세요" /><p></p>
<div class="remember"><input type="checkbox"> 로그인유지</div>
<div class="findid"><a href="../member/findid">아이디찾기</a></div>
<div class="findpwd"><a href="../member/findpwd">비밀번호찾기</a></div>
<input type="submit" value="로그인"/><p></p>
<button type="button" onclick="moveRegister();">회원가입</button>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</div>
</div>
</body>
</html>