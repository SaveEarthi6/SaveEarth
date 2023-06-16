<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>

/* 폰트 스타일 */
@font-face {
	font-family: 'KBO-Dia-Gothic_bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff')
		format('woff');
		
	font-weight: 700;
	font-style: normal;
}

/* 장바구니 타이틀 */
#cartTitle {
    width: 70%;
    margin: 0 auto;
    font-weight: bold; 
    margin-top: 30px;
 	font-size: 45px; 
	font-family: 'KBO-Dia-Gothic_bold';
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
}

tr {
	border-bottom: solid 1px #ccc;
}

/* 상품 태그 강조 */
.titleTag {
    font-weight: bold;
}

/* 총 가격, 버튼 랩 */
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
	border-color: #198754;
	color: #198754;
}

#btnDelete:hover {
	background-color: #E3F2EB;
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
}

/* 전체주문 버튼 */
#btnOrderAll {
	width: 350px;
	background-color: #59A8D9;
	border-color: #59A8D9;
    font-size: 1.15em;
    font-weight: bold;
}


</style>


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
	    	<c:set var="sum" value="0"/>
	        <c:forEach var="item" items="${cartList}">
	            <tr>
	                <td><input type="checkbox" data-cartNo="${item.CART_NO}" value="${item.CART_NO}" name="cartArr"></td>
					<td style="padding: 10px;"><img src="/upload/${item.PROD_STORED_NAME }" width="200px" height="200px" id="thumnail"></td>
	                <td class="titleTag">${item.PROD_NAME}</td>
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
	    </tbody>
	</table>
	
	<div id="bottomWrap">
		<div id="totalSum">
			총 상품가격 : <span id="tagColor"><fmt:formatNumber pattern="###,###,###" value="${sum}" /></span>원 
			+ 배송비 : 
			<c:if test="${sum >= 30000}"><span id="tagColor">0</span></c:if>
			<c:if test="${sum < 30000}"><span id="tagColor">3,000</span></c:if>
			원
		</div>
		
		<div id="btnSelectWrap">
			<button type="button" id="btnDelete" class="btn">선택 삭제</button>
			<button type="button" id="btnOrder" class="btn btn-success">선택 주문</button>
		</div>
		<div id="clear"></div>
	</div>
	
</div>	<!-- cartWrap -->