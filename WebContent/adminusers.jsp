<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Users</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/HigherStudies/stylesheets/style.css">
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ page import="entities.User,java.util.ArrayList"%>
<% ArrayList<User> users = (ArrayList<User>)request.getAttribute("users"); %>

<div class = "topnav">
      <a class = "active" href = "<%=response.encodeURL(request.getContextPath() + "/AdminController?action=users")%>">Users</a>
      <a href = "<%=response.encodeURL(request.getContextPath() + "/AdminController?action=courses")%>">Courses</a>
      <a href = "<%=response.encodeURL(request.getContextPath() + "/AdminController?action=colleges")%>">Colleges</a>
      <a href = "<%=response.encodeURL(request.getContextPath() + "/AdminController?action=exams")%>">Exams</a>
      <a href = "<%=response.encodeURL(request.getContextPath() + "/AdminController?action=materials")%>">Materials</a>
      <p style="float: right; color: white;"><%=session.getAttribute("user")%></p> 
 </div>

 <div class="container">

        <div class="container" style="width: 500px;margin-left: 65%">
            <div id="load_failed_alert" class="alert alert-danger alert-dismissible">
                <strong>Could not load. Please Try again</strong>
            </div>
        </div>

        <script>
            $('#load_failed_alert').hide();
        </script>

        <table class="table table-striped table-bordered" style="margin-top: 5%;">
            <thead style="text-align: center;">
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>DOB</th>
                    <th>Number</th>
                    <th></th>
                </tr>
            </thead>

            <tbody>
            <%for(User user : users){ %>
                <tr>
                    <td style="font-size: 15px"><%=user.getFirstname()%></td>
                    <td style="font-size: 15px"><%=user.getLastname()%></td>
                    <td style="font-size: 15px"><%=user.getEmail()%><br></td>
                    <td style="font-size: 15px"><%=user.getPassword()%><br></td>
                    <td style="font-size: 15px"><%=user.getDob()%><br></td>
                    <td style="font-size: 15px"><%=user.getNumber()%><br></td>
                    <td>
                    	<form onsubmit="return confirm('Are you Sure?');" action="<%=response.encodeURL(request.getContextPath() + "/AccountController?action=delete")%>" method="post">
                    		<input type="hidden" name="name" value="<%=session.getAttribute("name")%>">
                    		<input type="hidden" name="email" value="<%=user.getEmail()%>">
                    		<input type="submit" class="btn btn-danger" class="border border-danger" value="Delete">
                    	</form>
                    </td>
                </tr>
            <%}%>
            </tbody>
        </table>
    </div>
</body>
</html>