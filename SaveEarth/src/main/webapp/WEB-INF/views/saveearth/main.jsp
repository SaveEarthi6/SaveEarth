<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"></c:import>

<!-- 풀캘린더 -->

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>


<style type="text/css">

/* 여백 없애기 */
body {
	margin:0;
	padding: 0;
}

/* 게시판 메인 이미지 스타일 */
.freeimage {
	/* 이미지랑 네비게이션바 띄우기 */
	position: relative;
	width: 100%;
	height: 50%;
}

/* 이미지 안에 자유게시판 문구 스타일 */
.free {
	position: absolute;
	top: 38%;
	left: 45%;
	color: #fff;
	font-weight: bold;
	font-size: 50px;
	font-family: 'KBO-Dia-Gothic_bold';
}


/* '메인게시판'문구 폰트 스타일 */
@font-face {
	font-family: 'KBO-Dia-Gothic_bold';
	src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff')format('woff');
	font-weight: 100%;
	font-style: normal;
}
	
@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}


#quiz{
	font-family: 'omyu_pretty';
}

/* 달력 */
#wrapCalendar{
	width:1000px;
	margin: 0 auto;
}

/* 굿즈샵 이미지 스타일 */
.goodsimage {
	width: 100%; 
	height: 500px; 
	position: relative;
	margin-bottom: 30px;
}

/* 굿즈샵 상품 목록 스타일 */
#goodsList {
	text-align: center;
	margin-bottom: 20px;
}

/* 퀴즈 폼*/
#quizForm {
	border: 5px solid #59A8D9;
	padding-bottom: 50px;
	padding-top: 50px;
	margin-left: 400px;
	margin-right: 400px;
	padding-left: 60px;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">

//퀴즈폼
$(function() {
  $("#answer").click(function() {
    var selectedOption = $(".ch:checked");
    if (selectedOption.length === 0) {
      alert("정답을 선택해주세요 ‼️");
      
    } else {
      var answer = $(this).data("no");
      alert("정답은 " + answer + " 입니다❣️");
    }
    location.reload();
  });
});
</script>



<div>

<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" >
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner" >
    <div class="carousel-item active" >
      <img src="/resources/img/main_top2.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="/resources/img/main_top.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="/resources/img/main_top3.png" class="d-block w-100" alt="...">
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

</div>





<!--  달력(기념일) -->

<!-- 내 달력으로 가기 -->
 <h1 style="font-family: 'KBO-Dia-Gothic_bold'; text-align: center; padding-top: 100px;">🌱환경기념일🌱</h1>
	<div style= "padding-left: 1200px">
 		<a href = "/campaign/main"> 
 		<button type="button" class="btn btn-outline-success" >
 		내 달력</button></a>
	</div>
 
<div id="wrapCalendar"  >
	<div id="calendarImport" style="margin-top: 80px; margin-bottom: 40px;">
	
		<c:import url="./calendarMain.jsp"></c:import>
			
	</div>
</div>

 



<!-- 인증사진 모아보기 -->
 <h1 style="font-family: 'KBO-Dia-Gothic_bold'; text-align: center; padding-top: 100px; padding-bottom: 30px;">🤳🏻SAVE EARTH의 캠페인 참여🤳🏻</h1>
 
 	<div id="certList" class="row">
		<div class="col-1"></div>
		
		<div id="cert" class="row col-10" >
		
			<c:forEach var="cert" items="${cert }" varStatus="status">
			
			<c:if test="${status.index < 9}">
			
			<div id="info" class="col">
			<a href="./detail?prodno=${prod.PROD_NO }" id="prodNo">
			
				<c:if test="${prod.PROD_STORED_NAME ne null }" >
				
					<div>
						<img alt="" src="/upload/${prod.PROD_STORED_NAME }" style="width: 400px; height: 300px; margin-bottom: 10px;">
					</div>
				</c:if>	
				<c:if test="${prod.PROD_STORED_NAME eq null }">
					<div><img alt="" src="" style="width: 400px; height: 300px;"></div>
				</c:if>
			</a>
			</div>
			
			</c:if>
			</c:forEach>
			
		</div>
	
	</div>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
