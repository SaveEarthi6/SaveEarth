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
 
 .nav2 { 
    margin: 0 auto;
    margin-left: 1400px;
 } 
 
 /* 게시판 분류 버튼 스타일 */
.nav button {  
  	margin-left: 40px;  
	margin-top: 60px;  
 	width: 300px;  
  }  
 
 /* 글쓰기 버튼 스타일 */
#write {
 	text-align: right; 
 	margin-right: 100px; 
 	margin-bottom: 20px; 
}

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

.nav {  
  	margin: 10px auto;  
    width: fit-content;
   	 }

</style>
<!-- 필터 기능 -->
<script type="text/javascript">


function selectfreeHead() {
	
var freeHead = $('#freeHead').val()

console.log(freeHead)

location.href="?freeHead=" + freeHead

}


</script>

</head>
<body>
<div class="nav">
<h1>게시판 관리</h1>
</div>

<br>
<div class="nav">
<a href="./free"><button type="button" class="btn btn-outline-success" id ="top">자유 게시판</button></a>
<a href="./info"><button type="button" class="btn btn-outline-success" id ="top">정보 게시판</button></a>
<a href="./campaign"><button type="button" class="btn btn-outline-success" id ="top">캠페인 게시판</button></a>
</div> 

<!-- 게시판 -->
<table id= "board" class= "table table-hover text-center">

	<tr style= "background-color: #59A8D9; color: white;">
		<th style="width: 20px;">글번호</th>
		<th style="width: 20px;">말머리</th>
		<th style="width: 30px; text-align:center">제목</th>
		<th style="width: 20px;">작성자</th>
		<th style="width: 20px;">조회수</th>
		<th style="width: 20px;">작성일</th>
	</tr>
<tbody>
<c:forEach items="${list }" var="free">

			<tr>
				<td>${free.FREE_NO }</td>
				<td>
					<c:if test="${free.FREE_HEAD eq '공지사항' }" > 
						<img class="notice" src="../resources/img/notice.png" width= "35px;" > <!-- 공지사항 이미지 띄우게 하기 -->
					</c:if>
					${free.FREE_HEAD}
				</td>
				<td class="text-start" style="text-align:center"><a href="/admin/freeView?freeNo=${free.FREE_NO }">${free.FREE_TITLE }</a></td>
				<c:choose>
				<c:when test="${free.USER_ID != null }">
				<td>${free.USER_ID}</td>
				</c:when>
		         <c:otherwise>
				<td>${free.ADMIN_NAME}</td>
        		 </c:otherwise>
				</c:choose>
				<td>${free.FREE_VIEWS }</td>
				<td><fmt:formatDate value="${free.FREE_CREATE}" pattern="yy-MM-dd HH:mm:ss"/></td>
			</tr>

</c:forEach>
</tbody>

</table>	

 <div class="nav2">
<!-- 글쓰기 버튼 -->
	<a href = "/admin/freeWrite"><button type="button" class="btn btn-outline-success">글쓰기</button></a>
</div>



<span class="float-end mb-3">${paging.totalCount }</span>
<div class="clearfix"></div>

<div>
	<ul class="pagination pagination-sm justify-content-center">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li class="page-item"><a href="./free?freeHead=${freeHead }" class="page-link">&larr; 처음</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li class="page-item"><a href="./free?curPage=${paging.startPage - paging.pageCount }&freeHead=${freeHead}" class="page-link">&laquo;</a></li>
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li class="page-item disabled"><a class="page-link">&laquo;</a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li class="page-item"><a href="./free?curPage=${paging.curPage - 1 }&freeHead=${freeHead}" class="page-link">&lt;</a></li>
	</c:if>
	
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="page-item active"><a href="./free?curPage=${i }&freeHead=${freeHead}" class="page-link">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li class="page-item"><a href="./free?curPage=${i }&freeHead=${freeHead}" class="page-link">${i }</a></li>
	</c:if>
	</c:forEach>
	

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li class="page-item"><a href="./free?curPage=${paging.curPage + 1 }&freeHead=${freeHead}" class="page-link">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li class="page-item"><a href="./free?curPage=${paging.startPage + paging.pageCount }&freeHead=${freeHead}" class="page-link">&raquo;</a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="page-item disabled"><a class="page-link" href="./free?curPage=${paging.totalPage }&freeHead=${freeHead}">&raquo;</a></li>
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li class="page-item"><a href="./free?curPage=${paging.totalPage }&freeHead=${freeHead}" class="page-link">끝 &rarr;</a></li>	
	</c:if>
	
	</ul>
</div>


<c:import url="../layout/footer.jsp"></c:import>


</body>

</html>