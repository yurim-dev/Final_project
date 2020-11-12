/** 장바구니 정보를 결제창으로 보냄
 *  body 태그 끝나기 직전에 jquery랑 같이 붙여야지 작동됨
 */
var checkout = {
	init: function() {
		var _this = this;
		$('#checkout').on('click', function() {
			_this.order();
		});
	},
	// 장바구니에서 결제하기 버튼을 누르면 주문/결제 화면으로 넘어감
	// 그때에 장바구니 물건을 주문/결제 화면으로 보냄
	order: function() {
		var cartObejct = new Object();
		$("input[name=items]:checked").each(function(i) {
			cartArray.push($(this).val());
		});
		var csrf = $('#csrf').val();
		var userId = $('#userId').val();
		var data = {
			"csrf" : csrf,
			"userId" : userId,
			"goodsNo" : cartArray
		};
		
		$.ajax({
			type: 'GET',
			header: '',
			url: '/order/checkout',
			dataType: 'json',
			contentType: 'application/json;charset=utf-8',
			data: JSON.stringify(data)
		}).done(function() {
			window.location.href="/order/checkout";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
};
checkout.init();