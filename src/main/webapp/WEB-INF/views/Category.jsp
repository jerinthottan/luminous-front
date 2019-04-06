
<%@ page language="java" contentType="text/html"%>
<%@include file="Header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<html>
<form action="<c:url value="/AddCategory"/>" method="post">


<div class="container">
    <div class="row">
		<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-primary">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Category</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form">
                    <fieldset>
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="CategoryName" name="CategoryName" type="text">
			    		</div>
			    		<div class="form-group">
			    			<input class="form-control" placeholder="CategoryDesc" name="CategoryDesc" type="text">
			    		</div>
			    		<input class="btn btn-primary " type="submit" value="AddCategory">
			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>
  </form>
  <div class="container">
    <div class="row">
        <div class="col-md-12">
            <legend>Manage Category</legend>
        </div>
    </div>
    
	
	<div class="row">
	    <div class="col-md-12">
	        <table class="table table-responsive table-hover table-bordered ">
<thead>
      <tr class="info">
    <td> Category ID</td>
    <td> Category Name</td>
    <td> Category Desc</td>
    <td> Operations</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listCategories}" var="category">
    <tr>
      <td>${category.categoryID}</td>
      <td>${category.categoryName}</td>
      <td>${category.categoryDesc}</td>
      <td>
         <a href="<c:url value="/editCategory/${category.categoryID}"/>"class="btn btn-success">Edit</a>
         <a href="<c:url value="/deleteCategory/${category.categoryID}"/>"class="btn btn-danger">Delete</a>
      </td>   
      </tr>
    </c:forEach></table>
</body>
</html>