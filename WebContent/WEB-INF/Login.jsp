<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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
 alert("veuillez remplir password"); 
 return false; 
 } 
}
</script> 
<!-- Le styles -->
     <link href="bootstrap.css" rel="stylesheet">
     <style type="text/css">
       body {
         padding-top: 40px;
         padding-bottom: 40px;
         background-color: #f5f5f5;
       }

       .form-signin {
         max-width: 300px;
         padding: 19px 29px 29px;
         margin: 0 auto 20px;
         background-color: #fff;
         border: 1px solid #e5e5e5;
         -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
                 border-radius: 5px;
         -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                 box-shadow: 0 1px 2px rgba(0,0,0,.05);
       }
       .form-signin .form-signin-heading,
       .form-signin .checkbox {
         margin-bottom: 10px;
       }
       .form-signin input[type="text"],
       .form-signin input[type="password"] {
         font-size: 16px;
         height: auto;
         margin-bottom: 15px;
         padding: 2px 2px;
       }

     </style>
     <link href="bootstrap-responsive.css" rel="stylesheet">

</head>
<body><!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<div style="text-align:center"><h1 class="form-signin-heading">Authentification Utilisateur </h1> </div>
<br>
<form name="form" class="form-signin" action="LoginServlet" method="post" onsubmit="return validate()">

<div  class="container">
 <input type="text" class="input-block-level" placeholder="Email" name="email" />
<br>
 <input type="password" class="input-block-level" placeholder="Password" name="password" />

 <span style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
 : request.getAttribute("errMessage")%></span>
<br>
<input type="submit" value="Login" class="btn btn-large btn-primary"></input>
 <input type="reset"  class="btn btn-large btn-warning" value="Reset"></input>
 
</div>
</form>
 
</body>
</html>