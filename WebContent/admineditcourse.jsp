<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Course</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/css/select2.min.css" rel="stylesheet" />
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