<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp"/>

<style type="text/css">

.campimage {
	position: relative;
}

.camp {
	position: absolute;
	top: 38%; 
	left: 45%; 
/* 	transform: translate(-50%, -50%);  */
	color: #fff; 
	font-weight: bold;
	font-size: 50px;
    font-family: 'KBO-Dia-Gothic_bold';
}


@font-face {
    font-family: 'KBO-Dia-Gothic_bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff') format('woff');
    font-weight: 700;
    font-style: normal;
}


</style>



<div>
	<img class="campimage" src="../resources/img/camp.png" style="width: 100%; height: 500px;">
	<h1 class="camp">캠페인게시판</h1>
</div>	
	
	
<div>

나의 달력

</div>
	


<c:import url="../layout/footer.jsp"/>