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

<div style= "margin-left: 1100px; padding-top: 50px; padding-bottom: 50px;">
	<c:if test="${islogin eq true }">
		<button id="btnUpdate" class="btn btn-success">수정</button>
		<button id="btnDelete" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">삭제</button>
	</c:if>
</div>

<!-- 게시글 상세 -->
<table class="table table-bordered" style= "font-weight: bold;">
<tr>
	<td class="table-light">글번호</td><td colspan="3">${view.freeNo }</td>
</tr>
<tr>
	<td class="table-light">아이디</td><td>${loginid }</td>
	<td class="table-light">닉네임</td><td>${nick }</td>
</tr>
<tr>
	<td class="table-light">조회수</td><td>${view.freeViews }</td>
	<td class="table-light">작성일</td><td><fmt:formatDate value="${view.freeCreate }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="table-light">제목</td><td colspan="3">${view.freeTitle }</td>
</tr>
<tr>
	<td class="table-light" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">${view.freeContent }</td>
</tr>
</table>

<!-- 첨부파일 -->
<div class="mb-3">
	<c:if test="${not empty boardFile }">
		<a href="./download?fileNo=${boardFile.fileNo }">${boardFile.originName }</a>
	</c:if>
</div>

<!-- 버튼 -->
<div class="text-center mb-3">
	<a href= "/free/main"><button id="btnList" class="btn btn-success">목록</button></a>
	
</div>

<!-- 댓글 -->
	<div class="card my-4">
		<h5 class="card-header" style="font-weight: bold ;">댓글</h5>
		<div class="card-body">
			<form name="comment-form" action="/board/comment/write" method="post" autocomplete="off">
					<textarea name="content" class="form-control" rows="3"></textarea>
				<div style= "padding-top: 50px;">
					<button type="submit" class="btn btn-success">등록</button>
				</div>
			</form>
		</div>
	</div>
	
	
	
</div><!-- .container end -->



<c:import url="../layout/footer.jsp"></c:import>














