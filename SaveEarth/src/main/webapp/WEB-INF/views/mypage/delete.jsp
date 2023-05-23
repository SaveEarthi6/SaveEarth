<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:import url="../layout/header.jsp"></c:import>


<!-- jQuery 2.2.4  -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>

<style type="text/css">

</style>

</head>
<body>
<h1 style="text-align: center;">마이페이지 회원탈퇴</h1>
<hr>

탈퇴 아이디 확인

<table border="1">

<thead>
<tr>
	<th>아이디</th>
	<th>"id"</th>
</tr>
</thead>

<tbody>
<tr>
	<th>이름</th>
	<th>"nick"</th>
</tr>
</tbody>

</table>

<c:import url="../layout/footer.jsp"></c:import>