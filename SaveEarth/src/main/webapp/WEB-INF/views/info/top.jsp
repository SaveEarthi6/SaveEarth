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

@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
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

/* '정보'버튼 스타일 */
#infobtn {
	font-family: 'omyu_pretty';
	font-size: 18px;
}

/* '자유TOP' 버튼 스타일 */
#freebtn {
	font-family: 'omyu_pretty';
	font-size: 18px;
}


</style>

<script type="text/javascript">

function selectFree() {
	console.log("test")
	document.getElementById('freebtn').className = 'btn btn-success'
	location.href='./top'
}

function selectInfo() {
	console.log("test")
	document.getElementById('infobtn').className = 'btn btn-success'
	location.href='./main'
}

</script>

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
		<button type="button" class="btn btn-outline-success" id="infobtn" onclick="selectInfo()">정보</button>
		<button type="button" class="btn btn-success" id="freebtn" onclick="selectFree()">자유 TOP</button>
	</div>

<h2 style="text-align: center; font-family: KBO-Dia-Gothic_bold ; color: #2B4DA2" >⭐자유게시판 추천수 TOP 10⭐</h2>
<div class="container" style="margin-bottom: 90px;">

<!-- 정보 게시판 list CSS -->
<table id= "board" class= "table table-hover text-center" style= "font-family : omyu_pretty; font-size:20px">

	<tr style= "background-color: #59A8D9; color: white;">
		<th style="width: 10%;">글번호</th>
		<th style="width: 10%;">말머리글</th>
		<th style="width: 20%;">작성자</th>
		<th style="width: 30%; text-align:center">제목</th>
		<th style="width: 10%;">추천수</th>
		<th style="width: 20%;">작성일</th>
	</tr>

<tbody>

<!-- 자유게시판 TOP 추천수 10개 게시글 불러오기 -->
<c:forEach items="${recommend}" var="recommend" varStatus= "status">
	
	<c:if test="${status.index < 10}">

	<tr>
		<td>${recommend.FREE_NO }</td>
		<td>
			<img class="notice" src="../resources/img/bestHeart.png" width= "35px;" > <!-- BEST 이미지 -->
			${recommend.FREE_HEAD }
		</td>
            <c:choose>
            
            <c:when test="${recommend.USER_ID != null }">
            <td>${recommend.USER_ID}</td>
            </c:when>
            
            <c:otherwise>
            <td>관리자</td>
            </c:otherwise>
            
            </c:choose>
		<td class="text-start" style="text-align:center"><a href="/free/view?freeNo=${recommend.FREE_NO }">${recommend.FREE_TITLE }</a></td>
		<td>${recommend.RECOMMEND }</td>
		<td><fmt:formatDate value="${recommend.FREE_CREATE}" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
	
	</c:if>
	
</c:forEach>
</tbody>
</table>



</div><!-- container end -->

<c:import url="../layout/footer.jsp"></c:import>

