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
            document.getElementById('orderAddrPostcode').value = data.zonecode;
            document.getElementById("orderAddr").value = roadAddr;
//             document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
//                 document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("orderAddrDetail").value = '';
            }

        }
    }).open();
    
    
}
</script>

<script type="text/javascript">

//배송지 작성 중 검사
$(function() {
	
	$("#orderRec").blur(function() {
		
		if($(this).val() == "") {
			$("#recMsg").html("필수 입력요소입니다.")
		} else {
			$("#recMsg").html("")
		}
		
	})
	
	$("#orderAddrPostcode").blur(function() {
		
		if($(this).val() == "") {
			$("#addrMsg").html("필수 입력요소입니다.")
		} else {
			$("#addrMsg").html("")
		}
		
	})
	
	$("#orderAddr").blur(function() {
		
		if($(this).val() == "") {
			$("#addrMsg").html("필수 입력요소입니다.")
		} else {
			$("#addrMsg").html("")
		}
		
	})
	
	$("#orderAddrDetail").blur(function() {
		
		if($(this).val() == "") {
			$("#addrMsg").html("필수 입력요소입니다.")
		} else {
			$("#addrMsg").html("")
		}
		
	})
	
	$("#orderPhone").focus(function() {
		
		$("#phoneMsg").html("[010-0000-0000] 형식으로 입력해주세요.")
		
	})
	
	$("#orderPhone").blur(function() {
		
		var phoneReg = /^(010)-?[0-9]{3,4}-?[0-9]{4}$/;
		
		if($(this).val() == "") {
			$("#phoneMsg").html("필수 입력요소입니다.")
		} else if(!phoneReg.test($(this).val())) {
			$("#phoneMsg").html("[010-0000-0000] 형식으로 입력해주세요.") 
		} else {
			$("#phoneMsg").html("")
		}
		
	})
	
})


//결제하기 전 검사
function validate() {
	
	if($("#orderRec").val() == "") {
		$("#recMsg").html("수령인을 입력해주세요.")
		return false;
	} else {
		$("#recMsg").html("")
	}
	
	if($("#orderAddrPostcode").val() == "") {
		$("#addrMsg").html("주소를 입력해주세요.")
		return false;
	} else if($("#orderAddr").val() == "") {
		$("#addrMsg").html("주소를 입력해주세요.")
		return false;
	} else if($("#orderAddrDetail").val() == "") {
		$("#addrMsg").html("주소를 입력해주세요.")
		return false;
	} else {
		$("#addrMsg").html("")
	}
	
	if($("#orderPhone").val() == "") {
		$("#phoneMsg").html("연락처를 입력해주세요.")
		return false;
	} else {
		$("#phoneMsg").html("")
	}
	
	return true;
	
}


//주문자 배송정보 불러오기
$(function() {
	$("#getShipInfo").change(function() {
		console.log("체크변경")
		
		//체크가 되어있다면 ajax로 정보 불러오기 수행
		if($("#getShipInfo").is(":checked")) {
			console.log("체크된 상태임")
			
			$.ajax({
				url: "./getShipInfo"
				, type: "post"
				, success: function(res) {
					console.log("성공")
					console.log(res)
					console.log(res.userName)
					console.log(res.userPostcode)
					console.log(res.userAddr)
					console.log(res.userDetailaddr)
					console.log(res.userPhone)
					
					$("#orderRec").val(res.userName)
					$("#orderAddrPostcode").val(res.userPostcode)
					$("#orderAddr").val(res.userAddr)
					$("#orderAddrDetail").val(res.userDetailaddr)
					$("#orderPhone").val(res.userPhone)
					
				}
				, error: function() {
					console.log("실패")
				}
				
			})
			
		  //해제된 상태면 빈칸 만들어주기
		} else {
			console.log("해제된 상태")
			
			$("#orderRec").val("")
			$("#orderAddrPostcode").val("")
			$("#orderAddr").val("")
			$("#orderAddrDetail").val("")
			$("#orderPhone").val("")
			
		}
		
		
		
	})
})

</script>

<style>

/* 장바구니 목록 table */
#prodList {
	width: 70%;
    margin: 0 auto;
    margin-top: 10px;
    text-align: center;
}

thead {
    font-size: 1.25em;
    border-top: solid 1px #ccc;
}

tr {
	border-bottom: solid 1px #ccc;
}

/* 상품 태그 강조 */
.titleTag {
    font-weight: bold;
}

/* 주문목록 태그 */
#listTitle {
	width: 70%;
	margin: 0 auto;
    margin-top: 30px;
    font-size: 1.8em;
    font-weight: bold;
}

