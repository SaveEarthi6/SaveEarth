<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"></c:import>

<script type="text/javascript">

$(function() {
	
	$("#toOrderList").click(function() {
		location.href='./orderList'
	})
	
})

</script>

<div class="container">

<div id="title">주문정보</div>

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
    		<c:forEach var="item" items="${orderInfo}">
            <tr>
				<td><img src="" width="100px" height="100px"></td>
                <td>${item.prodName}</td>
                <td><fmt:formatNumber pattern="###,###,###" value="${item.prodPrice}" />원</td>
                <td>${item.prodAmount}</td>
            </tr>
            </c:forEach>
    </tbody>
</table>
<div id="sumWrap">
	<c:forEach var="item" items="${orderInfo}" begin="0" end="0">
	<div id="sum">
		총 합계 : <fmt:formatNumber pattern="###,###,###" value="${item.orderPrice}" />원
	</div>
	</c:forEach>
</div>
</div> <!-- listWrap -->
<hr>
<div id="shipInfo">
<div class="titleTag">배송정보</div>
	<c:forEach var="item" items="${orderInfo}" begin="0" end="0">
	<div class="textForm">
	  <label for="orderRec" class="form-label">받으시는 분</label>
	  <input type="text" class="form-control" id="orderRec" name="orderRec" value="${item.orderRec }">
	</div>
	
	<div class="textForm">
		<label for="orderAddrPostcode" class="form-label">우편번호</label>
	  	<input type="text" class="form-control" id="orderAddrPostcode" name="orderAddrPostcode" value="${item.orderAddrPostcode }">		
	
		<label for="orderAddr" class="form-label">주소</label>
	    <input type="text" class="form-control" id="orderAddr" value="${item.orderAddr }" name="orderAddr">

		<label for="orderAddrDetail" class="form-label">상세주소</label>
		<input type="text" class="form-control" id="orderAddrDetail" value="${item.orderAddrDetail }" name="orderAddrDetail">
	</div>

	<div class="textForm">
	  <label for="orderPhone" class="phone">연락처</label>
	  <input type="text" class="form-control" id="orderPhone" name="orderPhone" value="${item.orderPhone }">
	</div>
	</c:forEach>

	
	<br>
	<br>
	  <div >
	    <button type="button" class="btn btn-success" id="toOrderList">주문 목록으로</button>
	  </div>
	<br>
	<br>  

</div>


</div>

<c:import url="../layout/footer.jsp"></c:import>