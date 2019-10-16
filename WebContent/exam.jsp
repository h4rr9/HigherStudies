<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="entities.Exam" %>
<% Exam exam = (Exam)request.getAttribute("exam");%>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title><%=exam.getName()%></title>
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
      <a href = "<%=response.encodeURL(request.getContextPath() + "/MainController?action=materials")%>">Study Material</a>
      <p style="float:right; color: white; margin-top:0.75%; margin-right:0.5%;"><%=session.getAttribute("user")%></p>
    </div>

    <div class="container">
    	<h1 style="margin-top: 2%; text-align: center;"><%=exam.getName()%></h1>

    	<h3 style="margin-top: 2%;">About the Exam</h3>
    	<p><%=exam.getAbout()%></p>

		<div class="row" style="margin-top: 2%;">
  			<img src="<%=exam.getImage()%>" style="height: 325px; width: 212.5px;">
    	</div>

    	<h3 style="margin-top: 2%;">Portion to prepare</h3>
    	<ul>
    	<%for(String material : exam.getPortions()){ %>
    		<li><a href="<%=response.encodeURL(request.getContentType() + "/PageController?type=material&page=" + material) %>"><%=material%></a></li>
		<%} %>
    	</ul>
    </div>
</body>
</html>