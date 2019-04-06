<%@ page language="java" contentType="text/html"%>
<%@include file="Header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
</head>
<body>
<div class="container">
<table class="table table-bordered">


<tr class="danger">
<td colspan="6"><center>Your Cart</center></td>

</tr>

<tr>
<td> Product Id</td>
<td> Product Name</td>
<td> Quantity  </td>
<td> Price </td>
<td> SubTotal </td>
<td> Operation </td> 
</tr>
<c:forEach items="${cartList}" var="cart">
<form action="<c:url value="/updateCart/${cart.cartId}"/>" method="get">
<tr class="info">
      <td>${cart.productId}</td>
      <td> ${cart.productName}</td>
      <td><input type="text" value="${cart.quantity}" name="quantity"></td>
      <td>${cart.price}</td>
      <td>${cart.price*cart.quantity}</td>
      <td>
        <input type="submit" value="UPDATE" class="btn btn-success"/>
         <a href="<c:url value="/deleteCart/${cart.cartId}"/>" class="btn btn-danger">DELETE</a>
      </td>
</tr>
</form>
 </c:forEach>
<tr class="warning">
<td colspan="4">Total Purchase Amount</td>
<td colspan="2">${grandTotal}</td>
</tr>
<tr class="info">
<td colspan="3">
  <center> <a href="<c:url value="/productDisplay"/>" class="btn btn-success">Continue Shopping</a></center>
    </td>
    <td colspan="3">
   <center> <a href="<c:url value="/checkout"/>" class="btn btn-success">Check Out</a></center>
  </td> 
</tr>
</table>
</div>

</body>
</html>