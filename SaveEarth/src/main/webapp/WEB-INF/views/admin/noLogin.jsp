<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

body {
 text-align: center;
}


</style>



</head>
<body>
<a href="/saveearth/main"><img id="logo" src="../../resources/img/logo2.png"></a>
<h1 style="color: red;">회원이 아니면 접근 할 수 없는 페이지 입니다</h1>

<h3>이 페이지가 보이면 로그인 후 이용해 주세요</h3>

<a href="/member/login"> > 일반 로그인 페이지 이동 < </a>
 </body> 
 </html> 

<c:import url="../layout/footer.jsp"/>









