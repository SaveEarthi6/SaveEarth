<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소개게시판</title>

<style type="text/css">

/* 여백 없애기 */
body {
	margin:0;
	padding: 0;
}

/* 게시판 메인 이미지 스타일 */
.introimage {
	/* 이미지랑 네비게이션바 띄우기 */
	position: relative;
	width: 100%;
	height: 500px;
}

/* 이미지 안에 소개게시판 문구 스타일 */
.intro {
	position: absolute;
	top: 38%;
	left: 45%;
	color: #fff;
	font-weight: bold;
	font-size: 50px;
	font-family: 'KBO-Dia-Gothic_bold';
}

/* 소개게시판'문구 폰트 스타일 */
@font-face {
	font-family: 'KBO-Dia-Gothic_bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff')
		format('woff');
		
	font-weight: 700;
	font-style: normal;
}



</style>
</head>
<body>

<!-- 소개게시판 메인 이미지 -->

<div>
	<img class="introimage" src="../resources/img/intro.jpg">
	<h1 class="intro">소개게시판</h1>
</div>


<!-- 소개 -->

<div style= "padding-top: 50px;">
<h1 style= "text-align:center" ><strong>SAVE EARTH 핵심가치</strong></h1>
</div>


<div style = "padding-left: 100px">
	<span>용기</span>
	<br>
	<strong>COURAGE</strong>
	<p> 
		SaveEarth는 행동을 통해 용기를 발취하고, 보다 나은 변화를 필요하는 곳에서 일하며,
		모든 이들에게 우리의 터전인 지구의 미래를 위협하는 여러 문제들에
		대처할 수 있는 영감을 제공합니다. 
	</p>
</div>


<div  style = "padding-left: 100px">
	<span>정직</span>
	<br>
	<strong>INTEGRITY</strong>
	<p>
		SaveEarth는 다른 이들에게 요구하는 원칙을 준수합니다. 
		우리는 진실성, 책임감, 투명성을 가지고 행동하며, 
		사실과 과학을 토대 삼아 우리가 스스로 배우고 발전할 수 있도록 노력합니다.                        
	</p>
</div>


<div  style = "padding-left: 100px">
	<span>존중</span>
	<br>
	<strong>RESPECT</strong>
	<p>
		SaveEarth는 우리가 봉사하고 있는 지역사회의목소리와 지식을 존중하며, 
		사람들이 지속가능한 미래를  누릴 수 있는 기본적인 권리를 보장하기 위해 노력하고 있습니다.                                              
	</p>
</div>

<div  style = "padding-left: 100px">
	<span>협업</span>
	<br>
	<strong>COLLABORATION</strong>
	
	<p>
		SaveEarth는 공동 대응과 혁신의 힘을 통해 우리가 직면한 문제와 비례하는 영향력을 발휘하고자 합니다.                                                                     
	</p>
</div>

<div style="cursor:pointer;" onclick="window.scrollTo(0,0);"><i class="bi bi-arrow-up-circle-fill" ></i></div>

</body> 
</html>