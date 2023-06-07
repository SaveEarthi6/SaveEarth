<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="../layout/header.jsp"/>   

<style type="text/css">

#CreditStatus{
	width : 800px;
	text-align: -webkit-center;
    position: relative;
    font-size: 30px;
}

#MyCreditAmount {
	border : 1px solid gray;
    display: inline-block;
}
</style>

<div class="FunctionTitle">
   Credit
</div>
<div class="FunctionTitleLine">
   <img class="FunctionTilteLine" src="../../../resources/icon/Line.svg">
</div>

<!--  코드 완성되면 지울 내용들 ↓ -->
전체 내역 조회만 구현해놨음<br>
선택 삭제 및 충전/사용/수익/환전 에 따른 필터 구현해야함<br>
회원등급 : <c:if test="${grade eq '0'}"><c:out value="일반회원" /></c:if>
<c:if test="${grade eq '1'}"><c:out value="사운드디자이너 회원" /></c:if>
<!--  코드 완성되면 지울 내용들 ↑ -->


<!--  회원의 크레딧 상태 보여주는 공간-->
<div id="CreditStatus">

	<!--  회원의 현재 크레딧 잔액 보여주기 -->	
	<div id="MyCreditAmount">
		<span>보유한 크레딧 : ${creditAcc } </span>
		<a href="./charge"><button id="chargeCredit" class="charge-button">충전하기</button></a>
	</div>
	
	
	<!--  회원 등급 0 or 1인지에 따라 visible hidden 처리 조건문 -->
	<!--  일반회원일 경우 : 환전버튼 hidden -->
	<c:if test="${grade eq '0'}">
	    <a href="./exchange"><button id="exchangeCredit" class="exchange-button" hidden="hidden"><c:out value="환전하기" /></button></a>
	</c:if>
	
	
	<!--  사운드디자이너일 경우 : 환전버튼 visible -->
	<c:if test="${grade eq '1'}">
	
		<!--  환전크레딧조건 충족 시 : 환전버튼 active -->
		<c:if test="${creditAcc >= 100}"><a href="./exchange">
			<button id="exchangeCredit" class="exchange-button"><c:out value="환전하기" /></button></a>
		</c:if>
		<!--  환전크레딧조건 불충족 시 : 환전버튼 disabled -->
		<c:if test="${creditAcc < 100}">
			<a href="./exchange"><button id="exchangeCredit" class="exchange-button" disabled><c:out value="환전하기" /></button></a>
		</c:if>
		
	<!--  일단은 100크레딧(1,000원) 이상일 때 환전 가능하다고 가상 제약조건 가정할거임 -->
	</c:if>
</div> <!--  CreditStatus 끝 -->

<!--  내역 조회 필터 기능 -->
<!--  1. 전체 : 디폴트 -->
<button class="dealCategory">전체</button>
<!--  2. 충전 -->
<button class="dealCategory">충전</button>
<!--  3. 구매 -->
<button class="dealCategory">구매</button>
<!--  4. 수익 : 업로더에게만 보이는 필터 -->
<button class="dealCategory">수익</button>
<!--  5. 환전 : 업로더에게만 보이는 필터 -->
<button class="dealCategory">환전</button>

<script>


</script>



