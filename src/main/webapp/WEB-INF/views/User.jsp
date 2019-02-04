<%@ page language="java" contentType="text/html"%>
<%@include file="Header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<body>

<form action="<c:url value="/AddUser"/>" method="post">
<table align=center class="table">
  <tr> 
      <td colspan="2">
      <center><h2>User Registration</h2></center></td>
  </tr>
  <tr>
      <td>User Name</td>
      <td><input type="text" name="uName"/></td>
  </tr>
   <tr>
      <td>User Password</td>
      <td><input type="password" name="uPwd"/></td>
  </tr>
  <tr> 
      <td>User Address</td>
      <td><input type="text" name="uAddr"/></td>
  </tr>
  <tr> 
      <td colspan="2"> 
           <center><input type="submit" value="Adduser"/></center>
      </td>
  </tr>
  </table>
  </form>
   <table class="table-bordered" align="center"> 
    <tr>
    <td> UserName</td>
    <td>Password</td>
    <td> UserAddr</td>
    <td> Operations</td>
    </tr>
    <c:forEach items="${listUserDetails}" var="User">
    <tr>
      <td>${User.UserId}</td>
      <td>${User.UserName}</td>
      <td>${User.UserPassword}</td>
      <td>${User.UserAddr}</td>
      <td>
         <a href="<c:url value="/editUserDetails/${User.UserrId}"/>"class="btn btn-success">Edit</a>/
         <a href="<c:url value="/deleteUserDetails/${User.UserId}"/>"class="btn btn-danger">Delete</a>
      </td>   
      </tr>
    </c:forEach></table>
  </body>
</html>