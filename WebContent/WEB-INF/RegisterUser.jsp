<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	
	if (( request
			.getSession(false).getAttribute("Globale") == null)) {
%>
<jsp:forward page="/WEB-INF/Login.jsp"></jsp:forward>
<%
	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enregistrer les utilisateurs</title>
 <link rel="stylesheet" href="css/bootstrap.css" type="text/css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
<script> 
function validate()
{ 
 var Nom = document.form.nom.value;
 var Prenom = document.form.prenom.value;
 var email = document.form.email.value;
 var password = document.form.password.value;
 var conpassword= document.form.conpassword.value;
 var role = document.form.role.value;
 
 if (nom==null || nom=="")
 { 
 alert("saisir le nom"); 
 return false; 
 }
 if (prenom==null || prenom=="")
 { 
 alert("saisir le prenom"); 
 return false; 
 }
 else if (email==null || email=="")
 { 
 alert("saisir un Email"); 
 return false; 
 }
 else if(password.length<6)
 { 
 alert("Password must be at least 6 characters long."); 
 return false; 
 } 
 else if (password!=conpassword)
 { 
 alert("Confirm Password should match with the Password"); 
 return false; 
 } 
 else if (role==null || role=="")
 { 
 alert("saisir le role"); 
 return false; 
 }

 } 
</script> 
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
<center><h3>Enregistrer un nouvel utilisateur </h3></center>
<form name="form" action="RegisterSevlet" method="post" onsubmit="return validate()">

<table align="center">
 <tr>
 <td>Nom</td>
 <td><input type="text" class="form-control" name="nom" /></td>
 </tr>
  <tr>
 <td>Prenom</td>
 <td><input type="text" class="form-control" name="prenom" /></td>
 </tr>
 <tr>
 <td>Email</td>
 <td><input type="text" class="form-control" name="email" /></td>
 </tr>
 <tr>
 <td>Password</td>
 <td><input type="password" class="form-control" name="password" /></td>
 </tr>
 <tr>
 <td>Confirm Password</td>
 <td><input type="password" class="form-control" name="conpassword" /></td>
 </tr>
 <tr>
 <td>Role</td>
 <td>
 <select name="role" class="form-control">
          <c:forEach var="item" items="${role}">
            <option value="${item.key}">${item.value}</option>
          </c:forEach>
        </select>
 </tr>
 <tr>
 <td><%=(request.getAttribute("errMessage") == null) ? ""
 : request.getAttribute("errMessage")%></td>
 </tr>
 <tr>
 <td></td>
 <td><input type="submit" value="RegisterUser" class="btn btn-large btn-primary"></input><input
 type="reset" value="Reset" class="btn btn-large btn-warning"></input></td>
 </tr>
</table>
</form>
 
</body>
</html>