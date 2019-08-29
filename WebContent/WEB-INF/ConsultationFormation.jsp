<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%
	if ((request.getSession(false).getAttribute("RG") == null && request
			.getSession(false).getAttribute("Globale") == null)) {
%>
<jsp:forward page="/WEB-INF/Login.jsp"></jsp:forward>
<%
	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Consultation de Formation</title>
<link rel="stylesheet" href="css/bootstrap.css" type="text/css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Espace Administration "Globale"
				</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="#">Accueil</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Utilisateurs <span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="RegisterSevlet">Ajouter un utilisateur</a></li>
						<li><a href="ConsultationUser">Consulter les utilisateurs</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Formations <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="SalleByFormateur.jsp">Consulter les réservations</a></li>
						<li><a href="ConsulFormation">Consultation des
								formations</a></li>
						<li><a href="RegisterFormation">Ajouter une formation</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Salles<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="ConsulSalle">Consultation des salles</a></li>
					</ul></li>
				<li><a href="Logout">Déconnexion !</a></li>
			</ul>
		</div>
	</nav>

	<div class="container" align="center">
		<h3>Liste des formations</h3>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Libellé</th>
				<th>Date du début</th>
				<th>Date de fin</th>
				<th>Formateur</th>
				<th>Salle</th>
				<th>Classe</th>
			</tr>
		</thead>
		<c:forEach var="formateur" items="${data}">
			<tbody>
				<tr>
					<td>${formateur.getLibelle()}</td>
					<td>${formateur.getDateDebut()}</td>
					<td>${formateur.getDateFin()}</td>
					<td>${formateur.getNomP()}</td>
					<td>${formateur.getSalle()}</td>
					<td>${formateur.getNomClasse()}</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>


</body>
</html>