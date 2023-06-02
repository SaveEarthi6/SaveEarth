<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



	<div id="campList" class="row">
		<div class="col-1"></div>
		
		<div id="camps" class="row col-10">
		
			<c:forEach var="campaign" items="${campList }" begin="0" end="2">
			<div id="camp" class="col">
			<a href="./detail?campno=${campaign.CAMP_NO }" id="campTag">
				<c:if test="${campaign.CAMP_STORED_NAME ne null }">
					<div><img alt="" src="/upload/${campaign.CAMP_STORED_NAME }" style="width: 400px; height: 300px;"></div>
				</c:if>
				<c:if test="${campaign.CAMP_STORED_NAME eq null }">
					<div><img alt="" src="" style="width: 400px; height: 300px;"></div>
				</c:if>
				<div id="campTitle">
					<span id="titleTag">[${campaign.CAMP_STATE }]</span>
					<span id="title">${campaign.CAMP_TITLE }</span>
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
			<a href="./detail?campno=${campaign.CAMP_NO }" id="campTag">
				<c:if test="${campaign.CAMP_STORED_NAME ne null }">
					<div><img alt="" src="/upload/${campaign.CAMP_STORED_NAME }" style="width: 400px; height: 300px;"></div>
				</c:if>
				<c:if test="${campaign.CAMP_STORED_NAME eq null }">
					<div><img alt="" src="" style="width: 400px; height: 300px;"></div>
				</c:if>
				<div id="campTitle">
					<span id="titleTag">[${campaign.CAMP_STATE }]</span>
					<span id="title">${campaign.CAMP_TITLE }</span>
				</div>
			</a>
			</div>
			</c:forEach>
		</div>
		
		<div class='col-1'></div>
			
	</div>
	
		<div id="paging">
		<ul class="pagination pagination-sm justify-content-center">
	
		<%-- 첫 페이지로 이동 --%>
		<c:if test="${paging.curPage ne 1}">
		   <li class ="page-item"><span class="page-link first">&laquo;</span></li>
		</c:if>
		
		<%-- 현재 페이지가 1이라면 첫 페이지로 이동하는 기능을 비활성화한다 --%>
		<c:if test="${paging.curPage eq 1}">
		   <li class="page-item disabled"><span class="page-link first">&laquo;</span></li>
		</c:if>
		
		<%-- ./list페이지로 이동할때 현재 페이지 정보를 쿼리스트링형태로 전송함 --%>
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
		   <c:if test="${paging.curPage eq i }">
		      <li class="page-item active usable"><span class="page-link number">${i }</span></li>
		   </c:if>
		   <c:if test="${paging.curPage ne i }">
		      <li class="page-item usable"><span class="page-link number">${i }</span></li>
		   </c:if>   
		</c:forEach>
		
		<%-- 끝 페이지로 이동 --%>
		<c:if test="${paging.curPage ne paging.totalPage}">
		   <li class="page-item"><span class="page-link end">&raquo;</span></li>
		</c:if>
		
		<%-- 현재 페이지가 끝페이지라면 끝 페이지로 이동하는 기능을 비활성화한다 --%>
		<c:if test="${paging.curPage eq paging.totalPage}">
		   <li class="page-item disabled"><span class="page-link end">&raquo;</span></li>
		</c:if>
		
		</ul>
	</div>

