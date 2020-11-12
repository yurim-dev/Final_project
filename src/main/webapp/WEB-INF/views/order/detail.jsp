<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세</title>
<link rel="stylesheet" href="/resources/css/order-detail.css">
<script src="/resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
   <jsp:include page="../includes/header.jsp"></jsp:include>
   <div class="jumbotron jumbotron-fluid" id="title">
      <div class="container text-center">
         <h1 class="h1">주문 상세</h1>
      </div>
   </div>
   <div class="container">
      <h3 class="h3">주문 상세 정보</h3>
      <div class="col-sm-12">
         <table class="table table-bordered">
            <tr class="text-center">
               <td colspan="2">주문 번호</td>
               <td colspan="2">${order[0].orderId}</td>
            </tr>
            <tr>
               <td>주문 일시</td>
               <td><fmt:formatDate value="${order[0].orderDate}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"/></td>
               <td>결제 일시</td>
               <td><fmt:formatDate value="${order[0].orderDate}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"/></td>
            </tr>
            <tr>
               <td>주문자</td>
               <td>${order[0].userName}</td>
               <td>배송 상태</td>
               <td>${order[0].status}</td>
            </tr>
            <tr>
               <td>배송 주소</td>
               <td colspan="3">${order[0].address}</td>
            </tr>
            <tr>
               <td>배송 메시지</td>
               <td colspan="3">부재시 경비실에 맡겨주세요.</td>
            </tr>
         </table>
      </div>
      <br>
      <h3 class="h3">주문 상품 정보</h3>
      <table class="table">
         <thead style="text-align: center;">
            <tr>
               <td colspan="2">상품 이름</td>
               <td>수량</td>
               <td>상품 금액</td>
               <td>합계</td>
            </tr>
         </thead>
         <tbody>
            <c:forEach items="${order}" var="order">
               <tr>
                  <td colspan="2"><a href="/goods/detail?goodsNo=${order.goodsNo}">${order.goodsName}</a></td>
                  <td class="text-center">${order.amount}</td>
                  <td class="text-center">
                     <fmt:formatNumber type="number" pattern="">${order.unitPrice}</fmt:formatNumber> 원
                  </td>
                  <td class="text-center">
                     <fmt:formatNumber type="number" pattern="">${order.totalPrice}</fmt:formatNumber> 원
                  </td>
               </tr>
            </c:forEach>
         </tbody>
         <tfoot id="tfoot">
            <tr>
               <td colspan="3">
                  <h3 class="h3 text-center">합계</h3>
               </td>
               <td></td>
               <td class="text-center align-middle">
                  <h3 class="h3">
                     <fmt:formatNumber type="number" pattern="">${sum}</fmt:formatNumber> 원
                  </h3>
               </td>
            </tr>
         </tfoot>
      </table>
      <br>
      <h3 class="h3">결제 정보</h3>
      <hr>
      <div class="text-center">
         <table class="table table-bordered">
            <tr>
               <td class="font-weight-bold">결제 방법</td>
               <td>신용카드</td>
            </tr>
            <tr>
               <td class="font-weight-bold">결제 금액</td>
               <td>
                  <fmt:formatNumber type="number" pattern="">${sum}</fmt:formatNumber> 원
               </td>
            </tr>
         </table>
      </div>
   </div>
   <sec:authorize access="hasRole('ROLE_MEMBER')">
   <div class="container text-center">
      <a class="btn btn-lg" id="history" href="/order/history">
         <strong>목록으로</strong>
      </a>
   </div>
   </sec:authorize>
   <sec:authorize access="hasRole('ROLE_ADMIN')">
   <div class="container text-center">
      <a class="btn btn-lg" id="orderlsit" href="/admin/orderlist">
         <strong>목록으로</strong>
      </a>
   </div>
   </sec:authorize>   
</body>
</html>