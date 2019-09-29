<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Exam</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/css/select2.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/js/select2.min.js"></script>
</head>
<body>
<%@page import="java.util.ArrayList, entities.Material" %>
<% ArrayList<Material> materials = (ArrayList<Material>)request.getAttribute("materials"); %>
<form method="post" action="<%=response.encodeURL(request.getContextPath() + "/ExamController?action=create")%>">
<input type="hidden" name="user" value="<%=session.getAttribute("user")%>"/>
<p>Name</p>
<input type="text" name="name"/>
<p>About</p>
<textarea  rows="4" cols="50" name="about"></textarea>
<p>Image</p>
<input type="text" name="image"/>
<p>Portions:</p> 
<select class="js-example-basic-multiple js-states form-control" name="portions[]" multiple="multiple">
<%for(Material material : materials){ %>
<option value="<%=material.getName()%>"><%=material.getName()%></option>
<%} %>
</select>
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