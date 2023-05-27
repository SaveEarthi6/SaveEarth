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

#navButton  {  
  	margin-left: 30px;  
	margin-top: 20px;  
 	width: 100px;  
}  

.nav { 
 	margin-left: 100px; 
 	margin-bottom: 50px; 
} 


.search { 
 	text-align: center; 
 	margin-left: 925px;
 	display: flex;
    align-items: flex-end;
 } 

 .search_input { 
 	width: 300px; 
 	height: 30px; 
 	font-size: 18px; 
 	border: 1px solid #ccc; 
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
  	margin-left: 5px;
 } 

 .search_icon { 
 	width: 20px; 
 	height: 20px; 
 	margin-bottom: 3px; 
 } 

#camp {
  width: 225px;
  text-align: center;
  display: block;
  margin-left:10px;
  margin-right: 10px;
  margin-bottom: 80px;
  
}

#campTitle {
	font-size: 1.5em;
	font-weight: bold;
}

#campTag {
	text-decoration: none;
	color: inherit;
}


</style>


<script type="text/javascript">

//인증글 버튼 클릭 모달
// var myModal = document.getElementById('myModal')
// var myInput = document.getElementById('myInput')

// myModal.addEventListener('shown.bs.modal', function () {
// 	myInput.focus()
// }



//캠페인 상태 버튼 ajax
 $(function(){
	$(".preface").click(function() {
		console.log("test")
		console.log($(this).html())
		
		const state = $(this).html()
		
		$.ajax({
			type: "get"
			, url : "./preface"
			, data : {state : state}
// 			, dataType : "json"
			, success : function(res) {
				console.log('성공')
				console.log(res)
			}
			, error : function() {
				console.log('실패')
				
			}
		})
		

// 		const id = $(".id").val();
// 		$("#signup").attr("type","button");
// 		$.ajax({
// 			type: "get",

// 			url: "http://localhost:8888/member/idCheck",
// 			data:{id:id},
// 			success: function(data){
// 				if(data == 1) {
// 					$("#olmessage").text("이미 사용중인 ID입니다");
// 					$("#signup").attr("type","button");
					
					
// 				} else {
// 					$("#olmessage").text("사용가능한 ID입니다");
// 					$("#signup").attr("type","submit");
// 				}
// 			}
// 		})
	})
	

})



</script>



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
					//클릭시 모달창 클릭되도록 수정하기
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

<c:import url="./campList.jsp"/>

<div id="writeModal" style="height: 0; width: 0;">

<!-- Button trigger modal -->
<button style="display: hidden" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop"></button>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>

</div>

	

<c:import url="../layout/paging.jsp"/>

<c:import url="../layout/footer.jsp"/>
