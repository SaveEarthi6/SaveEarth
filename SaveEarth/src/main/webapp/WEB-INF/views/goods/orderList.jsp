<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"></c:import>

<style type="text/css">

/* 주문내역 태그 */
#listTitle {
	width: 70%;
	margin: 0 auto;
    margin-top: 30px;
    font-size: 1.8em;
    font-weight: bold;
}

#orderList {
	width: 70%;
	margin: 0 auto;
    margin-top: 30px;
}

#order {
	border: solid 5px #ccc;
}

p {
	margin-left: 30px;
}

#orderNoP {
	margin-top: 20px;
}

span {
	font-weight: bold;
    font-size: 1.5em;
}

.tag {
	font-weight: bold;
    font-size: 1.5em;	
    margin-left: 120px;
	display: inline-block;
 	width: 35%; 
}

.content {
	display: inline-block;
	margin-right: 120px;
 	width: 35%; 
 	font-size: 1.25em;
}

#orderPriceP {
	margin-bottom: 20px;
}

#orderNoP, #orderRecP, #orderAdddrP {
	margin-bottom: 10px;
}



</style>

<div class="container">

<div id='titleWrap'>
	<div id="listTitle">주문내역</div>
</div>

<div id="orderList">
	<c:forEach items="${orderList}" var="orderList">
	<div id="order">
		<div id="orderNoP">
			<div class="tag">주문번호</div>
			<div class="content"><a href="./orderView?orderNo=${orderList.orderNo}">${orderList.orderNo}</a></div>
		</div>
		<div id="orderRecP">
			<div class="tag">수령인</div>
			<div class="content">${orderList.orderRec}</div>
		</div>
		<div id="orderAdddrP">
			<div class="tag">주소</div>
			<div class="content">(${orderList.orderAddrPostcode}) ${orderList.orderAddr} ${orderList.orderAddrDetail}</div>
		</div>
		<div id="orderPriceP">
			<div class="tag">결제금액</div>
			<div class="content"><fmt:formatNumber pattern="###,###,###" value="${orderList.orderPrice}" /> 원</div>
		</div>
	</div>
	</c:forEach>
</div>

</div>

<c:import url="../layout/footer.jsp"></c:import>