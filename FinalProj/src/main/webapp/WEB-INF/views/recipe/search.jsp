<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 검색 결과</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/search.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
		rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lemonada&display=swap"
		rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script type="text/javascript" src="/resources/js/search_module.js"></script>
<script type="text/javascript">
	/** 검색 결과를 JSON 파일 형식으로 받아 출력하는 자바스크립트 페이지
	 * 1. 전 페이지에서 받아온 검색어와 타입을 출력해본다.
	 * 2.  
	 */
	
	var queryValue = '<c:out value="${search.query}"></c:out>';
	var typeValue = '<c:out value="${search.type}"></c:out>';

	var subQuery = "type="+typeValue+"&query="+queryValue;
	//  alert(subQuery);
	var resultDiv = $('#result');
	var kindSpan = $('#kind');
	var waySpan = $('#way');
	
	$(document).ready(function() {
		var queryValue = '<c:out value="${search.query}"></c:out>';
		var typeValue = '<c:out value="${search.type}"></c:out>';

		var subQuery = "type="+typeValue+"&query="+queryValue;
		//  alert(subQuery);
		var resultDiv = $('#result');
		var kindSpan = $('#kind');
		var waySpan = $('#way');
		var resetBtn = $('#resetBtn');
		
		showResult();
		getKind();
		getWay();
		
		function showResult() {
			searchService.getResult(
				{query : queryValue, type : typeValue},
					function(result) {
						var str = "";
						if (result == null|| result.length == 0) {
							$("#result").html("");
							return;
						}
						for (var i = 0, len = result.length || 0; i < len; i++) {
							str += "<div id='block' class='col overflow-hidden'>";
							str += "<div id='img_blo'>";
							str += "<a href='/recipe/detail?rcp_seq=" + result[i].rcp_seq + "'>";
							str += "<img src='" + result[i].att_file_no_mk + "' width='200px' height='200px'>";
							str += "<h3 class='h4'>" + result[i].rcp_nm + "</h3></a>";
							str += "</div>";
							str += "</div>";
					}
				resultDiv.html(str);
			});
		}
		
		// 음식 종류 키워드를 출력하는 함수
		function getKind() {
			searchService.getKind(
				{query:queryValue, type:typeValue},
				function(result) {
					var str = "";
					//"<button onclick='getFilterefData("'k'', ")'>";
					if (result == null|| result.length == 0) {
						kindSpan.html("");
						return;
					}
					for(var i = 0; i < result.length; i++) {
						console.log(result[i]);
						str += "<div class='col-md-2 bg-or'>";
						str += "<button type='button' class='btn btn-block bg-or' onclick='getFilteredData(\"k\",\""+result[i]+"\")'>";
						str += "<strong>";
						str += result[i];
						str += "</strong>"
						str += "</button>";
						str += "</div>";
					}
					kindSpan.html(str);
				});
		}
		
		// 조리 방법 키워드를 출력하는 함수
		function getWay() {
			searchService.getWay(
				{query:queryValue, type:typeValue},
				function(result) {
					var str = "";
					//"<button onclick='getFilterefData("'k'', ")'>";
					if (result == null|| result.length == 0) {
						waySpan.html("");
						return;
					}
					for(var i = 0; i < result.length; i++) {
						console.log(result[i]);
						str += "<div class='col-md-2 bg-or''>";
						str += "<button type='button' class='btn btn-block bg-or' onclick='getFilteredData(\"w\",\""+result[i]+"\")'>";
						str += "<strong>";
						str += result[i];
						str += "</strong>"
						str += "</button>";
						str += "</div>";
					}
					waySpan.html(str);
				});
		}
	});
	
	function resetResult() {
		$("#result").empty();
		searchService.getResult(
				{query : queryValue, type : typeValue},
					function(result) {
						var str = "";
						if (result == null|| result.length == 0) {
							$("#result").html("");
							return;
						}
						for (var i = 0, len = result.length || 0; i < len; i++) {
							str += "<div id='block' class='col overflow-hidden'>";
							str += "<div id='img_blo'>";
							str += "<a href='/recipe/detail?rcp_seq=" + result[i].rcp_seq + "'>";
							str += "<img src='" + result[i].att_file_no_mk + "' width='200px' height='200px'>";
							str += "<h3 class='h4'>" + result[i].rcp_nm + "</h3></a>";
							str += "</div>";
							str += "</div>";
					}
				$("#result").html(str);
			});
	
	}

	function getFilteredData (filterValue,keywordValue) {
		console.log("필터링된 검색 결과 출력--------------");
		var str = "";
		$("#result").empty();
		//alert("검색 결과 삭제");
		searchService.getFilteredResult(
				{query:queryValue, type:typeValue, filter:filterValue, keyword:keywordValue},
				function(result) {
					if (result == null|| result.length == 0) {
						$("#result").html("");
						return;
					}
					
					for (var i = 0, len = result.length || 0; i < len; i++) {
						str += "<div id='block' class='col overflow-hidden'>";
						str += "<div id='img_blo'>";
						str += "<a href='/recipe/detail?rcp_seq=" + result[i].rcp_seq + "'>";
						str += "<img src='" + result[i].att_file_no_mk + "' width='200px' height='200px'>";
						str += "<h3 class='h4'>" + result[i].rcp_nm + "</h3></a>";
						str += "</div>";
						str += "</div>";
				}
				$("#result").html(str);
		});
	}
</script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../includes/header.jsp"></jsp:include>
	<!-- ↑헤더 - 내용↓ 분할선 -->
	<div class="container">
		<div id="search">
			<form action="/recipe/search" method="GET">
				<input type="hidden" value="IN" name="type">
				<input name= "query" type="text" placeholder="검색어를 입력해주세요." id="search_S">
				<button id="search_btn">검색</button>
			</form>
		</div>
	</div>
	<div class="container">
		<!--<table class="table">
			<tr>
				
			</tr>
	</table> -->
		<div id="filter">
			<!-- 검색 결과를 필터링할 키워드가 출력되는 곳 -->
			<div class="row row-cols-12 text-center">
				<div class="col">
					요리 종류
				</div>
			</div>
			<div id="kind" class="row"></div>
			<div class="row row-cols-12 text-center">
				<div class="col">
					요리 방법
				</div>
			</div>
			<div id="way" class="row"></div>
			<div class="row row-cols-12 text-center">
				<div class="col">
					<button id="resetBtn" class="btn btn-block" onclick='resetResult()'>
						<strong>초기화</strong>
					</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container text-center">
		<div id="result" class="row row-cols-3">
			<!-- 검색 결과가 출력되는 곳 -->
		</div>
	</div>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>