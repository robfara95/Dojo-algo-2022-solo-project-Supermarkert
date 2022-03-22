<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Add Items</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">	
	<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	    <div class="collapse navbar-collapse" id="navbarNav">
		    <ul class="navbar-nav nav-tabs">
		      <li class="nav-item">
		        <a class="nav-link" href="/dashboard">Dashboard</a> 
		      </li>
		      <li class="nav-item active">
		        <a class="nav-link" href="/supermarkets">Supermarket</a> 
		      </li>		      
		      <li class="nav-item">
		        <a class="nav-item nav-link" href="/logout">Logout</a>
		      </li>	
		    </ul>
	  	</div>
	</nav>
	
	<h1 class="text-center">Add Item for <c:out value="${user.name}" /></h1>
	
	<div class="container border border-primary">
			<form:form action="/items/add" method="post" modelAttribute="item">	
		  		<div class="form-group row">   
		  			<div class="col-6">     		
			    		<form:label path="itemDescription">Item Description:</form:label>	    	       
			       		<form:input class="form-control" path="itemDescription"/>
			        	<form:errors class="text-danger" path="itemDescription"/>
			        </div> 	
			        <div class="col-2"> 
			        	<form:label path="price">Price:</form:label>
			        	<form:errors class="text-danger" path="price"/>
			        	<form:input class="form-control" path="price" pattern="^\d*(\.\d{0,2})?$"/>
			        </div>	   
			        <div class="col-4"> 
			        	<form:label path="category">Select Category:</form:label>
				    	<form:errors class="text-danger" path="category"/>
				    	<form:select class="form-control" path="category">
				    		<form:option value="" label="-Please Select-"/>
							<c:forEach items="${allCategories}" var="cat">
								<option value="${cat.category}">${cat.category}</option>
							</c:forEach>
						</form:select>		 
		    		</div> 			            
			    </div>		
	
			    <div class="form-group row">
			    	<div class="col-6">   
				        <form:label path="comment">Comment:</form:label>
				        <form:errors class="text-danger" path="comment"/>
				        <form:textarea class="form-control" path="comment"/>
			        </div>			   
					<div class="col-6">
			        	<form:label path="supermarket">Select Supermarket:</form:label>
			        	<form:errors class="text-danger" path="supermarket"/>			        	
				        <form:select class="form-control" path="supermarket">				        	
				        	<form:option value="0" label="-Please Select-"/>			        		        	
							<c:forEach items="${supermarkets}" var="supermarket">
								<option value="${supermarket.id}">${supermarket.name} ${supermarket.city}, ${supermarket.state} </option>
							</c:forEach>
						</form:select>		
					</div>		
			    </div>				     
			    
			    <form:input type="hidden" path="user" value="${user.id}"/>			     	    
			    <input type="submit" value="Add" class="btn btn-primary mt-2"/>
		</form:form>
	</div>

</body>
</html>