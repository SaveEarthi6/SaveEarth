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

/* .row { */
/* 	margin-bottom: 30px; */
/* } */

#infoTitle {
	margin-top: 10px;
}


#title {
	font-weight: bold;
}


#info {
    width: 225px;
    text-align: center;
    display: block;
    margin-left: 10px;
    margin-right: 10px;
    margin-bottom: 65px;
}

a{ text-decoration: none; } /* 링크텍스트에 밑줄없앰 */
button{ cursor: pointer; } /* 모든 버튼에 마우스손모양 처리 */

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
<button type="button" class="btn btn-success" id="infobtn" onclick="selectInfo()">정보</button>
<button type="button" class="btn btn-outline-success" id="freebtn" onclick="selectFree()">자유</button>
</div>

		
  	<div id="infoList" class="row">
		<div class="col-1"></div>
		
		<div id="infos" class="row col-10">
		
			<c:forEach var="infoList" items="${infoList }">
			<div id="info" class="col">
			<a href="./detail?infoNo=${infoList.INFO_NO }" id="infoNo">
				<c:if test="${infoList.THUMB_STORED_NAME ne null }">
					<div><img alt="" src="/upload/${infoList.THUMB_STORED_NAME }" style="width: 400px; height: 300px;"></div>
				</c:if>
				<c:if test="${infoList.THUMB_STORED_NAME eq null }">
					<div><img alt="" src="" style="width: 400px; height: 300px;"></div>
				</c:if>
				<div id="infoTitle">
					<span id="title">${infoList.INFO_TITLE }</span>
				</div>
			</a>
			</div>
			</c:forEach>
			
		</div>


</div><!-- infoList end	 -->


<div>
	<form action="/info/searchInfo?keyword=${keyword }" method="get">
	    <div class="search">
	        <input type="text" name="keyword" class="search_input"
	        placeholder="검색어를 입력해주세요" value=${keyword }>
	        <button class="search_btn" style="margin-bottom: 3px;"><i class="bi bi-search"></i></button>
	    </div>
	</form>
</div>


<c:import url="../layout/paging.jsp" />


<c:import url="../layout/footer.jsp" />