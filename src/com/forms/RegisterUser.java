package com.forms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.beans.Utilisateur;
import com.mvc.util.DbConnection;

public class RegisterUser {
	 public String registerUser(Utilisateur registerBean)
	 {
	 String nom = registerBean.getNom();
	 String prenom = registerBean.getPrenom();
	 String email = registerBean.getEmail();
	
	 String password = registerBean.getMotDePasse();
	 String role = registerBean.getRole();
	 
	 Connection con = null;
	 PreparedStatement preparedStatement = null;
	 
	 try
	 {
	 con = DbConnection.createConnection();
	 String query = "insert into utilisateur(id_U,Nom,Prenom,email,password,role) values (NULL,?,?,?,?,?)"; //Insert user details into the table 'USERS'
	 preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
	 preparedStatement.setString(1, nom);
	 preparedStatement.setString(2, prenom);
	 preparedStatement.setString(3, email);
	 preparedStatement.setString(4, password);
	 preparedStatement.setString(5, role);
	 
	 int i= preparedStatement.executeUpdate();
	 
	 if (i!=0)  //Just to ensure data has been inserted into the database
	 return "SUCCESS"; 
	 }
	 catch(SQLException e)
	 {
	 e.printStackTrace();
	 }
	 
	 return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
	 }
	 
	
		 
	   
	 
}
