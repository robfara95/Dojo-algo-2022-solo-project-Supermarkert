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
	
	<h1 class="text-center">Supermarket Add, Update and Delete - <c:out value="${user.name}"/> </h1>
	
	<div class="container border border-primary">		
		<div>
		<form:form action="/supermarkets/add" method="post" modelAttribute="supermarket">	
	  		<div class="form-group row col-xs-2">   
	  			<div class="col-6">  	     	
			    	<form:label path="name">Name:</form:label>	    	       
			       	<form:input class="form-control" path="name"/>
			        <form:errors class="text-danger" path="name"/>	  
		        </div>   
		    </div>
		    
		    <div class="form-group row">
		    	<div class="col-6">
			        <form:label path="address">Address:</form:label>
			        <form:errors class="text-danger" path="address"/>
			        <form:input class="form-control"  path="address"/>
		        </div>
		    </div>	     
	
			<div class="form-group row">
				<div class="col-4">
			        <form:label path="city">City:</form:label>
			        <form:errors class="text-danger" path="city"/>
			        <form:input class="form-control" path="city"/>
			    </div>   
			    <div class="col-2">	    		   
					<form:label path="state">State:</form:label>
					<form:errors path="state" class="text-danger"/>			 
					<form:select class="form-control" path="state" name="state">
						<option>State Selection</option>
						<c:forEach items="${allStates}" var="states">
							<option value="${states.abv}">${states.abv} - ${states.description}</option>
						</c:forEach>
					</form:select>			 
			    </div> 
			    <div class="col-2">
			        <form:label path="zip">Postal Code:</form:label>
			        <form:errors class="text-danger" path="zip"/>
			        <form:input class="form-control" path="zip"/>
			    </div> 	    
		    </div>
	

		    <input type="submit" value="Add" class="btn btn-primary mt-2"/>
	</form:form>
	</div>    
	</div>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Supermarket</th>
					<th>Address</th>
					<th>city</th>
					<th>State</th>
					<th>Postal</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var = "store" items="${supermarkets}">
					<tr>
						<td><c:out value = "${store.name}"/></td> 
						<td><c:out value = "${store.address}"/></td> 
						<td><c:out value = "${store.city}"/></td>
						<td><c:out value = "${store.state}"/></td>
						<td><c:out value = "${store.zip}"/></td>
						<td><div>
							<a href="/supermarkets/${store.id}/edit" ><button class="btn btn-primary">Edit</button></a>
    						</div>	
    					</td>
	   					<td>
    						<form action="/supermarkets/${store.id}/delete" method="post">
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