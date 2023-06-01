<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:import url="../layout/header.jsp" />


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

.rs {
   /*    border: 1px solid black; */
   width: 70px;
}

.commList {
   border: 1px solid green;
   margin-bottom: 3px;
}

#btnRecommend, #btnEmpty {
   border: 0;
   background-color: white;
}

.button {
   width: 30px;
   height: 30px;
}

.profile {
   width: 50px;
   height: 50px;
}

#title {
   font-size: 2em;
   font-weight: bold;
   font-family: 'KBO-Dia-Gothic_bold';
}

#head {
   color: blue;
}

#comment {
   font-family: 'KBO-Dia-Gothic_bold';
   font-weight: bold;
}

.commentProfile {
   width: 30px;
   height: 30px;
}


}
</style>





<!-- 자유게시판 디테일 이미지 -->
<div>
   <img class="free_detail" src="../resources/img/free_detail.png">
   <h1 class="free">자유게시판</h1>

</div>

<div class="container">

   <div
      style="margin-left: 1100px; padding-top: 50px; padding-bottom: 50px;">
      <c:if test="${ userInfo.userNo eq view.USER_NO }">
         <button onclick="location.href='./update?freeNo=${view.FREE_NO}'"
            id="btnUpdate" class="btn btn-success">수정</button>
         <button onclick="location.href='./delete?freeNo=${view.FREE_NO}'"
            id="btnDelete" class="btn btn-success" data-bs-toggle="modal"
            data-bs-target="#exampleModal">삭제</button>
      </c:if>
   </div>

   <!-- 게시글 상세 -->
   <div id="title">[${view.FREE_TITLE }]</div>
   <br>
   <div>
      <img class="profile" src="../resources/img/profile.png"> <span
         style="font-weight: bold; font-size: 20px;">${view.USER_NICK }</span>
      <br> <br>
      <div id="head">${view.FREE_HEAD }</div>
      작성일
      <fmt:formatDate value="${view.FREE_CREATE }"
         pattern="yy-MM-dd HH:mm:ss" />
      ㅣ 조회수 ${view.FREE_VIEWS }

      <!-- 추천 기능 버튼 -->

   
    <img class="button" id="recommendHeart" src="../resources/img/button_heart.png" onclick="toggleRecommend()">
    <img class="button" id="recommendEmpty" src="../resources/img/button_empty.png" onclick="toggleRecommend()">


      ${view.RECOMMEND }

   </div>

   <br> <br>

   <table class="table table-bordered">
      <tr>
         <td class="table-primary" colspan="4"><h5
               style="font-weight: bold;">본문</h5></td>
      </tr>

      <tr>
         <td colspan="4">${view.FREE_CONTENT }</td>
      </tr>

   </table>

   <!-- 첨부파일 다운-->
   <div class="mb-3">
      <c:if test="${not empty freeFile }">
         <c:forEach items="${freeFile }" var="file">
            <a href="../upload/${file.freeStoredName }"
               download="${file.freeOriginName }"> ${file.freeOriginName } </a>
            <br>
         </c:forEach>
      </c:if>
   </div>

<!-- 댓글 등록 -->
<script type="text/javascript">

$(function() {
   $("#enroll").click(function() {
      console.log("test")
      console.log($('#commContent').val());
      console.log(${userInfo.userNo});
      console.log(${view.FREE_NO});
      
      
      $.ajax({
          type : 'get',           // 타입 (get, post, put 등등)
          url : 'http://localhost:8888/free/comment',  // 요청할 서버url
          dataType : 'html',       // 데이터 타입 (html, xml, json, text 등등)
          data : {  // 보낼 데이터 (Object , String, Array)
        	  commContent: $("#commContent").val(),
              userNo: ${userInfo.userNo},
              freeNo: ${param.freeNo}
          }, 
          success : function(result) { // 결과 성공 콜백함수
        	  console.log(result);
              console.log(result.length);
				
              $(".comm").html(result);
              //값 비우기
              $("#commContent").val('');
          },
          error : function(request, status, error) { // 결과 에러 콜백함수
               console.log(error)
          }
    })

   });
});


</script>

