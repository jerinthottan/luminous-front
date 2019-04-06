<%@ page language="java" contentType="text/html"%>
<%@include file="Header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<body style="background-image: url('<c:url value='resources/images/bgproject.jpg'/>')" >

<form action="<c:url value="/UpdateCategory"/>" method="post">
<table align="center" class="table">
   <tr>
    <td colspan="2">
        <center><h3>Category</h3></center>
    </td>
    <tr>
      <td> Category ID </td>
      <td><input type="text" name="cID" value="${category.categoryID}" readonly/></td>
     </tr>
    <tr>
      <td> Category Name </td>
      <td><input type="text" name="cName" value="${category.categoryName}"/></td>
     </tr>
     <tr>
       <td> Category Description </td>
      <td><input type="text" name="cDesc" value="${category.categoryDesc}"/></td>
     </tr>
     <tr>
       <td colspan="2">
          <center><input type="submit" value="Update Category"/></center>
       </td>
      </tr>
</table>
</form>

</body>
</html>