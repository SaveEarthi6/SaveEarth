<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div id="campList">
	<div class="nav">
		<button id="navButton" type="button" class="btn btn-outline-success preface">전체</button>
		<button id="navButton" type="button" class="btn btn-outline-success preface">진행중</button>
		<button id="navButton" type="button" class="btn btn-outline-success preface">마감</button>
		
	    <span class="search">
	        <input type="text" name="search" class="search_input">
	        <button type="button" name="search_btn" class="search_btn"><i class="bi bi-search"></i></button>
	    </span>
		
	</div>
	

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


	
</div>
