<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<% //In case, if Admin session is not set, redirect to Login page
if((request.getSession(false).getAttribute("RG")== null) )
{
%>
<jsp:forward page="/WEB-INF/Login.jsp"></jsp:forward>
<%} %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Consultation de Formation</title>
</head>
<body>
	<h1>Liste des Formations</h1>
	<div style="text-align: right">
		<a href="<%=request.getContextPath()%>/FormationAjout">Enregistrement
			de formation</a>
	</div>
	<div style="text-align: right">
		<a href="<%=request.getContextPath()%>ConsulSalle">Consultation de
			salle</a>
	</div>
	<div style="text-align: right">
		<a href="<%=request.getContextPath()%>/SalleAjout">Enregistrement
			de salle</a>
	</div>
	<div style="text-align: right">
		<a href="<%=request.getContextPath()%>/Logout">Logout</a>
	</div>
	<table>
		<thead>
			<th>Libellé</th>
			<th>Date du début</th>
			<th>Date de fin</th>
			<th>Formateur</th>
			<th>Salle</th>
			<th>Classe</th>

		</thead>
		<c:forEach var="formateur" items="${data}">
			<tbody>
				<td>${formateur.getLibelle()}</td>
				<td>${formateur.getDateDebut()}</td>
				<td>${formateur.getDateFin()}</td>
				<td>${formateur.getNomP()} - ${formateur.getPrenomP()}</td>
				<td>${formateur.getIdSalle()}</td>
				<td>${formateur.getNomClasse()}</td>

			</tbody>
		</c:forEach>

	</table>


</body>
</html>