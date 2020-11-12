<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<%@include file="../includes/header.jsp"%>
</head>

<div class='bigPictureWrapper'>
	<div class='bigPicture'>
	</div>
</div>

<style>	
.uploadResult{
width:100%;
background-color:lightgray;
}

.uploadResult ul{
   display:flex;
   flex-flow:row;
   justify-content: center;
   align-items: center;
}

.uploadResult ul li{
   list-style: none;
   padding: 10px;
   align-content:center;
   text-align:center;
   
}

.uploadResult ul li img{
   width:100px;
}

.uploadResult ul li span{
   color:white;
}

.bigPictureWrapper{
   position: absolute;
   display: none;
   justify-content: center;
   align-items : center;
   top:0%;
   width:100%;
   height:100%;
   background-color:gray;
   z-index:100;
   background:rgba(255,255,255,0.5);
}
.bigPicture{
   position:relative;
   display:flex;
   justify-content:center;
   align-items:center;
}

.bigPicture>img{
   width:600px;
}
.center-block(){
	display : block;
	margin-left :auto;
	margin-right:auto;
}
.center-block{
	width:1000px;
	.center-block();
}

#logo{
 	font-family:'Black Han Sans', sans-serif;
    color : black;
    font-size:56px;
}
#logo>h1>a{
    text-decoration: none; color:black;
}
#menu>ul>li>a{
		text-decoration: none;
		}
#login>ul>li>a{
	text-decoration: none;
}
tr>td>a{
	text-decoration:none; 
	color:black;
}

tr>td>a:hover{
	text-decoration:none; 
	color:coral;
}
.box{
	margin:165px;
}

</style>
<body>
<div class="box"></div>
<!-- 	<div class="row center-block">
		<div class="col-md-12">
			<h1 class="page-header">Board Read</h1>
		</div>
		/.col-md-8
	</div> -->
	<!-- /.row -->
	<div class="row center-block">
		<div class="col-md-12">

			<div class="panel panel-default">
				<div class="panel-heading">Board Read Page</div>
				<!-- /.panel-heading -->
				<div class="panel-body">

					<div class="form-group">
						<label>bno</label><input class="form-control" name='bno'
							value='<c:out value="${board.bno }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>Title</label><input class="form-control" name='title'
							value='<c:out value="${board.title }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="3" name='content'
							readonly="readonly"><c:out value="${board.content }" /></textarea>
					</div>

					<div class="form-group">
						<label>Writer</label><input class="form-control" name='writer'
							value='<c:out value="${board.writer }"/>' readonly="readonly">
					</div>

				<!-- 	<button data-oper='modify' class="btn btn-default">Modify</button>
					<button data-oper='list' class="btn btn-info">List</button> -->
					
					<sec:authentication property="principal" var="pinfo"/>
						
						<sec:authorize access="hasRole('ROLE_ADMIN')">		
							<button data-oper='modify' class="btn btn-default" type="submit">수정하기</button>		
						</sec:authorize>
						<button data-oper='list' class="btn btn-info" type="submit">목록으로</button>

					<form id='operForm' action="/board/modify" method="get">
						<input type="hidden" id='bno' name='bno'
							value='<c:out value="${board.bno}"/>'> <input
							type='hidden' name='pageNum'
							value='<c:out value="${cri.pageNum}"/>'> <input
							type='hidden' name='amount'
							value='<c:out value="${cri.amount}"/>'> <input
							type='hidden' name='keyword'
							value='<c:out value="${cri.keyword}"/>'> <input
							type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
					</form>

				</div>
				<!--end panel body  -->

			</div>
			<!--end panel body  -->
		</div>
		<!--end panel body  -->
	</div>
	<!--/.row  -->
	
	<div class="row center-block">
		<div class="col-md-12">
			<div class="panel panel-default">
			
			<div class="panel-heading">Files</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
			<div class="uploadResult">
				<ul>
				</ul>
			</div>
		</div>
		<!--end panel-body  -->
		</div>
	<!--end panel-body  -->
	</div>
	<!--end panel  -->
