<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp"></c:import>

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

.titleTag {
	font-size: 1.8em;
	font-weight: bold;
}


</style>

<div class="container">

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
    	<c:set var="sum" value="0"/>
        <c:forEach var="item" items="${cartList}">
            <tr>
				<td><img src="" width="100px" height="100px"></td>
                <td>${item.PROD_NAME}</td>
                <td><fmt:formatNumber pattern="###,###,###" value="${item.PROD_PRICE}" />원</td>
                <td>${item.PROD_COUNT}</td>
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
</div> <!-- listWrap -->
<hr>
<div id="shipInfo">
<div class="titleTag">배송정보</div>

<form action="" onsubmit=" return joinform_check()"  method="post">

	<div class="textForm">
	  <label for="orderRec" class="form-label">받으시는 분</label>
	  <input type="text" class="form-control" id="orderRec" name="orderRec">
	</div>
	
	<div class="textForm">
		<label for="inputCity" class="form-label">주소</label>
	
		<input type="button" class="form-control" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
		<input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" name="orderAddrPostcode"> 
		<input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" name="orderAddr">
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소" name="orderAddrDetail">
	</div>

	<div class="textForm">
	  <label for="orderPhon" class="phone">연락처</label>
	  <input type="text" class="form-control" id="orderPhon" name="orderPhon">
	</div>
	
	<input type="hidden" name="orderPrice" value="${sum}">
	
	<br>
	<br>
	  <div >
	    <button type="submit" class="btn btn-success" id="orderMade" >주문하기</button>
	  </div>
	<br>
	<br>  
  
</form>


</div>


</div>

<c:import url="../layout/footer.jsp"></c:import>