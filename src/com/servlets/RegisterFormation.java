package com.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Classe;
import com.beans.Formation;
import com.beans.Prof;
import com.beans.Salle;
import com.beans.Utilisateur;
import com.forms.RegisterUser;

public class RegisterFormation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		com.forms.RegisterFormation dao = new com.forms.RegisterFormation();
		 
        try {
            List<Prof> listProf = dao.list();
            request.setAttribute("listProf", listProf);
            
            List<Classe> listClasse = dao.listClasse();
            request.setAttribute("listClasse", listClasse);
            
            List<Salle> listSalle = dao.listSalle();
            request.setAttribute("listSalle", listSalle);
 
            Map<String, String> JourneeList = new HashMap<String, String>();
            JourneeList.put("Matin", "Matin");
            JourneeList.put("Aprés-midi", "Aprés-midi");

		      request.setAttribute( "journee", JourneeList );
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/RegisterFormation.jsp");
            dispatcher.forward(request, response);
 
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
					
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String libelle = request.getParameter("libelle");
		 String dateD =request.getParameter("from");
		 String dateF = request.getParameter("to");
		 String prof = request.getParameter("prof");
		 String salle = request.getParameter("salle");
		 String classe = request.getParameter("classe");
		 
		 Formation registerBean = new Formation();
		 Prof pro = new Prof();
		 Classe clas = new Classe();
		 Salle sal = new Salle();
		 
		 registerBean.setLibelle(libelle);
		 registerBean.setDateDebut(dateD);
		 registerBean.setDateFin(dateF);
		 registerBean.setNomP(prof);
		 registerBean.setSalle(salle);
		 registerBean.setNomClasse(classe); 
		 
		 
		 com.forms.RegisterFormation registerDao = new com.forms.RegisterFormation();
		 
		 
		 String userRegistered = registerDao.registerFormation(registerBean);
		 
		 if(userRegistered.equals("SUCCESS"))   
		 {
		 request.getRequestDispatcher("/WEB-INF/Home.jsp").forward(request, response);
		 }
		 else  
		 {
		 request.setAttribute("errMessage", userRegistered);
		 request.getRequestDispatcher("/WEB-INF/RegisterFormation.jsp").forward(request, response);
		 }
		 
	}

}
