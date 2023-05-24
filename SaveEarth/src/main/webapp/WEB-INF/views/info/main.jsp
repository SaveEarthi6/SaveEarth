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

/* 썸네일 이미지 클릭했을 때 상세 페이지로 넘어가기 */
$(document).ready(function(){
	
	$("#thumnail1").click(function(){
		$(location).attr("href", "/info/detail")
	})
	$("#thumnail2").click(function(){
		$(location).attr("href", "/info/detail")
	})
	$("#thumnail3").click(function(){
		$(location).attr("href", "/info/detail")
	})
	$("#thumnail4").click(function(){
		$(location).attr("href", "/info/detail")
	})
	$("#thumnail5").click(function(){
		$(location).attr("href", "/info/detail")
	})
	$("#thumnail6").click(function(){
		$(location).attr("href", "/info/detail")
	})


})


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
}

</style>


</head>
<body>


<div>
	<img class="infoimage" src="../resources/img/info.png" style="width: 100%; height: 500px;">
	<h1 class="info">정보게시판</h1>
</div>

<div class="nav">
<button type="button" class="btn btn-outline-success">전체</button>
<button type="button" class="btn btn-outline-success">환경</button>
<button type="button" class="btn btn-outline-success">자유</button>
</div>

<div class="container">

<div class="row">	

	<div class="col-sm-4" id="thumnail1">
	<img src="http://www.snpo.kr/data/editor/2204/29da0cc3a9199228b1f876bf0eca7505_1648990579_4091.png" class="img-thumbnail" alt="..." style="height: 300px;">
	</div>
	<div class="col-sm-4" id="thumnail2">
	<img src="http://www.snpo.kr/data/editor/2204/29da0cc3a9199228b1f876bf0eca7505_1648990886_8624.png" class="img-thumbnail" alt="..." style="height: 300px;">
	</div>
	<div class="col-sm-4" id="thumnail3">
	<img src="http://www.snpo.kr/data/editor/2204/29da0cc3a9199228b1f876bf0eca7505_1648991022_9541.png" class="img-thumbnail" alt="..." style="height: 300px;">
	</div>
	
	<div class="col-sm-4">
	<span id="title1">제목1</span>
	</div>
	<div class="col-sm-4">
	<span id="title2">제목2</span>
	</div>
	<div class="col-sm-4">
	<span id="title3">제목3</span>
	</div>

	<div class="col-sm-4">
	<span id="content1">상세내용입니다1</span>
	</div>
	<div class="col-sm-4">
	<span id="content2">상세내용입니다2</span>
	</div>
	<div class="col-sm-4">
	<span id="content3">상세내용입니다3</span>
	</div>

</div>

<div class="row">

	<div class="col-sm-4" id="thumnail4">
	<img src="http://www.snpo.kr/data/editor/2204/29da0cc3a9199228b1f876bf0eca7505_1648990579_4091.png" class="img-thumbnail" alt="..." style="height: 300px;">
	</div>
	<div class="col-sm-4" id="thumnail5">
	<img src="http://www.snpo.kr/data/editor/2204/29da0cc3a9199228b1f876bf0eca7505_1648990886_8624.png" class="img-thumbnail" alt="..." style="height: 300px;">
	</div>
	<div class="col-sm-4" id="thumnail6">
	<img src="http://www.snpo.kr/data/editor/2204/29da0cc3a9199228b1f876bf0eca7505_1648991022_9541.png" class="img-thumbnail" alt="..." style="height: 300px;">
	</div>
	
	<div class="col-sm-4">
	<span id="title1">제목1</span>
	</div>
	<div class="col-sm-4">
	<span id="title2">제목2</span>
	</div>
	<div class="col-sm-4">
	<span id="title3">제목3</span>
	</div>

	<div class="col-sm-4">
	<span id="content1">상세내용입니다1</span>
	</div>
	<div class="col-sm-4">
	<span id="content2">상세내용입니다2</span>
	</div>
	<div class="col-sm-4">
	<span id="content3">상세내용입니다3</span>
	</div>
	
</div>

	<form action="/info/main" method="post">
	    <div class="search">
	        <input type="text" name="search" class="search_input">
	        <button type="button" name="search_btn" class="search_btn"><img src="../resources/img/searchicon.png" class="search_icon"></button>
	    </div>
	</form>

</div>

<c:import url="../layout/footer.jsp"></c:import>