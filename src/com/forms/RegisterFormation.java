package com.forms;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.beans.Classe;
import com.beans.Formation;
import com.beans.Prof;
import com.beans.Salle;
import com.beans.Utilisateur;
import com.mvc.util.DbConnection;


public class RegisterFormation {

	public String registerFormation(Formation registerBean)
	{
		String libelle= registerBean.getLibelle();
		String dateDebut = registerBean.getDateDebut();
		String dateFin = registerBean.getDateFin();
		int idClasse=registerBean.getIdClasse();
		int idProf=registerBean.getIdProf();
		int idSalle=registerBean.getIdSalle();
		String nomP = registerBean.getNomP(); //nomprof
		String salle=registerBean.getSalle(); //salle
		String classe=registerBean.getNomClasse(); //classe


		Connection con = null;
		PreparedStatement preparedStatement = null;

		try
		{
			con = DbConnection.createConnection();
			String query = 	"insert into formation (id, Libelle,DateDebut,DateFin,idProf,No,idClasse) VALUES (NULL,?,?,?,?,?,?)";
		
			preparedStatement = con.prepareStatement(query);
			
			preparedStatement.setString(1, libelle);
			preparedStatement.setString(2, dateDebut);
			preparedStatement.setString(3, dateFin);
			preparedStatement.setString(4, nomP);
			preparedStatement.setString(5, salle);
			preparedStatement.setString(6, classe);
			int i= preparedStatement.executeUpdate();
			if (i!=0)  
				return "SUCCESS"; 
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

		return "Oops.. Something went wrong there..!";  
	}

	public List<Prof> list() throws SQLException {
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
			throw ex;
		}      

		return listProf;
	}

	public List<Salle> listSalle() throws SQLException {
		List<Salle> listSalle = new ArrayList<>();

		try  {
			Connection con = DbConnection.createConnection();
			String sql = "SELECT * FROM salles ORDER BY NOM";
			Statement statement = con.createStatement();
			ResultSet result = statement.executeQuery(sql);

			while (result.next()) {
				int no = result.getInt("No");
				String nom = result.getString("NOM");

				Salle salle = new Salle(no, nom);

				listSalle.add(salle);
			}          

		} catch (SQLException ex) {
			ex.printStackTrace();
			throw ex;
		}      

		return listSalle;
	}

	public List<Classe> listClasse() throws SQLException {
		List<Classe> listClasse = new ArrayList<>();

		try  {
			Connection con = DbConnection.createConnection();
			String sql = "SELECT * FROM classe ORDER BY NOMClasse";
			Statement statement = con.createStatement();
			ResultSet result = statement.executeQuery(sql);

			while (result.next()) {
				int idC = result.getInt("idClasse");
				String nomC = result.getString("NOMClasse");

				Classe classe = new Classe(idC, nomC);

				listClasse.add(classe);
			}          

		} catch (SQLException ex) {
			ex.printStackTrace();
			throw ex;
		}      

		return listClasse;
	}


}
