<%@ page language="java" contentType="text/html"%>
<%@include file="Header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<form action="<c:url value="/AddSupplier"/>" method="post">
<div class="container">
    <div class="row">
		<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-primary">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Supplier</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form">
                    <fieldset>
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="Supplier Name" name="supplierName" type="text">
			    		</div>
			    		<div class="form-group">
			    		    <input class="form-control" placeholder="Supplier Address" name="supplierAddr" type="text">
			    		</div>
			    		<input class="btn btn-primary" type="submit" value="Add Supplier">
			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>
</form>
  
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
<script src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>


<div class="container">
    <div class="row">
        <div class="col-md-12">
            <legend>Manage Product</legend>
        </div>
    </div>
    
	
	<div class="row">
	    <div class="col-md-12">
	        <table class="table table-responsive table-hover table-bordered ">
    <thead>
      <tr class="info">
          <td> Supplier ID</td>
          <td> Supplier Name</td>
          <td> Supplier Address</td>
           <td> Operations</td>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${listSuppliers}" var="supplier">
    <tr>
      <td>${supplier.supplierId}</td>
      <td>${supplier.supplierName}</td>
      <td>${supplier.supplierAddr}</td>
      <td>
         <a href="<c:url value="/editSupplier/${supplier.supplierId}"/>"class="btn btn-success">Edit</a>
         <a href="<c:url value="/deleteSupplier/${supplier.supplierId}"/>"class="btn btn-danger">Delete</a>
      </td>   
      </tr>
    </c:forEach>
     
    </tbody>
  </table>
	    </div>
	</div>
</div>
</body>
</html>