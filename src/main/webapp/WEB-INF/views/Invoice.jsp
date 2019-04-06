    
<%@page language="java" contentType="text/html"%>
<%@include file="Header.jsp" %>
  
 <html>
 <body style="background-image: url('<c:url value='resources/images/bgproject.jpg'/>')" >
 
  <div class="container">
  <table class="table table-bordered" align="center">
  
  <tr class="danger">
  <td colspan="5"><Center>Invoice</Center></td>
  </tr>
  <tr class="info">
  <td>ORDER ID</td>
  <td>MOS98600${invoice.orderId}</td>
  <td>Date</td>
  <td colspan="2">${invoice.orderDate}</td>
  </tr> 
  <tr class="warning">
  <td colspan="5"><h3>Order Items</h3></td>
  </tr>
  <tr>
<td> Product Name</td>
<td> Quantity  </td>
<td> Price </td>
<td> SubTotal </td> 
</tr>
<c:forEach items="${cartList}" var="cart">

<tr class="info">
      <td> ${cart.productName}</td>
      <td>${cart.quantity}</td>
      <td>${cart.price}</td>
      <td>${cart.price*cart.quantity}</td>
     
     
</tr>

 </c:forEach>
<tr class="warning">
<td colspan="4">Total Purchase Amount</td>
<td colspan="1">${grandTotal}/-</td>
</tr>
  <tr class="warning">
<td colspan="5"><h3>Shipping Address</h3></td>

</tr>

<tr class="info">

<td>
     Address 
</td>
<td colspan="4">
${address}
  
   </td>
    </tr>
  
  </table>
</div>

</body>
</html>