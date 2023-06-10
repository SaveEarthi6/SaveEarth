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

		<div id="originFile2">
		<c:if test="${not empty info }">
		<c:forEach items="${infoFile }" var="infoFile">
			<a href="../upload/${infoFile.infoStroedName }" download="${infoFile.infoOriginName}">
				${infoFile.infoOriginName }
			</a><button class="deleteFile btn btn-outline-warning" type="button">삭제</button><br>
			<input type="hidden" value="${infoFile.infoFileNo}" class="infoFileNo">
		</c:forEach>
		</c:if>
		</div>

</body>
</html>