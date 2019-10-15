<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit College</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/css/select2.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/js/select2.min.js"></script>
</head>
<body>
<%@ page import="entities.College,java.util.Arrays,java.util.Set,java.util.HashSet" %>
<%
	College college = (College) request.getAttribute("college");
	Set<String> courseSet = new HashSet<String>(Arrays.asList(college.getCourses()));
	Set<String> examSet = new HashSet<String>(Arrays.asList(college.getExams()));
%>
<form method="post" action="<%=response.encodeURL(request.getContextPath() + "/CollegeController?action=edit")%>">
<input type="hidden" name="user" value="<%=session.getAttribute("user")%>"/>
<input type="hidden" name="tobemodified" value="<%=college.getName()%>"/>
<h4>Name</h4> <input type="text" name="name" value="<%=college.getName()%>"/>
<p>About</p> <textarea  rows="4" cols="50" name="about"><%=college.getAbout()%></textarea>
<p>Image</p> <input type="text" name="image" value="<%=college.getImage()%>"/>
<p>Courses:</p> 
<select class="js-example-basic-multiple js-states form-control" name="courses[]" multiple="multiple">
<option value="BTech" <%=courseSet.contains("BTech") ? "selected" : ""%>>BTech</option>
<option value="BSc" <%=courseSet.contains("BSc") ? "selected" : ""%>>BSc</option>
<option value="MBA" <%=courseSet.contains("MBA") ? "selected" : ""%>>MBA</option>
<option value="MTech" <%=courseSet.contains("MTech") ? "selected" : ""%>>MTech</option>
<option value="MSc" <%=courseSet.contains("MSc") ? "selected" : ""%>>MSc</option>
</select>
<p>Exams:</p>
<select class="js-example-basic-multiple js-states form-control" name="exams[]" multiple="multiple">
<option value="JEE Mains" <%=examSet.contains("JEE Mains") ? "selected" : ""%>>JEE Mains</option>
<option value="AEEE" <%=examSet.contains("AEEE") ? "selected" : ""%>>AEEE</option>
</select>
</p>
<input type="submit" value="submit"/>
</form>
<script>
$(document).ready(function() {
    $('.js-example-basic-multiple').select2();
});
</script>
</body>
</html>