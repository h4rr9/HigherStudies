<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <title>Home</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="/HigherStudies/stylesheets/style.css">
  <link rel="stylesheet" type="text/css" href="/HigherStudies/stylesheets/style2.css">
  <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <style>
body {
	background-image: url("/HigherStudies/stylesheets/3.jpg");
        background-repeat:no-repeat;
       background-size:cover;
} 
</style>
</head>
<body>
<%
	String name = (String)session.getAttribute("user");

	if(name == null){
		response.sendRedirect("/HigherStudies");
	}
%>
<div class = "topnav">
      <a class = "active" href = "<%=response.encodeURL(request.getContextPath() + "/MainController?action=search")%>">Search</a>
      <a href = "<%=response.encodeURL(request.getContextPath() + "/MainController?action=materials")%>">Study Material</a>
      <p style="float:right; color: white; margin-top:0.75%; margin-right:0.5%;"><%=session.getAttribute("user")%></p>
    </div>

    <div class = "container search">
    <form method="POST", action="<%=response.encodeURL(request.getContextPath() + "/MainController?action=search")%>">
      <h1 style="text-align: center; margin-top: 25%; color:white;">Search for colleges, courses and more...</h1>
      <input class="form-control" name="searchparameter" id="searchparameter" type="text" style="width: 1000px; height: 60px; margin-left: 5%; margin-top: 5%; :placeholder{color:red;}" placeholder="Search here">
      <input type="submit" value="Search" id="btn-search" class="btn btn-outline-primary" style="margin-left: 45%; margin-top: 1%;"/>
    </form>
    </div>
</body>
</html>