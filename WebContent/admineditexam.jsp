<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Exam</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/css/select2.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/js/select2.min.js"></script>
</head>
<body>
<%@ page import="entities.Exam,java.util.Arrays,java.util.Set,java.util.HashSet" %>
<%
	Exam exam = (Exam) request.getAttribute("exam");
	Set<String> portionSet = new HashSet<String>(Arrays.asList(exam.getPortions()));
%>
<form method="post" action="<%=response.encodeURL(request.getContextPath() + "/ExamController?action=edit")%>">
<input type="hidden" name="user" value="<%=session.getAttribute("user")%>"/>
<input type="hidden" name="tobemodified" value="<%=exam.getName()%>"/>
<p>Name</p>
<input type="text" name="name" value="<%=exam.getName()%>"/>
<p>About</p>
<textarea  rows="4" cols="50" name="about"><%=exam.getAbout()%></textarea>
<p>Image</p>
<input type="text" name="image" value="<%=exam.getImage()%>"/>
<p>Portions:</p> 
<select class="js-example-basic-multiple js-states form-control" name="portions[]" multiple="multiple">
<option value="Physics" <%=portionSet.contains("Physics") ? "selected" : ""%>>Physics</option>
<option value="Maths" <%=portionSet.contains("Maths") ? "selected" : ""%>>Maths</option>
<option value="Chemistry" <%=portionSet.contains("Chemistry") ? "selected" : ""%>>Chemistry</option>
<option value="Verbal" <%=portionSet.contains("Verbal") ? "selected" : ""%>>Verbal</option>
<option value="Quantitative" <%=portionSet.contains("Quantitative") ? "selected" : ""%>>Quantitative</option>
</select>
<input type="submit" value="submit"/>
</form>
<script>
$(document).ready(function() {
    $('.js-example-basic-multiple').select2();
});
</script>
</body>
</html>