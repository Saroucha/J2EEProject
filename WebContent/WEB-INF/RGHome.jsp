<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>RG Page</title>
</head>
<% //In case, if Admin session is not set, redirect to Login page
if((request.getSession(false).getAttribute("RG")== null) )
{
%>
<jsp:forward page="/WEB-INF/Login.jsp"></jsp:forward>
<%} %>
<body>
<center><h2>Espace RG</h2></center>
<div style="text-align: right"><a href="<%=request.getContextPath()%>/ConsulFormation">Consultation de formation</a></div>
<div style="text-align: right"><a href="<%=request.getContextPath()%>/RegisterFormation">Enregistrement de formation</a></div>
<div style="text-align: right"><a href="<%=request.getContextPath()%>ConsulSalle">Consultation de salle</a></div>
<div style="text-align: right"><a href="<%=request.getContextPath()%>/SalleAjout">Enregistrement de salle</a></div> 
<div style="text-align: right"><a href="<%=request.getContextPath()%>/Logout">Logout</a></div>
</body>
</html>