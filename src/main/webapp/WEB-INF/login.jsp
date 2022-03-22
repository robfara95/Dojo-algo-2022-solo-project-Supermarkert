<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Supermarket Login In</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">	
	<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
		<div class="container">
			<h1 class="text-center">Supermarket Item Price Register - Login Screen</h1>
			<div class="row"> 
				<div class="col">
					<h3>Register</h3>
					<form:form action="/registration" method="POST" modelAttribute="newUser">    		 
			    		<div class="form-group">
			    			<form:label path="name">User Name:</form:label>
			    			<form:errors class="text-danger" path="name"/>	        
			        		<form:input class="form-control" path="name"/>
			    		</div>
			    		<div class="form-group">
			    			<form:label path="email">Email:</form:label>
			    			<form:errors class="text-danger" path="email"/>	        
			        		<form:input class="form-control" path="email"/>
			    		</div>		    		 
			    		<div class="form-group">
			    			<form:label path="password">Password:</form:label>
			    			<form:errors class="text-danger" path="password"/>	        
			        		<form:input type="password" class="form-control" path="password"/>
			    		</div>	
			    		<div class="form-group">
			    			<form:label path="confirm">confirm:</form:label>
			    			<form:errors class="text-danger" path="confirm"/>	        
			        		<form:input class="form-control" path="confirm"/>
			    		</div>
			    		<input type="submit" value="Register" class="btn btn-primary mt-2"/>
			    			
					</form:form>    				
				</div>
				<div class="col">
					<h3>Login</h3>
					<c:out value="${error}"/>
					<form:form action="/login" METHOD="POST" modelAttribute="newLogin">
						<div class="form-group">
							<form:label path="email" >Email:</form:label>					
							<form:input path="email" class="form-control" />
							<form:errors path="email" class="text-danger error-space"/> 
						</div>
						
						<div class="form-group">
							<form:label path="password">Password:</form:label>					
							<form:input path="password" type="password" class="form-control" />
							<form:errors path="password" class="text-danger error-space"/> 
						</div>							
						<input type="submit" value="Login" class="btn btn-primary mt-2"/>
					</form:form>		    				
				</div>
			</div>
		</div>
</body>
</html>