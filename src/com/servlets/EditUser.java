package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Utilisateur;


public class EditUser extends HttpServlet {

	
	 public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
	        /* Affichage de la page d'inscription */
	        this.getServletContext().getRequestDispatcher("/WEB-INF/EditUser.jsp" ).forward( request, response );
	    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        if(request.getParameter("btn_edit")!=null) //check button click event not null form edit.jsp page after continue
        {
            String name_up=request.getParameter("nom"); //get textbox name "txt_name"
            String prenom=request.getParameter("prenom"); //get textbox name "txt_owner"
            String email=request.getParameter("email"); //get textbox name "txt_owner"
            String password=request.getParameter("password"); //get textbox name "txt_owner"
            String role=request.getParameter("role"); //get textbox name "txt_owner"
            int hidden_id=Integer.parseInt(request.getParameter("hidden_id")); //get hidden id name "hidden_id"
            
            Utilisateur editBean=new Utilisateur(); //this class contain setting up all receive values from edit.jsp page to seeter and getter method for application require effectively
            
            editBean.setNom(name_up); 
            editBean.setPrenom(prenom);
            editBean.setEmail(email);
            editBean.setMotDePasse(password);
            editBean.setRole(role);
            editBean.setId(hidden_id);
            
            com.forms.EditUser editDao=new com.forms.EditUser(); //this class contain main logic to perform function calling and database operation
            
            String updateValidate=editDao.checkUpdate(editBean); //send editBean object values into checkUpdate() function in EditDao class
            
            if(updateValidate.equals("UPDATE SUCCESS")) //check calling checkUpdate() function receive string "UPDATE SUCCESS" after redirect to index.jsp page and display update record
            {
                request.setAttribute("UpdateSuccessMsg",updateValidate); //setAttribute value is "UpdateSuccessMsg" for update successfully message
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
            else
            {
                request.setAttribute("UpdateErrorMsg",updateValidate); //setAttribute value is "UpdateErrorMsg" for update fail message
                RequestDispatcher rd=request.getRequestDispatcher("EditUser.jsp");
                rd.include(request, response);
            }
        }
    }

}
