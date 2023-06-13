	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

/* 게시판 분류 버튼 스타일 */
.nav button {  
  	margin-left: 30px;  
	margin-top: 20px;  
 	width: 100px;  
  }  


/* 게시글 분류 전체(div) 스타일 */
.nav { 
	margin: 0 auto;
	margin-left:615px; 
/*  }   */

/* 게시물 전체 감싸는 태그 */
.row {
	text-align: center;
	margin-bottom: 50px;
	cursor: pointer;
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

.main{
margin: 0 auto;
}

</style>

<body>
<br>

<div class="nav">
<a href="./update"><button type="button" class="btn btn-outline-success" id ="top">회원정보 수정</button></a>
<a href="./delete"><button type="button" class="btn btn-outline-success" id ="top">회원정보 탈퇴</button></a>
<a href="./board"><button type="button" class="btn btn-outline-success" id ="top">작성글<br>보기</button></a>
<a href="./order"><button type="button" class="btn btn-outline-success" id ="top">주문내역 확인</button></a>
<a href="./comment"><button type="button" class="btn btn-outline-success" id ="top">작성 댓글 보기</button></a>
</div>

<br>

<div class="main">

<form action="./delete" method="post">

<table class="table table-bordered">
    <tr>
      <td>아이디</td>
      <td>${info.userId }</td>
    </tr>
    <tr>
    
    <tr>
      <td>패스워드</td>
      <td>${info.userPw}</td>
    </tr>
    
    <tr>
      <td>닉네임</td>
      <td>${info.userNick}</td>
    </tr>
    
    <tr>
      <td>이메일</td>
      <td>${info.userEmail}</td>
    </tr>
    
    <tr>
      <td>연락처</td>
      <td>${info.userPhone}</td>
    </tr>
</table>


	<button class="btn-bottom">회원 탈퇴</button>

</form>

</div>

</body>
<c:import url="../layout/footer.jsp"></c:import>