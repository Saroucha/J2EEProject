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
		PreparedStatement preparedStatement2 = null;

		try
		{
			con = DbConnection.createConnection();
			if(role.equals("Formateur")){
				System.out.println("test"+role);
				con= DbConnection.createConnection();
				String query2 = "insert into prof(idProf,NOMP,emailP,passwordP) values (NULL,?,?,?)"; 
				preparedStatement2 = con.prepareStatement(query2); 
				preparedStatement2.setString(1, nom);
				preparedStatement2.setString(2, email);
				preparedStatement2.setString(3, password);

				preparedStatement2.executeUpdate();

				con = DbConnection.createConnection();
				String query = "insert into utilisateur(id_U,Nom,Prenom,email,password,role) values (NULL,?,?,?,?,?)"; 
				preparedStatement = con.prepareStatement(query); 
				preparedStatement.setString(1, nom);
				preparedStatement.setString(2, prenom);
				preparedStatement.setString(3, email);
				preparedStatement.setString(4, password);
				preparedStatement.setString(5, role);

				int i= preparedStatement.executeUpdate();


				if (i!=0)  
					return "SUCCESS"; 
			}else{
				con = DbConnection.createConnection();
				String query = "insert into utilisateur(id_U,Nom,Prenom,email,password,role) values (NULL,?,?,?,?,?)"; 
				preparedStatement = con.prepareStatement(query); 
				preparedStatement.setString(1, nom);
				preparedStatement.setString(2, prenom);
				preparedStatement.setString(3, email);
				preparedStatement.setString(4, password);
				preparedStatement.setString(5, role);

				int i= preparedStatement.executeUpdate();


				if (i!=0)  
					return "SUCCESS"; 
			}

		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

		return "Oops.. problème..!";  
	}





}
