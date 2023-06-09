<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminheader.jsp"/>

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
}

/* 기사 이미지 스타일 */
#thumnail1 { 
 	display : flex;
 	margin-left: auto; 
 	margin-right: auto; 
 	align-items: center; 
 	justify-content: center; 
 	
 }
 

/* 기사 내용 스타일 */
.content {
	margin: 0 auto;
	display : block;
	width : 500px;
	text-align: center;
}

/* 기사 url 스타일 */
.url {
	text-align: center;
 	margin-top: 10px;
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

#btnGruop {
	text-align: right;
	margin-right: 350px;
	margin-bottom: 40px;
}

</style>

</head>
<body>


<%-- <c:forEach var="info" items="${info }" varStatus="status"> --%>

<%-- <c:if test="${status.index < 1}"> --%>

<h1>${infoContent.infoTitle }</h1>

<div id="btnGruop">

	<a href="./infoUpdate?infoNo=${infoContent.infoNo }"><button type="button" class="btn btn-danger">수정</button></a>
	<a href="./infoDelete?infoNo=${infoContent.infoNo }"><button type="button" class="btn btn-danger">삭제</button></a>
</div>

<div id="thumnail1">
	<img src="../upload/${infoThumb.thumbStoredName}" class="img-thumbnail" alt="...">
</div>

<c:forEach items="${infoFile }" var="file">
<div class="files">
	<img src="../upload/${file.infoStoredName}" class="img-thumbnail" alt="...">
</div>
</c:forEach>

<div class="content">
${infoContent.infoContent }
</div>

<%-- </c:if> --%>
<%-- </c:forEach> --%>


<div class="url">
<a href="https://kids.hyundai.com/kidshyundai/safetyEnvironment/learnenv/environmentList.kids?dtlCtgrLgrpCd=#none" style="margin-left: 430px;">홈페이지로 이동</a>
</div>

<div class="list">
<a href="/admin/info"><button type="button" class="btn btn-success" style="width: 500px; margin-top: 20px;">목록으로</button></a>
</div>

<c:import url="../layout/footer.jsp"/>