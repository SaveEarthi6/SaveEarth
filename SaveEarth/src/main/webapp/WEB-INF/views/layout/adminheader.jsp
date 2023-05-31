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

/* '정보게시판' 클릭했을 때 지정한 href로 이동 */
$(document).ready(function(){

	$("#infoBoard").click(function(){
		$(location).attr("href", "/admin/board")
	})

	$("#freeBoard").click(function(){
		$(location).attr("href", "/admin/product")
	})
	
	$("#campBoard").click(function(){
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
 	background-color: #7CA621; 
 	color: white;
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
	height:100px;
	position: relative;
}

.lefttop {
	position : absolute;
	top: 50px;
	right:150px
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


</style>


</head>
<body>

<div id="fullHeader">
<div id="header">
	<div id="wrap">
	<a href="../admin/free"><img id="logo" src="../../resources/img/logo2.png"></a>
	
	<c:if test="${empty isLogin }">
	<a href="/admin/login"	class="righttop">관리자 로그인 </a>
	<a href="/saveearth/main"	class="righttop2">메인화면</a>
	</c:if>
	
	<c:if test="${not empty isLogin and isLogin }">
	<a href="/member/logout" class="lefttop3">로그아웃</a>
	</c:if>
	</div>
</div>



<table class="menu">

<tr>
	<td id="welcome">게시판 관리</td>
	<td id="infoBoard">상품 관리</td>
	<td id="freeBoard">문의 관리</td>
</tr>

</table>
</div>
