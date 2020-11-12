<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>요리법 검색 메인 페이지(테스트)</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/search.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lemonada&display=swap"
	rel="stylesheet">
<link href="/resources/css/search.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="/resources/js/search_module.js"></script>
</head>
<body>
	<jsp:include page="includes/header.jsp"></jsp:include>
	<!-- 헤더 -->

	<!-- ↑헤더 - 내용↓ 분할선 -->
	<div id="search">
		<form action="/recipe/search" method="GET">
			<select name="type">
				<option value="I">재료</option>
				<option value="N">요리</option>
			</select> <input name= "query" type="search" title="검색" placeholder="입력해주세요.">
			<button id="searchBtn">검색</button>
		</form>
	</div>
</body>
</html>