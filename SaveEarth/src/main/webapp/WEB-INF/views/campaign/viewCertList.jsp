<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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



</style>

<script type="text/javascript">

//인증글 삭제 ajax 수행
function deleteCert(partNo) {
	
	console.log(partNo)
	
}

</script>


<c:forEach var="cert" items="${userCertList }">
<div id="viewWrap">
	<div id="certViewPartNo" name="partNo">${cert.partNo }</div>
	<div id="certCampName">[캠페인 : 캠페인 이름]</div>
	<div id="certViewTitle">${cert.partTitle }</div>
	<hr>
	<div id="certViewImg">
		<img id="certImg" alt="" src="../../resources/img/cat_3.jpg">
	</div>
	<div id="certViewContent">${cert.partContent }</div>
	<!-- 버튼은 ajax 필요할듯 아마 -->
	<hr>
	<div id="btnWrap">
		<button id="btnEditCert" class="btnViewModal">수정</button>
		<button id="btnDeleteCert" class="btnViewModal" onclick="deleteCert(${cert.partNo })">삭제</button>
	</div>
</div>
</c:forEach>