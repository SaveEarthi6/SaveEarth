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
	font-weight: bold;
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
 	margin-bottom: 15px;
}

/* '목록으로' 버튼 스타일 */
.list{
	text-align: center;
	margin-bottom: 20px;
}

/* 이미지 스타일 */
.img-thumbnail {
	height: 900px; 
	width: 900px;
	margin-bottom: 30px;
}

.thumnail1 { 
 	display : flex;
 	margin-left: auto; 
 	margin-right: auto; 
 	align-items: center; 
 	justify-content: center; 
 	
 }

/* 버튼 스타일 */
#btnGruop {
	text-align: right;
	margin-right: 350px;
	margin-bottom: 40px;
}

a{ text-decoration: none; } /* 링크텍스트에 밑줄없앰 */
button{ cursor: pointer; } /* 모든 버튼에 마우스손모양 처리 */


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


<c:forEach items="${infoFile }" var="file">
<div class="thumnail1">
	<img src="/upload/${file.infoStoredName}" class="img-thumbnail" alt="...">
</div>
</c:forEach>


<%-- </c:if> --%>
<%-- </c:forEach> --%>


<div class="url">
	<a href="${infoContent.infoUrl}" style="margin-left: 530px;">기사 자세히 보기</a>
</div>

<div class="list">
<a href="/admin/info"><button type="button" class="btn btn-success" style="width: 500px; margin-top: 20px;">목록으로</button></a>
</div>

<c:import url="../layout/footer.jsp"/>