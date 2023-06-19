<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/adminheader.jsp"/>

<style>

@font-face {
   font-family: 'KBO-Dia-Gothic_bold';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff')
      format('woff');
      
   font-weight: 700;
   font-style: normal;
}

h1 {
   margin-top:50px;
   color: black;
   font-weight: bold;
   font-size: 50px;
   font-family: 'KBO-Dia-Gothic_bold';
}

.nav{
	margin: 10px auto;
	width: fit-content;
}

.write{
	text-align: right; 
 	margin-right: 100px; 
 	margin-bottom: 20px; 

}

.nav2{
    margin: 0 auto;
    margin-left: 1400px;
}

#prodList {
	text-align: center;
	margin-bottom: 20px;
}

.title2{
    margin-left: 342px;

}
body {
	margin:0;
	padding: 0;
}

</style>
</head>
<body>
<div class="nav">
<h1>상품 관리</h1>
</div>
<br>
<br>
<br>


	<div id="prodList" class="row">
		<div class="col-1"></div>
		
		<div id="infos" class="row col-10">
		
			<c:forEach var="prod" items="${prodList }">
			<div id="prod" class="col">
			
			<div class="title2">
				<a href = "./goodsDelete?prodNo=${prod.PROD_NO}"><button id="btnDelete" class="btn btn-danger">삭제</button></a>
			</div>
			
			<c:if test="${prod.PROD_STORED_NAME ne null }">
					<div>
					<a href="/goods/detail?prodno=${prod.PROD_NO }" id="campTag">
					<img alt="" src="/upload/${prod.PROD_STORED_NAME }" style="width: 400px; height: 300px;">
					</a>
					</div>
			</c:if>
		
			<c:if test="${prod.PROD_STORED_NAME eq null }">
					<div><img alt="" src="" style="width: 400px; height: 300px;"></div>
			</c:if>
			
			
				<div id="campTitle">
					<a href="/goods/detail?prodno=${prod.PROD_NO }" id="campTag">
						<span id="titleTag">[${prod.PROD_NAME }]</span>
						<span id="title">${prod.PROD_PRICE }</span>
					</a>
				</div>
			</div>
			</c:forEach>
		</div>
	
 	<div style="display: inline-block; margin: 0 584px;  float: right;">	
		<a href = "/admin/productWrite"><button type="button" class="btn btn-outline-success">글쓰기</button></a>
		<a href = "/admin/addopt"><button type="button" class="btn btn-outline-success">상품옵션</button></a>
	</div>
	</div>
			
<br>
<br>
<br>



<%-- <span class="float-end mb-3">${paging.totalCount }</span> --%>
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

</div>
</div>
</body>
</html>

<c:import url="../layout/footer.jsp"></c:import>
