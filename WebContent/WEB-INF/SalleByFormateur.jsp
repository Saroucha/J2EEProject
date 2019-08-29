<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Recherche de salles</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" >
</head>
<body>

<h2 align="center">Rechercher les salles selon le formateur</h2>
<div class="container">
<div class="col-sm-5">
<select class="form-control" name="cmb">
 <option value="0"> Select formateur </option>
 <%
 try{
	 String driverName = "org.mariadb.jdbc.Driver";
		Class.forName(driverName);
		String serverName = "localhost";
		String portNumber = "3306";
		String url = "jdbc:mysql://localhost:3306/gestionsalle"; 
		String username = "root"; 
		String password = ""; 
		Connection con=DriverManager.getConnection(url,username,password);
	 	Statement stm=con.createStatement();
	 	ResultSet rs= stm.executeQuery("select distinct id_U,Nom from utilisateur");
	 
	 	while(rs.next())
	 	{
	 		%>
	 		
	 		<option value="<%=rs.getInt("id") %>"><%=rs.getString("Nom") %> </option>
	 
	 		
	 		<%
	 	}
	 
 }catch(Exception ex){
	 ex.printStackTrace();
	 
 }
 
 
 %>
 
 
</select>
</div>
</div>
</body>
</html>