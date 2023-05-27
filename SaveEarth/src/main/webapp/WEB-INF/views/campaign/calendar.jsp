<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<style>
/* 툴바 제목 */
.fc-toolbar-title {
	font-weight: bold;
}

/* 요일 */
.fc-scrollgrid-sync-inner {
	background-color: #7CA621;
	
}

/* 요일 글씨 */
.fc-col-header-cell-cushion {
	color: white;
	text-decoration: none;
}

/* 오늘 날짜 !!!수정 필요!!! */
.fc-day-today {
  border: 1px solid blue !important;
  color: red !important;
  background: green !important;

}

/* 달력 바디 */
.fc-daygrid-day-frame {
	background-color: white;
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





  /*모달 푸터*/
  .modal-footer{
  	display:inline-block;
  }
  
</style>

<div id="calendar"></div>

<script>

document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth',
		customButtons: {
			myCustomButton: {
				text: '인증글 작성하기'
				, click: function() {
					alert('인증글 작성하기 모달')
					//클릭시 모달창 클릭되도록 수정하기
				}
			}

		},
		headerToolbar: {
			start: 'prev next today'
			, center: 'title'
			, end: 'myCustomButton'
		},
		selectable : true,
		select: function(arg) {		//날짜 클릭 이벤트
			console.log(calendar.getDate())
			
			var string = calendar.getDate()
			
			day = string.getDate()
			
			console.log(day)
			
			//현재 어딜 클릭해도 오늘 날짜 출력
			//일단 일 추출하는거까진 성공
			
		
		}

	});
    calendar.render();
});




// document.addEventListener('DOMContentLoaded', function() {
// 	var calendarEl = document.getElementById('calendar');
// 	var calendar = new FullCalendar.Calendar(calendarEl, {
// 		initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
// 		headerToolbar : { // 헤더에 표시할 툴 바
// 			start : 'prev next today',
// 			center : 'title',
// 			end : 'dayGridMonth,dayGridWeek,dayGridDay'
// 		},
// 		titleFormat : function(date) {
// 			return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
// 		},
// 		//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
// 		selectable : true, // 달력 일자 드래그 설정가능
// 		droppable : true,
// 		editable : true,
// 		nowIndicator: true, // 현재 시간 마크
// 		locale: 'ko' // 한국어 설정
// 	});
// 	calendar.render();
// });

</script>
