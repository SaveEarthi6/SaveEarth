<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<c:import url="../layout/header.jsp"></c:import>
<html>



<script>
    // 실패 시 알림 창을 띄우는 함수
	$(function(){
		if("${msg}"=="실패") alert("실패")
	})		
</script>





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


.email {
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




<form action="./findid" method="POST">

      <div class="textForm">
        <input name="userName" id="userName" type="text" class="id" placeholder="이름 ">
      </div>
     
      <div class="textForm">
	      <label for="userEmail"></label>
	      <input name="userEmail" id="userEmail" type="email" class="email" placeholder="이메일 " >
	       
      </div>
      
      <div style="width:700px; margin: 0 auto; text-align: center;">

      </div>
      <input type="submit" class="btn" id="check" value="아이디확인" onclick="showAlert()">

	  

</form>


</body>
<c:import url="../layout/footer.jsp"></c:import>