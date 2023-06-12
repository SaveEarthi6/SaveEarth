<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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

.free {
	position: absolute;
	top: 38%;
	left: 45%;
	color: #fff;
	font-weight: bold;
	font-size: 50px;
	font-family: 'KBO-Dia-Gothic_bold';
}

.free_detail {
	/* 이미지랑 네비게이션바 띄우기 */
	position: relative;
	width: 100%;
	height: 500px;
}

.commentProfile {
   width: 30px;
   height: 30px;
}

#comment {
   font-family: 'KBO-Dia-Gothic_bold';
   font-weight: bold;
}

.comm {
	font-family: 'omyu_pretty';
	font-size:20px;
}

@font-face {
   font-family: 'KBO-Dia-Gothic_bold';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff')
      format('woff');
   font-weight: 700;
   font-style: normal;
}

@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

</style>




<div class="container">


<div style= "margin-left: 1100px; padding-top: 50px; padding-bottom: 50px;">

	<c:if test="${ view.FREE_HEAD eq '공지사항'}">
	
		<button onclick="location.href='./noticeUpdate?freeNo=${view.FREE_NO}'"
            id="btnUpdate" class="btn btn-success">수정</button>
	</c:if>
	
		<a href = "./freeDelete?freeNo=${view.FREE_NO}"><button id="btnDelete" class="btn btn-danger">삭제</button></a>
		
</div>

<!-- 게시글 상세 -->
<table class="table table-bordered" style= "font-weight: bold;">
<tr>
	<td class="table-light">글번호</td><td colspan="3">${view.FREE_NO }</td>
</tr>
<tr>
	<td class="table-light">아이디</td><td>${view.USER_ID }</td>
	<td class="table-light">닉네임</td><td>${view.USER_NICK }</td>
</tr>
<tr>
	<td class="table-light">조회수</td><td>${view.FREE_VIEWS }</td>
	<td class="table-light">작성일</td><td><fmt:formatDate value="${view.FREE_CREATE }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="table-light">제목</td><td colspan="3">${view.FREE_TITLE }</td>
</tr>
<tr>
	<td class="table-light" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">${view.FREE_CONTENT }</td>
</tr>
</table>

<!-- 첨부파일 다운-->
<div class="mb-3">
	<c:if test="${not empty freeFile }">
	<c:forEach items="${freeFile }" var="file">
		<a href="../upload/${file.freeStoredName }" download="${file.freeOriginName }">
			${file.freeOriginName }
		</a>
	</c:forEach>
	</c:if>
</div>


<script type="text/javascript">

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
	          type : 'get',           // 타입 (get, post, put 등등)
	          url : '/admin/freecommdelete',  // 요청할 서버url
	          dataType : 'html',       // 데이터 타입 (html, xml, json, text 등등)
	          data : {  // 보낼 데이터 (Object , String, Array)
	        	  "commNo" : commentNo, 
	        	  "freeNo" : freeNo
	          }, 
	          success : function(result) { // 결과 성공 콜백함수
	              console.log("성공")
     	  	  console.log(result);
					
	              $(".comm").html(result);
	              location.reload();
	          },
	          error : function(request, status, error) { // 결과 에러 콜백함수
	               console.log(error)
	               console.log("실패")
	          }
	    })
		//ajax end

	   });
	});

















</script>


<!-- 버튼 -->
<div class="text-center mb-3">
	<a href= "/admin/free"><button id="btnList" class="btn btn-success">목록</button></a>
	
</div>

<!-- 댓글 -->

<h3 id="comment">댓글💚</h3>
  
   <div class="comm">
  
   <c:forEach items="${commContent }" var="commContent">
   
      <img class="commentProfile" src="../resources/img/commentProfile.png">&nbsp;<span
        id="writer" style="font-weight: bold">${commContent.USER_ID }</span>
      <br>
    <span id="rs">${commContent.COMM_CONTENT }</span>
ㅣ  <span id="writeDate">
	<fmt:formatDate value="${commContent.COMM_CREATE}" pattern="yyyy. MM. dd. HH:mm:ss" />
	</span>
	
	<button class="commDelete" data-no="${commContent.COMM_NO }">삭제</button>  

      <hr>
    
   </c:forEach>

    </div> <!-- <div> comm end -->




















	
	
</div><!-- .container end -->



<c:import url="../layout/footer.jsp"></c:import>















