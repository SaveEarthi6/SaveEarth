<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



	<div id="campList" class="row">
		<div class="col-1"></div>
		
		<div id="camps" class="row col-10">
		
			<c:forEach var="campaign" items="${campList }" begin="0" end="2">
			<div id="camp" class="col">
			<a href="./detail?campno=${campaign.campNo }" id="campTag">
				<div><img alt="" src="" style="width: 400px; height: 300px;"></div>
				<div id="campTitle">
					<span id="titleTag">[${campaign.campState }]</span>
					<span id="title">${campaign.campTitle }</span>
				</div>
			</a>
			</div>
			</c:forEach>
			
		</div>
		
		<div class='col-1'></div>
	</div>

	<div id="campList" class="row">
		<div class="col-1"></div>
		
		<div id="camps" class="row col-10">
		
			<c:forEach var="campaign" items="${campList }" begin="3" end="5">
			<div id="camp" class="col">
			<a href="./detail?campno=${campaign.campNo }" id="campTag">
				<div><img alt="" src="" style="width: 400px; height: 300px;"></div>
				<div id="campTitle">
					<span id="titleTag">[${campaign.campState }]</span>
					<span id="title">${campaign.campTitle }</span>
				</div>
			</a>
			</div>
			</c:forEach>
			
		</div>
		
		<div class='col-1'></div>
	</div>

<c:import url="./paging.jsp"/>
	

