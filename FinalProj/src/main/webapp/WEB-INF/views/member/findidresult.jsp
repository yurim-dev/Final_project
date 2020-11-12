<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Id Result</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<link href="${path}/resources/css/findidresult.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>
<script>
function moveLogin(){
	location.href="/secu/login";
	}
function movePage(){
	location.href="/member/findid";
	}	

</script>
<body>
<div class="wrap_box">
<div class="box">
<h3>아이디 찾기</h3>
<div class="idbox">
<c:set var="FindId" value="${findId}" />
<c:choose>
<c:when test="${ empty FindId}">
<br><br><br><br>일치하는 정보가 없습니다.<p>
<button type="button" name="login" onclick="movePage();">아이디찾기</button>
</c:when>
<c:otherwise>
<br><br><br><br>고객님의 아이디는 <span>${FindId}</span> 입니다.<p>
<button type="button" name="login" onclick="moveLogin();">로그인</button>
</c:otherwise>
</c:choose>
</div>

</div>
</div>
</body>
</html>