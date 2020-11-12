<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Password</title>
<link href="${path}/resources/css/findpwd.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>
<body>
<div class="wrap_box">
<div class="box">
<h3>비밀번호 찾기</h3>
<form action="/member/findpwd" method="post">
<label>이름</label><p>
<input type="text" id="findName" name="findName" placeholder="고객님의 이름을 입력해주세요"/><p>
<label>아이디</label><p>
<input type="text" id="findId" name="findId" placeholder="고객님의 아이디를 입력해주세요"/><p>
<label>이메일</label><p>
<input type="text" id="findMail" name="findMail" placeholder="가입시 등록하신 이메일주소를 입력해주세요" /><p>
<input type="submit" value="찾기"/>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</div>
</div>
</body>
</html>