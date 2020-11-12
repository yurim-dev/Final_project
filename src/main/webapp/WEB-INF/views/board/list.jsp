<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<%@include file="../includes/header.jsp"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>

#logo {
	font-family: 'Black Han Sans', sans-serif;
	color: black;	
}

#logo>h1>a {
	text-decoration: none;
	color: black;
}

#menu>ul>li>a {
	text-decoration: none;
}

#login>ul>li>a {
	text-decoration: none;
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
.h1{
	font-weight:bolder;
	font-size:56px;
	width:234.19px;
	height:56px;
	padding_bottom:5px;	
}
</style>
</head>	
<body>
	
<!-- <div class="row center-block">
	<div class="col-md-10">
		<h1 class="page-header">Tables</h1>
	</div>
	/.col-md-10
</div> -->
<!-- /.row -->
<div class="box"></div>
<div class="center-block">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				NOTICE
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button id='regBtn' type="button" class="btn btn-xs pull-right">글쓰기</button>
				</sec:authorize>
			</div>
			
			
	<!-- 게시판다중검색 -->			
<%-- 			<div class='row center-block'>
				<div class="col-md-10">
					<form id='searchForm' action="/board/list" method='get'>
						<select name='type'>
							<option value=""
							<c:out value="${pageMaker.cri.type == null?'selected' : '' }"/>>--</option>
								<option value="T"
								<c:out value="${pageMaker.cri.type eq 'T'?'selected' :'' }"/>>제목</option>
								<option value="C"
								<c:out value="${pageMaker.cri.type eq 'C'?'selected' :'' }"/>>내용</option>
								<option value="W"
								<c:out value ="${pageMaker.cri.type eq 'W'?'selected' :''}"/>>작성자</option>
								<option value="TC"
								<c:out value ="${pageMaker.cri.type eq 'TC'?'selected' :''}"/>>제목 or 내용</option>
								<option value="TW"
								<c:out value ="${pageMaker.cri.type eq 'TW'?'selected' :''}"/>>제목 or 작성자</option>
								<option value="TWC"
								<c:out value ="${pageMaker.cri.type eq 'TWC'?'selected' :''}"/>>제목 or 내용 or 작성자</option>
						</select>
						<input type ='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
						<input type="hidden" name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
						<input type="hidden" name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/>
						<button class='btn btn-default'>Search</button>
					</form>
				</div>
			</div> --%>
			
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover">
					<!-- id="dataTables-example"> -->
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>
					</thead>


					<c:forEach items="${list}" var="board">
						<tr>
							<td><c:out value="${board.bno}" /></td>
							<td>
								<a class='move' href='<c:out value="${board.bno}"/>'>
									<c:out value="${board.title}"/>  <b>[	<c:out value=" ${board.replyCnt }"/>	]</b>
								</a>
							</td>
							<td><c:out value="${board.writer}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regDate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updateDate}" /></td>
						</tr>
					</c:forEach>
				</table>
<!--페이지 처리  -->
<%-- 				<div class='pull-right'>
					<ul class="pagination">
						<c:if test="${pagrMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button"${pageMaker.cri.pageNum == num ? "active":""}">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1}">Next</a></li>
						</c:if>
					</ul>
				</div> --%>
				<!--end pagination  -->
				
				
				
				
<form id='actionForm' action="/board/list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
	<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
	<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>	
</form>


			<!-- Modal	추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
<!-- 							<button type="button" class="btn btn-primary">Save
							changes</button> -->

						</div>
					</div>
					<!--/.modal-content  -->
				</div>
				<!--/.modal-dialog  -->
			</div>
			<!-- /.table-responsive -->
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
</div>
<!-- /.col-md-10 -->
</div>
<!-- /.row -->

<script type="text/javascript">

	$(document).ready(function() {
		
		var result = '<c:out value="${result}"/>';

		//alert('aaaaa');
		checkModal(result);
		
		history.replaceState({},null,null);
		
		function checkModal(result){
			
			if(result === '' || history.state){
				return;
			}
			
			if(parseInt(result) > 0 ){
				$(".modal-body").html("게시글" + parseInt(result) +" 번이 등록되었습니다. ");
			
			}
			
			$("#myModal").modal("show");
		} 
		
		$("#regBtn").on("click",function(){
			
			self.location="/board/register";
			
		});	
			var actionForm = $("#actionForm");
			
			$(".paginate_button a ").on("click", function(e){
				
				e.preventDefault();
				
				console.log('click');
				
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
			
			$(".move").on("click",function(e){
				
				e.preventDefault();
				actionForm.append("<input type='hidden' name='bno' value='"+
			$(this).attr("href")+"'>");
				actionForm.attr("action","/board/get");
				actionForm.submit();
			});
			
			var searchForm = $("#searchForm");
			
			$("#searchForm button").on("click",function(e){
				
				
				if(!searchForm.find("option:selected").val()){
					alert("검색종류를 선택하세요");
					return false;
				}
				
				if(!searchForm.find("input[name='keyword']").val()){
					alert("키워드를 입력하세요");
					return false;
				}
				
				searchForm.find("input[name='pageNum']").val("1");
				e.preventDefault();
				
				searchForm.submit();
			});			
		});

	
</script>
</body>
</html>

