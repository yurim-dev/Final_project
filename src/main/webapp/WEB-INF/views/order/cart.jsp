<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>장바구니 상품보기</title>
	<link rel="stylesheet" href="/resources/css/cart.css">
	<script src="/resources/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <script type="text/javascript" src="/resources/js/bootstrap.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="/resources/js/cart_module.js"></script>
	<script type="text/javascript">
	var sumsum = 0;
	$(document).ready(function() {
		var cartTable = $('#cart');
		// 로그인 하지 않은 상태도 고려해야함
		var userIdValue = '<sec:authentication property="principal.username"/>';
		var token ="${_csrf.token}";
		var tokenName = "${_csrf.parameterName}";
		getCart();		// 장바구니 목록을 불러옴
			
		// 장바구니에 있는 물품을 불러오는 함수
		function getCart() {cartService.getCartList(
			{userId:userIdValue, csrf:token},
				function (result) {
				debugger;
				//alert('카트');
				var totalSum = 0;
					var str = "";
					var num = 0;
					if (result == null || result.length == 0) {
						str += "<tr><td class='text-center' colspan='6'>"+
							"<h3 class='h3'>장바구니에 담긴 상품이 없습니다.</h3></td></tr>";
						cartTable.html(str);
						return;
					}
					else {
						for (var i = 0; i < result.length; i++) {
							str += "<tr id='tr_"+result[i].goodsNo+"'>";
							str += "<td class='align-middle'><input type='checkbox' value='"+result[i].goodsNo+"' name='items' checked></td>";
							str += "<td width='10%' class='text-center align-middle'><img src='"
								+result[i].thumbImgUrl+"' width='100px'></td>";
							str += "<td class='align-middle'>"+result[i].goodsName+"</td>";
							str += "<td class='text-center align-middle'><input type='number' data-goodsNo='"
								+result[i].goodsNo+"'";
							str += " onchange='updateGoodsAmount(this)' value='"+result[i].amount+"' min='1'></td>";
							str += "<td class='text-center align-middle'>"+result[i].unitPrice+" 원</td>";
							str += "<td class='text-center align-middle' id='price_"+result[i].goodsNo+"'><strong>"
								+result[i].totalPrice+" 원</strong></td>";
							str += "<td><button class='close' style='padding-top:200%;' onclick='deleteItem("
								+result[i].goodsNo+")'>x</button></td>";
							str += "</tr>";
							totalSum += result[i].totalPrice;
						}
					}
					cartTable.html(str);
					debugger;
					$('#sum').html(totalSum + " 원");
					sumsum = totalSum;
					console.log("합!! " + sumsum);
				}
			);
		}
	});
		
	// 장바구니 페이지가 처음 출력될때 가격의 합계를 구하는 함수
	function getSum() {
		var userIdValue = '<sec:authentication property="principal.username"/>';
		var token ="${_csrf.token}";
		var sumOutput = $('#sum');
		var totalSum = 0;
		cartService.getCartList(
			{userId:userIdValue, csrf:token},
			function(result) {
				sumOutput.empty();
				debugger;
				for(var i=0; i < result.length; i++) {
					totalSum += result[i].totalPrice;
					console.log("합:" + totalSum);
				}
				// 현재 가격이 두 배로 나오는데 이유를 몰겟음
				
				
				sumOutput.html(totalSum + " 원");
			});
	}
	
	// '쇼핑 계속하기' 버튼을 클릭하면 쇼핑몰 메인으로 이동함
	function goShop() {
		window.location.href="/goods/list";
	}
		
		// 장바구니 물건의 개수가 변경되는 이벤트가 발생할 때 마다 개수와 가격을
		// 업데이트해 DB에 반영하는 함수
		function updateGoodsAmount(input) {		// <input>을 매개변수로 받음
			var amountValue = $(input).val();	// 변경된 값
			var goodsNoValue = $(input).data('goodsno');	// 변경할 제품의 id
			var priceTd = $("#price_"+goodsNoValue);
			var userIdValue = '<sec:authentication property="principal.username"/>';
			var token ="${_csrf.token}";
			// 나중에 가격 저장할 변수 선언할 것
			// 개수 변경
			cartService.updateAmount({amount:amountValue, goodsNo:goodsNoValue, userId:userIdValue, csrf:token});
			// 변경된 제품 정보 출력
			cartService.getGoods({userId : userIdValue, goodsNo:goodsNoValue, csrf:token},
				function(result) {
					var str = "<strong>"+result.totalPrice + " 원</strong>";
					priceTd.empty();
					priceTd.html(str);
			});
			//getSum();
		}
		
		// 장바구니 제품 삭제
		function deleteItem(goodsNo) {
			var userIdValue = '<sec:authentication property="principal.username"/>';
			var token ="${_csrf.token}";
			var isDelete = confirm("장바구니에서 제품을 삭제하시겠습니까?");
			var itemDiv = $("#tr_"+goodsNo);
			var itemArray = [{"userId":userIdValue, "goodsNo":goodsNo}];
			
			if(isDelete === true) {
				cartService.deleteGoods({array : itemArray, csrf:token},
					function(result) {
					// getSum();
				});
				itemDiv.remove();
				window.location.href="/order/cart";
			} else {
				window.location.href="/order/cart";
			}
		}
		
		
		
		
	</script>
</head>
<body>
	<jsp:include page="../includes/header.jsp"></jsp:include>
	<!-- 헤더 끝 -->
	<div class="jumbotron" id="title">
        <div class="container" style="text-align: center;">
            <h1 class="h1">장바구니</h1>
        </div>
    </div>
			<div class="history"><a href="/order/history">주문내역</a></div>
			
<!--     <div class="container">
    	<hr id="divider">
    </div> -->
	<div class="container">
		<form action="/order/checkout" method="POST" >
			<sec:csrfInput/>
			<input type="hidden" value="<sec:authentication property="principal.username"/>" name="userId" >
			<table class="table">
                <thead style="text-align: center;">
                	<tr>
                		<td>선택</td>
                        <td>상품 정보</td>
                        <td>수량</td>
                        <td>상품 금액</td>
                        <td>합계</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </thead>
                <tbody id="cart">
                    <!-- 장바구니 목록 출력되는 부분 -->
                </tbody>
                <tfoot id="tfoot">
                    <tr class="alert" >
                        <td colspan="2">
                            <h3 class="h3 text-center">합계</h3>
                        </td>
                        <td colspan="2"></td >
                        <td class="text-center align-middle" colspan="3">
                            <h3 class="h3 font-weight-bold" id="sum">
                            	<!-- 장바구니 물품 총 가격 -->
                            </h3>
                        </td>
                    </tr>
                </tfoot>
            </table>
			<div class="text-center">
        		<a class="btn btn-lg" id="continue" href="/goods/list"><strong>쇼핑 계속하기</strong></a>
        		<button class="btn btn-lg" type="submit" id="checkout"><strong>결제하기</strong></button>
        	</div>
        	
        </form>
    </div>
    <jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>