</div>
<!--/.row  -->
	
	
<%-- 	댓글부분 --%>
<%-- 	<div class='row center-block'>
		<div class="col-md-8">

			<!-- /.panel -->
			<div class="panel panel-default">
				<!--<div class ="panel-heading">
						<i class="fa fa-comments fa-fw"></i> Reply
					</div> -->

				<!--/.panel-heading  -->
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i>Reply
					<sec:authorize access="isAuthenticated()">
					<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New
						Reply</button>
					</sec:authorize>
				</div>
				<div class="panel -body">

					<ul class="chat">
						<!--start reply  -->
						<li class="left clearfix" data-rno='9'>
							<div>
								<div class="header">
									<strong class="promary-font">LUNA</strong> <small
										class="pull-right text-muted">2019-07-23 14:13</small>
								</div>
								<p>Good!!!</p>
							</div>
						</li>
						<!--end reply  -->
					</ul>
					<!--end ul  -->
				</div>
				<!--/.panel .chat-panel  -->
				<div class="panel-footer">			
				</div>
			</div>
		</div> --%>
	</div><!--댓글끝  -->



	<!--Modal  -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Reply</label> 
						<input class="form-control" name='reply'value='New Reply!!!!!'>
					</div>
					<div class="form-group">
						<label>Replyer</label> 
						<input class="form-control" name='replyer'value='replyer'>
					</div>
					<div class="form-group">
						<label>Reply Date</label> 
						<input class="form-control"name='replyDate' value=''>
					</div>

				</div>
				<div class="modal-footer">
					<button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
					<button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
					<button id="modalCloseBtn" type="button" class="btn btn-defalut" data-dismiss='modal'>Close</button>
					<button id="modalRegisterBtn" type="button" class="btn btn-default" data-dismiss='modal'>Register</button>
				</div>
			</div>
			<!--Modal-content  -->

		</div>
		<!-- Modal-dialog -->
	</div>
	<!-- modal -->


<script type = "text/javascript" src="/resources/js/reply.js"></script>

<script>

$(document).ready(function(){

   var operForm = $("#operForm");
   
$("button[data-oper='modify']").on("click", function(e){
   
   operForm.attr("action","/board/modify").submit();
   
});


$("button[data-oper='list']").on("click",function(e){
   
   operForm.find("#bno").remove();
   operForm.attr("action","/board/list")
   operForm.submit();
});
});

</script>

<script>
$(document).ready(function(){
      
   console.log(replyService);
   
})
</script>

<script>

console.log("============");
console.log("JS TEST");

/* var bnoValue = '<c:out value="${board.bno}"/>';

//for replyService add test
replyService.add(
   {reply:"JS Test", replyer:"tester", bno:bnoValue},
   function(result){
      alert("RESULT : "+result);
   }
); */

</script>

<script>
                  
                  console.log("============");
                  console.log("JS TEST");
                  
                  /* var bnoValue = '<c:out value="${board.bno}"/>';
                  
                  //댓글 조회
                  replyService.getList({bno:bnoValue, page:1}, function(list){
                     
                     for(var i = 0, len = list.length||0; i<len; i++){
                        console.log(list[i]);
                     }         
                  });
                  
                  //특정 댓글 삭제
                  replyService.remove(41, function(count){
                     console.log(count);
                     
                     if(count === "success"){
                        alert("REMOVED");
                     }
                     
                  }, function(err){
                     alert('ERROR....');
                  });
                  
                  //댓글 수정 
                  replyService.update({
                     rno : 42,
                     bno : bnoValue,
                     reply : "Modified Reply.....수정"
                  }, function(result){
                     alert("수정 완료.......");
                  });
                  */
                  //특정 댓글 조회
/*                   replyService.get(42, function(data){
                        console.log(data);   
                  }); */
                   
                   
                  </script>

