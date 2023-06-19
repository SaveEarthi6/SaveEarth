<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:import url="../layout/adminheader.jsp"/>


<style type="text/css">

@font-face {
   font-family: 'KBO-Dia-Gothic_bold';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff')
      format('woff');
      
   font-weight: 700;
   font-style: normal;
}

h1 {
   margin-top:50px;
   color: black;
   font-weight: bold;
   font-size: 50px;
   font-family: 'KBO-Dia-Gothic_bold';
}

.nav {  
  	margin: 10px auto;  
    width: fit-content;
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
	height: 500px;
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


/* 검색창 스타일 */
input {
	width: 100%;
	border: 1px solid #bbb;
	border-radius: 8px;
	font-size: 14px;
}

/* '자유게시판'문구 폰트 스타일 */
@font-face {
	font-family: 'KBO-Dia-Gothic_bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff')
		format('woff');
		
	font-weight: 700;
	font-style: normal;
}

.head {
	padding-left: 1200px;
	padding-top: 50px;
	
}



/* 게시판 목록 */
#board {
	width:1300px;
	
	margin-top: 100px;
	
	margin-left:auto;
	margin-right:auto;
	
	text-align: center;
}
/* 게시글 분류 전체(div) 스타일 */
.nav { 
 	margin: 0 auto; 
    width: fit-content;
    
 } 
 
 /* 게시판 분류 버튼 스타일 */
.nav button {  
  	margin-left: 40px;  
	margin-top: 60px;  
 	width: 300px;  
  }  
 
 /* 글쓰기 버튼 스타일 */
#write {
 	text-align: right; 
 	margin-right: 100px; 
 	margin-bottom: 20px; 
}

.main{

height: 1000px;
}
</style>

<div class="nav">
<h1>문의 관리</h1>
</div>

<br> <br>

<body>


<table id="board" class= "table table-hover text-center">

	<tr style= "background-color: #59A8D9; color: white;">
		<th style="width: 20px;">글번호</th>
		<th style="width: 20px;">문의 제목</th>
		<th style="width: 20px;">문의 내용</th>
		<th style="width: 20px;">문의 답변하기</th>
		<th style="width: 20px;">문의 답변상태</th>
	</tr>
	
<div class="main">
<c:forEach items="${prodinq}" var="prodinq" >

			<tr>
				<td>${prodinq.inqNo }</td>
				<td>${prodinq.inqTitle}</td>
				<td>${prodinq.inqContent}</td>
				<td><a href = "./inquiryWrite?inqNo=${prodinq.inqNo}"><button>답변</button></a></td>
				<td>${prodinq.inqProc}</td>
			</tr>

</c:forEach>
</tbody>
</table>	
</div>


  



<c:import url="../layout/footer.jsp"></c:import>


</body>

</html>