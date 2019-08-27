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
<title>Consulation User</title>
</head>
<body>
	<h1>Liste des Utilisateurs</h1>
	<div style="text-align: right">
		<a href="RegisterSevlet">Enregistrement d'un Utilisateur</a>
	</div>
	<div style="text-align: right">
		<a href="Logout">Logout</a>
	</div>
	<table>
		<thead>
			<th>Nom</th>
			<th>Prénom</th>
			<th>Email</th>
			<th>Password</th>
			<th>Role</th>
				</thead>
		<c:forEach var="user" items="${data}">
			<tbody>
				<td>${user.getNom()}</td>
				<td>${user.getPrenom()}</td>
				<td>${user.getEmail()}</td>
				<td>${user.getMotDePasse()}</td>
				<td>${user.getRole()}</td>
			</tbody>
		</c:forEach>

	</table>


</body>
</html>