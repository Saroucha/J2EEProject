<pre><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
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
<center><h2>Enregistrement des utilisateurs </h2></center>
<form name="form" action="RegisterSevlet" method="post" onsubmit="return validate()">
<table align="center">
 <tr>
 <td>Nom</td>
 <td><input type="text" name="nom" /></td>
 </tr>
  <tr>
 <td>Prenom</td>
 <td><input type="text" name="prenom" /></td>
 </tr>
 <tr>
 <td>Email</td>
 <td><input type="text" name="email" /></td>
 </tr>
 <tr>
 <td>Password</td>
 <td><input type="password" name="password" /></td>
 </tr>
 <tr>
 <td>Confirm Password</td>
 <td><input type="password" name="conpassword" /></td>
 </tr>
 <tr>
 <td>Role</td>
 <td>
 <select name="role">
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
 <td><input type="submit" value="RegisterUser"></input><input
 type="reset" value="Reset"></input></td>
 </tr>
</table>
</form>
 
</body>
</html>