<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">

/* 여백 없애기 */
body {
	margin:0;
	padding: 0;
}

/* 게시판 메인 이미지 스타일 */
.freeimage {
	/* 이미지랑 네비게이션바 띄우기 */
	position: relative;
	width: 100%;
	height: 500px;
}

/* 이미지 안에 자유게시판 문구 스타일 */
.free {
	position: absolute;
	top: 38%;
	left: 45%;
	/* 	transform: translate(-50%, -50%);  */
	color: #fff;
	font-weight: bold;
	font-size: 50px;
	font-family: 'KBO-Dia-Gothic_bold';
}


/* 검색창 스타일 */
input {
	width: 100%;
	border: 1px solid #bbb;
	border-radius: 8px;
/* 	padding: 10px 12px; */
	font-size: 14px;
}

/* '자유게시판'문구 폰트 스타일 */
@font-face {
	font-family: 'KBO-Dia-Gothic_bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff')
		format('woff');
	font-weight: 700;
	font-style: normal;
}

/* 검색 전체 div태그 스타일 */
.search {
	text-align: center;
	width: 100%;
	height: 100px;
}

/* 검색창 스타일 */
.search_input {
	width: 300px;
	height: 30px;
	font-size: 18px;
	border: 1px solid #ccc;
/* 	border-bottom: 1px black solid; */
}

/* 검색창 버튼 스타일 */
.search_btn {
	font-size: 18px;
	border: none;
	background-color: green;
	width: 50px;
	height: 30px;
	border-radius: 15px;
	color: #fff;
	cursor: pointer;
	vertical-align: middle;
}

/* 검색아이콘 이미지 */
.search_icon {
	margin-top:3px;
	width: 20px;
	height: 20px;
}

/* 게시판 목록 스타일 */
.list {
	margin-top: 70px;
	margin-left: 135px;

}

</style>

</head>
<body>

<!-- 자유게시판 메인 이미지 -->
<div>
	<img class="freeimage" src="../resources/img/free.png">
	<h1 class="free">자유게시판</h1>
</div>

<table class="list">

<tr>
	<td>list1</td>
	<td>list1</td>
	<td>list1</td>
</tr>
<tr>
	<td>list1</td>
	<td>list1</td>
	<td>list1</td>
</tr>
<tr>
	<td>list1</td>
	<td>list1</td>
	<td>list1</td>
</tr>
<tr>
	<td>list1</td>
	<td>list1</td>
	<td>list1</td>
</tr>
<tr>
	<td>list1</td>
	<td>list1</td>
	<td>list1</td>
</tr>

</table>

<div>
        <form action="/info/main">
            <div class="search">
                <input type="text" name="search" class="search_input">
                <button type="button" name="search_btn" class="search_btn"><img src="../resources/img/searchicon.png" class="search_icon"></button>
            </div>
        </form>
</div>




</body>

</html>