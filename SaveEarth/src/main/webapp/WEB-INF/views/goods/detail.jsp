<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp"/> 











<script>


$(function(){
	$(".increase").click(function() {
		console.log("test")

		const num = $("#num").val();
		const price = ${goodsDetail.PROD_PRICE };
	
		console.log($("#num").val());
		$.ajax({
			type: "get",

			url: "http://localhost:8888/goods/gettotal",
			data:{num:num,price:price },
			success: function(data){
				
				$(".totalprice").html(data);
					
		
			}
		})
	})
	
		$(".decrease").click(function() {
		console.log("test")

		const num = $("#num").val();
		const price = ${goodsDetail.PROD_PRICE };
	
		console.log($("#num").val());
		
		$.ajax({
			type: "get",

			url: "http://localhost:8888/goods/gettotal",
			data:{num:num,price:price },
			success: function(data){
				
				$(".totalprice").html(data);
					
		
			}
		})
	})
	
	


	

})

</script>
    

<style>

/* 게시판 메인 이미지 스타일 */
.freeimage {
	/* 이미지랑 네비게이션바 띄우기 */
	position: relative;
	width: 100%;
	height: 500px;
}

/* 이미지 안에 자유게시판 문구 스타일 */
.free {
	position: absolute;
	top: 38%; 
	left: 45%;
	color: #fff;
	font-weight: bold;
	font-size: 50px;
	font-family: 'KBO-Dia-Gothic_bold';
}



	.content{
		margin: 10%;
		margin-top: 0;
	}
	.title{
		margin: 10%;
		padding: 16%;
		border-bottom: 1px solid;
		margin-top: 0;
	}
	.left{
		float: left;
		width: 50%;
		
	}
	.right{
		float: right;
		width: 35%; 
		margin-left:15%;
		
	}
	.button{
		width: 160px;
		float: right;
		
	}
	
	.cart{
		float: left;
	}
	
	.order{
		float: right;
	}
	
	.imagetest{
		text-align: center;
		margin: 10%
	}
/*  문의하기 스타일	 */

thead {
	
    border-bottom: 1px solid black;

}
.inqtable {
	margin: 0 auto;
	width: 1200px;
}
th {
	
    text-align: center;
	
}

tbody{
	 text-align: center;
}


</style>


<style> 
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 50%;
}

.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
  text-align : end;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.inq1,.inq2{

	padding:10px;	
}

#inqTitle {
	width: 500px;
}

#inqContent{
	width:500px;
}

.inqsub{
	text-align : end;
}

.inqtext{
	    float: left;
	    
		margin-left: 10%;
}

.inqtext2{
		float: right;
		
		margin-right: 10%;
}


</style>






    




<style>

    .count {
        display: flex;
        align-items: center;
    }

    .count button {
        padding: 0px 10px;
        font-size: 16px;
        cursor: pointer;
        margin: 10px;
    }

    .count input {
        width: 40px;
        text-align: center;
    }
</style>




    
    



   
<div>
	<img class="freeimage" src="../resources/img/free.png">
	<h1 class="free">굿즈샵</h1>
</div>    

  
       
<div class="content">
	<div class="title">
		<div class="left">
			<div class="image">
			    <img src="/upload/${goodsDetail.PROD_STORED_NAME }" alt="상품이미지" class="goodsimage">
			</div>
		</div>
		<div class="right">
			<div class="summary">
			    <div>
			        <h1>${goodsDetail.PROD_NAME }</h1>
				</div>
				<div >                            	
				    <h3 class="prodprice">${goodsDetail.PROD_PRICE }원</h3>                              
			    </div>
			    <div>
			    	<h3>${goodsDetail.PROD_DETAIL }</h3>
			    </div>
			</div> 		
		              
		        
		
		             
			<div class="count">
				 <div>
					<button class="decrease" onclick="decreaseValue()">-</button>
				</div>  
				<div>  
				    <input type="text" name="num" id="num" value="1" readonly>
				</div>  
				<div>   
				    <button class="increase" onclick="increaseValue()">+</button>
				</div> 
				  	  
				 <div id="optionsDiv">
					<select id="optionSelect">
					<c:forEach items="${prodOption }" var="prodOption">
						<option value="${prodOption.PROD_OPT_NO }">Color: ${prodOption.PROD_COLOR } Size: ${prodOption.PROD_SIZE }</option>
					</c:forEach>
					</select>
				</div>      
		    </div>
			                  
			                  <!-- 옵션주기 -->
			
			
			
			
			
			
			<div class="total">
				<span>총가격 : </span>
			    <span class="totalprice" id="totalprice">${goodsDetail.PROD_PRICE }</span>
			    <span>원</span>
		    </div>
		    
		    <div class="button" id="btn_group">
		   
				<input type="button" class="cart" value="장바구니" onclick="addToCart()" id="btn_test1">
				<input type="hidden" name="prodCount" class="prodCount">
				    
				<form action="./detailbuy" method="post">
					<input type="hidden" name="prodNo" value="${goodsDetail.PROD_NO }">
					<input type="hidden" name="prodCount" value="">
					<input type="hidden" name="prodOptNo" value="">
					
					<button type="submit" class="order" id="btn_test2" onclick="detailbuy()" >구매하기</button>
			    </form>
			 </div>
		 </div>
	</div>    
	    
	                    
	                    
	                    
	 
	
	               
	
	
	       
	        
	
	<div class="imagetest">
		<c:forEach items="${detailfiles}" var="files">
			<img src="/upload/${files.PROD_STORED_NAME }" alt="상품이미지" class="goodsimage" style="width: 52%">
		</c:forEach>
	</div>
	
	
	
	
	<div style="padding : 100px">
	
					<div>
						<div class="inqtext" ><h3 >문의하기</h3></div>	
					<!-- 문의 모달버튼 -->
						<div class="inqtext2" ><input type="button" id="openModal" class="inq" value="문의하기" onclick="inquire()"></div>   
					</div>
	</div>				
