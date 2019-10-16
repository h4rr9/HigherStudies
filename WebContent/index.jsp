<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>yourCareers</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Bootstrap CSS File -->
  <link href="/HigherStudies/stylesheets/bootstrap.min.css" rel="stylesheet">

  <link href="/HigherStudies/stylesheets/style3.css" rel="stylesheet">
</head>

<body>
  <header id="header">
    <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="#intro" class="scrollto">yourCareers</a></h1>
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class="menu-active"><a class="active" href="<%=response.encodeURL(request.getContextPath() + "/MainController")%>">Home</a></li>
          <li><a href='<%=response.encodeURL(request.getContextPath() + "/MainController?action=login")%>'>Login</a></li>
        </ul>
      </nav>
    </div>
  </header><!-- #header -->
  <section id="intro">
    <div class="intro-container">
      <div id="introCarousel" class="carousel  slide carousel-fade" data-ride="carousel">
        <div class="carousel-inner" role="listbox">
          <div class="carousel-item active">
            <div class="carousel-background"><img src="/HigherStudies/stylesheets/1.jpg" alt=""></div>
            <div class="carousel-container">
              <div class="carousel-content">
                <h2>We are professional</h2>
                <p>We have the best of best of the most trained operatives at our company to help your find your true path in life to success</p>
                <a class="btn-get-started scrollto" href='<%=response.encodeURL(request.getContextPath() + "/MainController?action=signup")%>'>Get Started</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</body>
</html>
