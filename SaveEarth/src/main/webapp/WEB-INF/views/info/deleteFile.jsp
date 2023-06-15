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

		<c:forEach items="${infoFile}" var="file">
		<div id="originFile2">
		<c:if test="${not empty file }">
			<a href="../upload/${file.infoStoredName }" download="${file.infoOriginName}">
				${file.infoOriginName }
			</a><button class="deleteFile btn btn-outline-warning" type="button">삭제</button><br>
			<input type="hidden" value="${file.infoFileNo}" class="infoFileNo" name="infoFileNo">
		</c:if>
		</div>
		</c:forEach>

		<div id="newFile2">
			<label class="form-label" for="files">새로운 첨부파일</label>
			<input type="file" id="file" name="files" class="form-control" multiple="multiple">
			<small>** 새로운 파일로 첨부하면 기존 파일은 삭제됩니다</small>
		</div>

</body>
</html>