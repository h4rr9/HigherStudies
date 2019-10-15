<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Results</title>
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
<%@ page import="java.util.ArrayList, entities.College, entities.Course, entities.Exam" %>

<%
	ArrayList<College> collegeList = (ArrayList<College>) request.getAttribute("colleges");
	ArrayList<Course> courseList = (ArrayList<Course>) request.getAttribute("courses");
	ArrayList<Exam> examList = (ArrayList<Exam>) request.getAttribute("exams");
	
	int college_count = collegeList.size();
	int course_count = courseList.size();
	int exam_count = examList.size();

%>

<div class = "topnav">
      <a class = "active" href = "<%=response.encodeURL(request.getContextPath() + "/MainController?action=search")%>">Search</a>
      <a href = "<%=response.encodeURL(request.getContextPath() + "/MainController?action=materials")%>">Study Material</a>
      <p style="float: right; color: white;"><%=session.getAttribute("user")%></p>
    </div>

    <div class="container">
    <form method="POST" action="<%=response.encodeURL(request.getContextPath() + "/MainController?action=search")%>">
    	<div style="margin-top: 3%; margin-left: 20%;">
			<div class="row">
				
		    		<div class="col-8"><input type="text" class="form-control" placeholder="Search here" name="searchparameter" id="searchparameter"></div>
		    		<div class="col-1"><input type="submit" class="btn btn-primary" value="Search "/></div>
	    		
	    	</div>
    	</div>
    </form>
    	<div style="margin-top: 5%; margin-left: 10%;">
    		<div class="row">
	    		<div class="col-2">
	    			<table class="table table-striped">
	    				<thead>
	    					<th style="text-align: center;">Topics</th>
	    				</thead>
	    				<tbody>
	    					<tr><td>All<span style="float: right;"><%=(college_count + course_count + exam_count)%></span></td></tr>
	    					<tr><td>Courses<span style="float: right;"><%=course_count%></span></td></tr>
	    					<tr><td>Colleges<span style="float: right;"><%=college_count%></span></td></tr>
	    					<tr><td>Exams<span style="float: right;"><%=exam_count%></span></td></tr>
	    				</tbody>
	    			</table>
	    		</div>
	    		<div class="col-10">
	    		<%for(int i=0;i<college_count;i++){%>
	    			<a href="<%=response.encodeURL(request.getContextPath() + "/PageController?type=college&page=" + collegeList.get(i).getName())%>" style="color: black; text-decoration: none;">
	    				<div class="card" style="width: 100%; height: 175px; margin-top: 2%;">
	    					<div class="row">
	    						<div class="col-9">
	    							<h2 style="margin-top: 0.0125%"><%=collegeList.get(i).getName()%></h2>
	    							<p>Category : <em>College</em></p>		
	    						</div>
	    						<div class="col-3">
	    							<img src="<%=collegeList.get(i).getImage()%>" style="width: 100%; height: 100%;">
	    						</div>
	    					</div>
              			</div>
	    			</a>
	    		<%}%>
	    		<%for(int i=0;i<course_count;i++){%>
	    			<a href="<%=response.encodeURL(request.getContextPath() + "/PageController?type=course&page=" + courseList.get(i).getName())%>" style="color: black; text-decoration: none;">
	    				<div class="card" style="width: 100%; height: 175px; margin-top: 2%;">
	    					<div class="row">
	    						<div class="col-9">
	    							<h2 style="margin-top: 0.0125%"><%=courseList.get(i).getName()%></h2>
	    							<p>Category : <em>Course</em></p>		
	    						</div>
	    						<div class="col-3">
	    							<img src="<%=courseList.get(i).getImage()%>" style="width: 100%; height: 100%;">
	    						</div>
	    					</div>
              			</div>
	    			</a>
	    		<%}%>
	    		<%for(int i=0;i<exam_count;i++){%>
	    			<a href="<%=response.encodeURL(request.getContextPath() + "/PageController?type=exam&page=" + examList.get(i).getName())%>" style="color: black; text-decoration: none;">
	    				<div class="card" style="width: 100%; height: 175px; margin-top: 2%;">
	    					<div class="row">
	    						<div class="col-9">
	    							<h2 style="margin-top: 0.0125%"><%=examList.get(i).getName()%></h2>
	    							<p>Category : <em>Exam</em></p>		
	    						</div>
	    						<div class="col-3">
	    							<img src="<%=examList.get(i).getImage()%>" style="width: 100%; height: 100%;">
	    						</div>
	    					</div>
              			</div>
	    			</a>
	    		<%}%>
	    		</div>
	    	</div>
	    	<br>
	    	<br>
    	</div>
    </div>
</body>
</html>