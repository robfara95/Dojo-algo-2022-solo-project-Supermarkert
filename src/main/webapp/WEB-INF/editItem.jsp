<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Edit Item</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">	
	<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	    <div class="collapse navbar-collapse" id="navbarNav">
		    <ul class="navbar-nav nav-tabs">
		      <li class="nav-item active">
		        <a class="nav-link" href="/dashboard">Dashboard</a> 
		      </li>
		      <li class="nav-item active">
		        <a class="nav-link disabled" href="/supermarkets">Supermarket</a> 
		      </li>			      	      
		      <li class="nav-item">
		        <a class="nav-item nav-link" href="/logout">Logout</a>
		      </li>	
		    </ul>
	  	</div>
	</nav>
	
	<h1 class="text-center">Edit Item</h1>
	<h5 class="text-center">Supermarket Item Information Reported by <c:out value="${user.name}"/> on <fmt:formatDate value="${item.createdAt}" type="date" pattern="M/d/yyyy h:mm a"/></h5>
	
	<div class="container border border-primary">
			<form:form action="/items/${item.id}/edit" method="post" modelAttribute="item">						
		  		<div class="form-group row">   
		  			<div class="col-8">     		
			    		<form:label path="itemDescription">Item Description:</form:label>	    	       
			       		<form:input class="form-control" path="itemDescription"/>
			        	<form:errors class="text-danger" path="itemDescription"/>
			        </div> 	
			        <div class="col-1"> 
			        	<form:label path="price">Price:</form:label>
			        	<form:errors class="text-danger" path="price"/>
			        	<form:input class="form-control" path="price" pattern="^\d*(\.\d{0,2})?$"/>
			        </div>	   
			        <div class="col-3">
			       		<form:label path="category">Category:</form:label>
				    	<form:errors class="text-danger" path="category"/>
				    	<form:input class="form-control" path="category"/>
			        </div>
			    </div>			    
			    
			    <div class="form-group row">
			    	<div class="col">
			    		<label>Supermarket</label>		
				        <input type="text" value="${superM.name}" readonly>
				        <span>${superM.address} </span><span>${superM.city}</span><span>,${superM.state}</span>
			    	</div>
			    </div>			       
		
			    <div class="form-group row">
			    	<div class="col">   
				        <form:label path="comment">Comment:</form:label>
				        <form:errors class="text-danger" path="comment"/>
				        <form:textarea class="form-control input-fld-50" path="comment"/>
			        </div>
			    </div>			    

			    <form:input type="hidden" path="user" value="${user.id}"/>
			    <form:input type="hidden" path="supermarket" value="${supermarket.id}"/> 
			                       
			    <input type="submit" value="Submit Update" class="btn btn-primary mt-2"/>
		</form:form>		
		
	</div>
</body>
</html>