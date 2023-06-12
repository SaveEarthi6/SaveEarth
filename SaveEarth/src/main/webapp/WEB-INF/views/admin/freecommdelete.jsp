<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <c:forEach items="${comm }" var="comm">
      <img class="commentProfile" src="../resources/img/commentProfile.png">&nbsp;<span
        id="writer" style="font-weight: bold">${comm.USER_ID }</span>
      <br>
      <span id="rs">${comm.COMM_CONTENT }</span>
ㅣ  <span id="writeDate">
	<fmt:formatDate value="${comm.COMM_CREATE}" pattern="yyyy. MM. dd. HH:mm:ss" />
	</span>
	
	<button class="commDelete" data-no="${commContent.COMM_NO }">삭제</button>  
	
      <hr>
   </c:forEach>

</body>
</html>