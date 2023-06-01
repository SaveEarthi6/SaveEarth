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


<script type="text/javascript">

document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth',
		customButtons: {
			myCustomButton: {
				text: '인증글 작성하기'
				, click: function() {
					
					//버튼 클릭시 모달창 초기화
					document.getElementById('preview').src = "";
					$("#partForm")[0].reset();
					
					//버튼 클릭시 모달 오픈
					$("#btnWriteModal").click()
					
				}
			}

		},
		headerToolbar: {
			
			//비로그인 상태
			<c:if test="${empty isLogin }">
				start: 'prev'
				, center: 'title'
				, end: 'next'
			</c:if>
			
			//로그인 상태
			<c:if test="${not empty isLogin and isLogin }">
				start: 'prev next today'
				, center: 'title'
				, end: 'myCustomButton'
			</c:if>
		},
		events: [
			
			//비로그인 상태시 기본 기념일 보여주기
			<c:if test="${empty isLogin }">
				<c:forEach items="${calList}" var="calendar">
				{
					title : "${calendar.calName}"	,
					start : "<fmt:formatDate value="${calendar.calDate}" pattern="yyyy-MM-dd"/>"
				},
				</c:forEach>
			</c:if>
			
			//로그인 상태시 user의 인증글 보여주기
			<c:if test="${not empty isLogin and isLogin }">
				<c:forEach items="${certList}" var="certification">
				{
					id: "${certification.partNo}",
					title : "${certification.partTitle}",
					start : "<fmt:formatDate value="${certification.partDate}" pattern="yyyy-MM-dd"/>"
				},
				</c:forEach>
			</c:if>
				 
		],
		dayMaxEventRows: true,
		eventClick: function(info) {
			console.log(info.event.id)
			const partNo = info.event.id
			
			$.ajax({
				type: "post"
				, url : "./viewCert"
				, data : {partNo : partNo}
				, dataType : "html"
				, success : function(res) {
					console.log('성공')
					console.log(res)
					
					//view 모달 바디에 추가해주기
					$("#viewModalBody").html(res)
					
				}
				, error : function() {
					console.log('실패')
					
				}
			})
			
			//more 창 닫기
			$("#fc-dom-11").css("display", "none");
			
			//클릭시 모달 창 띄우기
			$("#btnViewModal").click()
			
		}
		<c:if test="${not empty isLogin and isLogin }">
		, selectable: true,
		dateClick: function(info) {
			
			//해당 날짜와 일치하는 user의 인증글 목록 보여주기
			console.log(info.dateStr)
			const dateStr = info.dateStr

			$.ajax({
				type: "post"
				, url : "./viewCertList"
				, data : {calDate : dateStr}
				, dataType : "html"
				, success : function(res) {
					console.log('성공')
					console.log(res)
					
					//view 모달 바디에 추가해주기
					$("#viewModalBody").html(res)
					
				}
				, error : function() {
					console.log('실패')
					
				}
			})
			
			//클릭시 모달 창 띄우기
			$("#btnViewModal").click()
		}
		</c:if>

	});
    calendar.render();
});






</script>

