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

<script>

//인증글 버튼 클릭 모달
var myModal = document.getElementById('myModal')
var myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', function () {
	myInput.focus()
})

//현재 달력이랑 모달 부딪힘,,ㅠ

</script>



<div id="calendar"></div>



<div id="writeModal" style="height: 0; width: 0;">

<!-- Button trigger modal -->
<button style="display: hidden" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop"></button>

<!-- Modal -->
<div class="modal fade insertModal" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
    	<div class="modal-content">
    
		    <!-- Modal Header -->
			<div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">인증글 작성하기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>	<!-- close 클릭시 modal 한번 더 띄위기 -->
			</div>
		      
		      
		    <!-- Modal Body -->  
			<div class="modal-body">
				<div class="form-group">
					<label for="partTitle">제목</label>
					<input type="text" class="form-control" id="partTitle" placeholder="제목을 입력하세요">
				</div>
				<br>
				<div class="form-group">
					<label for="partContent">내용</label>
					<input type="text" class="form-control" id="partContent" placeholder="내용을 입력하세요">				
				</div>
				<br>
				<div class="form-group">
					<label for="partFile">첨부파일</label>
					<input type="file" class="form-control" id="partFile">
				</div>
			</div>
			
			
			<!-- Modal Footer -->
			<div class="modal-footer" id="btnWrap">
		        <button type="button" class="btn btn-secondary" id="btnCancel" data-bs-dismiss="modal">취소하기</button>
		        <button type="button" class="btn btn-primary" id="btnWrite">작성하기</button>
			</div>
		</div>
	</div>
</div>

</div>



<!-- 모달 추가해야 함 -->


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
// 		selectable : true,
// 		select: function(arg) {		//날짜 클릭 이벤트
// 			console.log(calendar.getDate())
			
// 			var string = calendar.getDate()
			
// 			day = string.getDate()
			
// 			console.log(day)
			
// 			//현재 어딜 클릭해도 오늘 날짜 출력
// 			//일단 일 추출하는거까진 성공
			
		
// 		},
		dateClick: function(info) {		//날짜 클릭하면 해당 일 출력
			console.log(info.date)
			
			var string = info.date
			console.log(string)
			
			day = string.getDate()
			console.log(day)
			
			//여기에 해당 일자 목록 불러오는 에이젝스..? 혹은 메소드 추가해야 함
			
		}

	});
    calendar.render();
});



</script>
