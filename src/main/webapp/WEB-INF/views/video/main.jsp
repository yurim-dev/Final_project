<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유튜브 검색 메인</title>
<link rel="stylesheet" href="/resources/css/video-main.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lemonada&display=swap" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.5.1.js"></script>

<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/resources/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="/resources/slick/slick-theme.css"/>
<script type="text/javascript" src="/resources/js/youtube_module.js"></script>

</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../includes/header.jsp"></jsp:include>

	<!-- 페이지 제목 부분 -->
	<div class="jumbotron contents-center" id="title">
			<div id="search_div" class="text-center">
			<form action="/video/search" method="GET">
				<input name= "query" type="text" placeholder="찾고 싶은 레시피를 입력해주세요" id="search">
				<button id="search_btn">검색</button>
			</form>
		</div>
		
	</div>
	<!-- ↑헤더 - 내용↓ 분할선 -->
	<div class="container contents-center">
		<hr id="divider">
	</div>
	<!-- 검색 끝 -->
	<!-- 추천 채널 시작 -->
	<div class="container">
	
	<c:forEach items="${cList}" var="channels">
	<div class="col-md-12">
		<h3>
			<c:out value="${channels.channelName}"></c:out><br>
		</h3>
		<div id="${channels.playlistId}" data-pid='<c:out value="${channels.playlistId}"></c:out>' class="slide"></div>
	</div>
	</c:forEach>
	</div>
	<!-- 추천 채널 끝 -->
	<jsp:include page="../includes/footer.jsp"></jsp:include>
	<script type="text/javascript" src="/resources/slick/slick.js"></script>
	<script type="text/javascript">
	$(document).ready(function () {
		var c = new Array();
		c.push('<c:out value="${cList[0].playlistId}"></c:out>');
		c.push('<c:out value="${cList[1].playlistId}"></c:out>');
		c.push('<c:out value="${cList[2].playlistId}"></c:out>');
		
		for(var i = 0; i < c.length; i++) {
			var videoDiv = $('#'+c[i]);
			var pid = $(videoDiv).data('pid');
			 showPlaylist(pid);
		}
		
        var pageToken = '<c:out value="${pageToken}"></c:out>';

        function showPlaylist(videoDiv) {
        	var videoDiv = $('#'+videoDiv);
            youtubeService.getPlaylist(
                { playlistId: pid },
                function (data) {
                    var str = "";
                    if (data == null || data.length == 0) {
                    	videoDiv.html("");
                        return;
                    }
                    for (var i = 0 || 0; i < 12; i++) {
                    	
                    	str += "<div>";
                    	str += "<a href='/video/play?vid="+data.items[i].snippet.resourceId.videoId + "'>";
                        str += "<img src='" + data.items[i].snippet.thumbnails.medium.url + "' width='240px'>";
                       	str += "<p class='text-truncate' style='max-width:240px;'>"+data.items[i].snippet.title +"</p></a>";
                       	str += "</div>";
                    }
                    videoDiv.slick('slickAdd', str);
                    //videoDiv.html(str);
                    

                });
        }
		$('.slide').slick({
			  infinite: true,
			  slidesToShow: 4,
			  slidesToScroll: 4
		});

    });
</script>
</body>
</html>