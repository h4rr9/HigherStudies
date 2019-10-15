<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Course</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/css/select2.min.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/HigherStudies/stylesheets/style.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/js/select2.min.js"></script>

</head>
<body>
<%@ page import="entities.Course,java.util.Arrays,java.util.Set,java.util.HashSet" %>
<%
	Course course = (Course) request.getAttribute("course");
%>
<form method="post" action="<%=response.encodeURL(request.getContextPath() + "/CourseController?action=edit")%>">
<input type="hidden" name="user" value="<%=session.getAttribute("user")%>"/>
<input type="hidden" name="tobemodified" value="<%=course.getName()%>"/>
<p>Name</p>
<input type="text" name="name" value="<%=course.getName()%>"/>
<p>About</p>
<textarea  rows="4" cols="50" name="about"><%=course.getAbout()%></textarea>
<p>Image</p>
<input type="text" name="image" value="<%=course.getImage()%>"/>
<p>Prospects</p>
<textarea  rows="4" cols="50" name="prospects"><%=course.getProspects()%></textarea>
<input type="submit" value="submit"/>
</form>
<script>
$(document).ready(function() {
    $('.js-example-basic-multiple').select2();
});
</script>
</body>
</html>