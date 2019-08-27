package com.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Utilisateur;
import com.forms.RegisterUser;


public class RegisterSevlet extends HttpServlet {
	public RegisterSevlet() {
	 }
	 public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
	        /* Affichage de la page d'inscription */
	
		      Map<String, String> roleList = new HashMap<String, String>();
		      roleList.put("RF", "RF");
		      roleList.put("RG", "RG");
		      roleList.put("Etudiant", "Etudiant");
		      roleList.put("Formateur", "Formateur");
		      
		      request.setAttribute( "role", roleList );
 
	        this.getServletContext().getRequestDispatcher("/WEB-INF/RegisterUser.jsp" ).forward( request, response );
	    }
	
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	 String Nom = request.getParameter("nom");
	 String Prenom = request.getParameter("prenom");
	 String email = request.getParameter("email");
	 String role = request.getParameter("role");
	 String password = request.getParameter("password");
	 
	 Utilisateur registerBean = new Utilisateur();
	 
	 registerBean.setNom(Nom);
	 registerBean.setPrenom(Prenom);
	 registerBean.setEmail(email);
	 registerBean.setMotDePasse(password);
	 registerBean.setRole(role); 
	 
	 
	 RegisterUser registerDao = new RegisterUser();
	 
	 
	 String userRegistered = registerDao.registerUser(registerBean);
	 
	 if(userRegistered.equals("SUCCESS"))   
	 {
	 request.getRequestDispatcher("/WEB-INF/Home.jsp").forward(request, response);
	 }
	 else  
	 {
	 request.setAttribute("errMessage", userRegistered);
	 request.getRequestDispatcher("/WEB-INF/RegisterUser.jsp").forward(request, response);
	 }
	 }

}
