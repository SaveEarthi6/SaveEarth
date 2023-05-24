<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp"/>

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>


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

h1 {
	margin-top:50px;
	color: black;
	font-weight: bold;
	font-size: 50px;
	font-family: 'KBO-Dia-Gothic_bold';
}

form {
	font-weight: bold;
}

</style>

<div class="container">

<h1 style= "text-align: center; font-family: ">글쓰기</h1>

<div class="col-10 mx-auto">

<form action="./write" method="post" enctype="multipart/form-data">

<!-- 글쓰기 폼 (웹 에디터) -->
<div class="form-group" style= "margin-top: 50px">
	<label class="form-label" for="title">제목</label>
	<input type="text" id="title" name="title" class="form-control">
</div>
<div class="form-group" style= "margin-top: 50px">
	<label class="form-label" for="content">본문</label>
	<textarea rows="10" style="width: 100%;" id="content" name="content"></textarea>
</div>

<div class="form-group mb-3" style= "margin-top: 50px">
	<label class="form-label" for="file">첨부파일</label>
	<input type="file" id="file" name="file" class="form-control">
</div>

<!-- 글쓰기 작성, 취소 버튼 -->
<div>
	<button class="btn btn-success" id="btnWrite">작성</button>
	<input type="reset" id="cancel" class="btn btn-danger" value="취소">
</div>

</form>

</div>

<!-- 웹에디터 연결 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors
	, elPlaceHolder: "content"
	, sSkinURI: "/resources/se2/SmartEditor2Skin.html"
	, fCreator: "createSEditor2"
})
</script>

</div><!-- .container end -->

<c:import url="../layout/footer.jsp"></c:import>

</body>
</html>