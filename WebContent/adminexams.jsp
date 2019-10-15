<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Exams</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/HigherStudies/stylesheets/style.css">
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@page import="entities.Exam, java.util.ArrayList, java.util.Arrays"%>
<%ArrayList<Exam> exams=(ArrayList<Exam>)request.getAttribute("exams");%>

<div class = "topnav">
      <a href = "<%=response.encodeURL(request.getContextPath() + "/AdminController?action=users")%>">Users</a>
      <a href = "<%=response.encodeURL(request.getContextPath() + "/AdminController?action=courses")%>">Courses</a>
      <a href = "<%=response.encodeURL(request.getContextPath() + "/AdminController?action=colleges")%>">Colleges</a>
      <a class = "active" href = "<%=response.encodeURL(request.getContextPath() + "/AdminController?action=exams")%>">Exams</a>
      <a href = "<%=response.encodeURL(request.getContextPath() + "/AdminController?action=materials")%>">Materials</a>
      <p style="float:right; color: white; margin-top:0.75%; margin-right:0.5%;"><%=session.getAttribute("user")%></p> 
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
                    <th>Exam Name</th> 
                    <th>About</th>
                    <th>Image  Link</th>
                    <th>Portions</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>

            <tbody>
                <%for(Exam exam : exams){ %>
                <tr>
                    <td style="font-size: 15px"><%=exam.getName()%></td>
                    <td style="font-size: 15px"><%=exam.getAbout()%></td>
                    <td style="font-size: 15px"><%=exam.getImage()%></td>
                    <td style="font-size: 15px"><%=Arrays.toString(exam.getPortions())%><br></td>
                    <td>
                    	<form onsubmit="return confirm('Are you Sure?');" action="<%=response.encodeURL(request.getContextPath() + "/ExamController?action=delete")%>" method="post">
                    		<input type="hidden" name="user" value="<%=session.getAttribute("user")%>">
                    		<input type="hidden" name="name" value="<%=exam.getName()%>">
                    		<input type="submit" class="btn btn-danger" class="border border-danger" value="Delete">
                    	</form>
                    </td>
                    <td>
                    	<form method="get" action="<%=response.encodeURL(request.getContextPath() + "/ExamController")%>">
                    		<input type="hidden" name="action" value="edit">
                    		<input type="hidden" name="user" value="<%=session.getAttribute("user")%>">
                    		<input type="hidden" name="name" value="<%=exam.getName()%>">
                    		<input type="submit" class="btn btn-danger" class="border border-danger" value="Edit">
                    	</form>
                    </td>
                </tr>
            	<%}%>
            </tbody>	
        </table>
        
        <form method="get" action="<%=response.encodeURL(request.getContextPath() + "/ExamController")%>">
        	<input type="hidden" name="action" value="add">
        	<input type="hidden" name="user" value="<%=session.getAttribute("user")%>">
        	<input type="submit" value="Add" class="btn btn-primary">
        </form>
	</div>
</body>
</html>