<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="entities.Course" %>
<% Course course = (Course)request.getAttribute("course");%>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title><%=course.getName()%></title>
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
      <p style="float: right; color: white;"><%=session.getAttribute("user")%></p>
    </div>

    <div class="container">
    	<h1 style="margin-top: 2%; text-align: center;"><%=course.getName()%></h1>

    	<h3 style="margin-top: 2%;">About the course</h3>
    	<p><%=course.getAbout()%></p>
    	
    	<div class="row" style="margin-top: 2%;">
  			<img src="<%=course.getImage()%>" style="height: 325px; width: 212.5px;">
    	</div>

    	<h3 style="margin-top: 2%;">Future Prospects</h3>
    	<p><%=course.getProspects()%></p>

    </div>
</head>
<body>

</body>
</html>