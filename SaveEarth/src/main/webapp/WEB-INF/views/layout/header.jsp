<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


<script type="text/javascript">

// $(function() {
// 	("#infoBoard").click(function() {
// 		$(location).attr("href", "/info/main")
// 	})
// })

/* '정보게시판' 클릭했을 때 지정한 href로 이동 */
$(document).ready(function(){

	$("#infoBoard").click(function(){
		$(location).attr("href", "/info/main")
	})

	$("#freeBoard").click(function(){
		$(location).attr("href", "/free/main")
	})
	
	$("#campBoard").click(function(){
		$(location).attr("href", "/campaign/main")
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
	width : 500px;
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
}

</style>


</head>
<body>

<div id="fullHeader">
<div id="header">
	<div id="wrap">
	<a href="../saveearth/main"><img id="logo" src="../../resources/img/logo2.png"></a>
	</div>
</div>

<table class="menu">

<tr>
	<td id="welcome">소개</td>
	<td id="infoBoard">정보게시판</td>
	<td id="freeBoard">자유게시판</td>
	<td id="campBoard">캠페인</td>
	<td id="shop">굿즈샵</td>
</tr>

</table>
</div>
