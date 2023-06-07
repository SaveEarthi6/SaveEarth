<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:import url="../layout/adminheader.jsp"/>
<style type="text/css">
/* 여백 없애기 */
body {
   margin:0;
   padding: 0;
}

/* 게시판 메인 이미지 스타일 */
.freeimage {
   /* 이미지랑 네비게이션바 띄우기 */
   position: relative;
   width: 100%;
   height: 500px;
}

/* 이미지 안에 자유게시판 문구 스타일 */
.free {
   position: absolute;
   top: 38%;
   left: 45%;
   color: #fff;
   font-weight: bold;
   font-size: 50px;
   font-family: 'KBO-Dia-Gothic_bold';
}


/* 검색창 스타일 */
input {
   width: 100%;
   border: 1px solid #bbb;
   border-radius: 8px;
   font-size: 14px;
}

/* '자유게시판'문구 폰트 스타일 */
@font-face {
   font-family: 'KBO-Dia-Gothic_bold';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff')
      format('woff');
      
   font-weight: 700;
   font-style: normal;
}

/* 말머리글 (드롭다운) 크기 늘리기 */
select {
   width:100px;
}

.head {
   padding-left: 1200px;
   padding-top: 50px;
   
}

/* 검색 전체 div태그 스타일 */
.search {
   text-align: center;
   width: 100%;
   height: 100px;
}

/* 검색창 스타일 */
.search_input {
   width: 300px;
   height: 30px;
   font-size: 18px;
   border: 1px solid #ccc;
}

/* 검색창 버튼 스타일 */
.search_btn {
   font-size: 18px;
   border: none;
   background-color: green;
   width: 50px;
   height: 30px;
   border-radius: 15px;
   color: #fff;
   cursor: pointer;
   vertical-align: middle;
}

/* 검색아이콘 이미지 */
.search_icon {
   margin-top:3px;
   margin-bottom:3px;
   width: 20px;
   height: 20px;
}

/* 게시판 목록 */
#board {
   width:1300px;
   
   margin-top: 100px;
   
   margin-left:auto;
   margin-right:auto;
   
   text-align: center;
}
/* 게시글 분류 전체(div) 스타일 */
.nav { 
    margin: 0 auto; 
    width: fit-content;
    
 } 

#write {
	text-align: right;
	margin-right: 100px;
}

#info {
	margin-left: 10px;
}

#camp {
	margin-left: 10px;
}

h1 {
	text-align: center;
	margin-bottom: 30px;
}

#info {
    width: 225px;
    text-align: center;
    display: block;
    margin-left: 10px;
    margin-right: 10px;
    margin-bottom: 65px;
}

</style>


<script type="text/javascript">
$(document).ready(function() {
   $("#btnList").click(function() {
      location.href = "/admin/campagign"
   })
   
   $("#btnDelete").click(function() {
      location.href = "./campaignDelete?campNo=${view.CAMP_NO}"
   })
})
</script>


<br>
<div class="nav">
<a href="./free"><button type="button" class="btn btn-outline-success" id ="free">자유 게시판</button></a>
<a href="./info"><button type="button" class="btn btn-outline-success" id ="info">정보 게시판</button></a>
<a href="./campaign"><button type="button" class="btn btn-outline-success" id ="camp">켐페인 게시판</button></a>
</div> 

<br>

<div id="write">
<!-- 글쓰기 버튼 -->
   <a href = "/admin/infoWrite"><button type="button" class="btn btn-outline-success">글쓰기</button></a>
</div>

<h1>정보게시판</h1>

  	<div id="infoList" class="row">
		<div class="col-1"></div>
		
		<div id="infos" class="row col-10">
		
			<c:forEach var="infoList" items="${infoList }">
			<div id="info" class="col">
			<a href="./detail?infoNo=${infoList.INFO_NO }" id="infoNo">
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
</div>

<span class="float-end mb-3">${paging.totalCount }</span>
<div class="clearfix"></div>

<div>
   <ul class="pagination pagination-sm justify-content-center">

   <%-- 첫 페이지로 이동 --%>
   <c:if test="${paging.curPage ne 1 }">
      <li class="page-item"><a href="./campaign?freeHead=${freeHead }" class="page-link">&larr; 처음</a></li>   
   </c:if>
   
   <%-- 이전 페이징 리스트로 이동 --%>
   <c:choose>
   <c:when test="${paging.startPage ne 1 }">
      <li class="page-item"><a href="./campaign?curPage=${paging.startPage - paging.pageCount }&freeHead=${freeHead}" class="page-link">&laquo;</a></li>
   </c:when>
   <c:when test="${paging.startPage eq 1 }">
      <li class="page-item disabled"><a class="page-link">&laquo;</a></li>
   </c:when>
   </c:choose>
   
   
   <%-- 이전 페이지로 가기 --%>
   <c:if test="${paging.curPage > 1 }">
      <li class="page-item"><a href="./campaign?curPage=${paging.curPage - 1 }&freeHead=${freeHead}" class="page-link">&lt;</a></li>
   </c:if>
   
   
   
   
   <%-- 페이징 리스트 --%>
   <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
   <c:if test="${paging.curPage eq i }">
      <li class="page-item active"><a href="./campaign?curPage=${i }&freeHead=${freeHead}" class="page-link">${i }</a></li>
   </c:if>
   <c:if test="${paging.curPage ne i }">
      <li class="page-item"><a href="./campaign?curPage=${i }&freeHead=${freeHead}" class="page-link">${i }</a></li>
   </c:if>
   </c:forEach>
   

   
   
   <%-- 다음 페이지로 가기 --%>
   <c:if test="${paging.curPage < paging.totalPage }">
      <li class="page-item"><a href="./campaign?curPage=${paging.curPage + 1 }&freeHead=${freeHead}" class="page-link">&gt;</a></li>
   </c:if>
   
   <%-- 다음 페이징 리스트로 이동 --%>
   <c:choose>
   <c:when test="${paging.endPage ne paging.totalPage }">
      <li class="page-item"><a href="./campaign?curPage=${paging.startPage + paging.pageCount }&freeHead=${freeHead}" class="page-link">&raquo;</a></li>
   </c:when>
   <c:when test="${paging.endPage eq paging.totalPage }">
      <li class="page-item disabled"><a class="page-link" href="./campaign?curPage=${paging.totalPage }&freeHead=${freeHead}">&raquo;</a></li>
   </c:when>
   </c:choose>

   <%-- 끝 페이지로 이동 --%>
   <c:if test="${paging.curPage ne paging.totalPage }">
      <li class="page-item"><a href="./campaign?curPage=${paging.totalPage }&freeHead=${freeHead}" class="page-link">끝 &rarr;</a></li>   
   </c:if>
   
   </ul>
</div>

<c:import url="../layout/footer.jsp"/>