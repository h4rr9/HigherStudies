<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Material File</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/css/select2.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/js/select2.min.js"></script>
</head>
<body>
<form method="post" action="<%=response.encodeURL(request.getContextPath() + "/MaterialController?action=addfile")%>" encType="multipart/form-data">
<input type="hidden" name="user" value="<%=session.getAttribute("user")%>"/>
<p>File</p>
<input type="file" name="file" value="Select"/>
<br>
<input type="submit" value="upload"/>
</form>
</body>
</html>