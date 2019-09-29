<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <title>Home</title>
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
<div class = "topnav">
      <a class = "active" href = "search.html">Search</a>
      <a href = "material.html">Study Material</a>
    </div>

    <div class = "container search">
      <h1 style="text-align: center; margin-top: 25%;">Search for colleges,courses,exams and more</h1>
      <input class="form-control" id="searchparameter" type="text" style="width: 1000px; height: 60px; margin-left: 5%; margin-top: 5%; :placeholder{color:red;}" placeholder="Search here">
      <button id="btn-search" class="btn btn-outline-primary" style="margin-left: 45%; margin-top: 1%;" onclick="route()">Search</button>
    </div>
</body>
</html>