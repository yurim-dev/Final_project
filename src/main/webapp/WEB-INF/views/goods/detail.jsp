<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goods_detail_page</title>
	<link rel="stylesheet" href="/resources/css/goodsDetail.css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/detail.js"></script>
<%@ include file="../includes/header.jsp" %>
<style>

.h1{
	font-weight:bolder;
	font-size:56px;
}

</style>
</head>
<body>
    <div id="detail_goods">
        <img src='<c:out value="${detail.thumbImgUrl}"/>' width="430" heigth="552"/>
        <div id="description">    
            <p class="goods_name">   
                <strong class="goods_name"><c:out value="${detail.goodsName}"/></strong>
                <span class="desc"><c:out value="${detail.shortEx}"/></span>
            </p>
            <p class="goods_price">    
                <span class="price"><c:out value="${detail.priceStr}"/></span>
            </p>
        	<div class="goods_info">
                <dl class="list"> 
                    <dt class="tit">판매단위</dt>
                    <dd class="desc"><c:out value="${detail.saleUnit}"/></dd>
                </dl>             
                <dl class="list">
                    <dt class="tit">중량/용량</dt>
                    <dd class="desc"><c:out value="${detail.weight}"/></dd> 
                </dl>                         
                <dl class="list"> 
                    <dt class="tit">배송구분</dt>
                    <dd class="desc"><c:out value="${detail.shippingType}"/></dd>
                </dl>             
                <dl class="list">
                    <dt class="tit">안내사항</dt>
                    <dd class="desc">아래 상세정보 참조</dd>
                </dl>
                <dl class="list"> 
                    <dt class="tit">유통기한</dt>
                    <dd class="desc">아래 상세정보 참조</dd>
                </dl>   
                <br>
                <br>
                               
		        <!-- 목록으로 돌아가기버튼 -->
		        <div id="test">
		        	<div id = "back_block">
						<button class="back_btn">
							<a href="/goods/list">목록으로</a><!-- <img src="/resources/img/exit-door.png" width="72px" height="72px"> -->
						</button>
					</div>  
					
				<!-- 장바구니에 담기버튼 -->
				<div id="get_goods">
					<form>
						<input type="hidden" value="1" id="amount">
						<input type="hidden" value='<c:out value="${detail.goodsNo}"></c:out>' id="goodsNo">
						<input type="hidden" value='<sec:authentication property="principal.username"/>'id="userId">
						<input type="hidden" value="${_csrf.token}" id="csrf">
					</form>
					<button class="cart_btn" id="btn_add" role="button">
						장바구니담기<!-- <img src="/resources/img/basket.png" width="72px" height="72px"> --><!-- <a href="/order/cart"></a> -->
					</button>
				</div>
				<!-- 장바구니 버튼 끝 -->  	   
				</div>                    
            </div>
        </div>  
		
		<br>
		<br>
		<br>    
			<hr>
		<br>
		<br>
		<br>
		
		<div class="deatil_view">
			
			<div class="IntroImg">
				<img src='<c:out value="${detail.goodsIntroImgUrl}"/>'width=1050px;/>
			</div>
			<div class="explain">
				<p class="shortEx"><c:out value="${detail.shortEx}"/></p>
				<p class="goodsName"><c:out value="${detail.goodsName}"/></p>
				<br>
				<br>
				<p class="longEx"><c:out value="${detail.longEx}"/></p>
			</div>
			<br>
			<br>
			<br>
			<div class="ckPointImg">
				<img src='<c:out value="${detail.ckPointImgUrl}"/>'width=1050px;/>
					<c:if test ="${!empty detail.ckPointImgUrl}">
					<br>
					<br>
					<br>
					<br>
				<hr>
				</c:if>
			</div>
			<br>
			<br>
			<div class="DetailImg">
				<img src='<c:out value="${detail.goodsDetailImgUrl}"/>'width=1050px;/>
					<c:if test ="${!empty detail.goodsDetailImgUrl}">
					<br>
					<br>
					<br>
					<br>
				<hr>
				</c:if>
			</div>  			
			<br>
			<br>
			<div class="PickImg">
				<img src='<c:out value="${detail.goodsPickImgUrl}"/>'width=1050px;/>
					<c:if test ="${!empty detail.goodsPickImgUrl}">
					<br>
					<br>
					<br>
					<br>
				<hr>
				</c:if>
			</div>
			<br>
		</div> 
    </div>
    <br>
    <br>
    <br>
    <br>
<script src="/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="/resources/js/add_to_cart.js"></script>

</body>
</html>