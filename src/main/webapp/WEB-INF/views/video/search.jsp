<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${query}의 검색 결과</title>
<link rel="stylesheet" href="/resources/css/video-main.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lemonada&display=swap"
	rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script type="text/javascript" src="/resources/js/youtube_module.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var queryValue = '${query}';
		var result = $('#result');
		var prev = $('#prev');
		var next = $('#next');
		// var pageToken = $('#');
		
		showResult();
		
		// 검색 결과를 출력함
		function showResult(){
			youtubeService.search(
				{query:queryValue}, function(data) {
					var str = "";
					var arr = "";
					if (data == null|| data.length == 0) {
						$("#result").html("<h2>검색 결과가 없습니다.</h2>");
						return;
					}
					for(var i = 0 || 0; i < data.items.length ; i++) {
						str += "<div class='col-md-4 p10'>";
						str += "<a href='/video/play?vid="+data.items[i].id.videoId + "'>";
						str += "<img src='"+data.items[i].snippet.thumbnails.medium.url+"'>"
						str += "</div><div class='col-md-8 p10'>";
						str += "<h2>"+data.items[i].snippet.title+"</h2>";
						str += "<p>"+data.items[i].snippet.description+"</p>";
						str += "</a>";
						str += "</div>";
					}
					if(data.prevPageToken) {
						prev.html("<a onclick='nextOrPrevious(\"" + data.nextPageToken + 
								"\")'><img src='/resources/img/right_arrow.png'></a>");
					}
					if(data.nextPageToken) {
						next.html("<a onclick='nextOrPrevious(\"" + data.nextPageToken + 
								"\")'><img src='/resources/img/right_arrow.png'></a>");
					}
					result.html(str);
				});
		}
	});
	
	// 이전이나 다음 페이지의 컨텐츠를 출력함
	function nextOrPrevious(pageToken) {
		var queryValue = '${query}';
		var result = $('#result');
		var prev = $('#prev');
		var next = $('#next');
		
		$('#result').empty();
		
		youtubeService.otherPages(
				{query:queryValue, token:pageToken}, function(data) {
					var str = "";
					var arr = "";
					if (data == null|| data.length == 0) {
						$("#result").html("<h2>검색 결과가 없습니다.</h2>");
						return;
					}
					for(var i = 0 || 0; i < data.items.length ; i++) {
						str += "<div class='col-md-4 p10'>";
						str += "<a href='/video/play?vid="+data.items[i].id.videoId + "'>";
						str += "<img src='"+data.items[i].snippet.thumbnails.medium.url+"'>"
						str += "</div><div class='col-md-8 p10'>";
						str += "<h2>"+data.items[i].snippet.title+"</h2>";
						str += "<p>"+data.items[i].snippet.description+"</p>";
						str += "</a>";
						str += "</div>";
					}
					if(data.prevPageToken) {
						prev.html("<a onclick='nextOrPrevious(\"" + data.nextPageToken + 
								"\")'><img src='/resources/img/left_arrow.png'></a>");
					}
					if(data.nextPageToken) {
						next.html("<a onclick='nextOrPrevious(\"" + data.nextPageToken + 
								"\")'><img src='/resources/img/right_arrow.png'></a>");
					}
					result.html(str);
				});
	}

</script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../includes/header.jsp"></jsp:include>
	<!-- ↑헤더 - 내용↓ 분할선 -->
	<div class="jumbotron jumbotron-fluid" id="title">
		<div class="container">
			<div id="search_div" class="text-center">
				<form>
				<input name="query" type="text" placeholder="찾고 싶은 레시피를 입력해주세요" id="search" value="${query}">
					<button id="search_btn">검색</button>
				</form>
			</div>
		</div>
	</div>
	<div class="container contents-center">
		<hr id="divider">
	</div>
	<!-- 검색 끝 -->
	<div class="container">
		<div class="row" id="result">
		</div>
	</div>
	<!-- 이전, 다음 페이지 이동 -->
	<div class="container">
		<div class="row">
			<div class="col-md-1" id="prev"></div>
			<div class="col-md-10"></div>
			<div class="col-md-1" id="next"></div>
		</div>
	</div>
</body>
</html>