<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<meta charset="UTF-8">
<title>Admin-All Order List</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
.center-block(){
	display : block;
	margin-left :auto;
	margin-right:auto;
}
.center-block{
	width:1000px;
	.center-block();
}
tr>td>a{
	text-decoration:none; 
	color:black;
}

tr>td>a:hover{
	text-decoration:none; 
	color:coral;
}
.box{
	margin:165px;
}
.h1{
	font-weight:bolder;
	font-size:56px;
	width:234.19px;
	height:56px;
	padding_bottom:5px;	
}
</style>
</head>
<body>
<div class="box"></div>
	<div class="center-block">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">주문내역</div>
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover">
						<tr>
							<th>주문번호</th>
							<th>아이디</th>
							<th>수 량</th>
							<th>총 액</th>
							<th>주문일자</th>
							<th>상 태</th>
						</tr>
						<c:forEach var="orderlist" items="${orderlist}">
							<tr>
								<td align="center"><a
									href="${path}/order/detail?orderId=${orderlist.orderId}">${orderlist.orderId}</a></td>
								<td align="center">${orderlist.userId}</td>
								<td align="center">${orderlist.amount}개</td>
								<td align="center">${orderlist.sum}원</td>
								<td align="center"><fmt:formatDate
										value="${orderlist.orderDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td align="center">${orderlist.status}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>