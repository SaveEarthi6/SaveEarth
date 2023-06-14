<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/adminheader.jsp"/>

<style type="text/css">


@font-face {
   font-family: 'KBO-Dia-Gothic_bold';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff')
      format('woff');
      
   font-weight: 700;
   font-style: normal;
}

h1 {
   margin-top:50px;
   color: black;
   font-weight: bold;
   font-size: 50px;
   font-family: 'KBO-Dia-Gothic_bold';
}

form {
   font-weight: bold;
}

#freeHead {
   border: 1px solid #ccc;
}

</style>


<div class="container">

<h1 style= "text-align: center;">상품 옵션 추가 </h1>

<div class="col-8 mx-auto">

<form action="addopt" method="POST">

<div class="form-group" style= "margin-top: 50px">
   <label class="form-label" for="title">상품</label>
   
     <select name="ProdNo">
    <c:forEach var="prod" items="${ProdNoName}">
      <option value="${prod.prodNo}">${prod.prodName}</option>
    </c:forEach>
  </select>
</div>


<div class="form-group" style= "margin-top: 50px">
   <label class="form-label" for="title">색상</label>
   <input type="text" id="color" name="ProdColor" class="form-control">
</div>

<div class="form-group" style= "margin-top: 50px">
   <label class="form-label" for="title">사이즈</label>
   <input type="text" id="size" name="ProdSize" class="form-control">
</div>

<div>
   <button class="btn btn-success" type ="submit">옵션추가</button>
</div>
  

</form>

</div>

</div><!-- container end -->


<!-- <form action="addopt" method="POST"> -->
<!--   <select name="ProdNo"> -->
<%--     <c:forEach var="prod" items="${ProdNoName}"> --%>
<%--       <option value="${prod.prodNo}">${prod.prodName}</option> --%>
<%--     </c:forEach> --%>
<!--   </select> -->
  
<!--   <label for="color">색상</label> <br> -->
<!--   <input id="color" name="ProdColor"> -->
  
<!--   <label for="size">사이즈</label> <br> -->
<!--   <input id="size" name="ProdSize"> -->
<!--   <button type="submit">옵션추가</button> <br> -->
<!-- </form> -->





<c:import url="../layout/footer.jsp"></c:import>