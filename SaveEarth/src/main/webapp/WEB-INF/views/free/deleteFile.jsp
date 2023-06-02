<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

/* 첨부파일 버튼 동작 */
if( ${not empty freeFile} ) {
	$("#originFile").show()
} else {
	$("#newFile").show()
}

/* 파일 삭제 버튼 동작 */	
$(".deleteFile").click(function() {
	console.log('삭제 버튼 동작');
	
	$("#originFile").toggleClass("through");
	$("#newFile").toggle();

	console.log( $('.fileNo').val() )
	console.log( ${param.freeNo} )
	
	$.ajax({
		type: "get",
		dataType : "html",
		url: "http://localhost:8888/free/deleteFile",
		data:{
			fileNo:$('.fileNo').val(),
			freeNo:${param.freeNo}
			},
		success: function(data){
			console.log(data)
			alert('선택한 파일이 삭제되었습니다!')
			$("#originFile").html(data)
						
		}
	})
	
})/* 파일 삭제 버튼 동작 end */

</script>

</head>
<body>

		<div id="originFile">
		<c:if test="${not empty freeFile }">
		<c:forEach items="${freeFile }" var="file">
			<a href="../upload/${file.freeStoredName }" download="${file.freeOriginName }">
				${file.freeOriginName }
			</a><button class="deleteFile btn btn-outline-warning" type="button">삭제</button><br>
			<input type="hidden" value="${file.freeFileNo}" class="fileNo">
			<input type="hidden" value="${file.freeNo}" class="freeNo">
		</c:forEach>
		</c:if>
		</div>

</body>
</html>