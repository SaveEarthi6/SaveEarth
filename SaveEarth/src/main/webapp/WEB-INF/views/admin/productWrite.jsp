<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/adminheader.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 상품등록</title>

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

function selectfreeHead() {
	
var freeHead = $('#freeHead').val()


}

function updateContents() {
	//스마트 에디터에 작성된 내용을 textarea#content에 반영한다
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
}

// function freeHead_check() {
	
//     if($("#freeHead").val() != '질문' || $("#freeHead").val() != '정보' || $("#freeHead").val() != '사담'){
//       alert("사담, 정보, 질문만 입력할 수 있습니다");
//       $("#freeHead").focus();
//       return false;
//     }



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

<h1 style= "text-align: center;">상품 등록</h1>

<div class="col-8 mx-auto">

<form action="./productWrite" method="post" enctype="multipart/form-data">


<!-- 글쓰기 폼 (웹 에디터) -->
<div class="form-group" style= "margin-top: 50px">
	<label class="form-label" for="title">상품명</label>
	<input type="text" id="prodName" name="prodName" class="form-control">
</div>

<div class="form-group" style= "margin-top: 50px">
	<label class="form-label" for="title">상품가격</label>
	<input type="text" id="prodPrice" name="prodPrice" class="form-control">
</div>

<div class="form-group" style= "margin-top: 50px">
	<label class="form-label" for="title">상세내용</label>
	<input type="text" id="prodDetail" name="prodDetail" class="form-control">
</div>

<div class="form-group" style= "margin-top: 50px">
	<label class="form-label" for="title">재고 수</label>
	<input type="text" id="prodAmount" name="prodAmount" class="form-control">
</div>


<div class="form-group mb-3" style= "margin-top: 50px">
	<label class="form-label" for="file">상품 이미지</label>
	<input type="file" id="file" name="files" class="form-control" multiple="multiple">
</div>

<button class="btn btn-success" id="btnWrite">작성</button>
</form>



<a href="/admin/product"><button type="reset" id="cancel" class="btn btn-danger">취소</button></a>




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
