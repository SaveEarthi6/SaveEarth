<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
  
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
  border: 1px solid #7CA621 !important;


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


/* 모달 푸터 버튼 */
.modal-footer {
	display: flex;
    justify-content: space-evenly;
}

/* 모달 작성하기 버튼 */
#btnWrite {
	background-color: #7CA621;
	border-color: #7CA621
}

#btnWrite:hover {
	background-color: white;
	border-color: #7CA621;
	color: #7CA621;
}
  
</style>





<div id="calendar"></div>


<!-- 모달 추가해야 함 -->





<script type="text/javascript">

var eventDay;
var title;
var date;

// $.ajax({
// 	type: "post"
// 	, url : "./getCalendar"
// 	, dataType : "JSON"
// 	, success : function(res) {
// 		console.log('성공')
// 		console.log(res)
		
// 		$.each(res, function(key, value) {
			
// 			title1 = value.calName
// 			start1 = value.calDate
			
// 			console.log(title1)
// 			console.log(start1)
			
			
// 		})
		
// 	}
// 	, error : function() {
// 		console.log('실패')
		
// 	}
// })




document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth',
		customButtons: {
			myCustomButton: {
				text: '인증글 작성하기'
				, click: function() {
					//클릭시 모달창 클릭되도록 수정하기
					$("#btnModal").click()
				}
			}

		},
		headerToolbar: {
			start: 'prev next today'
			, center: 'title'
			, end: 'myCustomButton'
		},
		events: [
			<c:forEach items="${calList}" var="calList">
			{
				title : "${calList.calName}"	,
				start : "<fmt:formatDate value="${calList.calDate}" pattern="yyyy-MM-dd"/>"
			},
			</c:forEach>
				 
		],
		dateClick: function(info) {		//날짜 클릭하면 해당 일 출력
			var string = info.date
			day = string.getDate()
			console.log(day)
			
			//여기에 해당 일자 목록 불러오는 에이젝스..? 혹은 메소드 추가해야 함
			
		}
// 		selectable : true,
// 		select: function(arg) {		//날짜 클릭 이벤트
// 			console.log(calendar.getDate())
			
// 			var string = calendar.getDate()
			
// 			day = string.getDate()
			
// 			console.log(day)
			
// 			//현재 어딜 클릭해도 오늘 날짜 출력
// 			//일단 일 추출하는거까진 성공

			
		
// 		},

	});
    calendar.render();
});






</script>
