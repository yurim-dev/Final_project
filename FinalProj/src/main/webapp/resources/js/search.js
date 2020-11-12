/** 검색 결과를 JSON 파일 형식으로 받아 출력하는 자바스크립트 페이지
 * 1. 전 페이지에서 받아온 검색어와 타입을 출력해본다.
 * 2.  
 */
console.log("검색 결과 출력 테스트----------------------------------");
console.log('<c:out value="${search.query}"></c:out>');
console.log('<c:out value="${search.type}"></c:out>');
var queryValue = '<c:out value="${search.query}"/>';
var typeValue = '<c:out value="${search.type}"/>';

searchService.getResult(
	{query:queryValue, type:typeValue}, function(result) {
		for(var i = 0, len = result.length||0;i<len; i++) {
			console.log(result[i]);
		}
	}
);