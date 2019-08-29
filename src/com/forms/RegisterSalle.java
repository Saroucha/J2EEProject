package com.forms;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.beans.Salle;
import com.mvc.util.DbConnection;


public class RegisterSalle {

	
	 public String registerUser(Salle registerBean)
	 {
	 String nom = registerBean.getNOM();
	 int place = registerBean.getPlace();
	 String type = registerBean.getIdT();
	
	 Connection con = null;
	 PreparedStatement preparedStatement = null;
	 
	 try
	 {
	 con = DbConnection.createConnection();
	 String query = "insert into Salles(No,NOM,NOMBRE_SALLE,TYPE) values (NULL,?,?,?)"; 
	 preparedStatement = con.prepareStatement(query); 
	 preparedStatement.setString(1, nom);
	 preparedStatement.setInt(2, place);
	 preparedStatement.setString(3, type);
	 
	 int i= preparedStatement.executeUpdate();
	 
	 if (i!=0) 
	 return "SUCCESS"; 
	 }
	 catch(SQLException e)
	 {
	 e.printStackTrace();
	 }
	 
	 return "Oops.. erreur..!";  
	 }
	
}
