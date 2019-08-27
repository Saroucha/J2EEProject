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

import com.beans.Salle;		

public class ConsulSalle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {
		Connection connection = null;
		Statement stmt=null;
		ResultSet rs=null;
		List<Salle> dataList = new ArrayList<Salle>();
		try {

			String driverName = "org.mariadb.jdbc.Driver";
			Class.forName(driverName);
			String serverName = "localhost";
			String portNumber = "3306";
			String url = "jdbc:mysql://localhost:3306/gestionsalle"; 
			String username = "root"; //MySQL username
			String password = ""; //MySQL password
			connection = DriverManager.getConnection(url, username, password);
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select No,S.NOM,S.NOMBRE_PLACE,T.Libelle from salle S, type T ");
			while (rs.next()) {
				dataList.add(new Salle(rs.getString("Nom"),rs.getInt("nombre_place"),rs.getString("Libelle")));
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
		String strViewPage = "/WEB-INF/ConsultationSalle.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(strViewPage);
		if (dispatcher != null) {
			dispatcher.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

	}

}
