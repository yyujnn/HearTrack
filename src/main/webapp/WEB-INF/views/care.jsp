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
	    <h1>건강정보 페이지</h1>
	    <p>information</p>
	  </div>
	</div>
	<div class="container">
		<div class="card">
		  <div class="card-header">user01</div>
		  <div class="card-body">
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
		  		<c:forEach var="result" items="${result}">
			  		<tr>
						<td>${result.health_num}</td>	  		
						<td>${result.blood_pressure_high}</td>	  		
						<td>${result.blood_pressure_low}</td>	  		
						<td>${result.blood_sugar}</td>
						<td>${result.weight}</td>
						<td>${result.height}</td>
						<td>${result.BMI}</td>
						<td>${result.input_date}</td>
			  		</tr>
			  		
		  		</c:forEach>
		  		<tr>
			  		<td colspan = "8">
			  			<button type="button" class="btn btn-outline-info btn-sm" onclick = "location.href='${cpath}/login'">메인화면</button>
			  		</td>
		  		</tr>
		  	</table>
		  </div>
		  <div class="card-footer">건강정보 페이지</div>
		</div>
	</div>

</body>
</html>