<script>
         $(document).ready(function(){
            var bnoValue = '<c:out value="${board.bno}"/>';
            var replyUL = $(".chat");
            
            showList(1);
            
            function showList(page){
               
               console.log("show list"+page);
               
               replyService.getList({bno:bnoValue, page: page||1}, 
               function(replyCnt,  list){
                  
                  
                   console.log("replyCnt: "+replyCnt);
                  console.log("list: "+list);
                  console.log("list");
                  
                  if(page == -1){
                     
                     pageNum = Math.ceil(replyCnt/10.0);
                     showList(pageNum);
                     return;
                  } 
                  
                  var str = "";         
                  
               if(list == null || list.length == 0){
                  //replyUL.html("");
                     return;
               }
               for(var i = 0, len = list.length||0; i <len; i++){
                  str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
                  str +=" <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
                  str +=" <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
                  str +=" <p>"+list[i].reply+"</p></div></li>";
                  
               }
               replyUL.html(str);
               
               showReplyPage(replyCnt);
               }); //end function
            }//end showList
            
            
            //버튼 이벤트 처리
            var modal=$(".modal");
            var modalInputReply = modal.find("input[name='reply']");
            var modalInputReplyer = modal.find("input[name='replyer']");
            var modalInputReplyDate = modal.find("input[name='replyDate']");
            
            var modalModBtn = $("#modalModBtn");
            var modalRemoveBtn = $("#modalRemoveBtn");
            var modalRegisterBtn = $("#modalRegisterBtn");
            
            var replyer=null;
            
            <sec:authorize access="isAuthenticated()">
            
            replyer='<sec:authentication property="principal.username"/>';
            
            </sec:authorize>
            
            
            var csrfHeaderName = "${_csrf.headerName}";
            var csrfTokenValue = "${_csrf.token}";
            
            
            $("#addReplyBtn").on("click", function(e){
               
               modal.find("input").val("");
               modal.find("input[name='replyer']").val(replyer);
               modalInputReplyDate.closest("div").hide();
               modal.find("button[id !='modalCloseBtn']").hide();
               
               modalRegisterBtn.show();
               
               $(".modal").modal("show");
            });
            //Ajax spring security header...
            $(document).ajaxSend(function(e, xhr, options){
               xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            });
            
            
            //새로운 댓글 추가 처리
            modalRegisterBtn.on("click",function(e){
               
               var reply={
                     reply:modalInputReply.val(),
                     replyer:modalInputReplyer.val(),
                     bno:bnoValue
               };
               replyService.add(reply, function(result){
                  
                  alert(result);
                  
                  modal.find("input").val("");
                  modal.modal("hide");
                  

                  //showList(1);
                  showList(-1);
                  
               });
            });
            
            $(".chat").on("click", "li", function(e){
               var rno = $(this).data("rno");
               
               replyService.get(rno, function(reply){
                  
                  modalInputReply.val(reply.reply);
                  modalInputReplyer.val(reply.replyer);
                  modalInputReplyDate.val(replyService.displayTime( reply.replyDate)).attr("readonly","readonly");
                  modal.data("rno", reply.rno);
                  
                  modal.find("button[id != 'modalCloseBtn']").hide();
                  modalModBtn.show();
                  modalRemoveBtn.show();
                  
                  $(".modal").modal("show");
               });
               
            });
            
            //댓글 수정 버튼 클릭
             modalModBtn.on("click", function(e){
                
                var originalReplyer = modalInputReplyer.val();

               
               var reply = {rno:modal.data("rno"), reply: modalInputReply.val(), replyer: originalReplyer};
               
               if(!replyer){
                  alert("로그인 후 수정하십시오.");
                  modal.modal("hide");
                  return;
               }
               
               console.log("Original Replyer: "+originalReplyer);
               
               if(replyer != originalReplyer){
                  alert("자신이 작성한 댓글만 수정 가능");
                  modal.modal("hide");
                  return;
               }
               
               
               
               replyService.update(reply, function(result){
                  
                  alert(result);
                  modal.modal("hide");
                  showList(pageNum);
                  //showList(1);
                  
               });
               
            });
            
             //댓글 삭제 버튼 클릭 
            modalRemoveBtn.on("click",function(e){
   
   var rno = modal.data("rno");
   
   console.log("RNO: " +rno);
   console.log("REPLYER: " +replyer);
   
   if(!replyer){
      alert("로그인후 삭제가 가능합니다.")
      modal.modal("hide");
      return;
   }
   
   var originalReplyer = modalInputReplyer.val();
   
   console.log("Original Replyer: " + originalReplyer); //댓글의 원래 작성자

   if(replyer != originalReplyer){
      
      alert("자신이 작성한 댓글만 삭제가 가능합니다.");
      modal.modal("hide");
      return;
      
   }
   replyService.remove(rno,originalReplyer,function(result){
      
      alert(result);
      modal.modal("hide");
      showList(pageNum);
   });
   
}); 
            
             var pageNum = 1;
            var replyPageFooter = $(".panel-footer");
            
            function showReplyPage(replyCnt){
               
               var endNum = Math.ceil(pageNum / 10.0)*10;
               var startNum = endNum -9;
               
               var prev = startNum != 1;
               var next = false;
               
               if(endNum * 10 >= replyCnt){
                  endNum = Math.ceil(replyCnt/10.0);
               }
               
               if(endNum * 10 < replyCnt){
                  next = true;
               }
               
               var str = "<ul class='pagination pull-right'>";
               
               if(prev){
                  str+= "<li class= 'page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
               }
               
               for(var i = startNum; i <= endNum; i++){
                  var active = pageNum == i? "active":"";
                  
                  str+= "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
               }
               
               if(next){
                  str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
                  
               }
               str += "</ul></div>";
               
               console.log(str);
               
               replyPageFooter.html(str);
            } 
            
             replyPageFooter.on("click","li a",function(e){
               e.preventDefault();
               console.log("page click");
               
               var targetPageNum = $(this).attr("href");
               
               console.log("targetPageNum: "+targetPageNum);
               
               pageNum = targetPageNum;
               
               showList(pageNum);
            }); 
            
         });
         </script>
