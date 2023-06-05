<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>

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

/* 게시판 이미지 스타일 */
.infoimage {
	position: relative;
}

/* '정보게시판' 문구 스타일 */
.info {
	position: absolute;
	top: 38%; 
	left: 45%; 
	color: #fff; 
	font-weight: bold;
	font-size: 50px;
    font-family: 'KBO-Dia-Gothic_bold';
}

/* 폰트 스타일 */
@font-face {
    font-family: 'KBO-Dia-Gothic_bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff') format('woff');
    font-weight: 700;
    font-style: normal;
}

/* 게시판 분류 버튼 스타일 */
.nav button {  
  	margin-left: 30px;  
	margin-top: 20px;  
 	width: 100px;  
  }  


/* 게시글 분류 전체(div) 스타일 */
.nav { 
 	margin-left: 100px; 
 	margin-bottom: 50px; 
 } 

/* 게시물 전체 감싸는 태그 */
.row {
	text-align: center;
	margin-bottom: 50px;
	cursor: pointer;
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
	margin-top: 10px;
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
}

/* 검색아이콘 이미지 */
.search_icon {
	width: 20px;
	height: 20px;
	margin-bottom: 3px;
	color: white;
}

/* 검색창 스타일 */
input {
	width: 100%;
	border: 1px solid #bbb;
	border-radius: 8px;
	font-size: 14px;
}

/* 게시판 목록 */
#board {
	width:1300px;
	
	margin-top: 70px;
	
	margin-left:auto;
	margin-right:auto;
	
	text-align: center;
}



</style>


</head>
<body>


<div>
	<img class="infoimage" src="../resources/img/info.png" style="width: 100%; height: 500px;">
	<h1 class="info">정보게시판</h1>
</div>

<c:if test="${admin == true }">
<div>
	<a href="/free/write"><button type="button" class="btn btn-outline-success">글쓰기</button></a>
</div>
</c:if>

<div class="nav">
<button type="button" class="btn btn-outline-success">전체</button>
<button type="button" class="btn btn-outline-success">정보</button>
<button type="button" class="btn btn-outline-success">자유</button>
</div>

<div class="container">

<!-- 정보 게시판 -->
	<div id="list" class="row">
		<div class="col-1"></div>
		
		<div id="list" class="row col-10">
		
			<c:forEach var="list" items="${list }" begin="3" end="5">
				{list.infoNo}
				{list.infoTitle}
				{list.infoContent}
				{list.infoUpload}
			</c:forEach>
			
		</div>
		
		<div class='col-1'></div>
	</div>

</div>



<!-- 정보 게시판 list CSS -->
<table id= "board" class= "table table-hover text-center">

	<tr style= "background-color: #59A8D9; color: white;">
		<th style="width: 20px;">글번호</th>
		<th style="width: 30px; text-align:center">제목</th>
		<th style="width: 20px;">조회수</th>
		<th style="width: 20px;">작성일</th>
	</tr>
</table>













<c:import url="../layout/footer.jsp"></c:import>