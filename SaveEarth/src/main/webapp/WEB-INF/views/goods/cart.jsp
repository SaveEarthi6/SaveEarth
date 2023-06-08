<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/header.jsp"/> 

<script type="text/javascript">

$(function() {
	
	//전체 선택 / 해제
	$("#chkAll").click(function() {
		if($("#chkAll").is(":checked")) {
			$("input[name=cartArr]").prop("checked", true)
		} else {
			$("input[name=cartArr]").prop("checked", false)
		}
	})
	
	$("input[name=cartArr]").click(function() {
		var totalArr = $("input[name=cartArr]").length
		var checked = $("input[name=cartArr]:checked").length
		
		if(totalArr != checked) {
			$("#chkAll").prop("checked", false)
		} else {
			$("#chkAll").prop("checked", true)
		}
	})
	
})


$(function() {
	
	//선택 삭제
	$("#btnDelete").click(function() {
		var confirm_val = confirm("정말 삭제하시겠습니까?")
		
		if(confirm_val) {
			
			console.log("삭제 클릭")
			var chkArr = new Array();
			
		
			
			$("input[name=cartArr]:checked").each(function() {
				chkArr.push($(this).attr("data-cartNo"))
			})
			
			console.log(chkArr)
			
			$.ajax({
				url: "./deleteCart"
				, type: "post"
				, data: {chbox : chkArr}
				, success: function(res) {
					console.log("성공")
					
					if(res == 1) {
						location.href="./cart"
					}
				}
				, error: function() {
					console.log("실패")
				}
				
			})
		}
	})
})


//전체 주문
// $(function() {
	
// 	$("#btnOrderAll").click(function() {
// 		console.log("전체주문 선택")
		
// 		$("#chkAll").click()
		
// 		var chkArr = new Array();
		
// 		$("input[name=cartArr]:checked").each(function() {
// 			chkArr.push($(this).attr("data-cartNo"))
// 		})
		
// 		console.log(chkArr)
		
		
// 		$.ajax({
// 			url: "./orderAll"
// 			, type: "post"
// 			, data: {chbox : chkArr}
// 			, success: function(res) {
// 				console.log("성공")
				
// 			}
// 			, error: function() {
// 				console.log("실패")
// 			}
			
// 		})
		
// 	})
	
	
// })




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


</style>



<div id="cartWrap">
	<table>
		<thead>
	         <tr>
	             <th><input type="checkbox" id="chkAll"></th> 
	             <th>상품이미지</th> 
		<th>상품이름</th>
		   <th>옵션</th>
	             <th>가격</th>
	             <th>수량</th>
	             <th>소계</th>
	         </tr>
		</thead>
	    <tbody>
	    	<c:set var="sum" value="0"/>
	        <c:forEach var="item" items="${cartList}">
	            <tr>
	      
	                <td><input type="checkbox" data-cartNo="${item.CART_NO}" value="${item.CART_NO}" name="cartArr"></td>
					<td><img src="" width="100px" height="100px"></td>
	                <td>${item.PROD_NAME}</td>
	                                  <td>사이즈:${item.PROD_SIZE}색상:${item.PROD_COLOR}</td>
	                <td><fmt:formatNumber pattern="###,###,###" value="${item.PROD_PRICE }"  />원</td>
	<%--                 <td>${item.PROD_COUNT}</td> --%>
					<td>
						<div class="count">
						    <button class="decrease" data-sbItemCount="${item.PROD_COUNT}" data-cartNo="${item.CART_NO}">-</button>
						    <input type="text" class="amountValue" name="num" id="num" value="${item.PROD_COUNT}" readonly>
						    <button class="increase" data-sbItemCount="${item.PROD_COUNT}" data-cartNo="${item.CART_NO}">+</button>
	                     </div>
					</td>
	                <td><fmt:formatNumber pattern="###,###,###" value="${item.PROD_COUNT * item.PROD_PRICE }" />원</td>
	                
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
</div>
	
	<button type="button" id="btnDelete">선택 삭제</button>
	<button>선택 주문</button>
	
	<button type="button" id="btnOrderAll" onclick="location.href='./order'">전체 주문</button>
 
 
<script>
 
//  /* JavaScript 코드 더하기 빼기 */
// function decreaseValue() {
// 	let inputField = document.getElementById('num');
// 	let currentValue = parseInt(inputField.value);
// 	if (currentValue > 1) {
// 	    inputField.value = --currentValue;
// 	}
// }

// function increaseValue() {
// 	let inputField = document.getElementById('num');
// 	let currentValue = parseInt(inputField.value);
// 	inputField.value = ++currentValue;
// }
//  /* 스크립트로 상품 번호랑 갯수 넘기기 */
// function addToCart() {
//  	alert("장바구니 담기 완료");
//     let prodno = '${goodsDetail.PROD_NO}';
//     let prodCount = document.getElementById('num').value;
//     let url = './addCart?prodno=' + prodno + '&prodCount=' + prodCount;
//     location.href = url;
// }   

 
$(function(){
	
	var before;
	var after;
	var amount;
	var cartNo;
	
	//수량 증가 -> EL태그 내꺼에 맞게 수정하기
	//	-> for문을 돌고있어서 특정 상품의 값이 인식이 안됨..
	
	$(document).on("click", ".increase", function() {
		console.log("수량 증가")
		
		before = $(this).siblings(".amountValue").val();
		console.log("변수에 저장", before)

		after = parseInt(before);
		console.log("parseInt", after)		
		
		before = after + 1;
		console.log("값 증가 후", before)

		$(this).siblings(".amountValue").val(before)
		console.log("증가된 값 적용", before)		
		
		$(this).attr("data-sbItemcount", before)
		
		amount = $(this).attr("data-sbItemcount")
		cartNo = $(this).attr("data-cartNo")
		
		console.log("amount", amount)
		console.log("cartNo", cartNo)
		
		$.ajax({
			type: "post",
			url: "./cartAmount",
			data:{prodCount: amount, cartNo:cartNo },
			dataType: "html",
			success: function(data){
				console.log("성공")
				console.log(data)
				
				$("#cartWrap").html(data);
		
			},
			error: function() {
				console.log("실패")
			}
		})
	})
	
	//수량 감소
	$(document).on("click", ".decrease", function() {
		console.log("수량 감소")
		
		before = $(this).siblings(".amountValue").val();
		after = parseInt(before);
		before = after - 1;
		
		$(this).siblings(".amountValue").val(before)
		$(this).attr("data-sbItemcount", before)
		
		amount = $(this).attr("data-sbItemcount")
		cartNo = $(this).attr("data-cartNo")
		
		console.log("amount", amount)
		console.log("cartNo", cartNo)
		
		$.ajax({
			type: "post",
			url: "./cartAmount",
			data:{prodCount: amount, cartNo:cartNo },
			dataType: "html",
			success: function(data){
				console.log("성공")
				console.log(data)
				
				$("#cartWrap").html(data);
		
			},
			error: function() {
				console.log("실패")
			}
		})
	})

})





 
</script>



<c:import url="../layout/footer.jsp"/> 