<script>
$(document).ready(function(){
   (function(){
      var bno = '<c:out value="${board.bno}"/>';
      $.getJSON("/board/getAttachList", {bno: bno}, function(arr){
         console.log("read 첨부파일 "+arr);
         
         var str = "";
         
         $(arr).each(function(i, attach){
            
            //image type
            if(attach.fileType){
               var fileCallPath = encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
               
               str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"'data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
               str += "<img src='/display?fileName="+fileCallPath+"'>";
               str += "</div>";
               str +"</li>"; 
            }else{
               
               str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"'data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
               str += "<span> "+attach.fileName+"</span><br/>";   
               str += "<img src='/resources/img/attach.png'>";
                  str += "</div>";
                  str += "</li>"; 
            }

         });
         
         $(".uploadResult ul").html(str);
      });//end getjson
   
   })();//end function
   
   
   $(".uploadResult").on("click","li", function(e){
      console.log("view image");
      
      var liObj = $(this);
      
      var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
      
      if(liObj.data("type")){
         showImage(path.replace(new RegExp(/\\/g),"/"));
         
      }else{
         //download
         self.location = "/download?fileName="+path
      }
   });
   
   function showImage(fileCallPath){
      //alert(fileCallPath);
      
   $(".bigPictureWrapper").css("display","flex").show();
   
   $(".bigPicture")
   .html("<img src='/display?fileName="+fileCallPath+"'>")
   .animate({width:'100%', height:'100%'}, 1000);
   }
   
   
       $(".bigPictureWrapper").on("click",function(e){
           
           $(".bigPicture").animate({width:'0%',height:'0%'},1000);
           setTimeout(function(){
              $('.bigPictureWrapper').hide();
           },1000);
        }); 
});


</script>




</body>

</html>