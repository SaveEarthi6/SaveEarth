<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"></c:import>

<!-- 필요시 css, js, jquery 넣을 곳 -->

<style type="text/css">

@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

#posterWrap { 
	text-align: center;
	width: 70%;
 	height: 600px;
	overflow: hidden;
} 
#posterWrap img{
	max-width: 100%;
 	height: auto;
 	display: block;
 	width: 100%;
 	height: 100%;
}

#header {
	margin-top: 30px;
}

#poster {
/* 	width: 450px; */
/* 	height: 600px; */
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
	font-family: 'omyu_pretty';
}

#enroll {
	margin-right: 20px;
}

#part {
	margin-left: 20px;
}

#content{
	font-family: 'omyu_pretty';
}


</style>


<div class="container">

<div class="row">
	<div class="col-1"></div>
	<div id="content" class="col-10">
		<div id="header">
			<div id="title">[ ${campDetail.CAMP_STATE } ] ${campDetail.CAMP_TITLE }</div>
			<p id="clear"></p>
			<hr>
			<div id="info">
				<span id="enroll">등록일 : <fmt:formatDate value="${campDetail.CAMP_ENROLL }" pattern="yyyy/MM/dd"/></span>
				<span>|</span>
				<span id="part">
					참여현황 : ${campCount }
				</span>	<!-- DB에서 인증사진 campno으로 count해와서 넣기 -->
			</div>
		</div>
			
		<div id="clear"></div>
		<hr>
		<div id="posterWrap" style=" height: 584 px; width: auto; ">
			<!-- DB에서 불러온 이미지 넣기 -->
			<img id="poster" src="/upload/${campDetail.CAMP_STORED_NAME }">
		</div>
		<hr>
	</div>
	<div class="col-1"></div>
</div>
	 <div style="display: inline-block; margin: 0 5px;  float: right; font-family: 'omyu_pretty';">		
				첨부파일 다운로드 : 
						<c:if test="${not empty campDetail }">
							<a href="../upload/${campDetail.CAMP_STORED_NAME }" download="${campDetail.CAMP_ORIGIN_NAME }">
								${campDetail.CAMP_ORIGIN_NAME }
							</a>
						</c:if>
	</div>	
<div id="toList"><button onclick="location.href='/campaign/main'"  id="navButton" type="button" class="btn btn-outline-success">목록으로</button></div>

<c:import url="../layout/footer.jsp"></c:import>