<!-- 퀴즈폼 만들기 --> 
<!-- <div style="background-color: #D8E6EB; "> -->
<div>
 <h1 style="font-family: 'KBO-Dia-Gothic_bold'; text-align: center; padding-top: 100px;  padding-bottom: 30px;">🎲랜덤 퀴즈🎲</h1>
  <form action="/saveearth/main" method="get">
  <div id = "quizForm" >
  <c:forEach items="${quiz }" var="quiz" varStatus="status">
  
  	<c:if test="${status.index < 1}">
  	
    <h2 id = "quiz">Q.${quiz. quizQuestion}</h2>
    <input type="radio" name="q1" class= "ch" value="${quiz. quizOpt1}"> ${quiz. quizOpt1}<br>
    <input type="radio" name="q1" class= "ch" value="${quiz. quizOpt2}"> ${quiz. quizOpt2}<br>
    <input type="radio" name="q1" class= "ch" value="${quiz. quizOpt3}"> ${quiz. quizOpt3}<br>
    <input type="radio" name="q1" class= "ch" value="${quiz. quizOpt4}"> ${quiz. quizOpt4}<br>
           
           <br>
           
     	<button type="button" id="answer" data-no="${quiz.quizAnswer } "  style="font-family:omyu_pretty;">정답확인</button>
  	</c:if>
  	  	
  </c:forEach>
  
  </div>
  
	<h5 style= "padding-left: 1000px ; font-family: omyu_pretty; ">⚠️퀴즈는 3개로 랜덤입니다</h5>
   </form>
   
</div>

	<div id="campList" class="row">
		<div class="col-1"></div>
		
		<div id="camps" class="row col-10">
		
			<c:forEach var="campaign" items="${campList }" begin="0" end="2">
			<div id="camp" class="col">
			<a href="./detail?campno=${campaign.CAMP_NO }" id="campTag">
				
				<c:if test="${campaign.CAMP_STORED_NAME ne null }">
					<div><img alt="" src="/upload/${campaign.CAMP_STORED_NAME }" style="width: 400px; height: 300px;"></div>
				</c:if>
				
				<c:if test="${campaign.CAMP_STORED_NAME eq null }">
					<div><img alt="" src="" style="width: 400px; height: 300px;"></div>
				</c:if>
				
				<div id="campTitle">
					<span id="titleTag">[${campaign.CAMP_STATE }]</span>
					<span id="title">${campaign.CAMP_TITLE }</span>
				</div>
			</a>
			</div>
			</c:forEach>
			
		</div>
		
		<div class='col-1'></div>
	</div>






<!-- 굿즈샵 예시보기 -->
<h1 style="font-family: 'KBO-Dia-Gothic_bold'; text-align: center; padding-top: 100px;">🛍️굿즈샵🛍️</h1>
  	
	<div style= "padding-left: 1200px; padding-bottom: 50px;">
		<a href="/goods/main">
		<button type="button" class="btn btn-outline-success" >
		굿즈샵 </button></a>
  	</div>
  	
	<div id="goodsList" class="row" style="padding-bottom:100px;">
		<div class="col-1"></div>
		
		<div id="infos" class="row col-10">
		
			<c:forEach var="prod" items="${product }" varStatus="status">
			
  			<c:if test="${status.index < 3}">
			
			<div id="info" class="col">
			<a href="/goods/detail?prodno=${prod.PROD_NO }" id="prodNo">
			
				
<!-- 					<div><img alt="" src="" style="width: 400px; height: 300px; margin-bottom: 10px;"></div> -->
				<c:if test="${prod.PROD_STORED_NAME ne null }" >
					<div>
						<img alt="" src="/upload/${prod.PROD_STORED_NAME }" style="width: 400px; height: 300px; ">
					</div>
				</c:if>	
				<c:if test="${prod.PROD_STORED_NAME eq null }">
					<div><img alt="" src="" style="width: 400px; height: 300px;"></div>
				</c:if>
				<div id="CampTitle">
					<span id="titleTag">[${prod.PROD_NAME }]</span>
					<span id="title">${prod.PROD_PRICE }원</span>
				</div>
			</a>
			</div>
			
			</c:if>
			</c:forEach>
			
		</div>

</div>

	

</tbody>
<c:import url="../layout/footer.jsp"></c:import>