/* 총 합계 */
#sumWrap {
	width: 70%;
	margin: 0 auto;	
	margin-top: 10px;
    font-size: 1.4em;
    font-weight: bold;
}

/* 가격 강조 */
#tagColor {
	color: #59A8D9;
}

/* 배송지 입력 랩 */
#shipInfoWrap {
	width: 50%;
	margin: 0 auto;	
    margin-top: 10px;
}

label {
	font-size: 1.15em;
    font-weight: bold;
}

.warnMsg {
	font-size: 0.8em;
	color: #3788D8;
}

</style>


<div id="container">

<div id="listWrap">
<div id="listTitle">주문목록</div>
	<table id="prodList">
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
					<td style="padding: 10px; width:25%;"><img src="/upload/${item.CAMP_STORED_NAME }" width="150px" height="150px" id="thumnail"></td>
	                <td class="titleTag">${item.PROD_NAME}</td>
	                <td><span class="titleTag"><fmt:formatNumber pattern="###,###,###" value="${item.PROD_PRICE }"  /></span>원</td>
	                <td><span class="titleTag">${item.PROD_COUNT}</span>개</td>
	            </tr>
	        <c:set var="sum" value="${sum + (item.PROD_PRICE * item.PROD_COUNT) }"></c:set>    
	        </c:forEach>
	    </tbody>
	</table>
	<div id="sumWrap">
		<div id="sum">
			결제할 금액 : 
			<c:if test="${sum >= 30000}"><span id="tagColor"><fmt:formatNumber pattern="###,###,###" value="${sum}" /></span>원</c:if>
			<c:if test="${sum < 30000}"><span id="tagColor"><fmt:formatNumber pattern="###,###,###" value="${sum+3000}" /></span>원</c:if>
		</div>
	</div>
</div> <!-- listWrap -->

<div id="listTitle">배송지 입력</div>

<div id="shipInfoWrap">

<form action="./order" method="post">
	<input type="checkbox" id="getShipInfo">주문자 정보와 동일

	<div class="textForm">
	  <label for="orderRec" class="form-label">받으시는 분</label>
	  <input type="text" class="form-control" id="orderRec" name="orderRec" placeholder="수령인">
	  <span id="recMsg" class="warnMsg"></span>
	</div>
	
	<div class="textForm">
		<label for="inputCity" class="form-label">주소</label>
	
		<input type="button" class="form-control" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
	    <input type="text" class="form-control" id="orderAddrPostcode" placeholder="우편번호" name="orderAddrPostcode"> 
	    <input type="text" class="form-control" id="orderAddr" placeholder="도로명주소" name="orderAddr">
		<input type="text" class="form-control" id="orderAddrDetail" placeholder="상세주소" name="orderAddrDetail">
		<span id="addrMsg" class="warnMsg"></span>
	</div>

	<div class="textForm">
	  <label for="orderPhone" class="phone">연락처</label>
	  <input type="text" class="form-control" id="orderPhone" name="orderPhone" placeholder="연락처">
	  <span id="phoneMsg" class="warnMsg"></span>
	</div>
	
	<input type="hidden" name="orderPrice" value="${sum}">
	
	<br>
	<br>
	  <div>
	    <button type="submit" class="btn btn-success" id="orderMade">DB 결제하기</button>
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
paymentWidget.renderPaymentMethods("#payment-method", { value: 100 })
// ------  이용약관 렌더링 ------
// 이용약관이 렌더링될 DOM 요소를 지정하는 CSS 선택자를 넣어주세요.
// https://docs.tosspayments.com/reference/widget-sdk#renderagreement선택자
paymentWidget.renderAgreement('#agreement')
// ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
// 더 많은 결제 정보 파라미터는 결제위젯 SDK에서 확인하세요.
// https://docs.tosspayments.com/reference/widget-sdk#requestpayment결제-정보
button.addEventListener("click", function () {

	
	if(!validate()) {
		return false
	} 
	
		paymentWidget.requestPayment({
		  orderId: "RkluNBM8DMR923bZ09aZA" + new Date().getTime(),            // 주문 ID(직접 만들어주세요)
		  orderName: "토스 티셔츠 외 2건",                 // 주문명
		  successUrl: "http://localhost:8888/goods/payment",  // 결제에 성공하면 이동하는 페이지(직접 만들어주세요)
		  failUrl: "https://my-store.com/fail",        // 결제에 실패하면 이동하는 페이지(직접 만들어주세요)
		  customerEmail: "customer123@gmail.com",
		  customerName: "김토스"
		})
})

</script>

</div>

</div>

<c:import url="../layout/footer.jsp"></c:import>