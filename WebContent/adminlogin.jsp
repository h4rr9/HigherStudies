<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/HigherStudies/stylesheets/style.css">
<link rel="stylesheet" href="/HigherStudies/stylesheets/style2.css">
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
			href="<%=response.encodeRedirectURL(request.getContextPath() + "/AdminController?action=login")%>">Admin Login</a>
	</div>

	<div class="container"
		style="width: 500px; margin-left: 65%; margin-top: 1%;">
		<div id="error_alert" class="alert alert-danger alert-dismissible">
			<strong><%=request.getAttribute("message")%></strong>
		</div>
	</div>

	<script>
		$('#error_alert').hide();
  	</script>

	<h2 style="text-align: center; margin-top: 6%;">Admin Login</h2>

	<div>
		<center>
			<form method="post" action="<%=response.encodeURL(request.getContextPath() + "/AdminController?action=dologin")%>">
				<div
					style="background-color: white; margin-top: 4%; height: 500px; width: 448px; border: solid; border-color: #f0ead6; border-radius: 10px;">
					<div class="field" style="margin-top: 30%;">
						<input type="text" required autocomplete="off" id="user"
							name="username" value="<%=request.getAttribute("username")%>">
						<label for="user" title="Username" data-title="Email"></label>
					<input type="password" class="form-control" placeholder="Password"
						required autocomplete="off" id="pass" name="password">
					</div>
					<input type="submit" class="btn btn-primary" style="margin-top: 2%; margin-bottom: 2%;"
						value="Login In">
				</div>
			</form>
		</center>
	</div>

	<script>
    	let str = "<%=request.getAttribute("message")%>";

		if (str != "") {
			$('#error_alert').show('fade');
			setTimeout(function() {
				$('#error_alert').hide('fade');
			}, 2000);
		}
	</script>
</body>
</html>