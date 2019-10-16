<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="entities.Material" %>
<% Material material = (Material)request.getAttribute("material");%>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title><%=material.getName()%></title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="/HigherStudies/stylesheets/style.css">
  	<link rel="stylesheet" type="text/css" href="/HigherStudies/stylesheets/style2.css">
	<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class = "topnav">
      <a href = "<%=response.encodeURL(request.getContextPath() + "/MainController?action=search")%>">Search</a> 
      <a class = "active" href = "<%=response.encodeURL(request.getContextPath() + "/MainController?action=materials")%>">Study Material</a>
      <p style="float:right; color: white; margin-top:0.75%; margin-right:0.5%;"><%=session.getAttribute("user")%></p>
    </div>

    <div class="container">
    	</br>
    	<strong><h1 style="text-align: center;"><%=material.getName()%></h1></strong>

		<h2 style="margin-top: 5%;">About</h2>
    	<p style="margin-top: 3%;"><%=material.getAbout()%></p>
    	
    	<center>
    		<img src="<%=material.getImage()%>" style="height: 325px; width: 212.5px; margin-top: 2%;">    				
    	</center>

    	<h2 style="margin-top: 3%;">References</h2>
    	<ul style="font-size: 15px; margin-top: 3%;">
    	<% for(String reference : material.getReferences()){%>
    		<li><a href="<%=reference%>"><%=reference%></a></li>
    	<%} %>
    	</ul>
    </div>
</body>
</html>