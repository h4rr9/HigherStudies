<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Material</title>
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
<form method="post" action="<%=response.encodeURL(request.getContextPath() + "/MaterialController?action=create")%>">
<input type="hidden" name="user" value="<%=session.getAttribute("user")%>"/>
<h1 style="text-align: center; margin-top:2%;">Add Material</h1>
<div class = "container" style = "margin-top:3%; border: solid; border-color: #f0ead6; border-radius: 10px; padding: 20px;">
<p>Name</p> <input class = "form-control" type="text" name="name" style="margin-top:1%;"/>
<p>About</p> <textarea  rows="4" cols="50" name="about" class = "form-control" style="margin-top:1%;"></textarea>
<p>Image</p> <input class = "form-control" type="text" name="image" style="margin-top:1%;"/>
<p>References</p>
<select class="js-example-basic-multiple js-states form-control" name="references[]" multiple="multiple">
<option value='default'>add new entry</option>
</select>
<input class="btn btn-outline-secondary" type="submit" value="Add" style="margin-top:1%;"/>
</div>
</form>
<script>
$(document).ready(function() {
    $('.js-example-basic-multiple').select2({tags : true});
});
</script>
</body>
</html>