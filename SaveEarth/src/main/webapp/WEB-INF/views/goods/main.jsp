<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp"/>
<h1>굿즈 메인</h1>


	<div id="prodList" class="row">
		<div class="col-1"></div>
		
		<div id="camps" class="row col-10">
		
			<c:forEach var="prod" items="${prodList }" begin="0" end="2">
			<div id="camp" class="col">
			<a href="./detail?prodno=${prod.prodNo }" id="campTag">
				<div><img alt="" src="" style="width: 400px; height: 300px;"></div>
				<div id="campTitle">
					<span id="titleTag">[${prod.prodName }]</span>
					<span id="title">${prod.prodPrice }</span>
				</div>
			</a>
			</div>
			</c:forEach>
			
		</div>
		
		<div class='col-1'></div>
	</div>

	<div id="prodList" class="row">
		<div class="col-1"></div>
		
		<div id="camps" class="row col-10">
		
			<c:forEach var="prod" items="${prodList }" begin="3" end="5">
			<div id="camp" class="col">
			<a href="./detail?prodno=${prod.prodNo }" id="campTag">
				<div><img alt="" src="" style="width: 400px; height: 300px;"></div>
				<div id="campTitle">
					<span id="titleTag">[${prod.prodName }]</span>
					<span id="title">${prod.prodPrice }원</span>
				</div>
			</a>
			</div>
			</c:forEach>
			
		</div>
		
		<div class='col-1'></div>
	</div>

<c:import url="./paging.jsp"/>
	
	

<c:import url="../layout/footer.jsp"/>