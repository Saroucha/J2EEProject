package com.forms;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.beans.Utilisateur;
import com.mvc.util.DbConnection;

public class LoginUser {
	public String authenticateUser(Utilisateur loginBean)
	 {
	 
	String userName = loginBean.getEmail(); 
	 String password = loginBean.getMotDePasse();
	 
	Connection con = null;
	 java.sql.Statement statement = null;
	 ResultSet resultSet = null;
	 
	String userEmailDB = "";
	 String passwordDB = "";
	 String roleDB="";
	 
	try
	 {
	 con = DbConnection.createConnection(); 
	 statement = con.createStatement(); 
	 resultSet = statement.executeQuery("select email,password,Role from utilisateur"); 
	
	while(resultSet.next()) 
	 {
	  userEmailDB = resultSet.getString("email"); 
	  passwordDB = resultSet.getString("password");
	  roleDB = resultSet.getString("Role");
	 
	  if(userName.equals(userEmailDB) && password.equals(passwordDB) && roleDB.equals("Globale"))
		  return "Globale";
		  else if(userName.equals(userEmailDB) && password.equals(passwordDB) && roleDB.equals("Formateur"))
		  return "Formateur";
		  else if(userName.equals(userEmailDB) && password.equals(passwordDB) && roleDB.equals("RG"))
			  return "RG";
		  }
	  	 
	 }catch(SQLException e)
	 {
	 e.printStackTrace();
	 }
	 return "Invalid user credentials";
	 }

}