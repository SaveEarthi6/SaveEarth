<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<c:import url="../layout/header.jsp"></c:import>


<!-- jQuery 2.2.4  -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>
</head>

<style type="text/css">

</style>

<body>
<br>

<ul class="nav nav-pills nav-fill">
  <li class="nav-item">
    <a class="nav-link" href="./update">회원정보 수정</a>
  </li>

  <li class="nav-item">
    <a class="nav-link" href="./delete">회원정보 탈퇴</a>
  </li>
  
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="./board">게시글, 댓글</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="./order">주문내역</a>
  </li>
</ul>

<br>





</body>
<c:import url="../layout/footer.jsp"></c:import>