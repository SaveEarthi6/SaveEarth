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

@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

/* 아코디언*/
.accordion-button {
	font-weight: bold;
	background-color: #D2E6F6;
}

h1 {
	font-family: 'KBO-Dia-Gothic_bold';
}


</style>
</head>
<body>

<!-- 소개게시판 메인 이미지 -->

<div>
	<img class="introimage" src="../resources/img/intro.jpg">
	<h1 class="intro">소개게시판</h1>
</div>

<div style= "padding-top: 100px;">
<h1 style= "text-align:center; position:relative;" ><strong>지구 온도 상승 시나리오</strong></h1>
</div>

<!-- 지구 온도 상승 시나리오 -->
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style= "width:1000px; margin-left: 445px; padding-top: 20px;" >
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2" ></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
  </div>
  <div class="carousel-inner" >
    <div class="carousel-item active" >
      <img src="../resources/img/intro_1.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="../resources/img/intro_2.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="../resources/img/intro_3.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="../resources/img/intro_4.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="../resources/img/intro_5.png" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<!-- 소개 -->
<div style= "padding-top: 200px;">
<h1 style= "text-align:center; position:relative;" ><strong>SAVE EARTH 핵심가치</strong></h1>
</div>

<div class="accordion" id="accordionExample" style= "width:700px; padding-top: 20px; margin-left: 597px;">
  <div class="accordion-item">
  
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        용기 COURAGE
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body"  style= "background-color:#ECF2F7">
     <p style="font-family:omyu_pretty; "> 
		SaveEarth는 행동을 통해 용기를 발취하고, 보다 나은 변화를 필요하는 곳에서 일하며,
		모든 이들에게 우리의 터전인 지구의 미래를 위협하는 여러 문제들에
		대처할 수 있는 영감을 제공합니다. 
	</p>
      </div>
    </div>
  </div>
  
<div class="accordion-item">
 <h2 class="accordion-header" id="headingTwo">
   <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
	정직 INTEGRITY
   </button>
 </h2>
 <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
   <div class="accordion-body"  style= "background-color:#ECF2F7">
   	<p style="font-family:omyu_pretty; ">
		SaveEarth는 다른 이들에게 요구하는 원칙을 준수합니다. 
		우리는 진실성, 책임감, 투명성을 가지고 행동하며, 
		사실과 과학을 토대 삼아 우리가 스스로 배우고 발전할 수 있도록 노력합니다.                        
	</p>
    </div>
  </div>
</div>

<div class="accordion-item">
  <h2 class="accordion-header" id="headingThree">
    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
   	존중 RESPECT
    </button>
  </h2>
  <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
    <div class="accordion-body"  style= "background-color:#ECF2F7">
    <p style="font-family:omyu_pretty; ">
		SaveEarth는 우리가 봉사하고 있는 지역사회의 목소리와 지식을 존중하며, 
		사람들이 지속가능한 미래를  누릴 수 있는 기본적인 권리를 보장하기 위해 노력하고 있습니다.                                              
	</p>
      </div>
    </div>
  </div>

<div class="accordion-item">
  <h2 class="accordion-header" id="headingFour">
    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
   	협업 
  COLLABORATION
    </button>
  </h2>
  <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample" >
    <div class="accordion-body" style= "background-color:#ECF2F7">
    <p style="font-family:omyu_pretty; ">
		SaveEarth는 공동 대응과 혁신의 힘을 통해 우리가 직면한 문제와 비례하는 영향력을 발휘하고자 합니다.                                             
	</p>
      </div>
    </div>
    
  </div>
</div>

<!-- TOP으로 가기 -->
<div style="cursor:pointer; text-align:right;" onclick="window.scrollTo(0,0);"><i class="bi bi-arrow-up-circle-fill" ></i></div>

<c:import url="../layout/footer.jsp"/>

</body> 
</html>