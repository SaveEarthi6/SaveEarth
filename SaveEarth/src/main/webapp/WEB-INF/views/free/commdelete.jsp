<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

/* 댓글 등록 */
$(function() {
	   $("#enroll").click(function() {
	      console.log("test")
	      console.log($('#commContent').val());
	      console.log(${userInfo.userNo});
	      console.log(${view.FREE_NO});
	      
	      
	      $.ajax({
	          type : 'get',           // 타입 (get, post, put 등등)
	          url : '/free/comment',  // 요청할 서버url
	          dataType : 'html',       // 데이터 타입 (html, xml, json, text 등등)
	          data : {  // 보낼 데이터 (Object , String, Array)
	        	  commContent: $("#commContent").val(),
	              userNo: ${userInfo.userNo},
	              freeNo: ${param.freeNo}
	          }, 
	          success : function(result) { // 결과 성공 콜백함수
	        	  console.log(result);
				
	          	//이 코드를 사용하면 등록은 동작하는데 '수정', '삭제' 버튼이 동작 안함
// 	              $(".comm").html(result);
					
	          		//새로고침
	 				location.reload();
				
				  //값 비우기
// 	              $("#commContent").val('');
	          },
	          error : function(request, status, error) { // 결과 에러 콜백함수
	               console.log('로그인이 필요합니다!')
	          }
	    })

	   });
	});

/* 댓글 삭제 */
$(function() {
	   $(".commDelete").click(function() {
	      console.log("test")
	      console.log($(".commNo").index(this));
	      
	      var idx = $(".commDelete").index(this)
	      var commentNo = $(".commDelete").eq(idx).attr('data-no')
	      var freeNo = (${param.freeNo})
	      
	      console.log("인덱스 확인", commentNo)
	      console.log("글번호", freeNo)
	      
	      //ajax start
	      $.ajax({
	          type : 'post',           // 타입 (get, post, put 등등)
	          url : '/free/commdelete',  // 요청할 서버url
	          dataType : 'html',       // 데이터 타입 (html, xml, json, text 등등)
	          data : {  // 보낼 데이터 (Object , String, Array)
	        	  "commNo" : commentNo, 
	        	  "freeNo" : freeNo
	          }, 
	          success : function(result) { // 결과 성공 콜백함수
	              console.log("성공")
     	  	  console.log(result);
					
//	              $(".comm").html(result);

	            //새로고침
// 				location.reload();
	          },
	          error : function(request, status, error) { // 결과 에러 콜백함수
	               console.log(error)
	               console.log("실패")
	          }
	    })
		//ajax end

	   });
	});

/* 댓글 수정 */
function commUpdate(th) {

	var idx = $(".commUpdate").index(th)
	var commNo = $(".commUpdate").eq(idx).attr('data-no')
	var commContent = $(".commUpdate").eq(idx).attr('data-con')
	var freeNo = ${param.freeNo}
	
	console.log('commNo' + commNo)
	console.log(commContent)
	console.log(freeNo)
	
	/* 댓글 내용이 있는 태그를 바로 찾아갈 수 없기 때문에 부모 태그를 먼저 찾은 후에 하위 태그를 find로 찾음 */
	$(th).parents(".com").find('#rs').replaceWith('<input type="text" name="commContent" id="newcomm" value="'+ commContent +'">')
	$(th).parents(".com").find('.commUpdate').replaceWith('<button id="commSuccess" class="btn btn-danger" data-no="' +  commNo + '" onclick="success(this)">완료</button>')

	var commCon = $("#newcomm").val();
	
	$.ajax({
		type : 'get',
		url : '/free/commUpdate',
		dataType : 'html', 
		data : 
			{commNo : commNo,
			freeNo : freeNo,
			commContent : commCon},
		success:
			function(result){

// 			$('commUpdate').replaceWith('<button id="commSuccess">완료</button>');
			
// 			console.log($('#commSuccess').attr('data-no'));
			
			console.log('댓글 수정!');
			
			//새로고침
// 			location.reload();
			
			//-> 처음 수정만 되고 다시 수정 시도하면 실패 -> freeNo를 찾지 못함
// 			$(".comm").html(result);
			
			},
		error: function(error){
			console.log('댓글 수정 실패!')
		}
			
		
	})
	


}

function success(th) {

	var idx = $("#commSuccess").index(th)
	var commNo = $("#commSuccess").eq(idx).attr('data-no')
	var freeNo = ${param.freeNo}
	
	var commCon = $("#newcomm").val();
	
	console.log('commSuccess comCon' + commCon)
	console.log(commNo)
	console.log(freeNo)
	
	$.ajax({
		type : 'post',
		url : '/free/commSuccess',
		dataType : 'html', 
		data : 
			{commNo : commNo,
			freeNo : freeNo,
			commContent : commCon},
		success:
			function(result){
	
			console.log('댓글 수정 성공!');
			
			location.reload();
			
			//-> 처음 수정만 되고 다시 수정 시도하면 실패 -> freeNo를 찾지 못함
// 			$(".comm").html(result);
			
		},
		error: function(error){
			console.log('댓글 수정 실패!')
		}
			
		
	})
	
	}

</script>

</head>
<body>

   <c:forEach items="${commList }" var="commList">
      <img class="commentProfile" src="../resources/img/commentProfile.png">&nbsp;<span
        id="writer" style="font-weight: bold">${commList.USER_ID }</span>
      <br>
      <span id="rs">${commList.COMM_CONTENT }</span>
ㅣ  <span id="writeDate">
	<fmt:formatDate value="${commList.COMM_CREATE}" pattern="yyyy. MM. dd. HH:mm:ss" />
	</span>
	
	<!-- 로그인한 아이디랑 댓글 작성한 아이디랑 같을 때 삭제 버튼이 보인다 -->
	<c:if test="${loginId eq commList.USER_ID }">
	<button class="commDelete btn btn-danger" data-no="${commList.COMM_NO }">삭제</button> 
	<button class="commUpdate btn btn-danger" data-no="${commList.COMM_NO }" data-con="${commList.COMM_CONTENT }" onclick="commUpdate(this)">수정</button>   
    </c:if>
	
      <hr>
   </c:forEach>

</body>
</html>