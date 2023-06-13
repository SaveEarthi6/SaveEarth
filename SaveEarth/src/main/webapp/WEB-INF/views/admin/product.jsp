<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/adminheader.jsp"/>
<!DOCTYPE html>

<style type="text/css">

#prod{
	margin: 20px;
}

/* 글쓰기 버튼 스타일 */
#write {
	text-align: right;
	margin-right: 100px;
	margin-bottom: 20px;
}

#addopt {
	text-align: right;
	margin-right: 100px;
	margin-bottom: 20px;
}

.nav { 
 	margin: 10px auto; 
    width: fit-content;
   	
 } 
#campTitle {
	margin: 10px auto;
	width: 191px; 
}


</style>

<div class="nav">
<h1>상품 관리</h1>
</div>
 <div id=write>
	<a href = "/admin/productWrite"><button type="button" class="btn btn-outline-success">글쓰기</button></a>
</div>
 <div id=addopt>
	<a href = "/admin/addopt"><button type="button" class="btn btn-outline-success">옵션추가</button></a>
</div>

	<div id="prodList" class="row">
		<div class="col-1"></div>
		
		<div id="goods" class="row col-10">
		
			<c:forEach var="prod" items="${prodList }" begin="0" end="2">
			<div id="prod" class="col">
			
			<td><a href = "./goodsDelete?prodNo=${prod.PROD_NO}"><button id="btnDelete" class="btn btn-danger">삭제</button></a></td>
			<a href="/goods/detail?prodno=${prod.PROD_NO }" id="campTag">
			
			<c:if test="${prod.PROD_STORED_NAME ne null }">
					<div><img alt="" src="/upload/${prod.PROD_STORED_NAME }" style="width: 400px; height: 300px;"></div>
			</c:if>
		
			<c:if test="${prod.PROD_STORED_NAME eq null }">
					<div><img alt="" src="" style="width: 400px; height: 300px;"></div>
			</c:if>
			
			
				<div id="campTitle">
					<span id="titleTag">[${prod.PROD_NAME }]</span>
					<span id="title">${prod.PROD_PRICE }</span>
				</div>
			</a>
			</div>
			</c:forEach>
			
		</div>
		
		<div class='col-1'></div>
	</div>

	<div id="prodList" class="row">
		<div class="col-1"></div>
		
		<div id="camps" class="row col-10">
		
			<c:forEach var="prod" items="${prodList }" begin="3" end="5">
			<div id="prod" class="col">
		
			<td><a href = "./goodsDelete?prodNo=${prod.PROD_NO}"><button id="btnDelete" class="btn btn-danger">삭제</button></a></td>
			<a href="/admin/productView?prodno=${prod.PROD_NO }" id="campTag">
			<tr><tr>
				<div><img alt="" src="" style="width: 400px; height: 300px;"></div>
				<div id="campTitle">
					<span id="titleTag">[${prod.PROD_NAME }]</span>
					<span id="title">${prod.PROD_PRICE }원</span>
				</div>
			</a>
			</div>
			</c:forEach>
			
		</div>
		
		<div class='col-1'></div>
	</div>

<span class="float-end mb-3">${paging.totalCount }</span>
<div class="clearfix"></div>

<div>
	<ul class="pagination pagination-sm justify-content-center">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li class="page-item"><a href="./product?freeHead=${freeHead }" class="page-link">&larr; 처음</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li class="page-item"><a href="./product?curPage=${paging.startPage - paging.pageCount }&freeHead=${freeHead}" class="page-link">&laquo;</a></li>
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li class="page-item disabled"><a class="page-link">&laquo;</a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li class="page-item"><a href="./product?curPage=${paging.curPage - 1 }&freeHead=${freeHead}" class="page-link">&lt;</a></li>
	</c:if>
	
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="page-item active"><a href="./product?curPage=${i }&freeHead=${freeHead}" class="page-link">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li class="page-item"><a href="./product?curPage=${i }&freeHead=${freeHead}" class="page-link">${i }</a></li>
	</c:if>
	</c:forEach>
	

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li class="page-item"><a href="./product?curPage=${paging.curPage + 1 }&freeHead=${freeHead}" class="page-link">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li class="page-item"><a href="./product?curPage=${paging.startPage + paging.pageCount }&freeHead=${freeHead}" class="page-link">&raquo;</a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="page-item disabled"><a class="page-link" href="./product?curPage=${paging.totalPage }&freeHead=${freeHead}">&raquo;</a></li>
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li class="page-item"><a href="./product?curPage=${paging.totalPage }&freeHead=${freeHead}" class="page-link">끝 &rarr;</a></li>	
	</c:if>
	
	</ul>
</div>



<c:import url="../layout/footer.jsp"></c:import>