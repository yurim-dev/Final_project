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
<title>주문 결제</title>
<script src="/resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="/resources/css/checkout.css">
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="/resources/js/cart_module.js"></script>
<script type="text/javascript">
	//var userIdValue = '<sec:authentication property="principal.username"/>';	// 이 부분 에러남
	var token = "${_csrf.token}";
	var goodsTable = $('#goodsTable');

	$(document).ready(
		function() {
			var userIdValue = '<sec:authentication property="principal.username"/>';
			var str = "";
	});
</script>
</head>
<body>
	<!-- 헤더 끝 -->
	<jsp:include page="../includes/header.jsp"></jsp:include>
	<div class="jumbotron jumbotron-fluid" id="title">
		<div class="container" style="text-align: center;">
			<h1 class="h1">주문 결제</h1>
		</div>
	</div>
	<form action="/order/completed" method="POST">
		<div class="container">
			<hr id="divider">
			<h3 class="h3">주문 상품</h3>
			<!-- 상품 출력 부분 시작 -->
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr class="text-center">
							<td colspan="2">상품 정보</td>
							<td>상품 금액</td>
							<td>수량</td>
							<td>주문 금액</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${goods}" var="item">
							<tr>
								<td width="10%" class="text-center">
									<input name="items" value="${item.goodsNo}" type="hidden"> 
									<img src='<c:out value="${item.thumbImgUrl}"></c:out>' width="100px">
								</td>
								<td>${item.goodsName}</td>
								<td class="text-center">${item.amount}</td>
								<td class="text-center">
									<fmt:formatNumber type="number">${item.unitPrice}</fmt:formatNumber>원
								</td>
								<td class="text-center">
									<fmt:formatNumber type="number">${item.totalPrice}</fmt:formatNumber>원
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<!-- 상품 출력 부분 끝 -->
					<tfoot>
						<tr class="table">
							<td colspan="2" class="text-center">
								<strong class="coral">총 주문 금액</strong>
							</td>
							<td colspan="2"></td>
							<td class="text-center coral" id="sum">
							<h3><fmt:formatNumber type="number">${sum}</fmt:formatNumber>원</h3>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		<br>
		<div class="container">
			<h3 class="h3">배송지 정보</h3>
			<input type="hidden" value="<sec:authentication property="principal.username"/>" name="userId">
			<sec:csrfInput />
			<div class="form-group">
				<hr>
				<div class="col-sm-2">
					<label for="userName">이름</label> <input type="text"
						value='<sec:authentication property="principal.member.userName"/>'
						class="form-control" name="name">
				</div>
				<hr>
				<div class="col-sm-6">
					<label for="phone">연락처</label> <input type="text" id="email"
						class="form-control"
						value='<sec:authentication property="principal.member.mailAddress"/>'
						name="phone">
				</div>
				<hr>
				<div class="col-sm-6">
					<!-- 나중에 시간 있으면 카카오 지도 검색 API 넣을 예정 -->
					<!-- 주소 출력 -->
					<label for="address">주소</label> <input type="text" id="address"
						value='<sec:authentication property="principal.member.address"/>'
						class="form-control" name="address">
				</div>
				<hr>
				<div class="col-sm-8">
					<label for="memo">배송 메모</label> <input type="text" id="memo"
						value="부재시 경비실에 맡겨주세요." class="form-control" name="memo">
				</div>
				<hr>
				<div class="col-sm-8">
					<label>결제 방법</label> <select name="payMethod" class="form-control">
						<option>신용카드</option>
					</select>
				</div>
				<br>
				<div class="col-sm-12">
					<!--약관 같은게 들어가야할거 같긴 한데 잘 모르겠어서 일단은 지나감...-->
				</div>
				<div class="col-sm-12" style="text-align: center;">
					<a class="btn btn-lg" href="/goods/list" id="cancel"><strong>취소</strong></a>
					<button class="btn btn-lg" role="submit" id="checkout"><strong>결제하기</strong></button>
				</div>
			</div>
		</div>
	</form>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>