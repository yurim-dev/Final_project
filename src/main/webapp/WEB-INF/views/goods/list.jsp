<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

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
#title{
    font-size: 18px;
	font-weight: bolder;
	text-decoration: none;

}
#title>a{
text-decoration: none;
color:black;
}
#price{
    font-family: 'Nanum Gothic', sans-serif;
    font-weight:20px;
    color:gray;  
    padding-bottom: 5px;
}
#desc{
    font-family: 'Nanum Gothic', sans-serif;
    font-weight: lighter;
    font-size: 14px;
    padding-bottom: 13px;
}
.nav-tabs>li>a{
	color : black;
	border-radius:5px;
}
.nav-tabs>li>a:hover{
	border-radius:5px;
	background-color:rgba(255, 127, 80, 0.397);
}
	
</style>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/goodsList.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Goods_list_page</title>

<%@ include file="../includes/header.jsp"%>

<div id="search">
	<form id="searchForm" action="/goods/list" method="GET">
		<input id="search_S" type="search" title="검색" placeholder="상품 및 브랜드를 검색하세요!" name="keyword"> 
		<button id="search_button">검색</button>
	</form>   
</div>

	<script type="text/javascript">
	    var searchForm =$("#searchForm");
	    $('#searchForm button').on("click", function(e){
	    	//debugger;  
	    	var keyword=$('#search_S').val();
	    	
	    	console.log("keyword=" + keyword );
	    	
	    	if(searchForm.find("type[name= 'keyword' ]").val()){
	    		alert("키워드를입력");
	    		return false;
	    	}
	    	searchForm.find("input[name= 'pageNum' ]").val("1");
	    	e.preventDefault();
	    	
	    	searchForm.submit();
	    });
	    

	</script>
</head>
<body>	
<div class="container">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#all"> 전체 </a></li>
	    <li><a data-toggle="tab" href="#meal"> 반조리식품 </a></li>
	    <li><a data-toggle="tab" href="#fast"> 간편식 </a></li>
	    <li><a data-toggle="tab" href="#sub"> 소분식재료 </a></li>
  </ul>

	  <div class="tab-content">
	    <div id="all" class="tab-pane fade in active">    
	      <h3>전체</h3>
	      <div id="list_goods">
			<ul>
				<c:forEach items="${list}" var="goods">
					<li id="goods"><a href='/goods/detail?goodsNo=<c:out value="${goods.goodsNo}"/>'>
						<img src='<c:out value="${goods.thumbImgUrl}"/>' width="249" height="320"></a>
							<div id="info_goods">
								<p id="title">
									<a href='/goods/detail?goodsNo=<c:out value="${goods.goodsNo}"/>'>
									<c:out value="${goods.goodsName}"/></a>
								</p>
								<p id="price">
									<c:out value="${goods.priceStr}"/>
								</p>
								<p id="desc">
									<c:out value="${goods.shortEx}"/>
								</p>
							</div>
					</li>
				</c:forEach>
			</ul>
		</div>
    </div>
    <div id="meal" class="tab-pane fade">
      <h3>반조리식품</h3>
      <div id="list_goods">
		<ul>
			<c:forEach items="${list}" var="goods">
				<c:if test="${goods.category eq 'M'}">
					<li id="goods"><a href='/goods/detail?goodsNo=<c:out value="${goods.goodsNo}"/>'>
						<img src='<c:out value="${goods.thumbImgUrl}"/>' width="249" height="320"></a>
							<div id="info_goods">
								<p id="title">
									<a href='/goods/detail?goodsNo=<c:out value="${goods.goodsNo}"/>'>
									<c:out value="${goods.goodsName}"/></a>
								</p>
								<p id="price">
									<c:out value="${goods.priceStr}"/>
								</p>
								<p id="desc">
									<c:out value="${goods.shortEx}"/>
								</p>
							</div>
					</li>
				</c:if>
			</c:forEach>	
		</ul>
	</div> 
    </div>
    <div id="fast" class="tab-pane fade">
      <h3>간편식</h3>
      <div id="list_goods">
		<ul>
			<c:forEach items="${list}" var="goods">
				<c:if test="${goods.category eq 'F'}">
					<li id="goods"><a href='/goods/detail?goodsNo=<c:out value="${goods.goodsNo}"/>'>
						<img src='<c:out value="${goods.thumbImgUrl}"/>' width="249" height="320"></a>
							<div id="info_goods">
								<p id="title">
									<a href='/goods/detail?goodsNo=<c:out value="${goods.goodsNo}"/>'>
									<c:out value="${goods.goodsName}"/></a>
								</p>
								<p id="price">
									<c:out value="${goods.priceStr}"/>
								</p>
								<p id="desc">
									<c:out value="${goods.shortEx}"/>
								</p>
							</div>
					</li>
				</c:if>	
				</c:forEach>
		</ul>
	</div>
    </div>
    <div id="sub" class="tab-pane fade">
      <h2>소분식재료</h2>
      <div id="list_goods">
		<ul>
			<c:forEach items="${list}" var="goods">
				<c:if test="${goods.category eq 'S'}">
					<li id="goods"><a href='/goods/detail?goodsNo=<c:out value="${goods.goodsNo}"/>'>
						<img src='<c:out value="${goods.thumbImgUrl}"/>' width="249" height="320"></a>
							<div id="info_goods">
								<p id="title">
									<a href='/goods/detail?goodsNo=<c:out value="${goods.goodsNo}"/>'>
									<c:out value="${goods.goodsName}"/></a>
								</p>
								<p id="price">
									<c:out value="${goods.priceStr}"/>
								</p>
								<p id="desc">
									<c:out value="${goods.shortEx}"/>
								</p>
							</div>
					</li>
				</c:if> 
			</c:forEach>
		</ul>
	   </div>
    </div>
  </div>
</div>

</body>
</html>