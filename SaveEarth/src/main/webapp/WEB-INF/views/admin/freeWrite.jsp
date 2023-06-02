<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/adminheader.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 자유게시판 글쓰기</title>

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">

$(function() {

	//작성버튼 동작
	$("#btnWrite").click(function() {
		console.log("btnWrite click")
		
		//iframe내용을 textarea에 넣어주어야 보여짐
		//작성된 내용을 <textarea>에 적용하기
		updateContents()
		//-> 이 함수 밖에 있으면 content등록 전에 작동하게 됨
		
		//폼 제출
		$("form").submit()
		
	})
	
	
	
})

function updateContents() {
	//스마트 에디터에 작성된 내용을 textarea#content에 반영한다
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
}

</script>

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

#freeHead {
	border: 1px solid #ccc;
}

</style>

<div class="container">

<h1 style= "text-align: center;">자유 게시판 글쓰기</h1>

<div class="col-8 mx-auto">

<form action="./freeWrite" method="post" enctype="multipart/form-data">

<div>
	작성자 아이디 : ${memberInfo.adminId }
</div>

<div>
	닉네임 : ${memberInfo.adminName }
</div>


<div class="btn-group" >

  	    말머리글 : 
  <select id="freeHead" onchange="selectfreeHead()" name="freeHead" >

  	    <c:choose>
  	    
        <c:when test="${freeHead eq '사담' }">
			<option value= "사담" selected>사담</option>
			<option value= "정보">정보</option>
			<option value= "질문">질문</option>
			<option value= "공지사항">공지사항</option>
		</c:when>
       
        <c:when test="${freeHead eq '정보' }">
			<option value= "사담">사담</option>
			<option value= "정보" selected>정보</option>
			<option value= "질문">질문</option>
			<option value= "공지사항">공지사항</option>
		</c:when>
       
		<c:when test="${freeHead eq '질문' }">
			<option value= "사담">사담</option>
			<option value= "정보">정보</option>
			<option value= "질문" selected>질문</option>
			<option value= "공지사항">공지사항</option>
		</c:when>
		
		<c:when test="${freeHead eq '공지사항' }">
			<option value= "사담">사담</option>
			<option value= "정보">정보</option>
			<option value= "질문">질문</option>
			<option value= "공지사항"selected>공지사항</option>
		</c:when>

		<c:otherwise>
			<option value= "사담">사담</option>
			<option value= "정보">정보</option>
			<option value= "질문">질문</option>
			<option value= "공지사항">공지사항</option>
		</c:otherwise>
		
      </c:choose>

  </select>
  
</div>


<!-- 글쓰기 폼 (웹 에디터) -->
<div class="form-group" style= "margin-top: 50px">
	<label class="form-label" for="title">제목</label>
	<input type="text" id="title" name="freeTitle" class="form-control">
</div>

<div class="form-group" style= "margin-top: 50px">
	<label class="form-label" for="content">본문</label>
	<textarea rows="10" style="width: 100%;" id="content" name="freeContent"></textarea>
</div>

<div class="form-group mb-3" style= "margin-top: 50px">
	<label class="form-label" for="file">첨부파일</label>
	<input type="file" id="file" name="files" class="form-control" multiple="multiple">
</div>

<!-- 글쓰기 작성, 취소 버튼 -->
<div>
	<button class="btn btn-success" id="btnWrite">작성</button>
	<input type="reset" id="cancel" class="btn btn-danger" value="취소">
</div>

</form>

</div>

</div><!-- container end -->

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



<c:import url="../layout/footer.jsp"></c:import>
