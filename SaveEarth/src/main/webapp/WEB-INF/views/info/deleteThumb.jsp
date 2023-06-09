<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<div id="originFile1">
		<c:if test="${not empty info }">
		<c:forEach items="${infoThumb }" var="infoThumb">
			<a href="../upload/${infoThumb.thumbStoredName }" download="${infoThumb.thumbOriginName}">
				${infoThumb.thumbOriginName }
			</a><button class="deleteThumb btn btn-outline-warning" type="button">삭제</button><br>
			<input type="hidden" value="${infoThumb.thumbNo}" class="thumbNo">
		</c:forEach>
		</c:if>
		</div>


</body>
</html>