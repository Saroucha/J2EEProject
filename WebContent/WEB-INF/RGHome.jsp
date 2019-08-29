<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>RG Page</title>
 <link rel="stylesheet" href="css/bootstrap.css" type="text/css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
</head>
<% 
if((request.getSession(false).getAttribute("RG")== null) )
{
%>
<jsp:forward page="/WEB-INF/Login.jsp"></jsp:forward>
<%} %>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Espace Administration "RG" </a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Accueil</a></li>
    
       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Formations <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="RegisterFormation">Ajouter une formation</a></li>
        </ul>
      </li>
       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Salles<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="ConsulSalle">Consulter les salle</a></li>
        </ul>
      </li>
       <li><a href="Logout">Déconnexion !</a></li>
    </ul>
  </div>
</nav>

<div class="container" align="center">
<h2>Bienvenue à votre espace "RG" !!</h2>
</div>
</body>
</html>