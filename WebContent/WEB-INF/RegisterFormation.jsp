<pre><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $(document).ready(function () {
		var dt = new Date();
dt.setDate(dt.getDate());
  var d = new Date();
  var monthNames = ["January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"];
  today = monthNames[d.getMonth()] + ' ' + d.getDate() + ' ' + d.getFullYear();

  $('#to').attr('disabled', 'disabled');
  $('#from').datepicker({
      defaultDate: "+3d",
      minDate: dt,
      maxDate: "+3M",
      dateFormat: 'dd M yy',
      showOtherMonths: true,
      changeMonth: true,
      selectOtherMonths: true,
      required: true,
      showOn: "focus",
      numberOfMonths: 1,
  });

  $('#from').change(function () {
      var from = $('#from').datepicker('getDate');
      var date_diff = Math.ceil((from.getTime() - Date.parse(today)) / 86400000);
      var maxDate_d = date_diff+14+'d';
      date_diff = date_diff + 'd';
      $('#to').val('').removeAttr('disabled').removeClass('hasDatepicker').datepicker({
          dateFormat: 'dd.mm.yy',
          minDate: date_diff,
          maxDate: maxDate_d
      });
  });

  $('#to').keyup(function () {
      $(this).val('');
      alert('Please select date from Calendar');
  });
  $('#from').keyup(function () {
      $('#from,#to').val('');
      $('#to').attr('disabled', 'disabled');
      alert('Please select date from Calendar');
  });

});
  </script>
 
<title>Register</title>
<script> 




function validate()
{ 

 var libelle = document.form.libelle.value;
 var journee = document.form.journee.value;
 var dateD = document.form.from.value;
 var dateF = document.form.to.value;
 var prof = document.form.prof.value;
 var salle = document.form.salle.value;
 var classe = document.form.classe.value;
 
 if (libelle==null || libelle=="")
 { 
 alert("saisir le libellé"); 
 return false; 
 }
 if (journee==null || journee=="")
 { 
 alert("saisir la demi journée"); 
 return false; 
 }
 else if (dateD==null || dateD=="")
 { 
 alert("saisir une date de début"); 
 return false; 
 }
 else if (dateF==null || dateF=="")
 { 
 alert("saisir la date de fin"); 
 return false; 
 }
 else if (prof==null || prof=="")
 { 
 alert("saisir le formateur"); 
 return false; 
 }
 else if (salle==null || salle=="")
 { 
 alert("saisir la salle"); 
 return false; 
 }
 else if (classe==null || classe=="")
 { 
 alert("saisir la classe"); 
 return false; 
 }

 } 
</script> 
</head>
<body>
<center><h2>Enregistrement des utilisateurs </h2></center>
<form name="form" action="RegisterFormation" method="post" onsubmit="return validate()">
<table align="center">
  <tr>
 <td>Libellé</td>

 <td><input type="text" name="libelle" /></td>
 </tr>

 <tr>
 <td>Formateurs</td>

 <td>
 <select name="prof">
        <c:forEach items="${listProf}" var="prof">
            <option value="${prof.getIdProf()}"> ${prof.getNOMP()} ${prof.getPRENOMP()}</option>
        </c:forEach>
    </select>
    </td>
 </tr>
 
 <tr>
 <td>Sélectionner une demi journée</td>
 <td>
 <select name="journee">
        <c:forEach items="${journee}" var="journee">
            <option value="${journee.key}">${journee.value}</option>
        </c:forEach>
    </select>
 </tr>
 <tr>
  <td>Date Début</td>
 <td><input type="text" id="from" >
 </td></tr>
 <tr>
  <td>Date Fin</td>
   <td><input type="text" id="to" />
</tr>
 
 <tr>
 <td>Salles</td>
 <td>
 <select name="salle">
        <c:forEach items="${listSalle}" var="salle">
            <option value="${salle.getNo()}">${salle.getNOM()}</option>
        </c:forEach>
    </select>
 </tr>
 
 <tr>
 
 
 
 <tr>
 <td>Classe</td>
 <td>
 <select name="classe">
        <c:forEach items="${listClasse}" var="classe">
            <option value="${classe.getIdClasse()}">${classe.getNOMClasse()}</option>
        </c:forEach>
    </select>
 </tr>
 <tr>
 
 </tr>
 <tr>
 <td></td>
 <td><input type="submit" value="RegisterFormation"></input><input
 type="reset" value="Reset"></input></td>
 </tr>
</table>
</form>
 
</body>
</html>