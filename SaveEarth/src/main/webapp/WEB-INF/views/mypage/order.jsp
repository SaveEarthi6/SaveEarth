<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<c:import url="../layout/header.jsp"></c:import>


<!-- jQuery 2.2.4  -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>
</head>

<style type="text/css">

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

/* 말머리글 (드롭다운) 크기 늘리기 */
select {
	width:100px;
}

.head {
	padding-left: 1200px;
	padding-top: 50px;
	
}

/* 검색 전체 div태그 스타일 */
.search {
	text-align: center;
	width: 100%;
	height: 290px;
}

/* 검색창 스타일 */
.search_input {
	width: 300px;
	height: 30px;
	font-size: 18px;
	border: 1px solid #ccc;
}

/* 검색창 버튼 스타일 */
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

/* 검색아이콘 이미지 */
.search_icon {
	margin-top:3px;
	margin-bottom:3px;
	width: 20px;
	height: 20px;
}

/* 게시판 목록 */
#board {
	width:1300px;
	
	margin-top: 100px;
	
	margin-left:auto;
	margin-right:auto;
	
	text-align: center;
}

.nav button {  
  	margin-left: 30px;  
	margin-top: 20px;  
 	width: 100px;  
  }  


/* 게시글 분류 전체(div) 스타일 */
.nav { 
 	margin: 0 auto; 
    width: fit-content;
 } 
.main{
	height: 412px;
}

</style>

<body>
<br>

<div class="nav">
<a href="./update"><button type="button" class="btn btn-outline-success" id ="top">회원정보 수정</button></a>
<a href="./delete"><button type="button" class="btn btn-outline-success" id ="top">회원정보 탈퇴</button></a>
<a href="./board"><button type="button" class="btn btn-outline-success" id ="top">작성글<br>보기</button></a>
<a href="./order"><button type="button" class="btn btn-outline-success" id ="top">주문내역 확인</button></a>
<a href="./comment"><button type="button" class="btn btn-outline-success" id ="top">작성 댓글 보기</button></a>
</div>

<br>

<div class="main">
<table id= "board" class= "table table-hover text-center">

	<tr style= "background-color: #59A8D9; color: white;">
		<th style="width: 20px;">주문번호</th>
		<th style="width: 20px;">수령인</th>
		<th style="width: 20px;">주소</th>
		<th style="width: 20px;">가격</th>
	</tr>
	
<tbody>
<c:forEach items="${orderList }" var="orderList">
			<tr>
				<td> <a href="/shop/orderView?n=${orderList.orderNo}">${orderList.orderNo} </a></td>
				<td> ${orderList.orderRec} </td>
				<td> (${orderList.orderAddrPostcode}) ${orderList.orderAddr} ${orderList.orderAddrDetail} </td>
				<td> <fmt:formatNumber pattern="###,###,###" value="${orderList.orderPrice}" /> 원 </td>
			</tr>
</c:forEach>
</tbody>

</table>
</div>


</body>
<c:import url="../layout/footer.jsp"></c:import>