<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp"/>

<!-- 풀캘린더 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>


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

#btnModal {
	width: 0;
	height: 0;
	display: none;
}


</style>


<script type="text/javascript">



//캠페인 상태 버튼 ajax
 $(function(){
	$(".preface").click(function() {
		console.log("test")
		console.log($(this).html())
		
		const state = $(this).html()
		
		$.ajax({
			type: "post"
			, url : "./preface"
			, data : {state : state}
			, dataType : "html"
			, success : function(res) {
				console.log('성공')
				
				$("#campListJsp").html(res)
			}
			, error : function() {
				console.log('실패')
				
			}
		})

	})
	

})



</script>

<script type="text/javascript">

//인증글 버튼 클릭 모달
const myModal = document.getElementById('insertModal')
const myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', () => {
  myInput.focus()
})

// //모달 초기화
// function initModal(arg) {
	
// 	console.log('글 작성 취소')	
	$("#partTitle").val()
	
// }

// //첨부파일 읽어오기
// function readFile(file) {
	
// }

// //DB 삽입
// function insertPart() {
	
// 	console.log('글 작성하기')
// 	console.log($("#partTitle").val())
// 	console.log($("#partContent").val())
// 	console.log($("#partFile").val())
	
// 	const title = $("#partTitle").val()
// 	const content = $("#partContent").val()
	
	
	
// }



//파일 전송 api 제이쿼리


</script>



<div>
	<img class="campimage" src="../resources/img/camp.png" style="width: 100%; height: 500px;">
	<h1 class="camp">캠페인게시판</h1>
</div>	
	
	
<div id="wrapCalendar">

<!-- 나중에 c:if 로 감싸줘야 함 -->

	<div id="calName">나의 달력</div>
	
	<div id="calendarImport">
	
	<c:import url="./calendar.jsp"></c:import>
	
	</div>
	
	<!-- 달력 커스텀 해야함 -->

</div>


<div id="writeModal" style="height: 0; width: 0;">

<!-- Button trigger modal -->
<button id="btnModal" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop"></button>

<form id="partForm" action="./main" method="post" enctype="multipart/form-data">
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
					<label for="partNo">참여할 캠페인</label>
					<select id="partNo" class="form-control">
						<c:forEach var="campaign" items="${campList }">
						<option value="${campaign.campNo }">${campaign.campTitle }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="partTitle">제목</label>
					<input type="text" class="form-control" id="partTitle" name="partTitle" placeholder="제목을 입력하세요">
				</div>
				<br>
				<div class="form-group">
					<label for="partContent">내용</label>
					<input type="text" class="form-control" id="partContent" name="partContent" placeholder="내용을 입력하세요">				
				</div>
				<br>
				<div class="form-group">
					<label for="partFile">첨부파일</label>
					<input type="file" class="form-control" id="partFile" name="partFile">
				</div>
				<div>
					<!-- 회원번호랑 캠페인 번호 넣을 곳 -->
<%-- 					<input type="text" value="${loginNo }"> --%>
					
				</div>
			</div>
			
			
			<!-- Modal Footer -->
			<div class="modal-footer" id="btnWrap">
		        <button type="button" class="btn btn-secondary" id="btnCancel" data-bs-dismiss="modal">취소하기</button>
		        <button type="submit" class="btn btn-primary" id="btnWrite">작성하기</button>
		        <!-- 회원번호 캠페인번호 같이 넘겨야함 -->
		        <!-- onclick시 함수 ajax 함수 호출..? -->
			</div>
		</div>
	</div>
</div>
</form>

</div>



<div id="line"><hr></div>

<div id="campList">
	<div class="nav">
		<button id="navButton" type="button" class="btn btn-outline-success preface">전체</button>
		<button id="navButton" type="button" class="btn btn-outline-success preface">진행중</button>
		<button id="navButton" type="button" class="btn btn-outline-success preface">마감</button>
		
	    <span class="search">
	        <input type="text" name="search" class="search_input">
	        <button type="button" name="search_btn" class="search_btn"><i class="bi bi-search"></i></button>
	    </span>
		
	</div>
	
<div id="campListJsp">

<c:import url="./campList.jsp"/>

</div>

</div>


<c:import url="../layout/paging.jsp"/>

<c:import url="../layout/footer.jsp"/>
