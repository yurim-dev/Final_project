/** 검색 결과 출력을 관리하는 자바스크립트 모듈
 * 	같은 프로젝트 내에 있는 SearchController의 출력 결과(JSON 형식)를 가져온다.
 */
console.log("검색 모듈--------------------------------");
var searchService = (function() {
	// 기본 검색
	function getResult(param, callback, error) {
		var query = param.query;
		var type = param.type;
		console.log(query);
		console.log(type);
		$.getJSON("/search/result?type=" + type +"&query=" + query,
			function(data) {
				if(callback) {
					callback(data);
				}
			}).fail(function(xhr, status, err) {
				if(error) {
					error();
				}
		});
	}
	function getKind (param, callback, error) {
		var query = param.query;
		var type= param.type;
		$.getJSON("/search/kind?type="+type+"&query="+query,
		function(data) {
			if(callback) {
				callback(data);
			}
		}).fail(function(xhr, callback, error) {
			if(error) {
				error();
			}
		});
	}
	function getWay (param, callback, error) {
		var query = param.query;
		var type= param.type;
		$.getJSON("/search/way?type="+type+"&query="+query,
		function(data) {
			if(callback) {
				callback(data);
			}
		}).fail(function(xhr, callback, error) {
			if(error) {
				error();
			}
		});
	}
	// 필터링이 적용된 검색 결과
	function getFilteredResult(param, callback, error) {
		var query = param.query;
		var type = param.type;
		var filter = param.filter;
		var keyword = param.keyword;
		$.getJSON("/search/filter?type="+type+"&query="+query+"&filter="+filter+"&keyword="+keyword,
		function(data) {
			if(callback) {
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}
	// 이름+식재료 통합 검색 결과
	function getGeneral(param, callback, error) {
		var query = param.query;
		$.getJSON("/search/general?query="+query,
			function() {
				if(callback) {
					callback(data);
				}
			}).fail(function(xhr, status, error) {
				if(error) {
					error();
				}
			});
	}
	return {
		getResult : getResult,
		getFilteredResult:getFilteredResult,
		getKind:getKind,
		getWay:getWay,
		getGeneral:getGeneral
	};
})();