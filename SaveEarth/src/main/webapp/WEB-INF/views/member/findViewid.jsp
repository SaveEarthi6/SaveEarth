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
</style>
</head>
<body>




<div class="textForm">

<h1>${id.userName }님의 회원정보와 일치하는 아이디는 ${id.userId }입니다</h1>
  
</div>

	<div style="width:700px; margin: 0 auto;">
       <a href="./login"> <button class="btn">로그인하러가기</button></a>
	</div>



<c:import url="../layout/footer.jsp"></c:import>