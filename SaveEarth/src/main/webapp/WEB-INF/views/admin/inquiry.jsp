<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:import url="../layout/adminheader.jsp"/>

 <script >


</script> 

</head>
<body>
<table id= "board" class= "table table-hover text-center">

	<tr style= "background-color: #59A8D9; color: white;">
		<th style="width: 20px;">글번호</th>
		<th style="width: 20px;">문의 제목</th>
		<th style="width: 20px;">문의 내용</th>
		<th style="width: 20px;">문의 답변하기</th>
		<th style="width: 20px;">문의 답변상태</th>
		
	</tr>
<tbody>
<c:forEach items="${prodinq}" var="prodinq" >

			<tr>
				<td>${prodinq.inqNo }</td>
				<td>${prodinq.inqTitle}</td>
				<td>${prodinq.inqContent}</td>
				<td><a href = "./inquiryWrite?inqNo=${prodinq.inqNo}"><button>답변</button></a></td>
				<td>${prodinq.inqProc}</td>
			</tr>

</c:forEach>
</tbody>
</table>	


  



<c:import url="../layout/footer.jsp"></c:import>


</body>

</html>