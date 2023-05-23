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

.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: center;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
  margin-left: 60px;
}

.btn:hover {
  background-position: center;
}

form{
margin: 0 auto;
width: 700px;
}
</style>

<body>
<br>

<ul class="nav nav-pills nav-fill">
  <li class="nav-item">
    <a class="nav-link" href="./update">회원정보 수정</a>
  </li>
    <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="./update">회원정보 탈퇴</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="./board">게시글, 댓글</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="./order">주문내역</a>
  </li>
</ul>

<br>


<form action="./delete" method="post">

<table class="table table-bordered">
    <tr>
      <td>아이디</td>
      <td>{아이디}</td>
    </tr>
    <tr>
    
    <tr>
      <td>패스워드</td>
      <td>{패스워드}</td>
    </tr>
</table>


	<button class="btn">회원 탈퇴</button>

</form>

</body>
<c:import url="../layout/footer.jsp"></c:import>