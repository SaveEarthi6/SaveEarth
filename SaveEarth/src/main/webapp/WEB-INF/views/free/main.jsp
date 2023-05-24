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

/* 말머리글 (드롭다운) 크기 늘리기 */
select {
	width:100px;
}

.head {
	padding-left: 1200px;
	padding-top: 50px;
	
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
	margin-bottom:3px;
	width: 20px;
	height: 20px;
}

/* 게시판 목록 */
#board {
	width:1300px;
	
	margin-top: 100px;
	
	margin-left:auto;
	margin-right:auto
}



</style>

</head>
<body>

<!-- 자유게시판 메인 이미지 -->
<div>
	<img class="freeimage" src="../resources/img/free.png">
	<h1 class="free">자유게시판</h1>
</div>

<!-- 말머리글 -->
<div class= "head">
<!-- 	<select> -->
<!-- 		<option value="">선택</option> -->
<!-- 		<option value= "talk">사담</option> -->
<!-- 		<option value= "info">정보</option> -->
<!-- 		<option value= "quest">질문</option> -->
<!-- 	</select> -->

<div class="btn-group">
  <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
  선택
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#">사담</a></li>
    <li><a class="dropdown-item" href="#">정보</a></li>
    <li><a class="dropdown-item" href="#">질문</a></li>
  </ul>
</div>
<!-- 글쓰기 버튼 -->
	<a href = "/free/write"><button type="button" class="btn btn-outline-success">글쓰기</button></a>
</div>

<!-- 게시판 -->
<table id= "board" class= "table table-striped table-hover text-center">

	<tr>
		<th style="width: 20px;">글번호</th>
		<th style="width: 20px;">제목</th>
		<th style="width: 20px;">작성자</th>
		<th style="width: 20px;">조회수</th>
		<th style="width: 20px;">작성일</th>
	</tr>

</table>

<!-- 검색창 -->
<div>
	<form action="/info/main">
	    <div class="search">
	        <input type="text" name="search" class="search_input">
	        <button type="button" name="search_btn" class="search_btn"><img src="../resources/img/searchicon.png" class="search_icon"></button>
	    </div>
	</form>
</div>


<c:import url="../layout/footer.jsp"></c:import>


</body>

</html>