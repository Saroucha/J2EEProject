<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="css/bootstrap.css" type="text/css">

<script> 
			function validate()
				{ 
				
			 var email = document.form.email.value; 
			 var password = document.form.password.value;
			 
				 if (email==null || email=="")
					 { 
						 alert("veuillez remplir email"); 
						 return false; 
					 }
			else if(password==null || password=="")
					 { 
						 alert("veuillez remplir mot de passe"); 
						 return false; 
					 } 
			}
</script> 

</head>
<body>
	<div style="text-align:center; margin-top:122px; margin-left:-60px;"><h2 class="form-signin-heading">Espace Administration </h2> </div>
		<br>
		<div class="col-md-4 col-md-offset-4" style="text-align:center; ">
<form align="center" name="form" class="form-signin" action="LoginServlet" method="post" onsubmit="return validate()">

	<div  class="container" style="text-align:center;">
		<div class="center">
		<div class="input-group form-group">
		 <input type="text"  placeholder="Email" class="form-control" name="email" />
			<br><br><br>
			 <input type="password" class="form-control"  placeholder="Password" name="password" />
			<br><br>
		 <span style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
				 : request.getAttribute("errMessage")%></span>
		<br>
		<input type="submit" value="Login"  class="btn btn-large btn-primary"></input>
		 <input type="reset"  class="btn btn-large btn-warning" value="Reset"></input>
		 
		</div>
		</div>
</form>
</div>
 
</body>
</html>