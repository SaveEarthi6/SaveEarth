<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
 