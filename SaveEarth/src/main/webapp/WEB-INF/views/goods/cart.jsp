<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			
			//현재 이게 안찍힘
			console.log(chkArr)
			
			$.ajax({
				url: "./deleteCart"
				, type: "post"
				, data: {chbox : chkArr}
				, success: function() {
					location.href="./cart"
				}
			})
			
		}
		
		
		
	})
	
	
	
	
})

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



장바구니 구현 (조인한거에서 필요한거 골라쓰기)

    <table>
 		<thead>
            <tr>
                <th><input type="checkbox" id="chkAll"></th> 
                <th>상품이미지</th> 
				<th>상품이름</th>
                <th>가격</th>
                <th>수량</th>
                <th>총 가격</th>
            </tr>
  		</thead>
        <tbody>
            <c:forEach var="item" items="${cartList}">
                <tr>
                    <td><input type="checkbox" data-cartNo="${item.CART_NO}" value="${item.CART_NO}" name="cartArr"></td>
					<td><img src="" alt="제품 사진 이미지 " width="100px" height="100px"></td>
                    <td>${item.PROD_NAME}</td>
                    <td>${item.PROD_PRICE}</td>
                    <td>${item.PROD_COUNT}</td>
                    <td>${item.PROD_COUNT * item.PROD_PRICE }</td>
                    
                </tr>
            </c:forEach>
        </tbody>
       
    </table>
    <button type="button" id="btnDelete">선택 삭제</button>
    <button>선택 주문</button>

    <button>전체 주문</button>



<c:import url="../layout/footer.jsp"/> 