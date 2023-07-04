<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<script src="resources/vendor/jquery/jquery.min.js"></script>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<div class="jumbotron jumbotron-fluid">
	  <div class="container">
	    <h1>관리자 페이지</h1>
	    <p>information</p>
	  </div>
	</div>
	<div class="container">
		<div class="card">
		  <div class="card-header">userinfo</div>
		  <div class="card-body">
		  <h5>health</h5>
		  	<table class="table table-bordered table-hover">
		  		<tr>
					<th>번호</th>	 		
					<th>최고혈압</th>	  		
					<th>최저혈압</th>	  		
					<th>혈당</th>	  		
					<th>몸무게</th>
					<th>키</th>
					<th>BMI</th>
					<th>입력날짜</th>	  		
		  		</tr>
		  		<c:forEach items="${result}" var="result" >
		  		<tr>
		  			<td>${result.h_num}</td>	  		
					<td>${result.bp_high}</td>	  		
					<td>${result.bp_row}</td>	  		
					<td>${result.bs}</td>
					<td>${result.weight}</td>
					<td>${result.height}</td>
					<td>${result.bmi}</td>
					<td>${result.input_date}</td>
		  		</tr>
		  		</c:forEach>
		  		
		  		
		  	</table>
		  	
		  	<h5>community</h5>
		  	<table class="table table-bordered table-hover">
		  		<tr>
					<th>번호</th>	 		
					<th>제목</th>	  		
					<th>내용</th>	  		
					<th>작성일</th>	  		
					<th>카테고리</th>
		  		</tr>
		  		<c:forEach items="${comlist}" var="com" >
		  		<tr>
		  			<td>${com.p_num}</td>
		  			<td>${com.title}</td>
		  			<td>${com.content}</td>
		  			<td>${com.input_date}</td>
		  			<td>${com.category}</td>
		  		
		  		</tr>
		  		</c:forEach>
		  		
	
	
		  		
		  		
		  	</table>
		  	<tr>
			  		<td colspan = "5">
			  			<button type="button" class="btn btn-outline-info btn-sm" onclick = "location.href='${cpath}/'">메인화면</button>
			  		</td>
		  		</tr>
		  	
		  </div>
		  <div class="card-footer">관리자 페이지</div>
		</div>
	</div>

</body>
</html>