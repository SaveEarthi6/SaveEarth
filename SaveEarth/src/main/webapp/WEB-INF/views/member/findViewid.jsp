<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<c:import url="../layout/header.jsp"></c:import>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>








<style type="text/css">
.textForm {
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.btn {
  position:relative;
  left:40%;
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

.btn:hover {
  background-position: center;
}

.box{
	margin : 0 auto;
	text-align: center;
	
	width: 500px;
	
    font-size: 50px;
}
.find {
	margin-bottom: 6px;
	margin-top: 20%;
}
.content{
	width: 700px;
	margin: 0 auto;
	height: 600px;
}
.id{
	font-size: 20px;
    font-weight: bold;
    color: blueviolet;
}
.idid{
	margin:36px;
}
</style>
</head>
<body>



<div class="content">
	<div class="textForm">
	<div class="find">
		<div class="id">아이디찾기</div>
		<div style="border-top: 1px solid;">${id.userName} 님의 정보와 일치하는 아이디 입니다</div>
	</div>	
		<div class="box">
		
		
		
		<div class="idid">${id.userId }</div>
		</div>
	  
	</div>
	
		<div style="width:700px; margin: 0 auto;">
	       <a href="./login"> <button class="btn">로그인하러가기</button></a>
		</div>
</div>




<c:import url="../layout/footer.jsp"></c:import>