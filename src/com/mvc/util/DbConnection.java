package com.mvc.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	 public static Connection createConnection()
	 {
	 Connection con = null;
	 String url = "jdbc:mysql://localhost:3306/gestionsalle"; 
	 String username = "root"; 
	 String password = ""; 
	 
	 try 
	 {
	 try 
	 {
	 Class.forName("org.mariadb.jdbc.Driver");  
	 
	 } 
	 catch (ClassNotFoundException e)
	 {
	 e.printStackTrace();
	 } 
	 con = DriverManager.getConnection(url, username, password); 
	 System.out.println("Printing connection object "+con);
	 } 
	 catch (Exception e) 
	 {
	 e.printStackTrace();
	 }
	 return con; 
	 }
	}