<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="../layout/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

/* 기사 제목 스타일 */
h1 {
	margin-top: 30px;
	margin-bottom: 30px;
	text-align: center;
	font-weight: bold;
}

/* 기사 이미지 스타일 */
#thumnail1 { 
 	display : flex;
 	margin-left: auto; 
 	margin-right: auto; 
 	align-items: center; 
 	justify-content: center; 
 	
 }
 

/* 기사 url 스타일 */
.url {
	text-align: center;
 	margin-top: 10px;
 	margin-bottom: 15px;
}

.list{
	text-align: center;
	margin-bottom: 20px;
}

.img-thumbnail {
	height: 900px; 
	width: 900px;
	margin-bottom: 30px;
}

</style>

</head>
<body>


<c:forEach var="info" items="${info }">
<h1>${info.INFO_TITLE }</h1>

<div id="thumnail1">
	<img src="/upload/${info.INFO_STORED_NAME }" class="img-thumbnail" alt="...">
</div>

</c:forEach>

<div class="url">
<a href="https://kids.hyundai.com/kidshyundai/safetyEnvironment/learnenv/environmentList.kids?dtlCtgrLgrpCd=#none" style="margin-left: 530px;">기사 자세히 보기</a>
</div>

<div class="list">
<a href="./main"><button type="button" class="btn btn-success" style="width: 500px; margin-top: 20px;">목록으로</button></a>
</div>

<c:import url="../layout/footer.jsp"/>