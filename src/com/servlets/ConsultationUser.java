package com.servlets;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Utilisateur;


public class ConsultationUser extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request,  HttpServletResponse response) throws IOException, ServletException {
		Connection connection = null;
		Statement stmt=null;
		ResultSet rs=null;
		List<Utilisateur> dataList = new ArrayList<Utilisateur>();
		try {

			String driverName = "org.mariadb.jdbc.Driver";
			Class.forName(driverName);

			String serverName = "localhost";
			String portNumber = "3306";

			String url = "jdbc:mysql://localhost:3306/gestionsalle"; 
			String username = "root";
			String password = ""; 
			connection = DriverManager.getConnection(url, username, password);
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select Nom,Prenom,email,password,role from utilisateur");
			while (rs.next()) {
				dataList.add(new Utilisateur(rs.getString("nom"),rs.getString("prenom"),rs.getString("email"),rs.getString("password"),rs.getString("role")));
			}
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			if(rs!=null){
				try{ 
					rs.close();
				}catch(Exception ex) { /* */ ex.printStackTrace();}
			}
			if(stmt!=null){
				try{ 
					stmt.close();
				}catch(Exception ex) { /* */ ex.printStackTrace();}
			}
			if(connection !=null){
				try{ 
					connection.close();
				}catch(Exception ex) { /* */ ex.printStackTrace();}
			}
		}

		request.setAttribute("data", dataList);
		String strViewPage = "/WEB-INF/ConsultationUser.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(strViewPage);
		if (dispatcher != null) {
			dispatcher.forward(request, response);
		}
	}
}