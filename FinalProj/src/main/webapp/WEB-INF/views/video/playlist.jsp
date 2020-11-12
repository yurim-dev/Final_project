<!-- 유튜브 재생 목록을 출력할 때의 첫 번째 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="/resources/js/jquery-3.5.1.js" type="text/javascript"></script>
    <script src="/resources/js/youtube_module.js"></script>
	<link rel="stylesheet" href="/resources/css/bootstrap.css">
	<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
	<style type="text/css">

#logo>h1>a{
       text-decoration: none;
      font-family: 'Lemonada', cursive;
      font-size:53px;    
      font-weight: bolder;
       
      }
#menu>ul>li>a{
      text-decoration: none;
      }
#login>ul>li>a{
   text-decoration: none;
}      
</style>
    <script>
        $(document).ready(function () {
            var pid = '<c:out value="${pid}"></c:out>';
            var pageToken = '<c:out value="${pageToken}"></c:out>';
            
            var recipeUI = $('#video');

            showPlaylist();

            function showPlaylist() {
                youtubeService.getPlaylist(
                    { playlistId: pid },
                    function (data) {
                        var str = "";
                        if (data == null || data.length == 0) {
                            recipeUI.html("");
                            return;
                        }
                        for (var i = 0 || 0; i < 5; i++) {
                        	str += "<a href='/video/play?vid="+data.items[i].snippet.resourceId.videoId + "'>";
                            str += "<img src='" + data.items[i].snippet.thumbnails.maxres.url + "' width='240px'>";
                            str += "<br>"
                           	str += data.items[i].snippet.title +"</a>";
                            str += "<hr>"
                            
                        }
                        if(data.nextPageToken != null) {
                        	str += "<div class='col-md-12'><a href='/video/playlistOther?pid=" +pid + "&pageToken="+ data.nextPageToken + "'><h1>→</h1></a></div><br>";
                        }
                        recipeUI.html(str);
                    });
            }
        });

    </script>
    <link rel="stylesheet" href="/resources/css/playlist.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lemonada&display=swap"
	rel="stylesheet">
</head>

<body>
    <jsp:include page="../includes/header.jsp"></jsp:include>
    <div class="container">
    	<div class="row" id="video">
    	</div>
    </div>
</body>

</html>