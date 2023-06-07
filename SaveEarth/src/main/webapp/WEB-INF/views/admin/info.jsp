<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="../layout/adminheader.jsp" />

<style type="text/css">

/* 게시판 분류 버튼 스타일 */
.nav button {
	margin-left: 30px;
	margin-top: 20px;
	width: 120px;
}

/* 게시글 분류 전체(div) 스타일 */
.nav {
	margin-left: 30%;
	margin-bottom: 50px;
}

h1 {
	text-align: center;
	margin-bottom: 30px;
}

#write {
    text-align: right;
    margin-right: 100px;
}

#infoTitle {
	margin-top: 10px;
}


#title {
	font-weight: bold;
}



#info {
    width: 225px;
    text-align: center;
    display: block;
    margin-left: 10px;
    margin-right: 10px;
    margin-bottom: 65px;


</style>

<br>
<div class="nav">
	<a href="./free"><button type="button"
			class="btn btn-outline-success" id="top">자유 게시판</button></a> <a
		href="./info"><button type="button"
			class="btn btn-outline-success" id="top">정보 게시판</button></a> <a
		href="./campaign"><button type="button"
			class="btn btn-outline-success" id="top" style="width: 130px;">켐페인 게시판</button></a>
</div>


<div id="write">
<!-- 글쓰기 버튼 -->
	<a href = "/admin/infoWrite"><button type="button" class="btn btn-outline-success">글쓰기</button></a>
</div>

<br>


<h1>정보게시판</h1>

  	<div id="infoList" class="row">
		<div class="col-1"></div>
		
		<div id="infos" class="row col-10">
		
			<c:forEach var="infoList" items="${infoList }">
			<div id="info" class="col">
			<a href="./infoView?infoNo=${infoList.INFO_NO }" id="infoNo">
				<c:if test="${infoList.THUMB_STORED_NAME ne null }">
					<div><img alt="" src="/upload/${infoList.THUMB_STORED_NAME }" style="width: 400px; height: 300px;"></div>
				</c:if>
				<c:if test="${infoList.THUMB_STORED_NAME eq null }">
					<div><img alt="" src="" style="width: 400px; height: 300px;"></div>
				</c:if>
				<div id="infoTitle">
					<span id="title">${infoList.INFO_TITLE }</span>
				</div>
			</a>
			</div>
			</c:forEach>
			
		</div>


</div><!-- infoList end	 -->

<div>
	<ul class="pagination pagination-sm justify-content-center">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li class="page-item"><a href="./info" class="page-link">&larr; 처음</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li class="page-item"><a href="./info?curPage=${paging.startPage - paging.pageCount }" class="page-link">&laquo;</a></li>
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li class="page-item disabled"><a class="page-link">&laquo;</a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li class="page-item"><a href="./info?curPage=${paging.curPage - 1 }" class="page-link">&lt;</a></li>
	</c:if>
	
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="page-item active"><a href="./info?curPage=${i }" class="page-link">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li class="page-item"><a href="./info?curPage=${i }" class="page-link">${i }</a></li>
	</c:if>
	</c:forEach>
	

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li class="page-item"><a href="./info?curPage=${paging.curPage + 1 }" class="page-link">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li class="page-item"><a href="./info?curPage=${paging.startPage + paging.pageCount }" class="page-link">&raquo;</a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="page-item disabled"><a class="page-link" href="./info?curPage=${paging.totalPage }">&raquo;</a></li>
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li class="page-item"><a href="./info?curPage=${paging.totalPage }" class="page-link">끝 &rarr;</a></li>	
	</c:if>
	
	</ul>
</div>


<c:import url="../layout/footer.jsp"></c:import>
