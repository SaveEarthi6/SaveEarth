<%@ page language="java" contentType="text/html; charset=UTF-8"
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
</script>

<script type="text/javascript">

$(document).ready(function() {
	$("#cancel").click(function() {
		history.go(-1)
	})

	
	if( ${empty freeFile} ) {
		$("#newFile").show()
	} else {
		$("#originFile").show()
	}
	
	$("#deleteFile").click(function() {
		$("#originFile").toggleClass("through")
		$("#newFile").toggle();
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
	<td class="table-light">아이디</td><td>${view.ID }</td>
	<td class="table-light">닉네임</td><td>${view.NICK }</td>
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

</form>

<div class="form-group">

<!-- 	<div id="fileBox"> -->
<!-- 		<div id="originFile"> -->
<%-- 			<a href="./download?freeFileNo=${freeFile.freeFileNo }">${freeFile.freeOriginName }</a> --%>
<!-- 	</div> -->
		
	<div id="fileBox">
		<c:if test="${not empty freeFile }">
		<c:forEach items="${freeFile }" var="file">
			<a href="../upload/${file.freeStoredName }" download="${file.freeOriginName }">
				${file.freeOriginName }
			</a><span id="deleteFile">X</span><br>
		</c:forEach>
		</c:if>
	</div>

		<div id="newFile">
			<label class="form-label" for="file">새로운 첨부파일</label>
			<input type="file" id="file" name="file" class="form-control">
			<small>** 새로운 파일로 첨부하면 기존 파일은 삭제됩니다</small>
		</div>
		

</div>

<!-- 첨부파일 다운 -->
<!-- <div class="mb-3"> -->
<%-- 	<c:if test="${not empty freeFile }"> --%>
<%-- 		<a href="./download?fileNo=${freeFile.freeFileNo }">${freeFile.freeOriginName }</a> --%>
<%-- 	</c:if> --%>
<!-- </div> -->

<div>
	<input type="reset" id="cancel" class="btn btn-danger" value="취소">
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

<!-- 버튼 -->
<div class="text-center mb-3">
	<a href= "/free/main"><button id="btnList" class="btn btn-success">목록</button></a>
	
</div>

	
	
	
</div><!-- .container end -->




<c:import url="../layout/footer.jsp"></c:import>















