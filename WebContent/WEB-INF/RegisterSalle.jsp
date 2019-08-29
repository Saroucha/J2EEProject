<pre><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>enregistrement</title>
<script> 
function validate()
{ 
 var Nom = document.form.nom.value;
 var NOMBRE_PLACE = document.form.NOMBRE_PLACE.value;
 var TYPE = document.form.TYPE.value;

 
 if (nom==null || nom=="")
 { 
 alert("saisir le nom"); 
 return false; 
 }

 else if (NOMBRE_PLACE==null || NOMBRE_PLACE=="")
 { 
 alert("saisir le NOMBRE_PLACE"); 
 return false; 
 }

 } 
</script> 
</head>
<body>
<center><h2>Enregistrement des SALLEs </h2></center>
<form name="form" action="RegisterSalleSevlet" method="post" onsubmit="return validate()">
<table align="center">
 <tr>
 <td>Nom</td>
 <td><input type="text" name="nom" /></td>
 </tr>
 
 <tr>
 <td>Nombre de salle</td>
 <td><input type="text" name="NOMBRE_SALLE" /></td>
 </tr>
 <tr>
 <td>TYPE</td>
 <td>
 <select name="TYPE">
          <c:forEach var="item" items="${TYPE}">
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
 <td><input type="submit" value="RegisterSalle"></input>
 <input type="reset" value="Reset"></input></td>
 </tr>
</table>
</form>
 
</body>
</html>