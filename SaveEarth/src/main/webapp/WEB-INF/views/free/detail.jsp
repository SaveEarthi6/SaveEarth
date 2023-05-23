<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세</title>

<style type="text/css">

@font-face {
	font-family: 'KBO-Dia-Gothic_bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff')
		format('woff');
		
	font-weight: 700;
	font-style: normal;
}

.free {
	position: absolute;
	top: 38%;
	left: 45%;
	color: #fff;
	font-weight: bold;
	font-size: 50px;
	font-family: 'KBO-Dia-Gothic_bold';
}

.free_detail {
	/* 이미지랑 네비게이션바 띄우기 */
	position: relative;
	width: 100%;
	height: 500px;
}

</style>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "./list"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "./update?boardNo=${viewBoard.boardNo}"
	})
	
	$("#btnDelete").click(function() {
		location.href = "./delete?boardNo=${viewBoard.boardNo}"
	})


</script>

<!-- 자유게시판 디테일 이미지 -->
<div>
	<img class="free_detail" src="../resources/img/free_detail.png">
	<h1 class="free">자유게시판</h1>
	
</div>

<div class="container">

<hr>

<!-- 게시글 상세 -->
<table class="table table-bordered" style= "font-weight: bold;">
<tr>
	<td class="table-light">글번호</td><td colspan="3">${viewBoard.boardNo }</td>
</tr>
<tr>
	<td class="table-light">아이디</td><td>${viewBoard.writerId }</td>
	<td class="table-light">닉네임</td><td>${viewBoard.writerNick }</td>
</tr>
<tr>
	<td class="table-light">조회수</td><td>${viewBoard.hit }</td>
	<td class="table-light">작성일</td><td><fmt:formatDate value="${viewBoard.writeDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="table-light">제목</td><td colspan="3">${viewBoard.title }</td>
</tr>
<tr>
	<td class="table-light" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">${viewBoard.content }</td>
</tr>
</table>

<!-- 첨부파일 -->
<div class="mb-3">
	<c:if test="${not empty boardFile }">
		<a href="./download?fileNo=${boardFile.fileNo }">${boardFile.originName }</a>
	</c:if>
</div>

<div class="text-center mb-3">
	<a href= "/free/main"><button id="btnList" class="btn btn-success">목록</button></a>
	
	<c:if test="${id eq viewBoard.writerId }">
		<button id="btnUpdate" class="btn btn-success">수정</button>
		<button id="btnDelete" class="btn btn-success">삭제</button>
	</c:if>
</div>

</div><!-- .container end -->

<c:import url="../layout/footer.jsp"></c:import>















