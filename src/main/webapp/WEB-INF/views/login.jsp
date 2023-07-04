<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="resources/vendor/jquery/jquery.min.js"></script>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h2>SIGN IN</h2>
		<form action="${cpath}/index" method="post">
			<div class="form-group">
				<label for="id">ID :</label> <input type="text" name="user_id"
					class="form-control" id="user_id">
			</div>
			<div class="form-group">
				<label for="pw">PW :</label> <input type="password" name="user_pw"
					class="form-control" id="user_pw">
			</div>
			<button type="submit" class="btn btn-primary">Sign in</button>
		</form>
	</div>

</body>
</html>