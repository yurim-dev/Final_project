<!-- 유튜브 채널 목록을 출력하는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요리 비책 - 채널</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css2?family=Lemonada:wght@500&display=swap" rel="stylesheet"> 
<link rel="stylesheet" href="/resources/css/channels.css">
<script src="/resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<script src="/resources/js/youtube_module.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		var c = new Array();
		c.push('<c:out value="${cList[0].playlistId}"></c:out>');
		c.push('<c:out value="${cList[1].playlistId}"></c:out>');
		c.push('<c:out value="${cList[2].playlistId}"></c:out>');
		c.push('<c:out value="${cList[3].playlistId}"></c:out>');
		
		for(var i = 0; i < c.length; i++) {
			var videoDiv = $('#'+c[i]);
			var pid = $(videoDiv).data('pid');
			 showPlaylist(pid);
			 
		}
        var pageToken = '<c:out value="${pageToken}"></c:out>';
        
        var recipeUI = $('body');

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
                    for (var i = 0 || 0; i < 4; i++) {
                    	str += "<a href='/video/play?vid="+data.items[i].snippet.resourceId.videoId + "' class='d-line'>";
                        str += "<img src='" + data.items[i].snippet.thumbnails.maxres.url + "' width='240px'>";
                       	str += "<p class='text-truncate' style='max-width:240px;'>"+data.items[i].snippet.title +"</p></a>";
                    }
                    videoDiv.html(str);
                });
        }
    });
	
</script>
<style type="text/css">

</style>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../includes/header.jsp"></jsp:include>
	<!-- 콘텐츠 -->
	<div class="container">
	<c:forEach items="${cList}" var="channels">
		<p class="h1">
			<a href="/video/playlist?pid=${channels.playlistId}">
				<c:out value="${channels.channelName}"></c:out><br>
			</a>
		</p>
		<div class="row" id="${channels.playlistId}" data-pid='<c:out value="${channels.playlistId}"></c:out>'></div>
	</c:forEach>
	</div>
</body>
</html>