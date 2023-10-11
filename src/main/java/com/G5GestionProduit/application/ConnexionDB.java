package com.G5GestionProduit.application;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnexionDB {
	 private static Connection conn;
	public static Connection  getConnection() {
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/g5productstore", "root", "");
		} catch(Exception e) {
			e.printStackTrace();		}
		
		return conn;
		}
	

}
