<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="/HigherStudies/stylesheets/style2.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container" style="width: 500px;margin-left: 65%; margin-top: 1%;">
        <div id="error_alert" class="alert alert-danger alert-dismissible">
            <strong><%=request.getAttribute("message")%></strong>
        </div>
    </div>

    <script>
        $('#error_alert').hide();
    </script>

	<form method="post" action="<%= response.encodeURL(request.getContextPath() + "/UserController?action=createaccount") %>" class="container">
		<h1 style="margin-top: 10%; text-align: center;">User Sign Up</h1>
		<div
			style="margin-top: 10%; border: solid; border-color: #f0ead6; border-radius: 10px; padding: 20px;">
			<div class="row">
				<div class="col-6">
					<div class="field">
						<input type="text" required autocomplete="off" id="firstname"
							name="firstname" value="<%=request.getAttribute("firstname")%>"> <label for="firstname"
							title="First Name" data-title="First Name"></label>
					</div>
				</div>
				<div class="col-6">
					<div class="field">
						<input type="text" required autocomplete="off" id="lastname"
							name="lastname" value="<%=request.getAttribute("lastname")%>"> <label for="lastname" title="Last Name"
							data-title="Last Name"></label>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<div class="field">
						<input type="text" required autocomplete="off" id="email"
							name="email" value="<%=request.getAttribute("email")%>"> <label
							for="email" title="Email" data-title="Email"></label>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-6">
					<div class="field">
						<input type="password" required autocomplete="off" id="password"
							name="password" value="<%=request.getAttribute("password")%>"> <label
							for="password" title="Password" data-title="Password"></label>
					</div>
				</div>
				<div class="col-6">
					<div class="field">
						<input type="password" required autocomplete="off"
							id="confpassword" name="repeatpassword" value="<%=request.getAttribute("repeatpassword")%>"> <label for="confpassword"
							title="Confirm Password" data-title="Confirm Password"></label>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-6">
					<div class="field">
						<input type="date" required autocomplete="off" id="dob" name="dob" value="<%=request.getAttribute("dob")%>">
						<label for="password" title="" data-title="Date of Birth"></label>
					</div>
				</div>
				<div class="col-6">
					<div class="field">
						<input type="number" required autocomplete="off" id="number"
							name="number" value="<%=request.getAttribute("number")%>"> <label
							for="number" title="Phone Number (10 digits)"
							data-title="Phone Number"></label>
					</div>
				</div>
			</div>
			<input type="submit" class="btn btn-primary" style="margin-top: -3%;"
				value="Sign Up" />
		</div>
	</form>
	<script>
		let str = "<%=request.getAttribute("message")%>";
		
		if(str != ""){
			$('#error_alert').show('fade');
            setTimeout(function () {
                $('#error_alert').hide('fade');
            }, 2000);
		}
		
	</script>
</body>
</html>