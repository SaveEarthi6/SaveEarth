<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"></c:import>

<!-- 필요시 css, js, jquery 넣을 곳 -->

<div class="container">

<section id="content">
   
   <ul class="orderList">
    <c:forEach items="${orderList}" var="orderList">
    <li>
    <div>
     <p><span>주문번호 <a href="./orderView?orderNo=${orderList.orderNo}">${orderList.orderNo}</a></p>
     <p><span>수령인 ${orderList.orderRec}</p>
     <p><span>주소 (${orderList.orderAddrPostcode}) ${orderList.orderAddr} ${orderList.orderAddrDetail}</p>
     <p><span>가격 <fmt:formatNumber pattern="###,###,###" value="${orderList.orderPrice}" /> 원</p>
    </div>
    </li>
    </c:forEach>
   </ul>

</section>

</div>

<c:import url="../layout/footer.jsp"></c:import>