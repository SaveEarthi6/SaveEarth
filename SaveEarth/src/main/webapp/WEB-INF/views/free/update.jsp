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

/* 폰트 */
@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
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

h1 {
	margin-top:50px;
	color: black;
	font-weight: bold;
	font-size: 50px;
	font-family: 'KBO-Dia-Gothic_bold';
}

#detail {
	font-family: 'omyu_pretty';
	font-size: 18px;
}

#editor {
	font-family: 'omyu_pretty';
	font-size: 18px;
}

#file {
	font-family: 'omyu_pretty';
	font-size: 18px;
}

#btn {
	font-family: 'omyu_pretty';
	font-size: 18px;
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
	} else {
		$("#newFile").show()
	}
	
/* 파일 삭제 버튼 동작 */	
	$(".deleteFile").click(function() {
		console.log('삭제 버튼 동작');
		
		$("#originFile").toggleClass("through");
		$("#newFile").toggle();
		
		var idx = $(".deleteFile").index(this)
	    var freeFileNo = $(".deleteFile").eq(idx).attr('data-no')

		console.log( freeFileNo )
		console.log( ${param.freeNo} )
		
		$.ajax({
			type: "post",
			dataType : "html",
			url: "/free/deleteFile",
			data:{
				freeFileNo:freeFileNo,
				freeNo:${param.freeNo}
				},
			success: function(data){
				console.log(data)
				alert('선택한 파일이 삭제되었습니다!')
				$("#originFile").html(data)
				location.reload();
							
			}
		})
		
	})/* 파일 삭제 버튼 end */
	
	
	
})/* 취소버튼 동작 end */


</script>


<!-- 자유게시판 디테일 이미지 -->
<div>
	<img class="free_detail" src="../resources/img/free_detail.png">
	<h1 class="free">자유게시판</h1>
</div>

<div class="container">

<h1 style= "text-align: center;">글수정</h1>

<div style= "margin-left: 1100px; padding-top: 50px; padding-bottom: 50px;">
</div>

<!-- 게시글 상세 -->
<table class="table table-bordered" id="detail">
<tr>
	<td class="table-light">글번호</td><td colspan="3">${view.FREE_NO}</td>
</tr>
<tr>
	<td class="table-light">아이디</td><td>${view.USER_ID }</td>
	<td class="table-light">닉네임</td><td>${view.USER_NICK }</td>
</tr>
<tr>
	<td class="table-light">조회수</td><td>${view.FREE_VIEWS }</td>
	<td class="table-light">작성일</td>
	<td>
	
	<c:choose>
	  			
	<c:when test="${view.FREE_CREATE != view.FREE_MODIFY }">
	<fmt:formatDate value="${view.FREE_MODIFY }"
    pattern="yy-MM-dd HH:mm:ss" /> 
    </c:when> 

	<c:otherwise> 
	<fmt:formatDate value="${view.FREE_CREATE}" pattern="yy-MM-dd HH:mm:ss"/>
	</c:otherwise>
	
	</c:choose> 
	
	</td>
</tr>

</table>

<form action="/free/update" method="post" enctype="multipart/form-data">

<input type="hidden" name="freeNo" value="${view.FREE_NO}">

<div class="form-group" style= "margin-top: 50px; font-family: 'omyu_pretty'; font-size: 18px;">
	<label class="form-label" for="head" style="font-size: 20px;">말머리글</label><br>
	
	 <select id="freeHead" onchange="selectfreeHead()" name="freeHead">

  	    <c:choose>
        <c:when test="${view.FREE_HEAD eq '사담' }">
			<option value= "사담" selected>사담</option>
			<option value= "정보">정보</option>
			<option value= "질문">질문</option>
		</c:when>
       
        <c:when test="${view.FREE_HEAD eq '정보' }">
			<option value= "사담">사담</option>
			<option value= "정보" selected>정보</option>
			<option value= "질문">질문</option>
		</c:when>
       
		<c:when test="${view.FREE_HEAD eq '질문' }">
			<option value= "사담">사담</option>
			<option value= "정보">정보</option>
			<option value= "질문" selected>질문</option>
		</c:when>

		<c:otherwise>
			<option value= "사담">사담</option>
			<option value= "정보">정보</option>
			<option value= "질문">질문</option>
		</c:otherwise>
		
      </c:choose>

  </select>
  
</div>


<!-- 글쓰기 폼 (웹 에디터) -->
<div id="editor">

<div class="form-group" style= "margin-top: 50px">
	<label class="form-label" for="title">제목</label>
	<input type="text" id="title" name="freeTitle" class="form-control" value="${view.FREE_TITLE }">
</div>

<div class="form-group" style= "margin-top: 50px">
	<label class="form-label" for="content">본문</label>
	<textarea class="form-control" rows="10" style="width: 100%;" id="content" name="freeContent">${view.FREE_CONTENT }</textarea>
</div>

<div class="form-group" id="file">

		<div id="originFile">
		<c:if test="${not empty freeFile }">
		<c:forEach items="${freeFile }" var="file">
			<a href="../upload/${file.freeStoredName }" download="${file.freeOriginName }">
				${file.freeOriginName }
			</a><button class="deleteFile btn btn-outline-warning" type="button" data-no="${file.freeFileNo}">삭제</button><br>
			<input type="hidden" value="${file.freeFileNo}" class="freeFileNo">
			<input type="hidden" value="${file.freeNo}" class="freeNo">
		</c:forEach>
		</c:if>
		</div>

		<div id="newFile">
			<label class="form-label" for="files">새로운 첨부파일</label>
			<input type="file" id="file" name="files" class="form-control" multiple="multiple">
		</div>
		

</div>

<div style="margin-top: 30px; margin-bottom: 30px;">
		<button id="btnUpdate" class="btn btn-success">수정완료</button>
</div>

</div><!-- editor end -->


</form>


<div id="btn">

<div>
	<a href="/free/main"><input type="reset" id="cancel" class="btn btn-danger" value="취소"></a>
</div>

<div class="text-center mb-3">
	<a href= "/free/main"><button id="btnList" class="btn btn-success">목록</button></a>
	
</div>

</div>
	
</div><!-- .container end -->




<c:import url="../layout/footer.jsp"></c:import>















