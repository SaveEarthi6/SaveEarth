<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<c:import url="../layout/header.jsp"></c:import>


<!-- jQuery 2.2.4  -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>
</head>

<style type="text/css">
* {
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;

}

body {
  background-image:#34495e;
}

.joinForm {
  position:absolute;
  width:400px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:40%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.joinForm h2 {
  text-align: center;
  margin: 30px;
}

.textForm {
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}


.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.name {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.email {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.nickname {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.cellphoneNo {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

 .btn-bottom { 
  position:relative; 
  left:2%; */
  transform: translateX(-50%); 
  margin-bottom: 40px; 
  width:80%; 
  height:40px; 
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec); 
  background-position: center; 
  background-size: 200%; 
  color:white; 
  font-weight: bold; 
  border:none;
  cursor:pointer; 
  transition: 0.4s; 
  display:inline; 
  margin-left: 60px; 
 } 

.btn-bottom:hover {
  background-position: center;
}

form{
margin: 0 auto;
width: 700px;
}

/*  */
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
 	margin-left: 30%; 
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

</style>

<body>
<br>

<div class="nav">
<a href="./update"><button type="button" class="btn btn-outline-success" id ="top">회원정보 수정</button></a>
<a href="./delete"><button type="button" class="btn btn-outline-success" id ="top">회원정보 탈퇴</button></a>
<a href="./board"><button type="button" class="btn btn-outline-success" id ="top">게시글, 댓글 수정</button></a>
<a href="./order"><button type="button" class="btn btn-outline-success" id ="top">주문내역 수정</button></a>
</div>

<br>

<table class="table table-striped table-hover text-center">

<thead>
	<tr>
		<th style="width: 10%;">글번호</th>
		<th style="width: 45%;">제목</th>
		<th style="width: 20%;">작성자</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>

<tbody>
<c:forEach items="${list }" var="board">
	<tr>
		<td>${board.boardNo }</td>
		<td class="text-start"><a href="./view?boardNo=${board.boardNo }">${board.title }</a></td>
		<td>${board.writerNick }</td>
		<td>${board.hit }</td>
		<td><fmt:formatDate value="${board.writeDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>

</table>




</body>
<c:import url="../layout/footer.jsp"></c:import>