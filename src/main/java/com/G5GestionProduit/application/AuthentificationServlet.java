package com.G5GestionProduit.application;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class AuthentificationServlet
 */
public class AuthentificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/g5productstock?";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action = request.getServletPath();
		 

        switch (action) {
		    case "/login":
		        loginForm(request, response);
		        break;
		    default:
		        logForm(request, response);
		        break;
		}
    }
		
		
		//this.getServletContext().getRequestDispatcher("/WEB-INF/Login.jsp").forward(request, response);}
	protected void logForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/Login.jsp");
        dispatcher.forward(request, response);
	}
	
	protected void loginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les paramètres du formulaire
        String utilisateur = request.getParameter("username");
        String motDePasse = request.getParameter("password");

        // Vérifier les informations d'authentification (c'est ici que tu interagirais avec la base de données)
        boolean utilisateurExiste = verifierUtilisateur(utilisateur, motDePasse);

        if (utilisateurExiste) {
            // Utilisateur trouvé, rediriger vers la page sécurisée
            response.sendRedirect("pageSecurisee.jsp");
        } else {
            // Utilisateur non trouvé, rediriger vers la page de connexion avec un message d'erreur
            response.sendRedirect("login.jsp?erreur=1");
        }
    }

	 private boolean verifierUtilisateur(String utilisateur, String motDePasse) {
	        try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
	            String query = "SELECT * FROM utilisateurs WHERE username = ? AND password = ?";
	            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	                preparedStatement.setString(1, utilisateur);
	                preparedStatement.setString(2, motDePasse);

	                try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                    return resultSet.next(); // true si l'utilisateur est trouvé, false sinon
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace(); // Gestion appropriée des exceptions dans un environnement de production
	            return false;
	        }
	 }}


