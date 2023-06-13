<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/adminheader.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 상품등록</title>

<!-- 스마트 에디터 2 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript">

$(function() {

	//작성버튼 동작
	$("#btnWrite").click(function() {
		console.log("btnWrite click")
		
		//iframe내용을 textarea에 넣어주어야 보여짐
		//작성된 내용을 <textarea>에 적용하기
		updateContents()
		//-> 이 함수 밖에 있으면 content등록 전에 작동하게 됨
		
		//폼 제출
		$("form").submit()
		
	})

})

function selectfreeHead() {
	
var freeHead = $('#freeHead').val()


}

function updateContents() {
	//스마트 에디터에 작성된 내용을 textarea#content에 반영한다
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
}

// function freeHead_check() {
	
//     if($("#freeHead").val() != '질문' || $("#freeHead").val() != '정보' || $("#freeHead").val() != '사담'){
//       alert("사담, 정보, 질문만 입력할 수 있습니다");
//       $("#freeHead").focus();
//       return false;
//     }



</script>


<!--  결제하기 실험해보기 -->
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        var IMP = window.IMP; 
        IMP.init("imp42576077"); // 가맹점 식별코드
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        

        function requestPay() {
            IMP.request_pay({
                pg : 'html5_inicis.INIpayTest  ', // PG사 코드표에서 코드 맞춰놓았음
                pay_method : 'card', // 결제 방식
                merchant_uid: "IMP"+makeMerchantUid, // 결제 고유 번호
                name : '${goodsDetail.PROD_NAME }', // 제품명 변경
                amount : document.getElementById("totalprice").innerText, // 가격
                buyer_email : 'Iamport@chai.finance',
                buyer_name : '아임포트 기술지원팀',
                buyer_tel : '010-1234-5678',
                buyer_addr : '서울특별시 강남구 삼성동',
                buyer_postcode : '123-456'
            }, function (rsp) { // callback
                if (rsp.success) {
                    console.log(rsp);
                } else {
                    console.log(rsp);
                }
            });
        }

	</script>

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

form {
	font-weight: bold;
}

#freeHead {
	border: 1px solid #ccc;
}

</style>

<div class="container">

<h1 style= "text-align: center;">상품 등록</h1>

<div class="col-8 mx-auto">

<form action="./productWrite" method="post" enctype="multipart/form-data">


<!-- 글쓰기 폼 (웹 에디터) -->
<div class="form-group" style= "margin-top: 50px">
	<label class="form-label" for="title">상품명</label>
	<input type="text" id="prodName" name="prodName" class="form-control">
</div>

<div class="form-group" style= "margin-top: 50px">
	<label class="form-label" for="title">상품가격</label>
	<input type="text" id="prodPrice" name="prodPrice" class="form-control">
</div>

<div class="form-group" style= "margin-top: 50px">
	<label class="form-label" for="title">상세내용</label>
	<input type="text" id="prodDetail" name="prodDetail" class="form-control">
</div>

<div class="form-group" style= "margin-top: 50px">
	<label class="form-label" for="title">상품색상</label>
	<input type="text" id="prodColor" name="prodColor" class="form-control" value="해당없음">
</div>

<div class="form-group" style= "margin-top: 50px">
	<label class="form-label" for="title">상품 사이즈</label>
	<input type="text" id="prodSize" name="prodSize" class="form-control" value="해당없음">
</div>






<div class="form-group mb-3" style= "margin-top: 50px">
	<label class="form-label" for="file">대표 상품 이미지(대표이미지-먼저보여질 이미지 순서대로 파일첨부)</label>
	<input type="file" id="file" name="files" class="form-control" multiple="multiple">
</div>

<!-- <div class="form-group mb-3" style= "margin-top: 50px"> -->
<!-- 	<label class="form-label" for="otherfiles">상품 정보,이미지</label> -->
<!-- 	<input type="file" id="otherfiles" name="otherfiles" class="form-control" multiple="multiple"> -->
<!-- </div> -->

<button class="btn btn-success" id="btnWrite">작성</button>
</form>


</div><!-- container end -->
<!-- 웹에디터 연결 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors
	, elPlaceHolder: "content"
	, sSkinURI: "/resources/se2/SmartEditor2Skin.html"
	, fCreator: "createSEditor2"
})
</script>



<c:import url="../layout/footer.jsp"></c:import>