<!-- 댓글 삭제 -->

<script type="text/javascript">
// $(function() {
// 	   $("#commDelete").click(function() {
// 	      console.log("test")
// 	      console.log();
	      
	      //ajax start
// 	      $.ajax({
// 	          type : 'get',           // 타입 (get, post, put 등등)
// 	          url : 'http://localhost:8888/free/commdelete',  // 요청할 서버url
// 	          dataType : 'html',       // 데이터 타입 (html, xml, json, text 등등)
// 	          data : {  // 보낼 데이터 (Object , String, Array)
// 	        	  commNo: 1
// 	          }, 
// 	          success : function(result) { // 결과 성공 콜백함수
// 	        	  console.log(result);
// 	              console.log(result.length);
					
// 	              $("#comm").html(result);
// 	              //값 비우기
// 	              $("#commContent").val('');
// 	          },
// 	          error : function(request, status, error) { // 결과 에러 콜백함수
// 	               console.log(error)
// 	          }
// 	    })
		//ajax end

// 	   });
// 	});
	


function commDelete(th) {
// function commDelete(button) {
	/* 자식 */
// 	console.log( $(th).parent("#comm").children(".commNo").val() );
	/* 자손 */
	console.log( $(th).closest(".comm").find(".commNo").val() );
// 	console.log( $(button).closest(".comm").find(".commNo").val() );
}	


</script>

<!-- 추천 AJAX -->
<script type="text/javascript">


function toggleRecommend() {
    var userNo = ${userInfo.userNo};
    var freeNo = ${param.freeNo};

function toggleRecommend() {
	$.ajax({
		type: "GET",
		url: "/free/recommend",
		dataType: "json",
		data: {
			userNo: userNo,
			freeNo: freeNo
		},
		success: function(data) {
			if (data.recommend === 1) {
				$("#recommendHeart").attr("src", "../resources/img/button_heart.png");
			} else if (data.recommend === 0) {
				$("#recommendEmpty").attr("src", "../resources/img/button_empty.png");
			}
			$("#recommendHeart").empty().append(data.recommend);
			$("#recommendEmpty").empty().append(data.recommend);
		}
	});
}


</script>

   <!-- 목록 버튼 -->
   <div class="text-center mb-3">
      <a href="/free/main"><button id="btnList" class="btn btn-success">목록</button></a>
      <form action="/free/recommend">

         <div style="padding-top: 200px;"></div>

      </form>
   </div>

   <!-- 댓글 작성 위치 -->
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
	
	<!-- 로그인한 아이디랑 댓글 작성한 아이디랑 같을 때 삭제 버튼이 보인다 -->
	<c:if test="${loginId eq commContent.USER_ID }">
	<!-- id값은 중복되면 에러나기 때문에 c:foreach같은 반복문에서는 클래스로 지정해주어야 한다 -->
	<input type="hidden" value="${commContent.COMM_NO }" class="commNo">
	<!-- this는 버튼의 요소를 가져가 -->
	<button id="commDelete" class="btn btn-danger" onclick="commDelete(this)">삭제</button>  
<!-- 	<button id="commDelete" class="btn btn-danger" onclick="commDelete()">삭제</button>   -->
    </c:if>

      <hr>
    
   </c:forEach>

    </div> <!-- <div> comm end -->


   <!-- 댓글 -->
   <div class="card my-4">
      <h5 class="card-header" style="font-weight: bold;">댓글</h5>
      <div class="card-body">
         <form name="commentForm" action="./comment" method="get"
            autocomplete="off" id="commentForm">
            <textarea id="commContent" name="commContent" class="form-control"
               rows="3"></textarea>
            <div style="padding-top: 50px;">
               <button id="enroll" type="button" class="btn btn-success">등록</button>
            </div>
            <!-- 회원번호랑 게시글 번호도 함께 보내기 -->
            <%--             <input type="hidden" name="userNo" value=${userInfo.userNo }> --%>
            <%--             <input type="hidden" name="freeNo" value=${view.FREE_NO }> --%>
         </form>
      </div>
   </div>

</div>
<!-- .container end -->


<c:import url="../layout/footer.jsp"></c:import>








