<%@ page language="java" contentType="text/html"%>
<%@include file="Header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="<c:url value="/UpdateCategory"/>" method="get">
<table align="center" class="table">
   <tr>
    <td colspan="2">
        <center><h3>Supplier</h3></center>
    </td>
    <tr>
      <td> Supplier ID </td>
       <td><input type="text" name="supplierID" value="${supplier.supplierId}" readonly/></td>
     </tr>
    <tr>
      <td> Supplier Name </td>
      <td><input type="text" name="SupplierName" value="${supplier.supplierName}"/></td>
     </tr>
     <tr>
       <td> Supplier Address </td>
      <td><input type="text" name="Supplier Address" value="${supplier.supplierAddr}"/></td>
     </tr>
     <tr>
       <td colspan="2">
          <center><input type="submit" value="UpdateSupplier"/></center>
       </td>
      </tr>
</table>
</form>