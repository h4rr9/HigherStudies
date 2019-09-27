<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Material</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/css/select2.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/js/select2.min.js"></script>
</head>
<body>
<form method="post" action="<%=response.encodeURL(request.getContextPath() + "/MaterialController?action=create")%>">
<input type="hidden" name="user" value="<%=session.getAttribute("user")%>"/>
<p>Name</p>
<input type="text" name="name"/>
<p>About</p>
<textarea  rows="4" cols="50" name="about"></textarea>
<p>Image</p>
<input type="text" name="image"/>
<p>References:</p>
<select class="js-example-basic-multiple js-states form-control" name="references[]" multiple="multiple">
<option value='default'>add new entry</option>
</select>
<input type="submit" value="submit"/>
</form>
<script>
$(document).ready(function() {
    $('.js-example-basic-multiple').select2({tags : true});
});
</script>
</body>
</html>