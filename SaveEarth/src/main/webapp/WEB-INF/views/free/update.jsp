"<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세</title>

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


<script type="text/javascript">
/* 스마트 웹에디터 */
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(document).ready(function() {
	$("#btnUpdate").click(function() {
		submitContents($("#btnUpdate"))
		
		$("form").submit();
	})
})


/* '취소' 버튼 동작 */
$(document).ready(function() {
	$("#cancel").click(function() {
		history.go(-1)
	})

/* 첨부파일 버튼 동작 */
	if( ${not empty freeFile} ) {
// 		console.log(${freeFile})
		$("#originFile").show()
		$("#newFile").hide()
	} else {
		$("#newFile").show()
		$("#originFile").hide()
	}
	
/* 파일 삭제 버튼 동작 */	
	$(".deleteFile").click(function() {
		console.log('삭제 버튼 동작');
		
		$("#originFile").toggleClass("through");
		$("#newFile").toggle();

		console.log($('#fileName').val())
		
		$.ajax({
			type: "get",

			url: "http://localhost:8888/free/deleteFile",
			data:{
				fileName:("#fileName").val()
				},
			success: function(data){
				if(data == 1) {
					alert('댓글 작성이 완료되었습니다!')
// 					$('.comm').append(commContent);
					//값 비우기
// 					$("#commContent").val('');
					
				} else {
					alert('다시 확인해주세요!')
				}
			}
		})
		
	})
	
	
	
})


</script>


<!-- 자유게시판 디테일 이미지 -->
<div>
	<img class="free_detail" src="../resources/img/free_detail.png">
	<h1 class="free">자유게시판</h1>
	
</div>

<div class="container">

<div style= "margin-left: 1100px; padding-top: 50px; padding-bottom: 50px;">
</div>

<!-- 게시글 상세 -->
<table class="table table-bordered" style= "font-weight: bold;">
<tr>
	<td class="table-light">글번호</td><td colspan="3">${view.FREE_NO}</td>
</tr>
<tr>
	<td class="table-light">아이디</td><td>${view.USER_ID }</td>
	<td class="table-light">닉네임</td><td>${view.USER_NICK }</td>
</tr>
<tr>
	<td class="table-light">조회수</td><td>${view.FREE_VIEWS }</td>
	<td class="table-light">작성일</td><td><fmt:formatDate value="${view.FREE_CREATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>

</table>

<form action="/free/update" method="post" enctype="multipart/form-data">

<input type="hidden" name="freeNo" value="${view.FREE_NO}">

<div class="form-group" style= "margin-top: 50px">
	<label class="form-label" for="head">말머리글</label>
	<input type="text" id="head" name="freeHead" class="form-control" style="width: 100px;" value="${view.FREE_HEAD}">
</div>


<!-- 글쓰기 폼 (웹 에디터) -->
<div class="form-group" style= "margin-top: 50px">
	<label class="form-label" for="title">제목</label>
	<input type="text" id="title" name="freeTitle" class="form-control" value="${view.FREE_TITLE }">
</div>

<div class="form-group" style= "margin-top: 50px">
	<label class="form-label" for="content">본문</label>
	<textarea class="form-control" rows="10" style="width: 100%;" id="content" name="freeContent">${view.FREE_CONTENT }</textarea>
</div>

<div style="
    margin-top: 30px; margin-bottom: 30px;">
		<button id="btnUpdate" class="btn btn-success">수정완료</button>
</div>


<div class="form-group">

<!-- 	<div id="fileBox"> -->
<%-- 			<a href="./download?freeFileNo=${freeFile.freeFileNo }">${freeFile.freeOriginName }</a> --%>
<!-- 	</div> -->
		
<!-- 	<div id="fileBox"> -->
		<div id="originFile">
		<c:if test="${not empty freeFile }">
		<c:forEach items="${freeFile }" var="file">
			<a href="../upload/${file.freeStoredName }" download="${file.freeOriginName }" id="fileName">
				${file.freeOriginName }
			</a><button class="deleteFile" type="button">삭제</button><br>
		</c:forEach>
		</c:if>
		</div>
<!-- 	</div> -->

		<div id="newFile">
			<label class="form-label" for="files">새로운 첨부파일</label>
			<input type="file" id="file" name="files" class="form-control" multiple="multiple">
			<small>** 새로운 파일로 첨부하면 기존 파일은 삭제됩니다</small>
		</div>
		

</div>

</form>


<div>
	<input type="reset" id="cancel" class="btn btn-danger" value="취소">
</div>

<!-- 버튼 -->
<div class="text-center mb-3">
	<a href= "/free/main"><button id="btnList" class="btn btn-success">목록</button></a>
	
</div>

	
	
	
</div><!-- .container end -->




<c:import url="../layout/footer.jsp"></c:import>















