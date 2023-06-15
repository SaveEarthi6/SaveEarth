<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/header.jsp"/> 

<script type="text/javascript">

$(function() {
	
	//전체 선택 / 해제
	$(document).on("click", "#chkAll", function() {
		if($("#chkAll").is(":checked")) {
			$("input[name=cartArr]").prop("checked", true)
		} else {
			$("input[name=cartArr]").prop("checked", false)
		}
	})
	
	$(document).on("click", "input[name=cartArr]", function() {
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
	$(document).on("click", "#btnDelete", function() {
		
		var checked = $("input[name=cartArr]:checked").length
		
		if(checked == 0) {
			
			console.log("선택된 상품이 없습니다.")
			alert("선택된 상품이 없습니다.")
			return false;
			
		} else {

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
		}
	})
})



$(function() {
	
	//선택 주문
	$(document).on("click", "#btnOrder", function() {
		console.log("선택주문 선택")
		
		var totalArr = $("input[name=cartArr]").length
		var checked = $("input[name=cartArr]:checked").length

		if(checked == 0) {
			console.log("선택된 상품이 없습니다.")
			alert("선택된 상품이 없습니다.")
			return false;
		} else {
			
			//전체 선택되었다면 전체주문
			if(totalArr == checked) {
				$("#btnOrderAll").click()
				console.log("선택주문에서 전체주문으로 넘어감")
				
			  //선택 항목이 전체가 아니라면	
			} else if(totalArr != checked) {
				console.log("선택주문으로 넘어감")
				
				var chkArr = new Array();
				
				$("input[name=cartArr]:checked").each(function() {
					chkArr.push($(this).attr("data-cartNo"))
				})
				
				console.log(chkArr)
				location.href="./order?cartArr=" + chkArr;
			}
		
		}
	})
	
	
})


$(function() {
	
	//전체 주문
	$(document).on("click", "#btnOrderAll", function() {
		
		if(${empty cartList}) {
			console.log("장바구니 비어있음")
			alert("주문할 상품이 없습니다.")
			return false
		} else {
			console.log("물건 있음")
			location.href='./order'
		}
		
	})
	
})


$(function(){
	
	var before;
	var after;
	var amount;
	var cartNo;
	
	//수량 증가
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


<style>

/* 장바구니 타이틀 */
#cartTitle {
    width: 70%;
    margin: 0 auto;
    font-weight: bold; 
    margin-top: 30px;
 	font-size: 2em; 
}

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
    background-color: #7ca6212e;
    color: #000000bd; 
}

tr {
	border-bottom: solid 1px #ccc;
}

/* 상품 태그 강조 */
.titleTag {
    font-weight: bold;
}

/* 합계, 버튼 랩 */
#bottomWrap {
	width: 70%;
	margin: 0 auto;
	margin-top: 10px;
}

/* 총 합계 */
#totalSum {
    font-size: 1.4em;
    font-weight: bold;
    display: inline-block;
}

/* 선택 주문, 삭제 버튼 */
#btnSelectWrap {
	display: inline-block;
    float: right;
}

/* 선택 삭제 */
#btnDelete {
	margin-right: 20px;
	border-color: #7CA621;
	color: #7CA621;
}

#btnDelete:hover {
	background-color: #EBF0DF;
}

/* 선택 주문 */
#btnOrder {
	background-color: #7CA621;
	border-color: #7CA621;
	color: white;
}

#btnOrder:hover {
	background-color: #5C8A00;
	
}

/* 가격 강조 */
#tagColor {
	color: #59A8D9;
}

#clear {
	clear: both;
}

/* 전체주문 */
#btnWrap {
	width: 70%;
	margin: 25px auto;
    text-align: center;
    margin-bottom: 50px;
}

/* 전체주문 버튼 */
#btnOrderAll {
	width: 350px;
	background-color: #59A8D9;
	border-color: #59A8D9;
    font-size: 1.15em;
    font-weight: bold;
    color: white;
}

/* 장바구니 목록 없음 */
#noData {
    font-size: 1.25em;
    line-height: 60px;
}

</style>


<div id="container">
<div id="cartWrap">
	
	<div id="cartTitle">장바구니</div>

	<table id="prodList">
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
	    	<c:if test="${!empty cartList}">
	    	<c:set var="sum" value="0"/>
	        <c:forEach var="item" items="${cartList}">
	            <tr>
	                <td><input type="checkbox" data-cartNo="${item.CART_NO}" value="${item.CART_NO}" name="cartArr"></td>
					<td style="padding: 10px;"><a href="detail?prodno=${item.PROD_NO}"><img src="/upload/${item.PROD_STORED_NAME }" width="200px" height="200px" id="thumnail"></a></td>
	                <td class="titleTag"><a href="detail?prodno=${item.PROD_NO}" style="color: black;">${item.PROD_NAME}</a></td>
                    <td><span class="titleTag">사이즈 : </span>${item.PROD_SIZE} <br> <span class="titleTag">색상 : </span>${item.PROD_COLOR}</td>
	                <td><span class="titleTag"><fmt:formatNumber pattern="###,###,###" value="${item.PROD_PRICE }"  /></span>원</td>
	<%--                 <td>${item.PROD_COUNT}</td> --%>
					<td>
						<div class="count">
						    <button class="decrease btn btn-sm" data-sbItemCount="${item.PROD_COUNT}" data-cartNo="${item.CART_NO}">-</button>
						    <input type="text" class="amountValue form-control form-control-sm" name="num" id="num" value="${item.PROD_COUNT}" readonly style="width: 30px; display: inline-block;">
						    <button class="increase btn btn-sm" data-sbItemCount="${item.PROD_COUNT}" data-cartNo="${item.CART_NO}">+</button>
	                     </div>
					</td>
	                <td><span class="titleTag"><fmt:formatNumber pattern="###,###,###" value="${item.PROD_COUNT * item.PROD_PRICE }" /></span>원</td>
	                
				</tr>
	        <c:set var="sum" value="${sum + (item.PROD_PRICE * item.PROD_COUNT) }"></c:set>    
	        </c:forEach>
	        </c:if>
	        <c:if test="${empty cartList}">
	        	<tr>
	        		<td id="noData" colspan="7">담긴 상품이 없습니다.</td>
	        	</tr>
	        </c:if>
	    </tbody>
	</table>
	
	<div id="bottomWrap">
		
		<c:if test="${!empty cartList}">
		<div id="totalSum">
			총 상품가격 : <span id="tagColor"><fmt:formatNumber pattern="###,###,###" value="${sum}" /></span> 원 
			+ 배송비 : 
			<c:if test="${sum >= 30000}"><span id="tagColor">0</span></c:if>
			<c:if test="${sum < 30000}"><span id="tagColor">3,000</span></c:if>
			원
		</div>
		</c:if>
		
		<c:if test="${empty cartList}">
		<div id="totalSum">
			총 상품가격 : <span id="tagColor">0 </span>원 
			+ 배송비 : 
			<span id="tagColor">0</span>
			원
		</div>
		</c:if>
		
		<div id="btnSelectWrap">
			<button type="button" id="btnDelete" class="btn">선택 삭제</button>
			<button type="button" id="btnOrder" class="btn">선택 주문</button>
		</div>
		<div id="clear"></div>
	</div>
	
</div>	<!-- cartWrap -->

<div id="btnWrap">
	<button type="button" id="btnOrderAll" class="btn">전체 주문</button>
</div>

</div>	<!-- container -->
<c:import url="../layout/footer.jsp"/> 