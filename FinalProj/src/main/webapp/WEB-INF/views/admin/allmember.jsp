<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin-All Member List</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<style>
#logo {
	font-family: 'Black Han Sans', sans-serif;
	color: black;
}

#logo>h1>a {
	text-decoration: none;
	color: black;
}

#menu>ul>li>a {
	text-decoration: none;
}

#login>ul>li>a {
	text-decoration: none;
}

.center-block() {
	display: block;
	margin-left: auto;
	margin-right: auto;
}

.center-block {
	width: 1000px;
	.
	center-block
	();
}

tr>td>a {
	text-decoration: none;
	color: black;
}

tr>td>a:hover {
	text-decoration: none;
	color: coral;
}

.box {
	margin: 165px;
}

.h1 {
	font-weight: bolder;
	font-size: 56px;
	width: 234.19px;
	height: 56px;
	padding_bottom: 5px;
}
</style>
</head>
<body>
	<div class="box"></div>
	<div class="center-block">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">회원내역</div>
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover">
						<tr>
							<th>아이디</th>
							<th>이 름</th>
							<th>이메일</th>
							<th>주소</th>
							<th>가입일자</th>
						</tr>
						<c:forEach var="memberlist" items="${memberlist}">
							<tr>
								<td align="center">${memberlist.userId}</td>
								<td align="center">${memberlist.userName}</td>
								<td align="center">${memberlist.mailAddress }</td>
								<td align="center" width="500px">${memberlist.address}</td>
								<td align="center"><fmt:formatDate
										value="${memberlist.regDate}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>