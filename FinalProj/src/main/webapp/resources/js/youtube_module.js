/** 유튜브 API를 사용해 재생목록 데이터를 가져오는 자바스크립트 모듈
 * 
 */
console.log("유튜브 모듈-----------------------------------------------");
var youtubeService = (function() {
   // ****유튜브 API에서 재생목록을 가져오는 함수****
   // 매개변수 : pid(재생목록 id)
   function getPlaylist(param, callback, error) {
      var playlistId = param.playlistId;
      if(param.playlistId != null) {
         var pageToken = param.pageToken;
      }
      var key = "AIzaSyBvsE66PEiO_qaVv_VHTdGeGjjLW8MhuoU";
      var part = "snippet";
      //var playlistName = param.playlistName;
      $.getJSON("https://www.googleapis.com/youtube/v3/playlistItems?part="+part+"&playlistId="
               +playlistId+"&key="+key + "&maxResults=12", 
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
   // ****유튜브 API에서 다음 페이지에 있는 동영상 목록을 가져오는 함수****
   // 매개변수: pid(재생목록 id), nextPageToken(다음 페이지의 id)
   function getPlaylistOther(param, callback, error) {
      var playlistId = param.playlistId;
      var pageToken = param.pageToken;
      
      var key = "AIzaSyBvsE66PEiO_qaVv_VHTdGeGjjLW8MhuoU";
      var part = "snippet";
      //var playlistName = param.playlistName;
      $.getJSON("https://www.googleapis.com/youtube/v3/playlistItems?part="+part+"&playlistId="
               +playlistId+"&key="+key+"&pageToken="+pageToken, 
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
   // ****유튜브에서 동영상의 정보를 가져오는 함수****
   // 매개변수: vid(동영상 id)
   function getVideoDetail(param, callback, error) {
      var vid = param.vid;
      var key = "AIzaSyBvsE66PEiO_qaVv_VHTdGeGjjLW8MhuoU";
      var part = "snippet";
      $.getJSON("https://www.googleapis.com/youtube/v3/videos?part="+part+"&id="+vid+"&key="+key,
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
   //****유튜브에서 검색 결과를 가져오는 함수****
   function search(param, callback, error) {
      var q = param.query;
      var key = "AIzaSyBvsE66PEiO_qaVv_VHTdGeGjjLW8MhuoU";
      var part = "snippet";
      $.getJSON("https://www.googleapis.com/youtube/v3/search?key="+key+"&part="+part+"&q="+q+"&type=video&maxResults=4",
         function(data) {
            if(callback) {
               console.log(q + "의 검색 결과");
               callback(data);
            }
         }).fail(function() {
            alert("에러 발생");
         });
   }
   // ****유튜브 검색 결과 중에서 이전, 다음 페이지를 가져오는 함수****
   // 매개 변수 : 검색어(q),페이지 토큰(pageToken, 유튜브 제공)
   function otherPages(param, callback, error) {
      var q = param.query;
      var page = param.token;
      var key = "AIzaSyBvsE66PEiO_qaVv_VHTdGeGjjLW8MhuoU";
      var part = "snippet";
      $.getJSON("https://www.googleapis.com/youtube/v3/search?key="+key+"&part="+part+"&q="+q+
      "&type=video&maxResults=4" + "&pageToken=" + page,
         function(data) {
            if(callback) {
               console.log(q + "의 검색 결과");
               callback(data);
            }
         }).fail(function() {
            alert("에러 발생");
         });
   }
   return {
      getPlaylist:getPlaylist,
      getPlaylistOther:getPlaylistOther,
      getVideoDetail:getVideoDetail,
      search:search,
      otherPages:otherPages
   }
})();