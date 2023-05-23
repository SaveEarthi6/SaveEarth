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
* {
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;

}

body {
  background-image:#34495e;
}

.joinForm {
  position:absolute;
  width:400px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:40%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.joinForm h2 {
  text-align: center;
  margin: 30px;
}

.textForm {
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}


.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.name {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.email {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.nickname {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.cellphoneNo {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn:hover {
  background-position: right;
}


</style>

<body>
<br>

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

<form action="./update" method="POST">
      <div class="textForm">
        <input name="loginId" type="text" class="id" placeholder="아이디">
        </input>
      </div>
      <div class="textForm">
        <input name="loginPw" type="password" class="pw" placeholder="비밀번호">
      </div>
       <div class="textForm">
        <input name="loginPwConfirm" type="password" class="pw" placeholder="비밀번호 확인">
      </div>
      <div class="textForm">
        <input name="name" type="password" class="name" placeholder="이름">
      </div>

      <div class="textForm">
        <input name="nickname" type="text" class="nickname" placeholder="닉네임">
      </div>
      
      <div class="textForm">
        <input name="email" type="datetime-local" class="email" placeholder="생년월일">
      </div>
      
      <div class="textForm">
        <input name="email" type="text" class="email" placeholder="이메일">
      </div>
      
       <div class="textForm">
        <input name="email" type="text" class="email" placeholder="주소">
      </div>
      <div class="textForm">
        <input name="cellphoneNo" type="number" class="cellphoneNo" placeholder="전화번호">
      </div>
  
  	<button>회원정보 수정</button>
</form>






<!-- <form action="./update" method="post"> -->

<!-- <form class="row g-3" > -->

<!--   <div class="col-md-6"> -->
<!--     <label for="inputEmail4" class="form-label">아이디</label> -->
<!--     <input type="text" class="form-control" id="id"> -->
<!--   </div> -->
  
<!--   <div class="col-md-6"> -->
<!--     <label for="inputPassword4" class="form-label">비밀번호</label> -->
<!--     <input type="password" class="form-control" id="pw"> -->
<!--   </div> -->
  
<!--    <div class="col-md-6"> -->
<!--     <label for="inputPassword4" class="form-label">비밀번호 확인</label> -->
<!--     <input type="password" class="form-control" id="inputPassword4"> -->
<!--   </div> -->

<!--   <div class="col-md-6"> -->
<!--     <label for="inputCity" class="form-label">이름</label> -->
<!--     <input type="text" class="form-control" id="name"> -->
<!--   </div> -->
  
<!--   <div class="col-md-6"> -->
<!--     <label for="inputCity" class="form-label">닉네임</label> -->
<!--     <input type="text" class="form-control" id="nick"> -->
<!--   </div> -->
  
<!--    <div class="col-md-6"> -->
<!--     <label for="inputCity" class="form-label">생년월일</label> -->
<!--     <input type="datetime-local" class="form-control" id="nick"> -->
<!--   </div> -->
  
<!--    <div class="col-md-6"> -->
<!--     <label for="inputCity" class="form-label">이메일</label> -->
<!--     <input type="email" class="form-control" id="email"> -->
<!--   </div> -->
 
<!--   <div class="col-md-6"> -->
<!--     <label for="inputCity" class="form-label">주소</label>  -->
<!--         <button>주소 상세검색</button> -->
<!--     <input type="text" class="form-control" id="address"> -->

<!--   </div> -->
  
<!--   <div class="col-md-6"> -->
<!--     <label for="inputCity" class="phone">연락처</label> -->
<!--     <input type="text" class="form-control" id="address"> -->
<!--   </div> -->

<!--   <div class="col-12"> -->
<!--     <button type="submit" class="btn btn-primary">회원정보 수정</button> -->
<!--   </div> -->
  
  
<!-- </form> -->

<!-- </form> -->

<c:import url="../layout/footer.jsp"></c:import>