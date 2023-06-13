<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/adminheader.jsp"/>




<form action="addopt" method="POST">
  <select name="ProdNo">
    <c:forEach var="prod" items="${ProdNoName}">
      <option value="${prod.prodNo}">${prod.prodName}</option>
    </c:forEach>
  </select>
  
  <label for="color">색상</label>
  <input id="color" name="ProdColor">
  
  <label for="size">사이즈</label>
  <input id="size" name="ProdSize">
  <button type="submit">옵션추가</button>
</form>
<c:import url="../layout/footer.jsp"></c:import>