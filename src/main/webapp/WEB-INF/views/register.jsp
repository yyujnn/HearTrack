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
        <div class="card-header">ADMIN</div>
        <div class="card-body">
           <table class="table table-bordered table-hover">
              <tr>
               <th>id</th>           
               <th>name</th>           
               <th>age</th>
               <th>gender</th>
                          
              </tr>
              <c:forEach items="${userlist}" var="list" >
              <tr>
                 <td>${list.user_id}</td>
                 <td>${list.user_name}</td>
                 <td>${list.user_age}</td>
                 <td>${list.user_gender}</td>
                 <td><button class="btn btn-info" onclick="location.href='${cpath}/userInfo?user_id=${list.user_id}'">건강정보</button></td>
              </tr>
              </c:forEach>
              
              <tr>
                 <td colspan = "5">
                    <button type="button" class="btn btn-outline-info btn-sm" onclick = "location.href='${cpath}/'">메인화면</button>
                 </td>
              </tr>
           </table>
        </div>
        <div class="card-footer">관리자 페이지</div>
      </div>
   </div>

</body>
</html>