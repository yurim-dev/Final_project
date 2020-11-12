<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
<link rel="stylesheet" href="/resources/css/completed.css">
<script src="/resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/resources/css/completed.css" type="stylesheet">
</head>
<body>
	<jsp:include page="../includes/header.jsp"></jsp:include>
	<!-- 헤더 끝 -->
	<div class="jumbotron" id="title">
		<div class="container text-center">
			<h1 class="h1">결제가 완료되었습니다.</h1>
		</div>
	</div>
	<div class="container">
		<hr id="divider">
		<h3 class="h3">주문 상세 정보</h3>
		<div class="col-sm-12">
			<table class="table table-bordered">
				<tr class="text-center">
					<td colspan="2">주문 번호</td>
					<td colspan="2">${order[0].orderId}</td>
				</tr>
				<tr>
					<td>주문 일시</td>
					<td><fmt:formatDate value="${order[0].orderDate}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"/></td>
					<td>결제 일시</td>
					<td><fmt:formatDate value="${order[0].orderDate}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"/></td>
				</tr>
				<tr>
					<td>주문자</td>
					<td><sec:authentication property="principal.member.userName"/></td>
					<td>연락처</td>
					<td><sec:authentication property="principal.member.mailAddress"/></td>
				</tr>
				<tr>
					<td>배송 주소</td>
					<td colspan="3"><sec:authentication property="principal.member.address"/></td>
				</tr>
				<tr>
					<td>배송 메시지</td>
					<td colspan="3">부재시 경비실에 맡겨주세요.</td>
				</tr>
			</table>
		</div>
		<br>
		<h3 class="h3">주문 상품 정보</h3>
		<table class="table">
			<thead style="text-align: center;">
				<tr>
					<td colspan="2">상품 이름</td>
					<td>수량</td>
					<td>상품 금액</td>
					<td>합계</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${goods}" var="item">
					<tr>
						<td width="10%" class="text-center"><input name="items"
							value="${item.goodsNo}" type="hidden"> <img
							src='<c:out value="${item.thumbImgUrl}"></c:out>' width="100px"></td>
						<td>${item.goodsName}</td>
						<td class="text-center">${item.amount}</td>
						<td class="text-center">
							<fmt:formatNumber type="number">${item.unitPrice}</fmt:formatNumber> 원
						</td>
						<td class="text-center">
							<fmt:formatNumber type="number">${item.totalPrice}</fmt:formatNumber> 원
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot id="tfoot">
				<tr class="table">
					<td colspan="2">
						<h3 class="h3 text-center">합계</h3>
					</td>
					<td></td>
					<td colspan="2" class="text-center align-middle">
						<fmt:formatNumber type="number">${sum}</fmt:formatNumber> 원
					</td>
				</tr>
			</tfoot>
		</table>
		<br>
		<h3 class="h3">결제 정보</h3>
		<hr>
		<!-- <div class="col-md-6"></div> -->
		<div class="text-center">
			<table class="table table-bordered">
				<tr>
					<td>결제 방법</td>
					<td>신용카드</td>
				</tr>
				<tr>
					<td>결제 금액</td>
					<td>
						<fmt:formatNumber type="number">${sum}</fmt:formatNumber> 원
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="container text-center">
		<a class="btn btn-lg" id="order" href="/order/history">주문내역 확인</a>
		<a class="btn btn-lg" id="main" href="/">메인으로</a>
	</div>
	<br>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>