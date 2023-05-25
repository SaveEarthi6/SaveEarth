<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminheader.jsp"></c:import>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보게시판</title>


<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

/* 썸네일 이미지 클릭했을 때 상세 페이지로 넘어가기 */
$(document).ready(function(){
	
	$("#thumnail1").click(function(){
		$(location).attr("href", "/info/detail")
	})
	$("#thumnail2").click(function(){
		$(location).attr("href", "/info/detail")
	})
	$("#thumnail3").click(function(){
		$(location).attr("href", "/info/detail")
	})
	$("#thumnail4").click(function(){
		$(location).attr("href", "/info/detail")
	})
	$("#thumnail5").click(function(){
		$(location).attr("href", "/info/detail")
	})
	$("#thumnail6").click(function(){
		$(location).attr("href", "/info/detail")
	})


})


</script>

<style type="text/css">


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
	margin-bottom: 50px;
	cursor: pointer;
}

</style>

</head>
<body>



<div class="nav">
<button type="button" class="btn btn-outline-success">전체</button>
<button type="button" class="btn btn-outline-success">정보</button>
<button type="button" class="btn btn-outline-success">자유</button>
</div>

<div class="container">

<!-- 게시판 -->
<table id= "board" class= "table table-striped table-hover text-center">

	<tr>
		<th style="width: 20px;">글번호</th>
		<th style="width: 20px;">제목</th>
		<th style="width: 20px;">작성자</th>
		<th style="width: 20px;">조회수</th>
		<th style="width: 20px;">작성일</th>
	</tr>

</table>

<c:import url="/WEB-INF/views/layout/paging.jsp" />
</div>
<c:import url="../layout/footer.jsp"></c:import>


