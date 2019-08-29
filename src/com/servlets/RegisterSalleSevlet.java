package com.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Salle;
import com.beans.Utilisateur;
import com.forms.RegisterUser;

/**
 * Servlet implementation class RegisterSalleSevlet
 */
@WebServlet("/RegisterSalleSevlet")
public class RegisterSalleSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterSalleSevlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			      Map<String, String> TypeList = new HashMap<String, String>();
			      TypeList.put("ordinaire", "ordinaire");
			      TypeList.put("munie d'ordinateur", "munie d'ordinateur");
			      TypeList.put("MULTIMEDIA", "MULTIMEDIA");
			      TypeList.put("langue", "langue");      
			      request.setAttribute( "TYPE", TypeList );
	 
		        this.getServletContext().getRequestDispatcher("/WEB-INF/RegisterSalle.jsp" ).forward( request, response );
		    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 String Nom = request.getParameter("NOM");
		 //int nombresalle = request.get
		 String TYPE = request.getParameter("TYPE");
		 
		 
		 Salle registerBean = new Salle();
		 
		 registerBean.setNOM(Nom);
		// registerBean.setPlace(nombresalle);
		
	
		 RegisterUser registerDao = new RegisterUser();
		 
		 
		// String userRegistered = registerDao.registerUser(registerBean);
		 
	
		
		
		
	}

}
