<%@ page language="java" contentType="text/html"%>
<%@include file="Header.jsp" %>
  
<html>

<div class="row">
  <c:forEach items = "${productList}" var="product" >

    <div class = "col-sm-4 col-md-3">
      <a href = "<c:url value="/productDetailsDisplay/${product.productId}" />" class = "thumbnail">
         <img src="<c:url value="/resources/images/${product.productId}.jpg" />" style=" max-height:250px;min-height:250px; alt = "Generic placeholder thumbnail">
      </a>
       <p align="center"> ${product.productId} </p>
      <p align="center"> ${product.productName} </p>
      <p align="center"> Price : INR ${product.price}/- </p>
      <p align="center"> Stock : ${product.stock} </p>
      
    </div>     
  </c:forEach>
</div> 
</body>
</html>