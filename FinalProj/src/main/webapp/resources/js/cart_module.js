/** 
 * 주문 페이지 데이터의 수신과 발신을 담당하는 자바스크립트 파일
 */
var cartService = (function() {
	// userId를 전송하고 장바구니 목록을 불러옴
	function getCartList(param, callback, error) {
		var userId = param.userId;
		var token = param.csrf;
		console.log(">>>>>>>>>>>>" + userId + "의 장바구니 출력");
		//alert("장바구니: " + userId);
		//alert("토큰: " + token);
		$.ajax({
			method: 'POST',
			url: '/cart/list',
			// 헤더의 토큰 중요함!!!!
			headers: {'x-csrf-token' : token},
			data: JSON.stringify({"userId":userId}),
			dataType: 'json',
			success: callback,
			contentType: 'application/json;charset=utf-8'
		}).done(function(data) {
			if(data) {
				callback(data);
			}
		}).fail(function(error) {
			alert("출력 에러 발생"+ JSON.stringify(error));
		});
	}
	
	// 수량 변경될 때마다 DB에 반영됨
	function updateAmount(param, callback, error) {
		var amountValue = param.amount;
		var goodsNoValue = param.goodsNo;
		var userIdValue = param.userId;
		var token = param.csrf;
		$.ajax({
			method: 'POST',
			url: '/cart/update',
			headers: {'x-csrf-token' : token},
			data: JSON.stringify({"userId":userIdValue,"goodsNo":goodsNoValue,"amount":amountValue}),
			dataType: 'json',
			contentType: 'application/json;charset=utf-8'
		}).done(function(){
			console.log("개수 업데이트 완료");
		}).fail(function(error) {
			alert("업데이트 에러 발생: " + JSON.stringify(error));
		});
	}
	
	// 수량 변경 후 다시 정보 가져옴
	function getGoods(param, callback, error) {
		var userIdValue = param.userId;
		var goodsNoValue = param.goodsNo;
		var token = param.csrf;
		$.ajax({
			method: 'POST',
			url: '/cart/goods',
			// 헤더의 토큰 중요함!!!!
			headers: {'x-csrf-token' : token},
			data: JSON.stringify({"userId":userIdValue,"goodsNo":goodsNoValue}),
			dataType: 'json',
			success: callback,
			contentType: 'application/json;charset=utf-8'
		}).done(function(data) {
			if(data) {
				callback(data);
			}
		}).fail(function(error) {
			alert("제품 출력 에러 발생: " + JSON.stringify(error));
		});
	}
	
	// 장바구니에서 제품 삭제
	function deleteGoods (param, callback, error) {
		var token = param.csrf;
		var toJson = param.array;
		
		$.ajax({
			method: 'POST',
			url: '/cart/delete',
			// 헤더의 토큰 중요함!!!!
			headers: {'x-csrf-token' : token},
			data: JSON.stringify(toJson),
			dataType: 'json',
			success: callback,
			contentType: 'application/json;charset=utf-8'
		}).done(function(data) {
			if(data) {
				callback(data);
			}
		}).fail(function(error) {
			alert("제품 출력 에러 발생: " + JSON.stringify(error));
		});
	}
	return {
		getCartList : getCartList,
		updateAmount : updateAmount,
		getGoods : getGoods,
		deleteGoods:deleteGoods,
	};
})();
