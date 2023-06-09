"<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminheader.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 게시판 수정</title>

<style type="text/css">

@font-face {
	font-family: 'KBO-Dia-Gothic_bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff')
		format('woff');
		
	font-weight: 700;
	font-style: normal;
}

.camp {
	position: absolute;
	top: 38%;
	left: 45%;
	color: #fff;
	font-weight: bold;
	font-size: 50px;
	font-family: 'KBO-Dia-Gothic_bold';
}

.camp_detail {
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

		console.log( $('.campNo').val() )
		console.log( ${param.campNo} )
		
		$.ajax({
			type: "get",
			dataType : "html",
			url: "http://localhost:8888/camp/deleteFile",
			data:{
				fileNo:$('.fileNo').val(),
				freeNo:${param.campNo}
				},
			success: function(data){
				console.log(data)
				alert('선택한 파일이 삭제되었습니다!')
				$("#originFile").html(data)
							
			}
		})
		
	})
	
	
	
})


</script>


<div class="container">

<h1 style= "text-align: center;">캠페인 수정 페이지</h1>

<div class="col-8 mx-auto">

<div style= "margin-left: 1100px; padding-top: 50px; padding-bottom: 50px;">
</div>
<table class="table table-bordered" style= "font-weight: bold;">
	<td class="table-light">작성자 아이디</td><td>${memberInfo.adminId }</td>
	<td class="table-light">닉네임</td><td>${memberInfo.adminName }</td>
</table>

<form action="/admin/campUpdate" method="post" enctype="multipart/form-data">

<input type="hidden" name="campNo" value="${view.CAMP_NO}">

<!-- 글쓰기 폼 (웹 에디터) -->
<div class="form-group" style= "margin-top: 50px">
	<label class="form-label" for="title">제목</label>
	<input type="text" id="title" name="campTitle" class="form-control" value="${view.CAMP_TITLE }">
</div><br><br>

 <label>캠패인 현재 상태 :  ${view.CAMP_STATE}</label><br>
        <select name="campState" id="campState">
          <option>선택하세요</option>
          <option value="진행중">진행중</option>
          <option value="마감">마감</option>
        </select><br><br>


<div class="form-group">

		<div id="originFile">
		<c:if test="${not empty campFile }">
		<c:forEach items="${campFile }" var="camp">
			<a href="../campUpload/${camp.campStoredName }" download="${camp.campOriginName }">
				${camp.campOriginName }
			</a><button class="deleteFile btn btn-outline-warning" type="button">삭제</button><br>
			<input type="hidden" value="${camp.campFileNo}" class="campNo">
			<input type="hidden" value="${camp.campNo}" class="campNo">
		</c:forEach>
		</c:if>
		</div>

		<div id="newFile">
			<label class="form-label" for="files">새로운 첨부파일</label>
			<input type="file" id="file" name="files" class="form-control" multiple="multiple">
			<small>** 새로운 파일로 첨부하면 기존 파일은 삭제됩니다</small>
		</div>
		

</div>

<div style="
    margin-top: 30px; margin-bottom: 30px;">
		<button id="btnUpdate" class="btn btn-success">수정완료</button>
</div>
</form>
<div>
	<input type="reset" id="cancel" class="btn btn-danger" value="취소">
</div>

<!-- 버튼 -->
<div class="text-center mb-3">
	
</div>

	
	
	
</div><!-- .container end -->




<c:import url="../layout/footer.jsp"></c:import>















