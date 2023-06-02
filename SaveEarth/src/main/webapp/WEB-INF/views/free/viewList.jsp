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

   <c:forEach items="${commList }" var="commList">
      <img class="commentProfile" src="../resources/img/commentProfile.png">&nbsp;<span
         class="writer" style="font-weight: bold">${commList.USER_ID }</span>
      <br>
      <span class="rs">${commList.COMM_CONTENT }</span>
ㅣ  <span class="writeDate"><fmt:formatDate value="${commContent.COMM_CREATE}" pattern="yyyy. MM. dd. HH:mm:ss" /></span>
   </c:forEach>

</body>
</html>