<%@ page language="java"
		contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

 <link rel="stylesheet" href="css/bootstrap.css" type="text/css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
   <link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
			$(document)
					.ready(
							function() {
								var dt = new Date();
								dt.setDate(dt.getDate());
								var d = new Date();
								var monthNames = [ "January", "February",
										"March", "April", "May", "June",
										"July", "August", "September",
										"October", "November", "December" ];
								today = monthNames[d.getMonth()] + ' '
										+ d.getDate() + ' ' + d.getFullYear();

								$('#to').attr('disabled', 'disabled');
								$('#from').datepicker({
									defaultDate : "+3d",
									minDate : dt,
									maxDate : "+3M",
									dateFormat : 'yy.mm.dd',
									showOtherMonths : true,
									changeMonth : true,
									selectOtherMonths : true,
									required : true,
									showOn : "focus",
									numberOfMonths : 1,
								});

								$('#from')
										.change(
												function() {
													var from = $('#from')
															.datepicker(
																	'getDate');
													var date_diff = Math
															.ceil((from
																	.getTime() - Date
																	.parse(today)) / 86400000);
													var maxDate_d = date_diff
															+ 14 + 'd';
													date_diff = date_diff + 'd';
													$('#to')
															.val('')
															.removeAttr(
																	'disabled')
															.removeClass(
																	'hasDatepicker')
															.datepicker(
																	{
																		dateFormat : 'yy.mm.dd',
																		minDate : date_diff,
																		maxDate : maxDate_d
																	});
												});

								$('#to').keyup(function() {
									$(this).val('');
									alert('Please select date from Calendar');
								});
								$('#from').keyup(function() {
									$('#from,#to').val('');
									$('#to').attr('disabled', 'disabled');
									alert('Please select date from Calendar');
								});

							});
		</script>
 
<title>enregistrer formation</title>
<script>
	function validate() {

		var libelle = document.form.libelle.value;
		var journee = document.form.journee.value;
		var dateD = document.form.from.value;
		var dateF = document.form.to.value;
		var prof = document.form.prof.value;
		var salle = document.form.salle.value;
		var classe = document.form.classe.value;

		if (libelle == null || libelle == "") {
			alert("saisir le libellé");
			return false;
		}
		if (journee == null || journee == "") {
			alert("saisir la demi journée");
			return false;
		} else if (dateD == null || dateD == "") {
			alert("saisir une date de début");
			return false;
		} else if (dateF == null || dateF == "") {
			alert("saisir la date de fin");
			return false;
		} else if (prof == null || prof == "") {
			alert("saisir le formateur");
			return false;
		} else if (salle == null || salle == "") {
			alert("saisir la salle");
			return false;
		} else if (classe == null || classe == "") {
			alert("saisir la classe");
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


<center>
		<h2>Enregistrer une formation </h2>
	</center>
<form name="form" action="RegisterFormation" method="post"
		onsubmit="return validate()">
<table align="center">
  <tr>
 <td>Libellé</td>

 <td><input type="text" class="form-control" name="libelle" /></td>
 </tr>

 <tr>
 <td>Formateurs</td>

 <td>
 <select name="prof" class="form-control">
        <c:forEach items="${listProf}" var="prof">
            <option value="${prof.getIdProf()}"> ${prof.getNOMP()}</option>
        </c:forEach>
    </select>
    </td>
 </tr>
 
 <tr>
 <td>Sélectionner une demi journée</td>
 <td>
 <select name="journee" class="form-control">
        <c:forEach items="${journee}" var="journee">
            <option value="${journee.key}">${journee.value}</option>
        </c:forEach>
    </select>
 
			</tr>
 <tr>
  <td>Date Début</td>
 <td><input type="text" class="form-control" id="from" name="from">
 </td>
			</tr>
 <tr>
  <td>Date Fin</td>
   <td><input type="text" class="form-control" id="to" name="to" />

			</tr>
 
 <tr>
 <td>Salles</td>
 <td>
 <select name="salle" class="form-control">
        <c:forEach items="${listSalle}" var="salle">
            <option value="${salle.getNo()}">${salle.getNOM()}</option>
        </c:forEach>
    </select>
 
			</tr>
 
 <tr>
 
 
 
 
			<tr>
 <td>Classe</td>
 <td>
 <select name="classe" class="form-control">
        <c:forEach items="${listClasse}" var="classe">
            <option value="${classe.getIdClasse()}">${classe.getNOMClasse()}</option>
        </c:forEach>
    </select>
 
			</tr>
 <tr>
 
 </tr>
 <tr>
 <td></td>
 <td><input type="submit" value="RegisterFormation" class="btn btn-large btn-primary"></input><input
					type="reset" value="Reset" class="btn btn-large btn-warning"></input></td>
 </tr>
</table>
</form>
 
</body>
</html>