<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</head>
<body>
<h1>게시판 리스트</h1>
<hr>

<table>
	<tr>
		<th>글번호</th>
<!-- 		<th>번호</th> -->
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>
	
<c:forEach var="list" items="${list }">
	<tr>
		<td>${list.rnum }</td>
<%-- 		<td>${list.boardNo }</td> --%>
		<td>${list.title }</td>
		<td>${list.writerId }</td>
		<td>${list.hit }</td>

		<td><fmt:formatDate value="${list.writeDate }" pattern ="yyyy-MM-dd"/> </td>
		
	</tr>
</c:forEach>

</table>
<div>

<ul class="pagination justify-content-center">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
	<li class="page-item"><a class="page-link" href="./list${searchParam }">&larr; 처음</a></li>
	</c:if>
	<c:if test="${paging.curPage eq 1 }">
	<li class="page-item disabled"><a class="page-link" href="./list${searchParam }">&larr; 처음</a></li>
	</c:if>
	
	
	
	<%-- 이전 페이징 리스트로 이동 --%>
<%-- 	<li class="page-item"><a class="page-link" href="./list?curPage=${paging.curPage - paging.pageCount }">&laquo;</a></li> --%>
<%-- 	<li class="page-item"><a class="page-link" href="./list?curPage=${paging.endPage - paging.pageCount }">&laquo;</a></li> --%>
	<c:if test="${paging.startPage ne 1 }">
	<li class="page-item"><a class="page-link" href="./list?curPage=${paging.startPage - paging.pageCount }${searchQuery }">&laquo;</a></li>
	</c:if>
	<c:if test="${paging.startPage eq 1 }">
	<li class="page-item"><a class="page-link">&laquo;</a></li>
	</c:if>
	
	


	<%-- 이전 페이지로 이동 --%>
	<c:if test="${paging.curPage gt 1 }">
	<li class="page-item"><a class="page-link" href="./list?curPage=${paging.curPage - 1 }${searchQuery }">&lt;</a></li>
	</c:if>



	<%-- 페이징 번호 리스트 --%>
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
	
		<c:if test="${paging.curPage eq i }">
		<li class="page-item active">
			<a class="page-link" href="./list?curPage=${i }${searchQuery }">${i }</a>
		</li>
		</c:if>
		
		<c:if test="${paging.curPage ne i }">
		<li class="page-item">
			<a class="page-link" href="./list?curPage=${i }${searchQuery }">${i }</a>
		</li>
		</c:if>
		
	</c:forEach>
	
	
	
	<%-- 다음 페이지로 이동 --%>
	<c:if test="${paging.curPage lt paging.totalPage }">
	<li class="page-item"><a class="page-link" href="./list?curPage=${paging.curPage + 1 }${searchQuery }">&gt;</a></li>
	</c:if>




	<%-- 다음 페이징 리스트로 이동 --%>
	<c:if test="${paging.endPage ne paging.totalPage }">
	<li class="page-item"><a class="page-link" href="./list?curPage=${paging.startPage + paging.pageCount }${searchQuery }">&raquo;</a></li>
	</c:if>
	<c:if test="${paging.endPage eq paging.totalPage }">
	<li class="page-item"><a class="page-link">&raquo;</a></li>
	</c:if>
	
	

	
	<%-- 마지막 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
	<li class="page-item"><a class="page-link" href="./list?curPage=${paging.totalPage }${searchQuery }">마지막 &rarr;</a></li>
	</c:if>
	<c:if test="${paging.curPage eq paging.totalPage }">
	<li class="page-item disabled"><a class="page-link" href="./list?curPage=${paging.totalPage }${searchQuery }">마지막 &rarr;</a></li>
	</c:if>
	
	
</ul>

</div>
</body>
</html>