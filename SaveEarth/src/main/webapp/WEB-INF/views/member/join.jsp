<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<c:import url="../layout/header.jsp"></c:import>

<!-- 우편상세정보 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- <script src="/resources/js/addressapi.js"></script> -->
<!-- jQuery 2.2.4  -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>
</head>

<style type="text/css">

.form-control {
	width : 500px;
}

</style>

<!-- 20230525추가 id 중복 -->
<script type="text/javascript">




//아이디 중복체크()
 $(function(){
	$("#overlappedID").click(function() {
		console.log("test")

		const userId = $("#userId").val();
//		$("#signup").attr("type","button");
		$.ajax({
			type: "get",

			url: "http://localhost:8888/member/idCheck",
			data:{userId:userId},
			success: function(data){
				if(data == 1) {
					result="이미 사용중인 ID입니다";
					$("#olmessage").html(result);
					$("#idmessage").html("fail");
//					$("#signup").attr("type","button");
					
					
				} else {
					$("#olmessage").text("사용가능한 ID입니다");
					$("#idmessage").html("ok");
//					$("#signup").attr("type","submit");
				}
			}
		})
	})
	

})



//이메일 중복체크
$(function(){
	$("#userEmail").blur(function() {
		console.log("testemail")

		const userEmail = $("#userEmail").val();
		$.ajax({
			type: "get",

			url: "http://localhost:8888/member/emailCheck",
			data:{userEmail:userEmail},
			success: function(data){
				if(data == 1) {
					result="이미 사용중인 E-mail입니다";
					$("#olEmessage").html(result);

					$("#emailHidden").html("fail");
					
				} else {
					result="사용가능한 E-mail입니다"
					$("#olEmessage").html(result);

					$("#emailHidden").html("ok"); 
				  		
				}
			}
		})
	})
	

})








$(function(){

//비밀번호 확인
	$('#userpwcheck').blur(function(){
	   if($('#userPw').val() != $('#userpwcheck').val()){
	    	if($('#userpwcheck').val()!=''){
		    alert("비밀번호가 일치하지 않습니다.");
	    	    $('#userpwcheck').val('');
	          $('#userpwcheck').focus();
	          return false;
	       }
	    }
	})  	   
});



		  
function joinform_check() {
    var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    var getCheck= RegExp(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/);
    var getName= RegExp(/^[가-힣|a-z|A-Z]+$/);
    var test = "ok";
	console.log($("#idmessage").html()== test)
    //아이디 공백 확인
    if($("#userId").val() == ""){
      alert("아이디를 입력해주세요");
      $("#userId").focus();
      return false;
    }
    
    //아이디 중복 확인 
    if(!($("#idmessage").html()=="ok")){
    	alert("아이디 중복확인을 해주세요");
    	$("userId").focus();
    	return false;
    }


    
    //이름 글자수 
    if($('#userName').val().length>7){
		alert("이름은 7자 까지 입력가능합니다.")
		return false;
    }

    //이름 공백 확인
    if($("#userName").val() == ""){
      alert("이름을 입력해주세요");
      $("#userName").focus();
      return false;
    }
    //이름 유효성
    if (!getName.test($("#userName").val())) {
      alert("이름 형식에 맞게 입력해주세요.");
      $("#userName").val("");
      $("#userName").focus();
      return false;
    }
    
    //닉네임 공백 확인
    if($("#userNick").val() == ""){
      alert("닉네임을 입력해주세요");
      $("#userNick").focus();
      return false;
    }    
    
    
    //비밀번호 공백 확인
    if($("#userPw").val() == ""){
      alert("비밀번호를 입력해주세요");
      $("#userPw").focus();
      return false;
    }
    //비밀번호 유효성
    if(!getCheck.test($("#userPw").val())) {
    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
    $("#userPw").val("");
    $("#userPw").focus();
    return false;
    }
    
  
	if(!($("#userPw").val()==$("#userpwcheck").val())){
		alert("비밀번호 체크확인!!");
		$("#userpwcheck").val("");
		$("#userpwcheck").focus();
		return false;
	}
	    	
    
    
    
    
    //이메일 유효성 검사
    if(!getMail.test($("#userEmail").val())){
      alert("이메일 형식에 맞게 입력해주세요.")
      $("#userEmail").val("");
      $("#userEmail").focus();
      return false;
    }
   //이메일 공백 확인
    if($("#userEmail").val() == ""){
      alert("이메일을 입력해주세요");
      $("#userEmail").focus();
      return false;
    }
   
    //이메일 중복 확인 
    if(!($("#emailHidden").html()=="ok")){
    	alert("중복되는 이메일입니다");
    	$("userEmail").focus();
    	return false;
    }   

  return true;
}		  		    
    



    	

		  




</script>



<body >
<h1>회원가입 페이지</h1>
<hr>



<br>

<h3 style="margin: 0 680px;/* text-align: center; */">회원가입</h3>

<br>

<div style="justify-content: center, margin: 0 auto;">


<form action="./join" onsubmit=" return joinform_check()" style="margin : 0 520px;" method="post">





  <div class="col-md-6">
    <label for="inputEmail4" class="form-label">아이디</label>
    <input type="text" class="form-control" id="userId" name="userId">
  </div>
  
  <!-- 20230525추가 id 중복 -->
  <button id="overlappedID" type="button"  >중복확인</button><br>
  <span id="olmessage"></span>
  <span id="idmessage" style="display:none;"></span>

  
  
  <div class="col-md-6">
    <label for="inputPassword4" class="form-label">비밀번호</label>
    <input type="password" class="form-control" id="userPw" name="userPw">
  </div>
  
   <div class="col-md-6">
    <label for="inputPassword4" class="form-label">비밀번호 확인</label>
    <input type="password" class="form-control" id="userpwcheck" name="userpwcheck">
  </div>

  <div class="col-md-6">
    <label for="inputCity" class="form-label">이름</label>
    <input type="text" class="form-control" id="userName" name="userName">
  </div>
  
  <div class="col-md-6">
    <label for="inputCity" class="form-label">닉네임</label>
    <input type="text" class="form-control" id="userNick" name="userNick">
  </div>  
  
  
   <div class="col-md-6">
    <label for="inputCity" class="form-label">이메일</label>
    <input type="email" class="form-control" id="userEmail" name="userEmail">
  </div>
  <span id="olEmessage"></span>
  <span id="emailHidden" style="display:none;"></span>
 
  <div class="col-md-6">
 	<label for="inputCity" class="form-label">주소</label>
 
 	<input type="button" class="form-control" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
    <input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" name="userPostcode"> 
    <input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" name="userAddr">
	<span id="guide" style="color:#999;display:none"></span>
	<input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소" name="userDetailaddr">
  </div>
  
  <div class="col-md-6">
    <label for="inputCity" class="phone">연락처</label>
    <input type="text" class="form-control" id="userPhone" name="userPhone">
  </div>

  <div class="col-12">
    <button type="submit" class="btn btn-primary" id="signup" >가입하기</button>
  </div>
  
  
</form>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
        
        
        
    }
</script>

</div>

<c:import url="../layout/footer.jsp"></c:import>