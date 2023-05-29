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




//아이디 중복체크
 $(function(){
	$("#overlappedID").click(function() {
		console.log("test")

		const id = $("#id").val();
		$("#signup").attr("type","button");
		$.ajax({
			type: "get",

			url: "http://localhost:8888/member/idCheck",
			data:{id:id},
			success: function(data){
				if(data == 1) {
					result="이미 사용중인 ID입니다";
					$("#olmessage").html(result);
					$("#signup").attr("type","button");
					
					
				} else {
					$("#olmessage").text("사용가능한 ID입니다");
					$("#signup").attr("type","submit");
				}
			}
		})
	})
	

})



//이메일 중복체크
$(function(){
	$("#email").blur(function() {
		console.log("testemail")

		const email = $("#email").val();
		$.ajax({
			type: "get",

			url: "http://localhost:8888/member/emailCheck",
			data:{email:email},
			success: function(data){
				if(data == 1) {
					result="이미 사용중인 E-mail입니다";
					$("#olEmessage").html(result);
					$("#signup").attr("type","button");
					
					
				} else {
					$("#signup").attr("type","submit");
				  		
				}
			}
		})
	})
	

})








$(function(){

//비밀번호 확인
	$('#userpwcheck').blur(function(){
	   if($('#pw').val() != $('#userpwcheck').val()){
	    	if($('#userpwcheck').val()!=''){
		    alert("비밀번호가 일치하지 않습니다.");
	    	    $('#userpwcheck').val('');
	          $('#userpwcheck').focus();
	       }
	    }
	})  	   
});



// function joinform_check(){
	
// 	var id = document.getElementById("id");
// 	var pw = document.getElementById("pw");
	
	
// 	if(id.value == ""){
// 		alert("아이디를 입력하세요");
// 		id.focus();
// 		$("#signup").attr("type","button");
// 		return false;
// 	};
	

	
// 	  if (pw.value == "") {
// 		    alert("비밀번호를 입력하세요.");
// 		    pw.focus();
// 		    $("#signup").attr("type","button");
// 		    return false;
// 		  } else if(!pwdCheck.test(pw.value)) {
// 			  //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
// 			  var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
// 			    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
// 			    pw.focus();
// 			    $("#signup").attr("type","button");
// 			    return false;
// 			  } else{
// 				  $("#signup").attr("type","submit");
// 				  return true;
// 			  }

/* 		  //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
		  var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/; */

/* 		  if (!pwdCheck.test(pw.value)) {
		    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
		    pw.focus();
		    $("#signup").attr("type","button");
		    return false;
		  }; */
		  

		  
function joinform_check() {
    var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    var getCheck= RegExp(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/);
    var getName= RegExp(/^[가-힣|a-z|A-Z]+$/);

    //아이디 공백 확인
    if($("#id").val() == ""){
      alert("아이디를 입력해주세요");
      $("#id").focus();
      return false;
    }

//     //아이디 중복확인 수행
//     if($("#olmessage").val() == ""){
//       alert("아이디중복확인을 해주세요");
//       return false;
//     }    
    
    
    if($('#name').val().length>7){
		alert("이름은 7자 까지 입력가능합니다.")
		return false;
    }

    //이름 공백 확인
    if($("#name").val() == ""){
      alert("이름을 입력해주세요");
      $("#name").focus();
      return false;
    }
    //이름 유효성
    if (!getName.test($("#name").val())) {
      alert("이름 형식에 맞게 입력해주세요.");
      $("#name").val("");
      $("#name").focus();
      return false;
    }
    //비밀번호 공백 확인
    if($("#pw").val() == ""){
      alert("비밀번호를 입력해주세요");
      $("#pw").focus();
      return false;
    }
    //비밀번호 유효성
    if(!getCheck.test($("#pw").val())) {
    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
    $("#pw").val("");
    $("#pw").focus();
    return false;
    }
    //이메일 유효성 검사
    if(!getMail.test($("#email").val())){
      alert("이메일 형식에 맞게 입력해주세요.")
      $("#email").val("");
      $("#email").focus();
      return false;
    }
   //이메일 공백 확인
    if($("#email").val() == ""){
      alert("이메일을 입력해주세요");
      $("#email").focus();
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
    <input type="text" class="form-control" id="id" name="id">
  </div>
  
  <!-- 20230525추가 id 중복 -->
  <button id="overlappedID" type="button"  >중복확인</button><br>
  <span id="olmessage"></span>

  
  
  <div class="col-md-6">
    <label for="inputPassword4" class="form-label">비밀번호</label>
    <input type="password" class="form-control" id="pw" name="pw">
  </div>
  
   <div class="col-md-6">
    <label for="inputPassword4" class="form-label">비밀번호 확인</label>
    <input type="password" class="form-control" id="userpwcheck" name="userpwcheck">
  </div>

  <div class="col-md-6">
    <label for="inputCity" class="form-label">이름</label>
    <input type="text" class="form-control" id="name" name="name">
  </div>
  
  <div class="col-md-6">
    <label for="inputCity" class="form-label">닉네임</label>
    <input type="text" class="form-control" id="nick" name="nick">
  </div>
  
   <div class="col-md-6">
    <label for="inputCity" class="form-label">생년월일</label>
    <input type="date" class="form-control" id="birth" name="birth">
  </div>
  
   <div class="col-md-6">
    <label for="inputCity" class="form-label">이메일</label>
    <input type="email" class="form-control" id="email" name="email">
  </div>
  <span id="olEmessage"></span>
 
  <div class="col-md-6">
 	<label for="inputCity" class="form-label">주소</label>
 
 	<input type="button" class="form-control" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
    <input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" name="post"> 
    <input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" name="addr1">
	<span id="guide" style="color:#999;display:none"></span>
	<input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소" name="addr2">
  </div>
  
  <div class="col-md-6">
    <label for="inputCity" class="phone">연락처</label>
    <input type="text" class="form-control" id="phone" name="phone">
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