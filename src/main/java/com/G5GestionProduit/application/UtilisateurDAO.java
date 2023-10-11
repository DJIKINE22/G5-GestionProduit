package com.G5GestionProduit.application;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UtilisateurDAO {
	
	//Definition des variables
		private static String jdbcurl="jdbc:mysql://localhost:3306/g5productstock?useSSL=false&useGmtMillisForDatetimes=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&useTimezone=true&serverTimezone=UTC";
		private static String user="root";
		private static String password="";
		
	public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcurl, user, password);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }
	 // Méthode pour vérifier les informations d'identification dans la base de données
    public Utilisateur verifierUtilisateur(String username, String password) {
        Utilisateur utilisateur = null;
        String role = null;

        try (Connection connection = getConnection()) {
            String query = "SELECT id, username, role FROM utilisateurs WHERE username = ? AND password = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                    	 utilisateur = new Utilisateur();
                         utilisateur.setId(resultSet.getInt("id"));
                         utilisateur.setUsername(resultSet.getString("username"));
                         utilisateur.setRole(resultSet.getString("role"));
                     }
                 }
             }
         } catch (SQLException e) {
             e.printStackTrace();
         }

         return utilisateur;
                    }

}
