package com.forms;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.beans.Utilisateur;
import com.mvc.util.DbConnection;

public class EditUser {
	public String checkUpdate(Utilisateur editBean)
    {
        String nom=editBean.getNom();
        String prenom=editBean.getPrenom();
        String email=editBean.getEmail();
        String password=editBean.getMotDePasse();
        String role=editBean.getRole();
       
        int hidden_id=editBean.getId();
        Connection con = null;
		PreparedStatement preparedStatement = null;

        try
        {
        	con = DbConnection.createConnection();
        	preparedStatement=con.prepareStatement("update utilisateur set Nom=?, Prenom=?, email=?, password=?, role=? where id_U=? "); //sql update query
        	preparedStatement.setString(1,nom);
        	preparedStatement.setString(2,prenom);
        	preparedStatement.setString(3,email);
        	preparedStatement.setString(4,password);
        	preparedStatement.setString(5,role);
        	preparedStatement.setInt(6,hidden_id);
        	preparedStatement.executeUpdate(); 
            
        	preparedStatement.close(); 
            
        	 int i= preparedStatement.executeUpdate();
        	 
        	 if (i!=0)  
        	 return "SUCCESS UPDATE"; 
        	 }
        	 catch(SQLException e)
        	 {
        	 e.printStackTrace();
        	 }
        	 
        	 return "Oops.. Something went wrong there..!";  
        	 }
}
