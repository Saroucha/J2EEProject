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

import com.beans.Formation;
import com.beans.Prof;
import com.beans.Salle;
import com.mvc.util.DbConnection;


public class ConsulFormation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {
		Connection connection = null;
		Statement stmt=null;
		ResultSet rs=null;
		List<Formation> dataList = new ArrayList<Formation>();
			List<Prof> listProf = new ArrayList<>();
			try  {
				Connection con = DbConnection.createConnection();
				String sql = "SELECT * FROM prof ORDER BY NOMP";
				Statement statement = con.createStatement();
				ResultSet result = statement.executeQuery(sql);

				while (result.next()) {
					int id = result.getInt("idProf");
					String name = result.getString("NOMP");
					Prof prof = new Prof(id, name);

					listProf.add(prof);
				}          

			} catch (SQLException ex) {
				ex.printStackTrace();
			
			}      

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
			
			rs = stmt.executeQuery("select id,S.libelle,S.DateDebut,S.DateFin,T.NOMP,L.NOM, C.NOMClasse from formation S, prof T, salles L, classe C");

			while (rs.next()) {
				dataList.add(new Formation(rs.getString("Libelle"),rs.getString("DateDebut"),rs.getString("DateFin"),rs.getString("NOMP"),rs.getString("NOM"),rs.getString("NOMClasse")));
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
		String strViewPage = "/WEB-INF/ConsultationFormation.jsp";
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
