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

#btnRecommend {
   display: none;
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

      <button type="button" id="btnEmpty"
         onclick="location.href='./recommend?freeNo=${view.FREE_NO}">
         <img class="button" src="../resources/img/button_empty.png">
      </button>


      <button type="button" id="btnRecommend"
         onclick="location.href='./recommend?freeNo=${view.FREE_NO}">
         <img class="button" src="../resources/img/button_heart.png">
      </button>

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
// $(function(){
//    $("#enroll").click(function() {
//       console.log("test")
//       console.log($('#commContent').val());
//       console.log(${userInfo.userNo });
//       console.log(${view.FREE_NO });
      
// //       const res = $("#commentForm").val();
//       $.ajax({
//          type: "get",

//          url: "http://localhost:8888/free/comment",
//          data:{
//             commContent:$("#commContent").val(),
//             userNo:${userInfo.userNo },
//             freeNo:${view.FREE_NO }
//             },
//          success: function(data){
//      		console.log(data)
//             console.log(data.length)  		
     		
//             for (let i = 0; i < data.length; i++) {
							
// 				const timestamp = data[i].COMM_CREATE;
// 				const date = new Date(timestamp);

// 				const formattedDate = date.toLocaleString("ko-KR", {
// 				  year: "numeric",
// 				  month: "2-digit",
// 				  day: "2-digit",
// 				  hour: "2-digit",
// 				  minute: "2-digit",
// 				  hour12: false,
// 				  second: "2-digit"
// 				});

// 				console.log(formattedDate);

//             	   $(".writer").eq(i).html(data[i].USER_ID);
//             	   $(".rs").eq(i).html(data[i].COMM_CONTENT);
//             	   $(".writeDate").eq(i).html(formattedDate);
//             }
     		
//      		// 남은 요소 초기화
//             for (let i = data.length; i < $(".writer").length; i++) {
//                $(".writer").eq(i).html('');
//                $(".rs").eq(i).html('');
//                $(".writeDate").eq(i).html('');
//             }
     		
//             //값 비우기
//             $("#commContent").val('')
//          }
//       })
//    })
   

// })

$(function() {
   $("#enroll").click(function() {
      console.log("test")
      console.log($('#commContent').val());
      console.log(${userInfo.userNo});
      console.log(${view.FREE_NO});
      
      $.ajax({
         type: "get",
         url: "http://localhost:8888/free/comment",
         data: {
            commContent: $("#commContent").val(),
            userNo: ${userInfo.userNo},
            freeNo: ${view.FREE_NO}
         },
         success: function(data) {
            console.log(data);
            console.log(data.length);
            
            for (let i = 0; i < data.length; i++) {
               const timestamp = data[i].COMM_CREATE;
               const date = new Date(timestamp);

               const formattedDate = date.toLocaleString("ko-KR", {
                  year: "numeric",
                  month: "2-digit",
                  day: "2-digit",
                  hour: "2-digit",
                  minute: "2-digit",
                  hour12: false,
                  second: "2-digit"
               });

               console.log(formattedDate);

               $(".writer").eq(i).html(data[i].USER_ID);
               $(".rs").eq(i).html(data[i].COMM_CONTENT);
               $(".writeDate").eq(i).html(formattedDate);
            }
            
            // 남은 요소 초기화
            for (let i = data.length; i < $(".writer").length; i++) {
               $(".writer").eq(i).html('');
               $(".rs").eq(i).html('');
               $(".writeDate").eq(i).html('');
            }
            
            //값 비우기
            $("#commContent").val('');
         }
      });
   });
});


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
  
   <div id="comm">
  
   <c:forEach items="${commContent }" var="commContent">
      <img class="commentProfile" src="../resources/img/commentProfile.png">&nbsp;<span
         class="writer" style="font-weight: bold">${commContent.USER_ID }</span>
      <br>
      <span class="rs">${commContent.COMM_CONTENT }</span>
ㅣ  <span class="writeDate">
	<fmt:formatDate value="${commContent.COMM_CREATE}" pattern="yyyy. MM. dd. HH:mm:ss" />
	</span>
      <hr>
   </c:forEach>
  
    </div>  


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








