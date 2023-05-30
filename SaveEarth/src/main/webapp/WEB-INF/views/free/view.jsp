<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="../layout/header.jsp"/>


<style type="text/css">

@font-face {
	font-family: 'KBO-Dia-Gothic_bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff')
		format('woff');
		
	font-weight: 700;
	font-style: normal;
}

.free {
	position: absolute;
	top: 38%;
	left: 45%;
	color: #fff;
	font-weight: bold;
	font-size: 50px;
	font-family: 'KBO-Dia-Gothic_bold';
}

.free_detail {
	/* 이미지랑 네비게이션바 띄우기 */
	position: relative;
	width: 100%;
	height: 500px;
}

</style>


<!-- 자유게시판 디테일 이미지 -->
<div>
	<img class="free_detail" src="../resources/img/free_detail.png">
	<h1 class="free">자유게시판</h1>
	
</div>

<div class="container">

<div style= "margin-left: 1100px; padding-top: 50px; padding-bottom: 50px;">
	<c:if test="${ userInfo.userNo eq view.USER_NO }">
		<button onclick="location.href='./update?freeNo=${view.FREE_NO}'" id="btnUpdate" class="btn btn-success">수정</button>
		<button onclick="location.href='./delete?freeNo=${view.FREE_NO}'" id="btnDelete" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">삭제</button>
	</c:if>
</div>

<!-- 게시글 상세 -->
<table class="table table-bordered" style= "font-weight: bold;">
<tr>
	<td class="table-light">글번호</td><td colspan="3">${view.FREE_NO }</td>
</tr>
<tr>
	<td class="table-light">아이디</td><td>${view.USER_ID }</td>
	<td class="table-light">닉네임</td><td>${view.USER_NICK}</td>
</tr>
<tr>
	<td class="table-light">조회수</td><td>${view.FREE_VIEWS }</td>
	<td class="table-light">작성일</td><td><fmt:formatDate value="${view.FREE_CREATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="table-light">제목</td><td colspan="3">${view.FREE_TITLE }</td>
</tr>
<tr>
	<td class="table-light" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">${view.FREE_CONTENT }</td>
</tr>
</table>

<!-- 첨부파일 다운-->
<div class="mb-3">
	<c:if test="${not empty freeFile }">
	<c:forEach items="${freeFile }" var="file">
		<a href="../upload/${file.freeStoredName }" download="${file.freeOriginName }">
			${file.freeOriginName }
		</a><br>
	</c:forEach>
	</c:if>
</div>

<script type="text/javascript">

$function(){
   $('#btnRecommend').click (function(){
      
      //전송
        $("form").submit();

      
      $.ajax({
           url : "./recommend",
           type : "POST",
           data : $("#updateForm").serialize(),
           dataType: 'JSON',
           success : function (data) {
               if(data.resultMap.code == "1"){
                   alert("좋아요!")
                   
               } else {
                   alert("좋아요 취소!")
               }
               
               }
           });
      
   })
   
    console.log("btnRecommend click")
   
   
   
}


</script>


<!-- 버튼 -->
<div class="text-center mb-3">
   <a href= "/free/main"><button id="btnList" class="btn btn-success">목록</button></a>
   <form action="/free/recommend">
   <button type="button" id="btnRecommend" class="btn btn-success">추천</button>
   <span id= "recommend" ></span>
   </form>
</div>

<!-- 댓글 -->
	<div class="card my-4">
		<h5 class="card-header" style="font-weight: bold;">댓글</h5>
		<div class="card-body">
			<form name="comment-form" action="/board/comment/write" method="post" autocomplete="off">
					<textarea name="content" class="form-control" rows="3"></textarea>
				<div style= "padding-top: 50px;">
					<button type="submit" class="btn btn-success">등록</button>
				</div>
			</form>
		</div>
	</div>
	
	
	
</div><!-- .container end -->



<c:import url="../layout/footer.jsp"></c:import>















