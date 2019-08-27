package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Utilisateur;
import com.forms.LoginUser;

public class LoginServlet extends HttpServlet {
	
	 public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
	        /* Affichage de la page d'inscription */
	        this.getServletContext().getRequestDispatcher("/WEB-INF/Login.jsp" ).forward( request, response );
	    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userNom = request.getParameter("Nom");
		String userPrenom = request.getParameter("Prenom"); 
		String userEmail = request.getParameter("email");
		 String password = request.getParameter("password");
		 
		Utilisateur loginBean = new Utilisateur(); 
		 
		loginBean.setEmail(userEmail); 
		 loginBean.setMotDePasse(password);
		 
		LoginUser loginUser = new LoginUser(); 
		 try
		 {
		 String userValidate = loginUser.authenticateUser(loginBean);
		 
		 if(userValidate.equals("Globale"))
		 {
		 System.out.println("Admin Globale");
		 
		 HttpSession session = request.getSession(); 
		 session.setAttribute("Globale", userEmail); 
		 request.setAttribute("userEmail", userEmail);
		 
		 request.getRequestDispatcher("/WEB-INF/Home.jsp").forward(request, response);
		 }
		 else if(userValidate.equals("Formateur"))
		 {
		 System.out.println("Espace Formateur");
		 
		 HttpSession session = request.getSession();
		 session.setAttribute("Formateur", userEmail);
		 request.setAttribute("userEmail", userEmail);
		 
		 request.getRequestDispatcher("/WEB-INF/FormateurHome.jsp").forward(request, response);
		 }
		 else if(userValidate.equals("RG"))
		 {
		 System.out.println("Espace RG");
		 
		 HttpSession session = request.getSession();
		 session.setAttribute("RG", userEmail);
		 request.setAttribute("userEmail", userEmail);
		 
		 request.getRequestDispatcher("/WEB-INF/RGHome.jsp").forward(request, response);
		 }
		 
		 else
		 {
		 System.out.println("Error message = "+userValidate);
		 request.setAttribute("errMessage", userValidate);
		 
		 request.getRequestDispatcher("/WEB-INF/Login.jsp").forward(request, response);
		 }
		 }
		 catch (IOException e1)
		 {
		 e1.printStackTrace();
		 }
		 catch (Exception e2)
		 {
		 e2.printStackTrace();
		 }
	}

}