<!--  내역 조회 -->
<section id = "creditContent">

	<div>	
		<label for="allCheck">전체 선택</label>
		<button type="button" class="selectDelete_btn">선택 삭제</button>
		
		<!--  선택 삭제에 대한 script -->
		<script>
			$(".selectDelete_btn").click(function() {
				console.log("선택 삭제 clicked()");
				
				var confirm_val = confirm("삭제된 내역은 복구할 수 없습니다. 정말로 삭제하시겠습니까?");
				
				//삭제 - 확인 눌렀을 경우 -> true
				if(confirm_val) {
					console.log("삭제 확인 clicked()");
					
					//checkArr 배열 생성
					var checkArr = new Array();
					console.log(checkArr);
					
					//삭제될 항목..?
// 					var removeArr = new Array();
					
					//체크 상태 항목 각각에 걸어놓은 메소드. 
					//data-deal-no 요소(attr), 즉 dealNo를 
					//checkArr 배열의 끝에 요소를 추가하고, 추가된 배열의 길이를 반환하겠다.
					//class명이 2개일때는 상태가 적용이 안되었다.. 그래서 name 으로 선택자를 지정해준거다.
					$("input[name='chBox']:checked").each(function(){
						
						console.log("체크항목들 각각에 대한 동작");
						checkArr.push($(this).attr("data-deal-no"));
						//각 배열의 수에 따라 n+1 개씩 추가되어 계속해서 출력됨을 알 수 있었다.
						//['147'] / (2) ['147', '138']/ (3) ['147', '138', '144']
						console.log(checkArr);
// 						removeArr.push($(this).attr("data-deal-no"));
						
					});
					
// 					var $dealItem = removeArr;
					
					//ajax 로 해당 url 에 데이터 전송하기
					$.ajax({
						url : "/credit/delete"
						//get이 없는데 냅다 post 로 써도 될랑가? => 가능하군..
						, type : "post"
						, data : {chbox : checkArr}
						, success : function(result) {
							//성공했을경우, 1반환..
							if(result == 1) {
								console.log("ajax 성공!");
// 								$dealItem.remove(); // $dealItem 변수를 사용하여 항목 제거 <= 실패..ㅠㅠ 이게 좀 더 부드러운 느낌인데.. 아쉽다..
								location.href = "/credit/list";
								
							} else {
								//이 알람이 뜰일은 없을 것 같다... 왜냐면.. 값이 넘어오지 않을테니..
								alert("삭제 실패");
							}
						}
					})
				}
			})
		
		</script>
	</div>
	
	<!--  테이블 내용 -->
	<div id="order">
		<table class="table">

		  <!--  테이블 헤드라인 -->
		  <thead class="table-light">
		    <tr>
		      <th scope="col">
		      	<div class="form-check">
				  <input class="form-check-input" type="checkbox" id="flexCheckDefault" name="allCheck" >
				  <label class="form-check-label" for="flexCheckDefault"></label>
			  		
			  		<!--  전체선택 클릭에 대한 이벤트 -->
			  		<script>
					$("#flexCheckDefault").click(function(){
						 var chk = $("#flexCheckDefault").prop("checked");
						 if(chk) {
						  $(".form-check-input").prop("checked", true);
						 } else {
						  $(".form-check-input").prop("checked", false);
						 }
					});
					</script>
				</div>
		      </th>
		      <th scope="col">사용일자</th>
		      <th scope="col">내역</th>
		      <th scope="col">금액</th>
		      <th scope="col">delete</th>
		    </tr>
		  </thead>
		  
		  
		  <!--  테이블 데이터 -->
		  <c:forEach var="i" items="${list}">
		  <tbody>
				<tr class="deal-item"><!--  첫번째 열 시작-->
					<td><!--  1. 체크박스 -->
						<div class="checkBox">
						  <input class="form-check-input chBox" type="checkbox" name="chBox" data-deal-no="${i.dealNo}">
						  
						  <!--  항목선택 클릭에 대한 이벤트 -->
					  		<script>
							$(".chBox").click(function(){
								  $("#flexCheckDefault").prop("checked", false);
							});
							</script>
						</div>
				 	</td>
	
					<td><!--  2. 사용일자 -->
						<span>${i.dealDate}</span>
					</td>
					
					<td><!--  4. 내용 -->	  	  
						<c:if test="${i.dealCategory eq '1'}"><c:out value="크레딧 충전" /></c:if>
				  		<c:if test="${i.dealCategory eq '2'}"><c:out value="음원 구매" /></c:if>
						<c:if test="${i.dealCategory eq '3'}"><c:out value="음원 수익" /></c:if>
						<c:if test="${i.dealCategory eq '4'}"><c:out value="크레딧 환전" /></c:if>
					</td>
					
					<td><!--  5. 금액 -->
						<span>${i.amount} Credit</span>
					</td>
					
					<td class="popup"><!--  6. delete -->
						<img data-deal-no='${i.dealNo}' class="delete-${i.dealNo}button" alt="삭제" src="../resources/icon/X.png" width="20">
							<!--  삭제 완료 후 떴다 사라지는 메시지 -->
							<!--  html 미완성 -->
							<!--  script 미완성 -->
							
							<script>
							/*  크레딧 이용내역 항목 삭제 시 ajax 구현 */
							/*  사실은 실제 데이터를 지우는게 아니라 hidden 으로 상태변경하여, 사용자에게는 삭제된 척 할거임. */
							$(document).on('click', '.delete-${i.dealNo}button', function() {
								console.log("항목 삭제 clicked()");
								
								var confirm_val = confirm("삭제된 내역은 복구할 수 없습니다. 정말로 삭제하시겠습니까?");
								//삭제 - 확인 눌렀을 경우 -> true
								if(confirm_val) {
									console.log("삭제 확인 clicked()");
									
									//여러 항목 삭제 메소드와 같이 코드를 쓰려고 굳이 한개의 항목도 배열에 넣는거다.
									var checkArr = new Array();
									checkArr.push($(this).attr("data-deal-no"));
									
// 									var dealNo = $(this).data('deal-no'); //다른 방식

									var $dealItem = $(this).closest('.deal-item'); // .deal-item을 찾아서 저장
									console.log(checkArr);
// 									console.log(dealNo);
									console.log($dealItem);
								
									//ajax 로 해당 url 에 데이터 전송하기
									$.ajax({
										url : "/credit/delete"
										, type : "post"
										, data : {chbox : checkArr}
										, success : function(result) {
											if(result == 1) {
												console.log("ajax 성공");
												$dealItem.remove(); // $dealItem 변수를 사용하여 항목 제거
											}else {
												//이 알람이 뜰일은 없을 것 같다... 왜냐면.. 값이 넘어오지 않을테니..
												alert("삭제 실패");
											}
										}
									})
								}
							});
							</script>
								
					</td>
					
				</tr><!--  첫번째 열 End -->
			</tbody><!--  항목들 END-->
			</c:forEach><!--  반복되는 항목들 end-->
			
		</table><!--  orderTable End-->

		
	</div>
</section> <!--  creditContent 끝 -->	
<c:import url ="../layout/footer.jsp"/>