<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:import url="../layout/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굿즈샵</title>


<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">

/* 굿즈샵 이미지 스타일 */
.goodsimage {
	width: 100%; 
	height: 500px; 
	position: relative;
	margin-bottom: 30px;
}

/* 굿즈샵 상품 목록 스타일 */
#goodsList {
	text-align: center;
	margin-bottom: 20px;
}


/* '굿즈샵' 문구 스타일 */
.goods {
	position: absolute;
	top: 38%; 
	left: 45%; 
	color: #fff; 
	font-weight: bold;
	font-size: 50px;
    font-family: 'KBO-Dia-Gothic_bold';
}

#goods {
  width: 225px;
  text-align: center;
  display: block;
  margin-left:10px;
  margin-right: 10px;
  margin-bottom: 80px;
  
}

/* '굿즈'문구 폰트 스타일 */
@font-face {
	font-family: 'KBO-Dia-Gothic_bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff')
		format('woff');
		
	font-weight: 700;
	font-style: normal;
}

/* 폰트 */
@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}


.col {
	margin-bottom: 10px;
}

#infos {
	font-family: 'omyu_pretty';
	font-size: 18px;
}

</style>

<body>

<div style="text-align: center;">
	<img class="goodsimage" src="../resources/img/goods.jpg">
	<h1 class="goods">굿즈샵</h1>
</div>



  	<div id="goodsList" class="row">
		<div class="col-1"></div>
		
		<div id="infos" class="row col-10">
		
			<c:forEach var="prod" items="${prodList }" begin="0" end="2">
			<div id="goods" class="col">
			<a href="./detail?prodno=${prod.PROD_NO }" id="prodNo">
			
				<c:if test="${prod.PROD_STORED_NAME ne null }" >
					<div><img alt="" src="/upload/${prod.PROD_STORED_NAME }" style="width: 400px; height: 300px; margin-bottom: 10px;"></div>
				</c:if>	
				<c:if test="${prod.PROD_STORED_NAME eq null }">
					<div><img alt="" src="" style="width: 400px; height: 300px;"></div>
				</c:if>
				<div id="goodsinfo">
					<span id="titleTag">[${prod.PROD_NAME }]</span>
					<span id="title">${prod.PROD_PRICE }원</span>
				</div>
			</a>
			</div>
			</c:forEach>
			
		</div>
		
		
		
		<div class="col-1"></div>
		</div>
		

  	<div id="goodsList" class="row">
		<div class="col-1"></div>
		
		<div id="infos" class="row col-10">
		
			<c:forEach var="prod" items="${prodList }" begin="3" end="5">
			<div id="goods" class="col">
			<a href="./detail?prodno=${prod.PROD_NO }" id="prodNo">
			
				<c:if test="${prod.PROD_STORED_NAME ne null }" >
					<div><img alt="" src="/upload/${prod.PROD_STORED_NAME }" style="width: 400px; height: 300px; margin-bottom: 10px;"></div>
				</c:if>	
				<c:if test="${prod.PROD_STORED_NAME eq null }">
					<div><img alt="" src="" style="width: 400px; height: 300px;"></div>
				</c:if>
				<div id="goodsinfo">
					<span id="titleTag">[${prod.PROD_NAME }]</span>
					<span id="title">${prod.PROD_PRICE }원</span>
				</div>
			</a>
			</div>
			</c:forEach>
			
		</div>
		<div class="col-1"></div>
		</div>




<!-- TOP으로 가기 -->
<div style="cursor:pointer; text-align:right; margin-right: 20px;" onclick="window.scrollTo(0,0);"><i class="bi bi-arrow-up-circle-fill" ></i></div>

<c:import url="../layout/paging.jsp"/>	
<c:import url="../layout/footer.jsp"/>