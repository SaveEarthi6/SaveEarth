<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style type="text/css">

#viewWrap {
	border: 1px solid #ccc;
	margin: 20px 10px;
	padding: 10px;
}

#certViewTitle {
	font-size: 1.2em;
	font-weight: bold;
}

#certImg {
	width: 50%;
}

#certViewImg {
	text-align: center;
}

#certCampName {
	font-size: 0.8em;
    margin-bottom: 5px;
}

.btnViewModal {
	border: none;
}

#btnWrap {
	text-align: right;
    padding-right: 30px;
    margin-bottom: 5px;
}

#btnEditCert {
    margin-right: 15px;
}

#certViewPartNo {
	width: 0;
	height: 0;
	display: none;
}

#certViewPartFileNo {
	width: 0;
	height: 0;
	display: none;
}

#certCampDate {
	font-size: 0.8em;
}





</style>

<script type="text/javascript">

//인증글 삭제 ajax 수행
// function deleteCert(partNo, partFileNo) {
	
// 	console.log(partNo)
// 	console.log(partFileNo)
	
// 	$.ajax({
// 		type: "post"
// 		, url : "./viewCertDelete"
// 		, data : {partNo : partNo, partFileNo : partFileNo}
// 		, dataType : "html"
// 		, success : function(res) {
// 			console.log('성공')
			
// 			//모달창 강제 닫아
			
// 			//href location으로 메인으로 보내기
			
// 		}
// 		, error : function() {
// 			console.log('실패')
			
// 		}
// 	})
	
// }

</script>


<c:forEach var="cert" items="${userCertList }">
<div id="viewWrap">

	<div id="certViewPartNo" name="partNo">${cert.PART_NO }</div>
	<div id="certViewPartFileNo" name="partFileNo">${cert.PART_FILE_NO }</div>
	
	<div id="certCampName">[${cert.CAMP_TITLE }]</div>
	<div id="certViewTitle">${cert.PART_TITLE }</div>
	<div id="certCampDate">작성일자 : <fmt:formatDate value="${cert.PART_DATE }" pattern="yyyy-MM-dd"/></div>
	<hr>
	<div id="certViewImg">
		<img id="certImg" alt="" src="/upload/${cert.PART_STORED_NAME }">
		<!-- 경로 파일을 upload로 맞춰주고 st  -->
	</div>
	<div id="certViewContent">${cert.PART_CONTENT }</div>
	<!-- 버튼은 ajax 필요할듯 아마 -->
	<hr>
	<div id="btnWrap">
<!-- 		<button id="btnEditCert" class="btnViewModal">수정</button> -->
		<a href="./viewCertDelete?partNo=${cert.PART_NO }&partFileNo=${cert.PART_FILE_NO }"><button id="btnDeleteCert" class="btnViewModal btn btn-danger btn-sm">삭제</button></a>
	</div>
</div>
</c:forEach>


















