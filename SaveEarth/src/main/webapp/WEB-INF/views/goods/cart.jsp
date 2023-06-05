<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp"/> 
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
                <th>상품이미지</th> 
				<th>상품이름</th>
                <th>가격</th>
                <th>수량</th>
            </tr>
  		</thead>
        <tbody>
            <c:forEach var="item" items="${cartList}">
                <tr>
					<td><img src="" alt="제품 사진 이미지 " width="100px" height="100px"></td>
                    <td>${item.PROD_NAME}</td>
                    <td>${item.PROD_PRICE}</td>
                    <td>${item.PROD_COUNT}</td>
                    
                </tr>
            </c:forEach>
        </tbody>
    </table>



<c:import url="../layout/footer.jsp"/> 