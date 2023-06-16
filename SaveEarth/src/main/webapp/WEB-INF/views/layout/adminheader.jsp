<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Save Earth</title>

<!-- 부트스트랩 : CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- 부트스트랩 : JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- 부트스트랩 : icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">


<script type="text/javascript">

// $(function() {
// 	("#infoBoard").click(function() {
// 		$(location).attr("href", "/info/main")
// 	})
// })

/* '게시판' 클릭했을 때 지정한 href로 이동 */
$(document).ready(function(){

	$("#adminFree").click(function(){
		$(location).attr("href", "/admin/free")
	})

	$("#adminProduct").click(function(){
		$(location).attr("href", "/admin/product")
	})
	
	$("#adminInquiry").click(function(){
		$(location).attr("href", "/admin/inquiry")
	})
})

</script>

<style type="text/css">

/* 이미지랑 위에 네비게이션바 여백 없애기 위한 스타일 */
body {
	margin: 0;
	padding: 0;
}

/* 상단, 하단 글씨 가운데 정렬 */
#header, #footer {
	text-align: center;
}

/* 하단(footer) 스타일 */
#footer {
 	background-color: #E1E1E1; 
 	color: black;
}

/* 네비게이션바 전체 스타일 */
.menu  tr {
	width : 1500px;
	text-align: center;
/* 	padding-left: 100px; */
}

/* 네비게이션바 구분 스타일 */
.menu td {
	width : inherit;
	text-align: center;
	background-color: #7CA621;
	color : white;
	height : 50px;
	margin: 0;
	padding: 0;
	cursor: pointer;
}

/* 로고 이미지 부모 태그 가운데 정렬 및 스타일(이미지 가운데 정렬하려면 부모 태그에 가운데 정렬 스타일 적용해야 함) */
#wrap{
	text-align: center;
 	width:100%; 
 	height:100px; 
}

/* 로고 이미지 가운데 정렬 및 스타일 */
#logo {
	text-align: center;
	width:500px;
	height:115px;
	position: relative;
}

.lefttop3 {
	position : absolute;
	top: 50px;
	right:150px;
}
.righttop{
	position: absolute;
	top: 50px;
	right: 18px;
}

.righttop2{
	position: absolute;
	top: 50px;
	right: 137px;
}

@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

a{ text-decoration: none; } /* 링크텍스트에 밑줄없앰 */
button{ cursor: pointer; } /* 모든 버튼에 마우스손모양 처리 */


@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

</style>


</head>
<body>
<div id="header"  style= "font-family: GmarketSansMedium">
<div id="fullHeader">

	<div id="wrap" >
	<a href="../admin/free"><img id="logo" src="../../resources/img/logo2.png"></a>
	
	<c:if test="${empty adminLogin }">
	<a href="/admin/login"	class="righttop">관리자 로그인 </a>
	<a href="/saveearth/main"	class="righttop2">메인화면</a>
	
	</c:if>
	
	<c:if test="${not empty adminLogin }">
	<a href="/member/logout" class="lefttop3">관리자 로그아웃</a>
	</c:if>
	</div>
</div>
</div>

<div style= "font-family: GmarketSansMedium">
<table class="menu">

<tr>

	<td id="adminFree">게시판 관리</td>
	<td id="adminProduct">상품 관리</td>
	<td id="adminInquiry">문의 관리</td>
</div>
</tr>
</div>
</table>
</div>
