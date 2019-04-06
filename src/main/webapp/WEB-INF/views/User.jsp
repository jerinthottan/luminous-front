<%@ page language="java" contentType="text/html"%>
<%@include file="Header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<form action="<c:url value="/AddUser"/>" method="post">
<table align=center class="table">
  <tr> 
      <td colspan="2">
      <center><h2>User Registration</h2></center></td>
  </tr>
  <tr>
      <td>User Name</td>
      <td><input type="text" name="userName"/></td>
  </tr>
   <tr>
      <td>User Password</td>
      <td><input type="password" name="userPassword"/></td>
  </tr>
  <tr> 
      <td>User Address</td>
      <td><input type="text" name="userAddress"/></td>
  </tr>
  <tr> 
      <td colspan="2"> 
           <center><input type="submit" value="Add User"/></center>
      </td>
  </tr>
  </table>
  </form>
  </body>
</html>