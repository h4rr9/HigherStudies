<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add College</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/css/select2.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/js/select2.min.js"></script>
</head>
<%@page import="java.util.ArrayList, entities.Course, entities.Exam" %>
<%
	ArrayList<Course> courses=(ArrayList<Course>)request.getAttribute("courses");
	ArrayList<Exam> exams=(ArrayList<Exam>)request.getAttribute("exams");
%>
<body>
<form method="post" action="<%=response.encodeURL(request.getContextPath() + "/CollegeController?action=create")%>">
<input type="hidden" name="user" value="<%=session.getAttribute("user")%>"/>
<p>Name</p>
<input type="text" name="name"/>
<p>About</p>
<textarea  rows="4" cols="50" name="about"></textarea>
<p>Image</p>
<input type="text" name="image"/>
<p>Courses:</p> 
<select class="js-example-basic-multiple js-states form-control" name="courses[]" multiple="multiple">
<%for(Course course: courses){ %>
<option value="<%=course.getName()%>"><%=course.getName()%></option>
<%}%>
</select>
<p>Exams:</p>
<select class="js-example-basic-multiple js-states form-control" name="exams[]" multiple="multiple">
<%for(Exam exam: exams){ %>
<option value="<%=exam.getName()%>"><%=exam.getName()%></option>
<%}%>
</select>
</p>
<input type="submit" value="submit"/>
</form>
<script>
$(document).ready(function() {
    $('.js-example-basic-multiple').select2({
    	tags: true
    });
});
</script>
</body>
</html>