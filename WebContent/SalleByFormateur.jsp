<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Consultation de réservation</title>
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
		<h3>Liste des réservations</h3>
	</div>

	<div class="container" align="center">
		<div class="col-sm-5">
			<form action="SalleByFormateur.jsp" method="post">
				<select class="form-control" align="center" name="cmb"
					onchange="this.form.submit()">
					<option value="0">Select formateur</option>
					<%
 try{
		 String driverName = "org.mariadb.jdbc.Driver";
		Class.forName(driverName);
		String serverName = "localhost";
		String portNumber = "3306";
		String url = "jdbc:mysql://localhost:3306/gestionsalle"; 
		String username = "root"; //MySQL username
		String password = ""; //MySQL password
		Connection con=DriverManager.getConnection(url,username,password);
	 	Statement stm=con.createStatement();
	 	ResultSet rs= stm.executeQuery("select idProf, NOMP from prof");
	 	
	 	while(rs.next())
	 	{
	 		%>
					<option value="<%=rs.getInt("idProf") %>"><%=rs.getString("NOMP") %>
					</option>
					<%
	 	}
	 	con.close();
	 	rs.close();
	 
	 
 }catch(Exception ex){
	 ex.printStackTrace();
 }

 %>
				</select> <br>
		</div>

		<table class="table table-bordered table-striped">
			<tr>
				<th>Salle</th>
				<th>Classe</th>
				<th>Date Début</th>
				<th>Date Fin</th>
				<th>Libellé</th>
			</tr>

			<%
	try{
	
		 String driverName = "org.mariadb.jdbc.Driver";
			Class.forName(driverName);
			String serverName = "localhost";
			String portNumber = "3306";
			String url = "jdbc:mysql://localhost:3306/gestionsalle"; 
			String username = "root"; //MySQL username
			String password = ""; //MySQL password
			Connection conn=DriverManager.getConnection(url,username,password);
		 	Statement stmt=conn.createStatement();
		 	ResultSet rsu= stmt.executeQuery("select formation.id,formation.libelle,formation.DateDebut,formation.DateFin,salles.No, salles.NOM,classe.NOMClasse from formation,salles,classe where idProf="+request.getParameter("cmb"));
		 	
		 	while(rsu.next())
		 	{
		%>
			<tr>
				<td><%=rsu.getString("NOM") %></td>
				<td><%=rsu.getString("NOMClasse") %></td>
				<td><%=rsu.getString("DateDebut") %></td>
				<td><%=rsu.getString("DateFin") %></td>
				<td><%=rsu.getString("libelle") %></td>

			</tr>

			<%
		 	}
		 	rsu.close();
		 	conn.close();
		}catch(Exception EX){
			EX.printStackTrace();
		}

%>
		</table>
		</form>



	</div>





</body>
</html>