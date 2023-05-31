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


<!-- 20230525임시비밀번호 -->
<script>
     
    $(function(){
    	$("#check").click(function() {
    		console.log("test")

    		const userId = $("#userId").val();
    		const userEmail = $("#userEmail").val();
    		$("#check").attr("type","button");
    		$.ajax({
    			type: "get",

    			url: "http://localhost:8888/member/findIdEmail",
    			data:{userId:userId, userEmail:userEmail},
    			success: function(data){
    				if(data == 1) {
    					$("#checkemail").html("<h6 style='color:blue;'>이메일로 임시비밀번호가 발송되었습니다</h6>");
    					$("#check").attr("type","button");
    					
    					
    				} else {
    					$("#checkemail").html("<h6 style='color:red;'>아이디/이메일이 일치하지않습니다</h6>");
    					$("#check").attr("type","submit");
    				}
    			}
    		})
    	})
    	

    })     
    
    
</script>




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
<br>



<form action="./findpw" method="POST">

      <div class="textForm">
        <input name="userId" id="userId" type="text" class="id" placeholder="아이디 ">
      </div>
      <span id= "checkid"></span>
      
      <div class="textForm">
	      <label for="userEmail"></label>
	      <input name="userEmail" id="userEmail" type="email" class="email" placeholder="이메일 " >
	       
      </div>
      
      <div style="width:700px; margin: 0 auto; text-align: center;">
      <p id="checkemail"></p> 
      </div>
      
	  <input type="submit" class="btn" id="check" value="비밀번호찾기">
	  

</form>
	<div style="width:700px; margin: 0 auto;">
       <a href="./login"> <button class="btn">로그인하러가기</button></a>
	</div>


</body>
<c:import url="../layout/footer.jsp"></c:import>