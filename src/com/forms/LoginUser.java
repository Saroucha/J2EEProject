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
	 
	String userName = loginBean.getEmail(); //Keeping user entered values in temporary variables.
	 String password = loginBean.getMotDePasse();
	 
	Connection con = null;
	 java.sql.Statement statement = null;
	 ResultSet resultSet = null;
	 
	String userEmailDB = "";
	 String passwordDB = "";
	 String roleDB="";
	 
	try
	 {
	 con = DbConnection.createConnection(); //establishing connection
	 statement = con.createStatement(); //Statement is used to write queries. Read more about it.
	 resultSet = statement.executeQuery("select email,password,Role from utilisateur"); //Here table name is users and userName,password are columns. fetching all the records and storing in a resultSet.
	
	while(resultSet.next()) // Until next row is present otherwise it return false
	 {
	  userEmailDB = resultSet.getString("email"); //fetch the values present in database
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
	 return "Invalid user credentials"; // Just returning appropriate message otherwise
	 }

}