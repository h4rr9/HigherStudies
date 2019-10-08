<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Study Materials</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="/HigherStudies/stylesheets/style.css">
  	<link rel="stylesheet" type="text/css" href="/HigherStudies/stylesheets/style2.css">
	<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ page import="entities.Material, java.util.ArrayList" %>
<%
	ArrayList<Material> materialList = (ArrayList<Material>)request.getAttribute("materials");
	int rows = (materialList.size() / 3) + 1;
%>
    <div class = "topnav">
      <a href = "<%=response.encodeURL(request.getContextPath() + "/MainController?action=search")%>">Search</a>
      <a class = "active" href = "<%=response.encodeURL(request.getContextPath() + "/MainController?action=materials")%>">Study Material</a>
      <p style="float: right; color: white;"><%=session.getAttribute("user")%></p>
    </div>

    <div class="container" style="margin-top: 4%; margin-bottom: 4%;">
    <%for(int i=0;i<rows;i++){%>
      <div class="row" style="margin-top: 4%">
      	<%
      		for(int j=0;j<3;j++){
      			if((3*i + j) < materialList.size()){ 
      				String name = materialList.get(3 * i + j).getName();
      	%>
        <div class="col-4">
          <center>
            <a href="<%=response.encodeURL(request.getContextPath() + "/PageController?type=material&page=" + name)%>">
              <div class="card" style="width: 212.5px; height: 325px; background-color: #A09BE7;">
                <span style="text-align: center; color: white; margin-top: 65%; font-size: 20px;"><%=name%></span>
              </div>
            </a>
          </center>
        </div>
        <%}
      			}%>
      </div>
      <%}%>
    </div>
</body>
</html>