/** 추천 상품을 출력하는 자바스크립트 모듈
 * 
 */
console.log("추천 모듈--------------------------------");
var recommendService = (function() {
	// RecommendController로 분석할 문자열을 POST 방식으로 보내는 함수
	// (길이가 매우 길 수도 있기 때문에 POST 방식으로 전송함)
	function getRecommend(param, callback, error) {
		var strValue = param.str;
		var destination = param.destination;
		var token = param.csrf;
		console.log("전송 받은 대상 문자열: " + strValue);
		$.ajax({
			method: "POST",
			url: "/recommend/"+destination,
			headers: {'x-csrf-token' : token},
			data: JSON.stringify({"str" : strValue}),
			success: callback,
			dataType: "json",
			contentType: "application/json"
		}).done(function(data){
			if(data) {
				callback(data);
			}
		});
	}
	return {
		getRecommend : getRecommend
	};
})();