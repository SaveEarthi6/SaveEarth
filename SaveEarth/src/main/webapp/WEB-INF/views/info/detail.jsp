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

/* 폰트 */
@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

/* 기사 제목 스타일 */
h1 {
	margin-top: 30px;
	margin-bottom: 30px;
	text-align: center;
	font-weight: bold;
	font-family: 'omyu_pretty';
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
 	font-family: 'omyu_pretty';
 	font-size: 22px;
}

.list{
	text-align: center;
	margin-bottom: 20px;
	font-family: 'omyu_pretty';
	font-size: 20px;
}

.img-thumbnail {
	height: 900px; 
	width: 900px;
	margin-bottom: 30px;
}

</style>

</head>
<body>


<h1>${info.infoTitle }</h1>

<c:forEach items="${infoFile}" var="infoFile">
<div id="thumnail1">
	<img src="/upload/${infoFile.infoStoredName }" class="img-thumbnail" alt="...">
</div>
</c:forEach>


<div class="url">
<a href="https://kids.hyundai.com/kidshyundai/safetyEnvironment/learnenv/environmentList.kids?dtlCtgrLgrpCd=#none" style="margin-left: 530px;">기사 자세히 보기</a>
</div>

<div class="list">
<a href="./main"><button type="button" class="btn btn-success" style="width: 500px; margin-top: 20px;">목록으로</button></a>
</div>

<c:import url="../layout/footer.jsp"/>