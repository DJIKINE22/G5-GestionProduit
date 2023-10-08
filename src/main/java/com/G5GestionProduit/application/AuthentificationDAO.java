package com.G5GestionProduit.application;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AuthentificationDAO {
	
	private static DataSource dataSource;

    static {
        try {
            // Initialisation de la DataSource lors du chargement de la classe
            InitialContext initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            dataSource = (DataSource) envContext.lookup("jdbc/g5productstore");
        } catch (NamingException e) {
            e.printStackTrace(); // Gestion appropriée des exceptions dans un environnement de production
        }
    }
    public Connection getConnection() throws SQLException {
        // Obtention d'une connexion à partir de la DataSource
        return dataSource.getConnection();
    }

    // Autres méthodes DAO...

    // Exemple d'utilisation dans une méthode DAO
    public void exempleDAO() {
        try (Connection connection = getConnection()) {
            // Utilisation de la connexion pour effectuer des opérations sur la base de données
            // ...
        } catch (SQLException e) {
            e.printStackTrace(); // Gestion appropriée des exceptions dans un environnement de production
        }
    }
}


