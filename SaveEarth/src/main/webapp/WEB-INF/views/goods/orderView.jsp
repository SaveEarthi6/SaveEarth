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

/* 주문목록 태그 */
#orderNo {
	width: 70%;
	margin: 30px auto;
    font-size: 2em;
    font-weight: bold;
}

/* 주문목록 태그 */
#listTitle {
	width: 70%;
	margin: 30px auto;
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
/*     margin-top: 10px; */
}

/* 결제하기 wrap */
#btnPayWrap {
	margin-bottom: 50px;
	text-align: center;
}

/* 결제하기 */
#payment-button {
	width: 350px;
	background-color: #7CA621;
	border-color: #7CA621;
    font-size: 1.15em;
    font-weight: bold;
    color: white;
}

#payment-button:hover {
	background-color: #5C8A00;
}

/* 수령인 wrap */
#recWrap {
	margin-bottom: 20px;
}

/* 주소 wrap */
#addrWrap {
	margin-bottom: 20px;
}

/* 연락처 wrap */
#phoneWrap {
	margin-bottom: 20px;
}

/* 구분선 */
#line {
	width: 80%;
	margin: 30px auto;
	border-style: dashed;
}

/* 결제부분 wrap */
#payWrap {
 	width:70%; 
 	margin: 0 auto; 
}

/* 우편번호 찾기 버튼 */
#postBtn {
    width: 49%;
    display: inline-block;
    background-color: #59A8D9;
    border-color: #59A8D9;
    color: white;
    font-weight: bold;
}

/* 우편번호 폼 */
#orderAddrPostcode {
/*     width: 50%; */
/*     display: inline-block; */
}

/* 주문자 정보 체크버튼 */
#getInfoBtn {
	width: 50%;
	margin: 0 auto;
    font-size: 1.05em;
    margin-bottom: 5px;
}

/* 주문 목록으로 버튼 */
#toOrderList {
	width: 350px;
	background-color: #7CA621;
	border-color: #7CA621;
    font-size: 1.15em;
    font-weight: bold;
    color: white;
}

/* 총 합계 */
#totalSum {
    font-size: 1.5em;
    font-weight: bold;
    width: 70%;
    margin: 0 auto;
    margin-top: 30px;
}

/* 상품 가격 + 배송비 */
#payInfo {
	width: 70%;
	margin: 0 auto;
	font-size: 1.35em;
}

.addr {
	margin-bottom: 10px;
}

.clear {
	clear: both;
}

label {
	font-size: 1.15em;
    font-weight: bold;
}

</style>


<div id="container">


<div id="orderNo">
<c:forEach var="item" items="${orderInfo}" begin="0" end="0">
주문번호 : ${item.orderNo}
</c:forEach>
</div>

<hr id="line">

<div id="listWrap">
<div id="listTitle">구매목록</div>
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
	        <c:forEach var="item" items="${orderInfo}">
	            <tr>
					<td style="padding: 10px; width:25%;"><img src="/upload/${item.prodStoredName }" width="150px" height="150px" id="thumnail"></td>
	                <td class="titleTag">${item.prodName}</td>
	                <td><span class="titleTag"><fmt:formatNumber pattern="###,###,###" value="${item.prodPrice }"  /></span>원</td>
	                <td><span class="titleTag">${item.prodAmount}</span>개</td>
	            </tr>
	        </c:forEach>
	    </tbody>
	</table>
	
	<div id="bottomWrap">
		<c:forEach var="item" items="${orderInfo}" begin="0" end="0">
		<div id="totalSum">
			결제 금액 : <span id="tagColor"><fmt:formatNumber pattern="###,###,###" value="${item.orderPrice}" /></span> 원
		</div>
		<div id="payInfo">
			<c:if test="${item.orderPrice >= 30000}">
				총 상품가격 : <span id="tagColor"><fmt:formatNumber pattern="###,###,###" value="${item.orderPrice}" /></span> 원 
				+ 배송비 : <span id="tagColor">0</span> 원
			</c:if>
			<c:if test="${item.orderPrice < 30000}">
				총 상품가격 : <span id="tagColor"><fmt:formatNumber pattern="###,###,###" value="${item.orderPrice - 3000}" /></span> 원 
				+ 배송비 : <span id="tagColor">3,000</span> 원
			</c:if>
		</div>
		</c:forEach>
	</div>
	
</div> <!-- listWrap -->

<hr id="line">

<div id='titleWrap'>
	<div id="listTitle">배송정보</div>
</div>

<div id="shipInfoWrap">
	<c:forEach var="item" items="${orderInfo}" begin="0" end="0">
	<div id="recWrap">
	  <label for="orderRec" class="form-label">받으시는 분</label>
	  <input type="text" class="form-control" id="orderRec" name="orderRec" value="${item.orderRec }">
	</div>
	
	<div id="addrWrap">
<!-- 		<div><label for="inputCity" class="form-label">주소</label></div> -->
	
<%-- 	    <input type="text" class="form-control addr" id="orderAddrPostcode" value="${item.orderAddrPostcode }" name="orderAddrPostcode" >  --%>
<!-- 		<input type="button" id="postBtn" class="form-control addr" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"> -->
<%-- 	    <input type="text" class="form-control addr" id="orderAddr" value="${item.orderAddr }" name="orderAddr"> --%>
<%-- 		<input type="text" class="form-control addr" id="orderAddrDetail" value="${item.orderAddrDetail }" name="orderAddrDetail"> --%>
	
		<label for="orderAddrPostcode" class="form-label">우편번호</label>
	  	<input type="text" class="form-control" id="orderAddrPostcode" name="orderAddrPostcode" value="${item.orderAddrPostcode }">		
	
		<label for="orderAddr" class="form-label">주소</label>
	    <input type="text" class="form-control" id="orderAddr" value="${item.orderAddr }" name="orderAddr">

		<label for="orderAddrDetail" class="form-label">상세주소</label>
			<input type="text" class="form-control" id="orderAddrDetail" value="${item.orderAddrDetail }" name="orderAddrDetail">
	</div>

	<div id="phoneWrap">
	  <label for="orderPhone" class="phone">연락처</label>
	  <input type="text" class="form-control" id="orderPhone" name="orderPhone" value="${item.orderPhone }">
	</div>
	</c:forEach>

	<input type="hidden" name="orderPrice" value="${sum}">
	
	<div>
<!-- 	  <button type="submit" class="btn btn-success" id="orderMade">DB 결제하기</button> -->
	</div>
  
</form>

</div>

<hr id="line">
	
<div id="btnPayWrap">
	<button type="button" class="btn" id="toOrderList">주문 내역</button>
</div>
	
</div>

<c:import url="../layout/footer.jsp"></c:import>