<!-- 유튜브 재생목록에서 이전, 다음 페이지를 출력하는 페이지 -->
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
            var token = '<c:out value="${pageToken}"></c:out>';
            
            var recipeUI = $('#video');

            showResult();

            function showResult() {
                youtubeService.getPlaylistOther(
                    { playlistId: pid, pageToken:token },
                    function (data) {
                        var str = "";
                        if (data == null || data.length == 0) {
                            recipeUI.html("");
                            return;
                        }
                        for (var i = 0 || 0; i < 5; i++) {
                        	str += "<a href='/video/play?vid="+data.items[i].snippet.resourceId.videoId + "'>";
                            str += "<img src='" + data.items[i].snippet.thumbnails.medium.url + "' width='240px'>";
                            str += "<br><p class='overflow-auto'>"
                           	str += data.items[i].snippet.title +"</p></a>";
                            str += "<hr>";
                        }
              				str += "<div class='col-md-12'><a href='/video/playlistOther?pid=" +pid + "&pageToken="+ data.prevPageToken + "'><h1>←</h1></a><br></div>";
                        if(data.nextPageToken != null) {
                        	str += "<div class='col-md-12'><a href='/video/playlistOther?pid=" +pid + "&pageToken="+ data.nextPageToken + "'><h1>→</h1></a><br></div>";
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