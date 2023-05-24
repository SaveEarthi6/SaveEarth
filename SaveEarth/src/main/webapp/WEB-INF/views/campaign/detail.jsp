<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp"></c:import>

<!-- 필요시 css, js, jquery 넣을 곳 -->

<style type="text/css">

#posterWrap { 
	text-align: center; 
} 

#header {
	margin-top: 30px;
}

#poster {
	width: 450px;
	height: 600px;
	
}

#title {
	font-size: 2em;
	font-weight: bold;
	float: left;
}

#info {
	float: left;
}

#clear {
	clear: both;
}

</style>


<div class="container">

<div class="row">
	<div class="col-1"></div>
	<div id="content" class="col-10">
		<div id="header">
			<div id="title">캠페인 제목</div>
			<p id="clear"></p>
			<div id="info">
				<span>작성일</span>
				<span>조회수</span>
			</div>
		</div>
	
		<div id="clear"></div>
		<hr>
		<div id="posterWrap">
			<img id="poster" src="../../resources/img/cat_3.jpg">
		</div>
	</div>
	<div class="col-1"></div>
</div>


</div>

<c:import url="../layout/footer.jsp"></c:import>