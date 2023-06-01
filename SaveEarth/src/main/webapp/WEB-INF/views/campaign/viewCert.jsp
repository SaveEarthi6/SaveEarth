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


<div id="viewWrap">

	<div id="certViewPartNo" name="partNo">${userCert.PART_NO }</div>
	<div id="certViewPartFileNo" name="partFileNo">${userCert.PART_FILE_NO }</div>
	
	<div id="certCampName">[${userCert.CAMP_TITLE }]</div>
	<div id="certViewTitle">${userCert.PART_TITLE }</div>
	<div id="certCampDate">작성일자 : <fmt:formatDate value="${userCert.PART_DATE }" pattern="yyyy-MM-dd"/></div>
	<hr>
	<div id="certViewImg">
		<img id="certImg" alt="" src="/upload/${userCert.PART_STORED_NAME }">
		<!-- 경로 파일을 upload로 맞춰주고 st  -->
	</div>
	<div id="certViewContent">${userCert.PART_CONTENT }</div>
	<!-- 버튼은 ajax 필요할듯 아마 -->
	<hr>
	<div id="btnWrap">
<!-- 		<button id="btnEditCert" class="btnViewModal">수정</button> -->
		<a href="./viewCertDelete?partNo=${userCert.PART_NO }&partFileNo=${userCert.PART_FILE_NO }"><button id="btnDeleteCert" class="btnViewModal btn btn-danger btn-sm">삭제</button></a>
	</div>
</div>


















