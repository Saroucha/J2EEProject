<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<% 
if((request.getSession(false).getAttribute("Globale")== null) )
{
%>
<jsp:forward page="/WEB-INF/Login.jsp"></jsp:forward>
<%} %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Consulation utilisateur</title>
<link rel="stylesheet" href="css/bootstrap.css" type="text/css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Espace Administration "Globale" </a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="#">Accueil</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Utilisateurs <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="RegisterSevlet">Ajouter un utilisateur</a></li>
          <li><a href="ConsultationUser">Consulter les utilisateurs</a></li>
        </ul>
      </li>
       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Formations <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="ConsulFormation">Consulter les réservations</a></li>
          <li><a href="SalleByFormateur.jsp">Consultation des formations</a></li>
          <li><a href="RegisterFormation">Ajouter une formation</a></li>
        </ul>
      </li>
       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Salles<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="ConsulSalle">Consultation des salles</a></li>
        </ul>
      </li>
       <li><a href="Logout">Déconnexion !</a></li>
    </ul>
  </div>
</nav>
<div class="container" align="center">
	<h3>Liste des Utilisateurs</h3>
	</div>
	<table class="table table-hover">
    <thead>
      <tr>
        <th>Nom</th>
        <th>Prénom</th>
        <th>Email</th>
        <th>Password</th>
        <th>Rôle</th>
      </tr>
    </thead>
    <c:forEach var="user" items="${data}">
    <tbody>
      <tr>
        <td>${user.getNom()}</td>
     
       <td>${user.getPrenom()}</td>
     
        <td>${user.getEmail()}</td>
     
        <td>${user.getMotDePasse()}</td>
      
        <td>${user.getRole()}</td>
      </tr>
    </tbody>
    </c:forEach>
  </table>
	
</body>
</html>