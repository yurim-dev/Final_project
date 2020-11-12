<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/search.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lemonada&display=swap"
	rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="/resources/js/result.js"></script>

<title>search_recipe</title>
</head>

<body>
	<header id="logo_header">
		<div id="logo">
			<h1>
				<a href="#">recipe</a>
			</h1>
		</div>
		<nav id="menu">
			<ul>
				<li><a href="#">레시피검색</a></li>
				<li><a href="#">요리비책</a>
				<li><a href="#">게시판</a>
					<ul>
						<li><a href="#">레시피공유</a></li>
						<li><a href="#">공지사항</a></li>
					</ul></li>
				<li><a href="#">스토어</a></li>
			</ul>
		</nav>
		<nav id="login">
			<ul>
				<li><a href="#">로그인 </a></li>
				<li><a href="#"> 회원가입</a></li>
			</ul>
		</nav>
	</header>
	<div id="search">
		<form action="search.html" method="GET">
			<select>
				<option>재료</option>
				<option>요리</option>
			</select> <input type="search" title="검색" placeholder="입력해주세요.">
			<button>검색</button>
		</form>
	</div>

	<div id="block">
		<div id="img_blo">
			<img
				src="http://www.foodsafetykorea.go.kr/uploadimg/cook/10_00095_2.png"
				width=200px; height=200px;>
		</div>
		<div id="content_blo">
			<h2>
				<a>치커리 샐러드와 올리브 마늘 소스</a>
			</h2>
			<br> <br>
			<p>1.ddddddddddddddddddddddd</p>
			<p>2.rrrrrrrrrrrrrrrrrrrrrrr</p>
			<p>3.fffffffffffffffffffffff</p>
			<p>4.ddddddddddddddddddddddd</p>
			<p>5.eeeeeeeeeeeeeeeeeeeeeee</p>
		</div>
	</div>

</body>


</html>