<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"></c:import>

<!-- 필요시 css, js, jquery 넣을 곳 -->

<style type="text/css">

#posterWrap { 
	text-align: center; 
} 

#header {
	margin-top: 30px;
}

#poster {
	width: 450px;
	height: 600px;
	
}

#title {
	font-size: 2em;
	font-weight: bold;
	float: left;
}

#info {
	float: left;
}

#clear {
	clear: both;
}

#navButton  {  
 	width: 100px;  
}  

#toList {
	text-align: center;
	margin: 30px 0;
}

#enroll {
	margin-right: 20px;
}

#part {
	margin-left: 20px;
}

</style>


<div class="container">

<div class="row">
	<div class="col-1"></div>
	<div id="content" class="col-10">
		<div id="header">
			<div id="title">[ ${campDetail.CAMP_STATE } ] ${campDetail.CAMP_TITLE }</div>
			<p id="clear"></p>
			<div id="info">
				<span id="enroll">등록일 : <fmt:formatDate value="${campDetail.CAMP_ENROLL }" pattern="yyyy/MM/dd"/></span>
				<span>|</span><
				<span id="part">참여현황 : </span>	<!-- DB에서 인증사진 campno으로 count해와서 넣기 -->
			</div>
		</div>
		
<div class="mb-3">
	<c:if test="${not empty campaign_file }">
	<c:forEach items="${campaign_file }" var="file">
		<a href="../upload/${file.campaignStoredName }" download="${file.campaignOriginName }">
			${file.campaignOriginName }
		</a>
	</c:forEach>
	</c:if>
</div>
	
		<div id="clear"></div>
		<hr>
		<div id="posterWrap">
			<!-- DB에서 불러온 이미지 넣기 -->
			<img id="poster" src="../../resources/img/cat_3.jpg">
		</div>
	</div>
	<div class="col-1"></div>
</div>

<div id="toList"><button onclick="location.href='./main';"  id="navButton" type="button" class="btn btn-outline-success">목록으로</button></div>

</div>

<c:import url="../layout/footer.jsp"></c:import>