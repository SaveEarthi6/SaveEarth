<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp"/>

<!-- 풀캘린더 -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js'></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js"></script>


<style type="text/css">

.campimage {
	position: relative;
}

.camp {
	position: absolute;
	top: 38%; 
	left: 45%; 
/* 	transform: translate(-50%, -50%);  */
	color: #fff; 
	font-weight: bold;
	font-size: 50px;
    font-family: 'KBO-Dia-Gothic_bold';
}


@font-face {
    font-family: 'KBO-Dia-Gothic_bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff') format('woff');
    font-weight: 700;
    font-style: normal;
}

#wrapCalendar {
	width: 1000px;
	margin: 0 auto;
}

#calName {
	text-align: center;
	font-weight: bold;
	font-size: 2em;
	padding: 40px;
}

#line {
	width: 1700px;
	margin: 0 auto;
}

.nav button {  
  	margin-left: 30px;  
	margin-top: 20px;  
 	width: 100px;  
}  

.nav { 
 	margin-left: 100px; 
 	margin-bottom: 50px; 
} 


/* 검색 전체 div태그 스타일 */
.search {
	text-align: center;
	width: 100%;
	height: 100px;
}

.search_input {
	width: 300px;
	height: 30px;
	font-size: 18px;
	border: 1px solid #ccc;
/* 	border-bottom: 1px black solid; */
}

.search_btn {
	font-size: 18px;
	border: none;
	background-color: green;
	width: 50px;
	height: 30px;
	border-radius: 15px;
	color: #fff;
	cursor: pointer;
	vertical-align: middle;
}

.search_icon {
	width: 20px;
	height: 20px;
	margin-bottom: 3px;
}


</style>



<div>
	<img class="campimage" src="../resources/img/camp.png" style="width: 100%; height: 500px;">
	<h1 class="camp">캠페인게시판</h1>
</div>	
	
	
<div id="wrapCalendar">

<!-- 나중에 c:if 로 감싸줘야 함 -->

<div id="calName">나의 달력</div>

<div id="calendar"></div>


<script>

document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		themeSystem: 'bootstrap5'
		, customButtons: {
			myCustomButton: {
				text: '인증글 작성하기'
				, click: function() {
					alert('인증글 작성하기 모달')
				}
			}

		}
		, initialView: 'dayGridMonth'		//초기 로드될 때 보이는 캘린더화면(month)
		, headerToolbar: {
			start: 'prev next today'
			, center: 'title'
			, end: 'myCustomButton'
		}
		//타이틀 포멧
		, locale: 'ko'	//한국어 설정
	});
	calendar.render();
});

</script>

<!-- 달력 커스텀 해야함 -->

</div>

<div id="line"><hr></div>

<div id="campList">

<div class="nav">
<button type="button" class="btn btn-outline-success">전체</button>
<button type="button" class="btn btn-outline-success">진행중</button>
<button type="button" class="btn btn-outline-success">마감</button>
</div>

<div class="search">
	<form action="/info/main">
        <input type="text" name="search" class="search_input">
        <button type="button" name="search_btn" class="search_btn"><img src="../resources/img/searchicon.png" class="search_icon"></button>
	</form>
</div>


</div>
	


<c:import url="../layout/footer.jsp"/>