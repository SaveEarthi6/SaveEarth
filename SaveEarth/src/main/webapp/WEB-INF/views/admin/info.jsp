<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="../layout/adminheader.jsp" />

<style type="text/css">

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
</style>

<br>
<div class="nav">
	<a href="./free"><button type="button"
			class="btn btn-outline-success" id="top">자유 게시판</button></a> <a
		href="./info"><button type="button"
			class="btn btn-outline-success" id="top">정보 게시판</button></a> <a
		href="./campaign"><button type="button"
			class="btn btn-outline-success" id="top">켐페인 게시판</button></a>
</div>
<br>


<h1>정보게시판</h1>


</body>
</html>