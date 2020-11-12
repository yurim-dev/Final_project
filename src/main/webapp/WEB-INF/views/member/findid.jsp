<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find ID</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<link href="${path}/resources/css/findid.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>
<script>
	/* function resultId(){
		$.ajax({
			type:"post",
			url:"/member/findid",
			
			dataType:"text",
			data:{
				"findName" : $("#findName").val(),
				"findMail" : $("#findMail").val()},
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},

			success: function(response){
				/* if(data.length != 0){
				 alert("찾으시는 아이디는 "+data+" 입니다.");
				 location.href="../secu/login";
				}else{
					alert("일치하는 정보가 없습니다.");
					location.reload();
				} 
				if(data.length == 0){
					alert("일치하는 정보가 없습니다.");
					location.reload();
				}
			}
		})
	} */
</script>
<body>
<div class="wrap_box">
<div class="box">
<h3>아이디 찾기</h3>
<form action="/member/findidresult" method="post">
<label>이름</label><p>
<input type="text" id="findName" name="findName" placeholder="고객님의 이름을 입력해주세요"/><p>
<label>이메일</label><p>
<input type="text" id="findMail" name="findMail" placeholder="가입시 등록하신 이메일주소를 입력해주세요" /><p>
<input type="submit" value="찾기" onclick="resultId();"/>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</div>
</div>
</body>
</html>