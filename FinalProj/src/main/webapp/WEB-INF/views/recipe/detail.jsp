<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recipe_detail_page</title>
<link rel="stylesheet" href="/resources/css/detail.css"> <!-- diff -->
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
	<!-- 4slider -->
<link rel="stylesheet" type="text/css" href="/resources/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/slick/slick-theme.css" />
	<!-- 4slider -->
<script type="text/javascript" src="/resources/js/jquery-3.5.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<%@ include file="../includes/header.jsp"%>
<style type="text/css">

.box{
	margin:10px;
}
</style>
</head>
<body>


	<div id="recipe">
		<h1>
			<c:out value="${recipe.rcp_nm}" />
		</h1>
		<hr>
		<div id="searchDetail_img">
			<p>
				<img src='${recipe.att_file_no_mk}' width="571px">
			</p>
		</div>
		<div id="ingredients">
			<h2>재료</h2>
			<hr>
			<br>
			<p>
				<c:out value="${recipe.rcp_parts_dtls}"></c:out>
			</p>
		</div>

		<div id="cooking">
			<h2>요리 방법</h2>
			<hr>
			<c:if test="${not empty recipe.manual01}">
				<div>${recipe.manual01}
					<button onclick="makeSound('${recipe.manual01}')">재생</button>
					<br> <img src='${recipe.manual_img01}'>
				</div>
			</c:if>
			<c:if test="${not empty recipe.manual02}">
				<div>${recipe.manual02}
					<button onclick="makeSound('${recipe.manual02}')">재생</button>
					<br> <img src='${recipe.manual_img02}'>
				</div>
			</c:if>
			<c:if test="${not empty recipe.manual03}">
				<div>${recipe.manual03}
					<button onclick="makeSound('${recipe.manual03}')">재생</button>
					<br> <img src='${recipe.manual_img03}'>
				</div>
			</c:if>
			<c:if test="${not empty recipe.manual04}">
				<div>${recipe.manual04}
					<button onclick="makeSound('${recipe.manual04}')">재생</button>
					<br> <img src='${recipe.manual_img04}'>
				</div>
			</c:if>
			<c:if test="${not empty recipe.manual05}">
				<div>${recipe.manual05}
					<button onclick="makeSound('${recipe.manual05}')">재생</button>
					<br> <img src='${recipe.manual_img05}'>
				</div>
			</c:if>
			<c:if test="${not empty recipe.manual06}">
				<div>${recipe.manual06}
					<button onclick="makeSound('${recipe.manual06}')">재생</button>
					<br> <img src='${recipe.manual_img06}'>
				</div>
			</c:if>
			<c:if test="${not empty recipe.manual07}">
				<div>${recipe.manual07}
					<button onclick="makeSound('${recipe.manual07}')">재생</button>
					<br> <img src='${recipe.manual_img07}'>
				</div>
			</c:if>
			<c:if test="${not empty recipe.manual08}">
				<div>${recipe.manual08}
					<button onclick="makeSound('${recipe.manual08}')">재생</button>
					<br> <img src='${recipe.manual_img08}'>
				</div>
			</c:if>
		</div>
	</div>

<div id="slider_goods">
		<!-- 추천 상품 -->
		<form class="form">
<!--모두담기버튼  -->
			<input type="hidden"
				value='<sec:authentication property="principal.username"/>'
				class="userId"> <input type="hidden" value="${_csrf.token}"
				id="csrf">
			<div class="All_btn">
				<button class="All_cart_btn" id="btn_addAll" role="button" style="position: relative; right: -1200px;" >
					모두담기
					<!-- <img src="/resources/img/shopping-cart.png" 
						style="height: 45px; width: 45px; position: relative; right: -1200px;"> -->
				</button>
			</div>	
<!--모두담기버튼 끝  -->
			<section class="regular slider">
				<%-- <input type="hidden"
					value='<c:out value="${recipe.rcp_seq}"></c:out>' id="rcp_seq"> --%>
				<c:forEach var="goods" items="${gList}">
					<div id="relatedGoods">
						<div class="relatedGoods">						
							<img src="${goods.thumbImgUrl}" width="240px" alt="thumnail"
								onclick="btn_add"> <input type="hidden" value="1"id="amount"> 
							<input type="hidden" value='<c:out value="${goods.goodsNo}"></c:out>' class="goodsNo">
							<input type="hidden" value="1" class="amount">	
							<input type="hidden" value='<sec:authentication property="principal.username"/>'id="userId">	
						</div>
						
						<div class="select_btn">
							<button class="cart_btn" role="button">
								<a href="${path}/goods/detail?goodsNo=${goods.goodsNo}"><img src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png"
											style="height: 45px; width: 45px;"></a>
							</button>
						</div>
					</div>
				</c:forEach>
			</section>

		</form>
</div><!--slider_goods(end)  -->

	<!-- recommend-end -->
	
	<div>
		<!-- <a href="javascript:window.history.back()">뒤로 가기</a> -->
	</div>
<script type="text/javascript" src="/resources/slick/slick.min.js"></script>
	<!--추천상품슬라이드JS -->
	<script type="text/javascript">
		/* 	$('#slider-div').slick("unslick");
		 $('#slider-div').slick('slickPlay'); */
		$(".regular").slick({
 			dots : true,
			//infinite : true,
			slidesToShow : 3,
			slidesToScroll : 3
		});
	</script>
	
	<script type="text/javascript" src="/resources/js/add_to_cart.js"></script> <!-- 위치가 중요 -->
	
</body>
</html>