<!-- 여기까지 -->	
<div>
  <table class="inqtable">
    <thead>
      <tr>
        <th>작성자</th>
        <th>제목</th>
        <th>내용</th>
        <th>답변상태</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${prodInq}" var="prodInq" varStatus="status">
        <tr>
          <td>${prodInq.USER_ID}</td>
          <td>${prodInq.INQ_TITLE}</td>
          <td>${prodInq.INQ_CONTENT}</td>
          <td>${prodInq.INQ_PROC}</td>
          <td><img id="inqtest${status.index}" src="../../resources/img/logo2.png" style="width:120px"></td>
        </tr>
        <tr>
          <td colspan="5">
            <div id="inq${status.index}" style="display: none; text-align: start;">
              답변: ${prodInq.INQ_ANSWER_CONTENT}
            </div>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>	
	</div>
	<!-- 모달로 문의하기------시작---- -->
	

<!-- 	<div><input type="button" id="openModal" class="inq" value="문의하기" onclick="inquire()"></div>     -->
	<div id="myModal" class="modal">
	  <div class="modal-content">
	    <span class="close">&times;</span>
	    
	    <form action="./writeInq" method="post">
		    <div>
		    	<h3>상품명: ${goodsDetail.PROD_NAME }</h3>
		    </div>
		    
		    <div class="inq1">
		  	  <label for="inqTitle">문의 제목</label>
		   	 <input type="text" id="inqTitle" name="inqTitle">
		    </div>
		    
		    <div class="inq2">
		    
		    
		  	  <label for="inqContent">문의 내용</label>
		  	  <textarea rows="10" cols="10" id="inqContent" name="inqContent"></textarea>
<!-- 		   	 <input type="text" id="inqContent" name="inqContent"> -->
		    </div>
	    	
	    	<input type="hidden" name="prodNo" value="${goodsDetail.PROD_NO }">
	    	<div class="inqsub">
	    		<button >문의하기</button>
	    	</div>
	    </form>
	    
	    
	  </div>
	</div>
</div>


<!-- CSS -->




 <!-- 로그인 확인 후 안되있으면 로그인 하셈 코드  -->
 <script >
function inquire() {
	 
	if(${login}){
		

		var modal = document.getElementById("myModal");
		var btn = document.getElementById("openModal");
		var span = document.getElementsByClassName("close")[0];

		btn.onclick = function() {
		  modal.style.display = "block";
		}

		span.onclick = function() {
		  modal.style.display = "none";
		}

		window.onclick = function(event) {
		  if (event.target == modal) {
		    modal.style.display = "none";
		  }
		}

		
	} else {
		alert("로그인이 필요");
		let url = '../member/login'
		location.href = url;
	  }
}

</script> 




<!-- 모달로 문의하기------끝---- -->


<script>
     /* JavaScript 코드 더하기 빼기 */
    function decreaseValue() {
        let inputField = document.getElementById('num');
        let currentValue = parseInt(inputField.value);
        if (currentValue > 1) {
            inputField.value = --currentValue;
        }
    }

    function increaseValue() {
        let inputField = document.getElementById('num');
        let currentValue = parseInt(inputField.value);
        inputField.value = ++currentValue;
    }
	 /* 스크립트로 상품 번호랑 갯수 넘기기 */
    function addToCart() {
		 
	if(${login}){
		
		
		 alert("장바구니 담기 완료");
			let prodOptNo = document.getElementById('optionSelect').value;
	        let prodno = '${goodsDetail.PROD_NO}';
	        let prodCount = document.getElementById('num').value;
	        let url = './addCart?prodno=' + prodno + '&prodCount=' + prodCount + '&prodOptNo=' + prodOptNo;
	        location.href = url;	
	
		
	} else {
		alert("로그인이 필요");
		let url = '../member/login'
		location.href = url;
	  }
			 
			 	
    }    
	 
	function detailbuy(){
		let prodOptNo = document.getElementById('optionSelect').value;
        
        let prodCount = document.getElementById('num').value;
		
		
		$('input[name=prodCount]').attr('value',prodCount);
		$('input[name=prodOptNo]').attr('value',prodOptNo);
	
	} 
</script>




<!-- 문의하기 스크립트 -->
<script>
  $(document).ready(function() {

    <c:forEach items="${prodInq}" varStatus="status">
      $("#inqtest${status.index}").click(function() {

        var inqStatus = "${prodInq[status.index].INQ_PROC}";
        <%--  답변완료일떄 토글 동작을 수행 --%>
        if (inqStatus === "답변완료") {
          $("#inq${status.index}").toggle();
        }
      });
    </c:forEach>
  });
</script>
    
    
    
<c:import url="../layout/footer.jsp"/> 