<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp"/> 
<!--  결제하기  -->
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
        var address = $('input[name=userAddr]').val()+" "+$('input[name=userDetailaddr]').val();

        function requestPay() {
            IMP.request_pay({
                pg : 'html5_inicis.INIpayTest  ', // PG사 코드표에서 코드 맞춰놓았음
                pay_method : 'card', // 결제 방식
                merchant_uid: "IMP"+makeMerchantUid, // 결제 고유 번호
                name : '${product.prodName }', // 제품명 변경
                amount : ${prodCount * product.prodPrice}, // 가격
                buyer_email : '${info.userEmail }',
                buyer_name : $("input[name=userName]").val(),
                buyer_tel : $("input[name=userPhone]").val(),
                buyer_addr : $('input[name=userAddr]').val()+" "+$('input[name=userDetailaddr]').val(),
                buyer_addr2 :$('input[name=userDetailaddr]').val(),
                buyer_postcode : $("input[name=userPostcode]").val()
            }, function (rsp) { // callback
                if (rsp.success) {
                    console.log(rsp);
                    
                //결제완료하고 값보내기
                    // AJAX 요청으로 결제 정보를 컨트롤러로 전송
                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "http://localhost:8888/goods/complete", true);
                    xhr.setRequestHeader("Content-Type", "application/json");
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            // 요청 완료 후에 수행할 작업
                            console.log(xhr.responseText);
                        }
                    };
                    var data = {
                        merchant_uid: rsp.merchant_uid,
                        status: rsp.status,
                        imp_uid: rsp.imp_uid
                    };
                    xhr.send(JSON.stringify(data));                
                    
                } else {
                    console.log(rsp);
                }
            });
        }

	</script>
	
	
	
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
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>	



      <div class="textForm">
      	<label>수령인</label>
      	<input name="userName" id="userName" type="text" class="userName" value = "${info.userName }">
      </div>
      
      <div class="textForm">
	      <input type="button" class="form-control" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
	
	      <input  type="text" class="nickname" id="sample4_postcode" value="${info.userPostcode}" name="userPostcode"> 
	
	      <input type="text"  class="nickname" id="sample4_roadAddress" value="${info.userAddr}" name="userAddr">
	      <span id="guide" style="color:#999;display:none"></span>
	      <label>상세주소</label>
	      <input type="text" class="nickname" id="sample4_detailAddress" value ="${info.userDetailaddr}" name="userDetailaddr">
     </div>
      
      
      
       <div class="textForm">
      	<label>이메일</label>
      	<input name="userEmail" id="userEmail" type="email" class="email" value = "${info.userEmail }">
      </div>
      
      <div class="textForm">
      	<label>전화번호</label>
      	<input name="userPhone" id="userPhone" type="text" class="phone" value = "${info.userPhone }">
      </div>
      
      <div class="textForm">
      	<label>상품</label>
      	<input name="prod" disabled id="prod" type="text" class="prod" value = "${product.prodName }">
      </div>

      <div class="textForm">
      	<label>총가격</label>
      	<input name="totalprice" disabled id="totalprice" type="text" class="totalprice" value = " ${prodCount * product.prodPrice}">
      </div>



${info.userName }
${info.userNo }
이메일:${info.userEmail }
주소:${info.userAddr }
${info.userDetailaddr }
전화번호:${info.userPhone }

<br>
${product.prodName }
<br>
개수${prodCount}
가격${product.prodPrice }
총 가격: ${prodCount * product.prodPrice}원

<button onclick="requestPay()">결제하기</button> 
 
 
<c:import url="../layout/footer.jsp"/> 