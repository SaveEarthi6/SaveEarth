<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
  
<style>

:root {
  --fc-today-bg-color: #fffad9 !important;
}

/* 툴바 제목 */
.fc-toolbar-title {
	font-weight: bold;
}

/* 요일 */
.fc-col-header-cell {
	background-color: #7CA621;
}


/* 요일 글씨 */
.fc-col-header-cell-cushion {
	color: white;
	text-decoration: none;
}

/* 달력 바디 글씨 */
.fc-daygrid-day-number {
	text-decoration: none;
	color: black;
}

/* 버튼 -> 색 고민 같이 해보기 */
.fc-button {
	border-color: #7CA621 !important;
	color: #7CA621 !important;
	background-color: white !important;
}

/* 버튼 호버 */
.fc-button:hover {
	color: white !important;
	background-color: #7CA621 !important;
}

/* 이벤트 라벨 */
.fc-event-title-container {
	font-weight: bold;
}

/* 클릭시 테두리 */
.fc-highlight{
   border: solid #7CA621;

}


.fc-day-today {
	color: black;
	background-color: red;
	border-color: blue;
}

</style>

<div id="calendar"></div><!-- 없어서 어디에 담아야할지 몰라서 안 뜬거였음 ㅠ -->

<script type="text/javascript">

var today = new Date().toISOString().split("T")[0];

document.addEventListener('DOMContentLoaded', function() {
   var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      customButtons: {
			myCustomButton: {
				text: '내 달력'
				, click: function() {
					
					location.href="/campaign/main"
				}
			}

		},
      headerToolbar: {
         start: 'prev next'
         , center: 'title'
         , end: 'myCustomButton'
      },
      events: [
         <c:forEach items="${calList}" var="calendar">
         {
            title : "${calendar.calName}"   ,
            start : "<fmt:formatDate value="${calendar.calDate}" pattern="yyyy-MM-dd"/>"
         },
            </c:forEach>
             
      ]

   });
    calendar.render();
});


</script>













