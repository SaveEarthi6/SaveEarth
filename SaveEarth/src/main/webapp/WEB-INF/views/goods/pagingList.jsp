<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<ul class="pagination pagination-sm justify-content-center">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li class="page-item"><a href="./orderList" class="page-link">&laquo;</a></li>	
	</c:if>
	<c:if test="${paging.curPage eq 1 }">
		<li class="page-item disabled"><a href="./orderList" class="page-link">&laquo;</a></li>	
	</c:if>
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="page-item active"><a href="./orderList?curPage=${i }" class="page-link">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li class="page-item"><a href="./orderList?curPage=${i }" class="page-link">${i }</a></li>
	</c:if>
	</c:forEach>
	
	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li class="page-item"><a href="./orderList?curPage=${paging.totalPage }" class="page-link">&raquo;</a></li>	
	</c:if>
	<c:if test="${paging.curPage eq paging.totalPage }">
		<li class="page-item disabled"><a href="./orderList?curPage=${paging.totalPage }" class="page-link">&raquo;</a></li>	
	</c:if>
	
	</ul>
</div>

