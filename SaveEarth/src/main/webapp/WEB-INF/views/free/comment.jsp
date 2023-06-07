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
        id="writer" style="font-weight: bold">${commList.USER_ID }</span>
      <br>
      <span id="rs">${commList.COMM_CONTENT }</span>
ㅣ  <span id="writeDate">
	<fmt:formatDate value="${commList.COMM_CREATE}" pattern="yyyy. MM. dd. HH:mm:ss" />
	</span>
	
	<!-- 로그인한 아이디랑 댓글 작성한 아이디랑 같을 때 삭제 버튼이 보인다 -->
	<c:if test="${loginId eq commList.USER_ID }">
	<button id="commDelete" class="btn btn-danger">삭제</button>  
    </c:if>
	
      <hr>
   </c:forEach>

</body>
</html>