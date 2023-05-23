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
<h1>마이페이지 회원정보 수정, 탈퇴 페이지</h1>
<hr>

<ul class="nav nav-pills nav-fill">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="./update">회원정보 수정</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="./delete">회원정보 탈퇴</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="./board">게시글, 댓글</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="./order">주문내역</a>
  </li>
</ul>

<br>

<h3 style="text-align: center;">회원정보 수정</h3>

<br>

<div style="justify-content: center, margin: 0 auto;">


<form action="./update" method="post">



<form class="row g-3" >

  <div class="col-md-6">
    <label for="inputEmail4" class="form-label">아이디</label>
    <input type="text" class="form-control" id="id">
  </div>
  
  <div class="col-md-6">
    <label for="inputPassword4" class="form-label">비밀번호</label>
    <input type="password" class="form-control" id="pw">
  </div>
  
   <div class="col-md-6">
    <label for="inputPassword4" class="form-label">비밀번호 확인</label>
    <input type="password" class="form-control" id="inputPassword4">
  </div>

  <div class="col-md-6">
    <label for="inputCity" class="form-label">이름</label>
    <input type="text" class="form-control" id="name">
  </div>
  
  <div class="col-md-6">
    <label for="inputCity" class="form-label">닉네임</label>
    <input type="text" class="form-control" id="nick">
  </div>
  
   <div class="col-md-6">
    <label for="inputCity" class="form-label">생년월일</label>
    <input type="datetime-local" class="form-control" id="nick">
  </div>
  
   <div class="col-md-6">
    <label for="inputCity" class="form-label">이메일</label>
    <input type="email" class="form-control" id="email">
  </div>
 
  <div class="col-md-6">
    <label for="inputCity" class="form-label">주소</label> 
        <button>주소 상세검색</button>
    <input type="text" class="form-control" id="address">

  </div>
  
  <div class="col-md-6">
    <label for="inputCity" class="phone">연락처</label>
    <input type="text" class="form-control" id="address">
  </div>

  <div class="col-12">
    <button type="submit" class="btn btn-primary">회원정보 수정</button>
  </div>
  
  
</form>

</form>

</div>

<c:import url="../layout/footer.jsp"></c:import>