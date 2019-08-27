<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <title>Consultation de salle</title>
    </head>
    <body>
        <h1>Liste des Salle</h1>
          <div style="text-align: right"><a href="Logout">Logout</a></div>
 <table>
 <thead>
 <th>Nom</th>
 <th>Nombre place</th>
 <th>type</th>

 </thead>
        <c:forEach var="salle" items="${data}">
         <tbody>
             <td> ${salle.getNOM()} </td> <td> ${salle.getPlace()}</td> <td> ${salle.getIdT()} </td>  
         
            </tbody>
        </c:forEach>
        
        </table>
        
        
    </body>
</html>