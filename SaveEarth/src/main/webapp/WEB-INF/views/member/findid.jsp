<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<c:import url="../layout/header.jsp"></c:import>
<html>


<body>
<h1> 아이디 찾기 구현 페이지</h1>



<form action="./findid" method="post">
<label>이름</label>
<input type="text" name="userName"><br>
<label>이메일</label>
<input type="email" name="userEmail">


<button class="button">아이디 확인</button>
</form>


</body>
<c:import url="../layout/footer.jsp"></c:import>