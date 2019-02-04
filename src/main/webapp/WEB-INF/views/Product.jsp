<%@ page language="java" contentType="text/html"%>
<%@include file="Header.jsp"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<br/><br/>

<form:form action="InsertProduct" modelAttribute="product" method="post" enctype="multipart/form-data">
<table align="center" class="table-bordered">
     <tr>
        <td colspan="2"><center>Product Information</center></td>
     </tr>
     <tr>
         <td>Product Name</td>
         <td><form:input path="productName"/></td>
      </tr>
      <tr>
          <td>Price</td>
          <td><form:input path="price"/></td>
       </tr>
       <tr>
          <td>Stock</td>
          <td><form:input path="stock"/></td>
       </tr>
       <tr>
           <td>Category</td>
           <td> 
              <form:select path="categoryId">
                   <form:option value="0" label="---Select from the List---"/>
                   <form:options items="${categoryList}"/>
              </form:select>
            </td>
         </tr>
         <tr>
             <td>Supplier</td>
             <td><form:input path="supplierId"/></td>
          </tr>
          <tr>
              <td>Product Desc</td>
              <td><form:input path="productDesc"/></td>
           </tr>
           
           <tr>
              <td colspan="2"><center><input type="submit" value="AddProduct"/></center></td>
           </tr>
        </table>
        </form:form>
        
        
        <table align="center" class="table-bordered">
        <tr>
           <td>Product ID</td>
           <td>Product Name</td>
           <td>Price</td>
           <td>Stock</td>
           <td>Supplier</td>
           <td>Operations</td>
         </tr>
         <c:forEach items="${ProductList}" var="product">
         <tr>
            <td>${product.productId}</td>
            <td>${product.productName}</td>
            <td>${product.price}</td>
            <td>${product.stock}</td>
            <td>${product.supplierId}</td>
            <td>
         <a href="<c:url value="/editProduct/${product.productId}"/>"class="btn btn-success">Edit</a>/
                  <a href="<c:url value="/deleteProduct/${product.productId}"/>"class="btn btn-danger">Delete</a>
      </td>   
          </tr>
          </c:forEach>
          </table>
          </body>
          </html>