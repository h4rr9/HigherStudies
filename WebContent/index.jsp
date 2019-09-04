<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="/HigherStudies/stylesheets/style.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="topnav">
		<a class="active"
			href="<%=response.encodeURL(request.getContextPath() + "/Controller")%>">Home</a>
		<button class="btn btn-primary"
			style="float: right; margin-top: 0.25%; margin-right: 1%;"
			onclick='window.location.href="<%=response.encodeURL(request.getContextPath() + "/UserController?action=login")%>"'>Login</button>
	</div>

	<div class="bg-text" style="margin-top: -10%;">
		<h1 style="font-size: 50px">yourCareers</h1>
		<p>Our mission is to help you make the right decision</p>
	</div>

	<div class="bg-text" style="margin-top: 5%; height: 300px;">
		<h3>What we offer</h3>
		<div class="row" style="margin-top: 10%;">
			<div class="col">
				<div class="bg-text2">
					<h4>Universities</h4>
				</div>
			</div>
			<div class="col">
				<div class="bg-text2">
					<h4>Courses</h4>
				</div>
			</div>
			<div class="col">
				<div class="bg-text2">
					<h4>Exams</h4>
				</div>
			</div>
			<div class="col">
				<div class="bg-text2">
					<h4>Study Materials</h4>
				</div>
			</div>
		</div>
	</div>

	<div>
		<button id="btn-search" class="btn btn-outline-primary"
			style="margin-left: 45.5%; margin-top: 40%"
			onclick='window.location.href="<%=response.encodeURL(request.getContextPath() + "/UserController?action=signup")%>"'>Sign
			Up</button>
	</div>
</body>
</html>