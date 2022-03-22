<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Add Supermarket</title>
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
		      <li class="nav-item">
		        <a class="nav-item nav-link" href="/supermarkets">Supermarket</a>
		      </li>
		      <li class="nav-item">
		       <a class="nav-item nav-link" href="/logout">Logout</a>	
		      </li>
		    </ul>
	  	</div>
		</nav>
	<div class="container">
		<h1 class="text-center">Supermarket Update</h1>
		 
		<form:form action="/supermarkets/${supermarket.id}/edit" method="post" modelAttribute="supermarket">
			
		<form:input type="hidden" path="id"/>	
	
  		<div class="form-group row">     	     	
	    	<form:label path="name">Name:</form:label>	
	    	<form:errors class="text-danger" path="name"/>	    	      
	       	<form:input class="form-control input-fld-30" path="name"/>	        	     
	    </div>
	    
	    <div class="form-group row">
	        <form:label path="address">Address:</form:label>
	        <form:errors class="text-danger" path="address"/>
	        <form:input class="form-control input-fld-50" path="address"/>
	    </div>	     

	    <div class="form-group row">
	        <form:label path="city">City:</form:label>
	        <form:errors class="text-danger" path="city"/>
	        <form:input class="form-control input-fld-30" path="city"/>
	    </div>   
	    
	    <div class="form-group row">	    		   
			<form:label path="state">State </form:label>
			<form:errors path="state" class="text-danger"/>	
			<form:input class="form-control input-fld-5" path="state" maxlength="2"/> 
	    </div> 	    
	 
	    <div class="form-group row">
	        <form:label path="zip">Postal Code:</form:label>
	        <form:errors class="text-danger" path="zip"/>
	        <form:input class="form-control input-fld-10" path="zip"/>
	    </div> 	    
	    <input type="submit" value="Update" class="btn btn-primary mt-2"/>
	    
	</form:form>  
	
	</div>

</body>
</html>