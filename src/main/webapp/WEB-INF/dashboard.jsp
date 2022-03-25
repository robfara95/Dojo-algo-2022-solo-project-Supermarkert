<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Dashboard Supermarket</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">	
	<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	    <div class="collapse navbar-collapse" id="navbarNav">
		    <ul class="navbar-nav nav-tabs">
		      <li class="nav-item active">
		        <a class="nav-link disabled" href="/dashboard">Dashboard</a> 
		      </li>
		      <li class="nav-item active">
		        <a class="nav-link" href="/items/add"><button class="btn btn-primary">Add Item</button></a>		        
		      </li>		
		      <li class="nav-item active">
		        <a class="nav-link" href="/supermarkets">Supermarket</a> 
		      </li>	
		      <li class="nav-item active">
		        <a class="nav-link" href="/category">Category</a> 
		      </li>			      
		      <li class="nav-item">
		        <a class="nav-item nav-link" href="/logout">Logout</a>
		      </li>	
		    </ul>
	  	</div>
	</nav>
	 
	<h1 class="text-center">Supermarket Price Dashboard - <c:out value="${user.name}"/></h1>
	
	<div class="container">
	 	<form:form action="/items/query" METHOD="POST" modelAttribute="searchFields">
			<div class="form-group row">							
				<div class="col-4">
					<form:label path="item">Item</form:label>					
					<form:input path="item" class="form-control" />
					<form:errors path="item" class="text-danger error-space"/> 
				</div>	
		
				<div class="col-3">
					<form:label path="category">Category</form:label>					
					<form:input path="category" class="form-control" />
					<form:errors path="category" class="text-danger error-space"/> 
				</div>	
				<div class="col-1"> 
					<p><p>
					<input type="submit" value="Search" class="btn btn-primary form-control"/>	
				</div>	
				
			</div>				
			
		</form:form>
	</div>		
	
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>			
					<th>Item Description</th>
					<th>Category</th>
					<th>Price</th>	
					<th>Supermarket</th>
					<th>address</th>				
					<th>Date Reported</th>
					<th>User</th>					
				</tr>
			</thead>
			<tbody>
				<c:forEach var = "item" items="${items}">
					<tr>						
						<td><a href="/items/view/${item.id}"><c:out value = "${item.itemDescription}"/></a></td>
						<td><c:out value = "${item.category}"/></td> 	
						<td><c:out value = "${item.price}"/></td>							
						<td><a href="/supermarkets/${item.supermarket.id}/edit/"><c:out value = "${item.supermarket.name}"/></a></td>
						<td><c:out value = "${item.supermarket.address} ${item.supermarket.city}, ${item.supermarket.state}" /></td>				
						<td><fmt:formatDate value="${item.createdAt}" type="date" pattern="M/d/yyyy h:mm a"/></td>
						<td><c:out value = "${item.user.name}"/></td>		
						
						<td><div>
							<a href="/items/${item.id}/edit" ><button class="btn btn-primary">Edit</button></a>
    						</div>	
    					</td>
	   					<td>
    						<form action="/items/${item.id}/delete" method="post">
								<input type="hidden" name="_method" value="delete">
								<input type="submit" value="Delete" class="btn btn-danger">								
							</form>
    					</td>    					    					
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>