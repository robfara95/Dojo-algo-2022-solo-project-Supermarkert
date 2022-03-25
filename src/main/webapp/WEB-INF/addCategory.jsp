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
	
	<h1 class="text-center">Category Add and Display</h1>	
	<div class="container border border-primary">		 
		<form:form action="/category/add" method="post" modelAttribute="category1">	
	  		<div class="form-group row col-xs-2">   
	  			<div class="col-6">  	     	
			    	<form:label path="category">Category:</form:label>	    	       
			       	<form:input class="form-control" path="category"/>
			        <form:errors class="text-danger" path="category"/>	  
		        </div>   
		    </div>	
		    <input type="submit" value="Add" class="btn btn-primary mt-2"/>
		</form:form>
	</div>	 
	
	<div class="container border border-primary">
		<table class="table table-striped">
			<thead>
				<tr>				
					<th>Category</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var = "cat" items="${categories}">
					<tr>						
						<td><c:out value = "${cat.category}"/></td>			    					
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
</body>
</html>