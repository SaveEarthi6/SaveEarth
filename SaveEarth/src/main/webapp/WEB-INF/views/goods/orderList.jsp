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

/* 주문내역들 */
#orderList {
	width: 70%;
	margin: 0 auto;
    margin-top: 30px;
}

/* 주문내역 */
.order {
	border: solid 5px #ccc;
    margin-bottom: 60px;
}

/* 주문번호 wrap */
#orderNoP {
	margin-top: 20px;
}

/* 소제목 태그 */
.tag {
	font-weight: bold;
    font-size: 1.5em;	
    margin-left: 120px;
	display: inline-block;
 	width: 35%; 
}

/* 태그 내용 */
.content {
	display: inline-block;
	margin-right: 120px;
 	width: 35%; 
 	font-size: 1.25em;
}

/* 주문금액 wrap */
#orderPriceP {
	margin-bottom: 20px;
}

/* 주문번호, 수령인, 주소 wrap */
#orderNoP, #orderRecP, #orderAdddrP {
	margin-bottom: 10px;
}

/* 주문내역 없음 */
#noOrder {
    text-align: center;
    font-size: 1.5em;
    padding: 30px;
}

</style>

<div class="container">

<div id='titleWrap'>
	<div id="listTitle">주문내역</div>
</div>

<div id="orderList">
	<c:if test="${!empty orderList}">
	<c:forEach items="${orderList}" var="orderList">
	<div id="existOrder" class="order">
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
	</c:if>
	<c:if test="${empty orderList}">
	<div id="noOrder" class="order">
		주문 내역이 없습니다
	</div>
	</c:if>
</div>

</div>

<c:import url="../layout/footer.jsp"></c:import>