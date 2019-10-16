<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="entities.College" %>
<% College college = (College)request.getAttribute("college");%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title><%=college.getName()%></title>
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
<body>
	<div class = "topnav">
      <a href = "<%=response.encodeURL(request.getContextPath() + "/MainController?action=search")%>">Search</a> 
      <a href = "<%=response.encodeURL(request.getContextPath() + "/MainController?action=materials")%>">Study Material</a>
      <p style="float:right; color: white; margin-top:0.75%; margin-right:0.5%;"><%=session.getAttribute("user")%></p>
    </div>

    <div class="container">
    	<h1 style="margin-top: 2%; text-align: center;"><%=college.getName()%></h1>

    	<h3 style="margin-top: 2%;">About the university</h3>
    	<p><%=college.getAbout()%></p>

    	<div class="row" style="margin-top: 2%;">
    		
    			<img src="<%=college.getImage()%>" style="height: 325px; width: 212.5px;">
    	
    	</div>

    	<h3 style="margin-top: 2%;">Courses Offered</h3>
    	<ul>
    	    <%for(String course : college.getCourses()){ %>
    		<li><a href="<%=response.encodeURL(request.getContextPath() + "/PageController?type=course&page=" + course)%>"><%=course%></a></li>
    		<%}%>
    	</ul>

    	<h3 style="margin-top: 2%;">Entrance Exam</h3>
    	<ul>
    		<%for(String exam : college.getExams()){ %>
    		<li><a href="<%=response.encodeURL(request.getContextPath() + "/PageController?type=exam&page=" + exam)%>"><%=exam%></a></li>
    		<%}%>
    	</ul>

    </div>
</body>
</html>