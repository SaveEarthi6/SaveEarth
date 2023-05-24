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

<div id="campList">


</div>
	


<c:import url="../layout/footer.jsp"/>