<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"></c:import>

<!-- 결제위젯 SDK 추가 -->
<script src="https://js.tosspayments.com/v1/payment-widget"></script>
<!-- 우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
//             document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
//                 document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

        }
    }).open();
    
    
}
</script>

<style>
table {
    
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

tr:hover {
    background-color: #f5f5f5;
}

.titleTag {
	font-size: 1.8em;
	font-weight: bold;
}


</style>


<div class="container">

<div id="listWrap">
<div class="titleTag">주문목록</div>
<table>
	<thead>
         <tr>
            <th>상품이미지</th> 
			<th>상품이름</th>
            <th>가격</th>
            <th>수량</th>
         </tr>
	</thead>
    <tbody>
    	<c:set var="sum" value="0"/>
        <c:forEach var="item" items="${cartList}">
            <tr>
				<td><img src="" width="100px" height="100px"></td>
                <td>${item.PROD_NAME}</td>
                <td><fmt:formatNumber pattern="###,###,###" value="${item.PROD_PRICE}" />원</td>
                <td>${item.PROD_COUNT}</td>
            </tr>
        <c:set var="sum" value="${sum + (item.PROD_PRICE * item.PROD_COUNT) }"></c:set>    
        </c:forEach>
    </tbody>
</table>
<div id="sumWrap">
	<div id="sum">
		총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
	</div>
</div>
</div> <!-- listWrap -->
<hr>
<div id="shipInfo">
<div class="titleTag">배송정보</div>

<form action="" method="post">

	<div class="textForm">
	  <label for="orderRec" class="form-label">받으시는 분</label>
	  <input type="text" class="form-control" id="orderRec" name="orderRec">
	</div>
	
	<div class="textForm">
		<label for="inputCity" class="form-label">주소</label>
	
		<input type="button" class="form-control" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
	    <input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" name="userPostcode"> 
	    <input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" name="userAddr">
		<input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소" name="userDetailaddr">
  </div>

	<div class="textForm">
	  <label for="orderPhone" class="phone">연락처</label>
	  <input type="text" class="form-control" id="orderPhone" name="orderPhone">
	</div>
	
	<input type="hidden" name="orderPrice" value="${sum}">
	
	<br>
	<br>
	  <div >
	    <button type="submit" class="btn btn-success" id="orderMade" >DB 결제하기</button>
	  </div>
	<br>
	<br>  
  
</form>

<!-- 결제위젯, 이용약관 영역 -->
<div id="payment-method"></div>
<div id="agreement"></div>
<!-- 결제하기 버튼 -->
<button id="payment-button">토스 결제하기</button>
<script>
const clientKey = "test_ck_lpP2YxJ4K87vZ9PKpAvrRGZwXLOb"
const customerKey = "swfA_xX4Vg5HeRU1AZveQ" // 내 상점의 고객을 식별하는 고유한 키
const button = document.getElementById("payment-button")
// ------  결제위젯 초기화 ------ 
// 비회원 결제에는 customerKey 대신 ANONYMOUS를 사용하세요.
const paymentWidget = PaymentWidget(clientKey, customerKey) // 회원 결제
// const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS) // 비회원 결제
// ------  결제위젯 렌더링 ------ 
// 결제위젯이 렌더링될 DOM 요소를 지정하는 CSS 선택자 및 결제 금액을 넣어주세요. 
// https://docs.tosspayments.com/reference/widget-sdk#renderpaymentmethods선택자-결제-금액-옵션
paymentWidget.renderPaymentMethods("#payment-method", { value: 15_000 })
// ------  이용약관 렌더링 ------
// 이용약관이 렌더링될 DOM 요소를 지정하는 CSS 선택자를 넣어주세요.
// https://docs.tosspayments.com/reference/widget-sdk#renderagreement선택자
paymentWidget.renderAgreement('#agreement')
// ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
// 더 많은 결제 정보 파라미터는 결제위젯 SDK에서 확인하세요.
// https://docs.tosspayments.com/reference/widget-sdk#requestpayment결제-정보
button.addEventListener("click", function () {
  paymentWidget.requestPayment({
    orderId: "RkluNBM8DMR923bZ09aZA" + new Date().getTime(),            // 주문 ID(직접 만들어주세요)
    orderName: "토스 티셔츠 외 2건",                 // 주문명
    successUrl: "http://localhost:8888/goods/paycomplete",  // 결제에 성공하면 이동하는 페이지(직접 만들어주세요)
    failUrl: "https://my-store.com/fail",        // 결제에 실패하면 이동하는 페이지(직접 만들어주세요)
    customerEmail: "customer123@gmail.com",
    customerName: "김토스"
  })
})

</script>





</div>


</div>

<c:import url="../layout/footer.jsp"></c:import>