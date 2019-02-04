<%@ page language="java" contentType="text/html"%>
<%@include file="Header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<form action="<c:url value="/AddSupplier"/>" method="post">
<table align=right class="table">
  <tr> 
      <td colspan="2">
      <center><h2>Supplier</h2></center></td>
  </tr>
  <tr>
      <td>Supplier Name</td>
      <td><input type="text" name="supplierName"/></td>
  </tr>
  <tr> 
      <td>Supplier Address</td>
      <td><input type="text" name="supplierAddr"/></td>
  </tr>
  <tr> 
      <td colspan="2"> 
           <center><input type="submit" value="Add Supplier"/></center>
      </td>
  </tr>
  </table>
  </form>
  <table class="table-bordered" align="center"> 
    <tr>
    <td> Supplier ID</td>
    <td> Supplier Name</td>
    <td> Supplier Addr</td>
    <td> Operations</td>
    </tr>
    <c:forEach items="${listSuppliers}" var="supplier">
    <tr>
      <td>${supplier.supplierId}</td>
      <td>${supplier.supplierName}</td>
      <td>${supplier.supplierAddr}</td>
      <td>
         <a href="<c:url value="/editSupplier/${supplier.supplierId}"/>"class="btn btn-success">Edit</a>/
         <a href="<c:url value="/deleteSupplier/${supplier.supplierId}"/>"class="btn btn-danger">Delete</a>
      </td>   
      </tr>
    </c:forEach></table>
</body>
</html>