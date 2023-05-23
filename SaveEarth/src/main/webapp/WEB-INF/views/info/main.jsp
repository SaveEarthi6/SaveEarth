<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../header/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보게시판</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

</script>

<style type="text/css">

.infoimage {
	position: relative;
}

.info {
	position: absolute;
	top: 38%; 
	left: 45%; 
/* 	transform: translate(-50%, -50%);  */
	color: #fff; 
	font-weight: bold;
	font-size: 50px;
    font-family: 'KBO-Dia-Gothic_bold';
}


@font-face {
    font-family: 'KBO-Dia-Gothic_bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff') format('woff');
    font-weight: 700;
    font-style: normal;
}

/* ul태그 id=nav, 스타일 적용 */
#nav {
	list-style-type: none;
	margin: 0 auto;
	padding: 0 auto;
	margin-left: 100px;
	margin-top: 20px;
}

/* li태그 네비게이션바 요소 스타일 */
li {
	float: left; 
	background-color: white;
	/* 	background-color: #7CA621; */
	width: 100px;
	text-align: center;
	color: black;
	border: 1px solid #ccc;
	height: 30px;
	padding-top: 12px;
	font-weight: bold;
}

/* 게시판 분류에 마우스 올렸을 때 스타일 */
li:hover {
	color: white;
	background-color: #59A8D9;
}

</style>


</head>
<body>

<!-- 메뉴 네비게이션바 -->

<div>
	<img class="infoimage" src="../resources/img/info.png" style="width: 100%; height: 500px;">
	<h1 class="info">정보게시판</h1>
</div>

<ul id="nav">
	<li>전체</li>
	<li>환경</li>
	<li>자유</li>
</ul>




</body>

</html>