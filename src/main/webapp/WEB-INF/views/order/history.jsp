<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
<link rel="stylesheet" href="/resources/css/order-history.css">
<script src="/resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<jsp:include page="../includes/header.jsp"></jsp:include>
	<div class="jumbotron jumbotron-fluid" id="title">
		<div class="container" style="text-align: center;">
			<h1 class="h1">주문 내역</h1>
		</div>
	</div>
	<div class="container">
		<table class="table">
			<thead class="text-center">
				<tr>
					<td>주문 번호</td>
					<td>주문일</td>
					<td>주문 금액</td>
					<td>배송 상태</td>
				</tr>
			</thead>
			<tbody class="text-center align-middle">
				<c:forEach items="${order}" var="order">
					<tr class="hover-coral" onclick="location.href='/order/detail?orderId=${order.orderId}'">
						<td>${order.orderId}</td>
						<td><fmt:formatDate value="${order.orderDate}" pattern="yyyy년 MM월 dd일" /></td>
						<td>
							<fmt:formatNumber type="number" pattern="">${order.sum}</fmt:formatNumber> 원
						</td>
						<td>${order.status}</td>
					</tr>
					
				</c:forEach>
			</tbody>
		</table>
		<!--페이징 처리 해야함-->
	</div>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>