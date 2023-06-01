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

.rs {
/* 	border: 1px solid black; */
	width: 70px;
}

.commList {
	border : 1px solid green;
	margin-bottom: 3px;
}

#btnRecommend{

	border:0;
	background-color: white;
	
}

.button{
	width:50px;
	height: 50px;
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


$("#btnRecommend").click(function(){
	
	const element = document.getElementById('btnRecommend');
	
	location.href='./recommend?freeNo='+ ${view.FREE_NO}
	
	element.innertext = '추천취소'
	
	
	
	
})

</script>


$(function(){
	$("#enroll").click(function() {
		console.log("test")
		console.log($('#commContent').val());
		console.log(${userInfo.userNo });
		console.log(${view.FREE_NO });
		
// 		const res = $("#commentForm").val();
		$.ajax({
			type: "get",

			url: "http://localhost:8888/free/comment",
			data:{
				commContent:$("#commContent").val(),
				userNo:${userInfo.userNo },
				freeNo:${view.FREE_NO }
				},
			success: function(data){
				if(data == 1) {
					alert('댓글 작성이 완료되었습니다!')
// 					$('.comm').append(commContent);
					//값 비우기
					$("#commContent").val('');
					
				} else {
					alert('다시 확인해주세요!')
				}
			}
		})
	})
	

})


</script>






<!-- 버튼 -->
<div class="text-center mb-3">
   <a href= "/free/main"><button id="btnList" class="btn btn-success">목록</button></a>
   <form action="/free/recommend">
   <!-- 추천 기능 버튼 -->
   
   <button type="button" id="btnRecommend" onclick="location.href='./recommend?freeNo=${view.FREE_NO}'">
   <img class="button" src="../resources/img/button_heart.png" ></button>
   

   </form>
</div>

<!-- 댓글 작성 위치 -->
<h3>댓글</h3>
<h5>작성자 : ${userInfo.userId}</h5>

<c:forEach items="${comment }" var="comment">
<div class="commList">
<span>작성자 :</span><span class="writer">${comment.USER_ID }</span>
<span>댓글 :</span><span class="rs">${comment.COMM_CONTENT }</span>
<span>작성일 :</span><span class="writeDate">${comment.COMM_CREATE }</span>
</div>
</c:forEach>

<!-- 댓글 -->
	<div class="card my-4">
		<h5 class="card-header" style="font-weight: bold;">댓글</h5>
		<div class="card-body">
			<form name="commentForm" action="./comment" method="get" autocomplete="off" id="commentForm">
					<textarea id="commContent" name="commContent" class="form-control" rows="3"></textarea>
				<div style= "padding-top: 50px;">
					<button id="enroll" type="button" class="btn btn-success">등록</button>
				</div>
				<!-- 회원번호랑 게시글 번호도 함께 보내기 -->
<%-- 				<input type="hidden" name="userNo" value=${userInfo.userNo }> --%>
<%-- 				<input type="hidden" name="freeNo" value=${view.FREE_NO }> --%>
			</form>
		</div>
	</div>
	
	
	
</div><!-- .container end -->



<c:import url="../layout/footer.jsp"></c:import>















