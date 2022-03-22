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
		      <li class="nav-item">
		        <a class="nav-item nav-link" href="/logout">Logout</a>
		      </li>	
		    </ul>
	  	</div>
	</nav>
	
	<h1 class="text-center">View Item</h1>
	
	<h5 class="text-center">Supermarket Item Information Reported by <c:out value="${user.name}"/> on <fmt:formatDate value="${item.createdAt}" type="date" pattern="M/d/yyyy h:mm a"/></h5>
	
	<div class="container border border-primary">
		<div class="form-group row">
			<div class="col-4">
				Item Description: <c:out value="${item.itemDescription}" />
			</div>
			<div class="col-2">
				price: <c:out value="${item.price}" />
			</div>			
			<div class="col-3">
				Category: <c:out value="${item.category}" />
			</div>
		</div>   
		<div class="form-group row">
			<div class="col"> 
				Comment: <c:out value="${item.comment}" />
			</div>	
		</div> 

	</div>
	"
	<h5 class="text-center">Supermarket Information</h5>
	<div class="container border border-primary">
		<div class="form-group row">
			<div class="col"> 
				<c:out value="${supermarket.name}" />
			</div>	 
		</div>		
		<div class="form-group row">
			<div class="col"> 
				<c:out value="${supermarket.address}" />		
			</div>
		</div>		
		<div class="form-group row">		
			<div class="col"> 
				<c:out value="${supermarket.city}" />,<c:out value="${supermarket.state}"/> <c:out value="${supermarket.zip}"/>		
			</div>	 
		</div> 
	</div> 
	
	<h5 class="text-center">Update and delete links</h5>
	<div class="container border border-primary">
		<div class="form-group row">
			<div class="col-2"> 
				<a href="/items/${item.id}/edit">Edit Item</a>
			</div>
			<div class="col-2"> 
				<form action="/items/${item.id}/delete" method="post">
					<input type="hidden" name="_method" value="delete">
					<input type="submit" value="Delete">								
				</form>
			</div>			
		</div>	
	</div> 
	
	<div>
		

	</div>
	
</body>
</html>