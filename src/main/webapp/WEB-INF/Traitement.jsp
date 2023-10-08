<%@ page import="java.util.List" %>
<%@ page import="com.G5GestionProduit.application.Produit" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*" %>


<%
    // Récupérer les données du formulaire
    int id = Integer.parseInt(request.getParameter("id"));
			        String nom = request.getParameter("nom");
			        String caracteristique = request.getParameter("caracteristique");
			        int prix = Integer.parseInt(request.getParameter("prix"));
			        int quantite = Integer.parseInt(request.getParameter("quantite"));
			        

			        
    // Connexion à la base de données
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/g5productstock)", "root", "");

        // Préparer la requête SQL pour la mise à jour
        String updateQuery = "UPDATE produits SET nom = ? , caracteristique, prix, quantite WHERE id = ?";
        preparedStatement = connection.prepareStatement(updateQuery);

        // Définir les valeurs des paramètres dans la requête SQL
        preparedStatement.setString(1, nom);
        preparedStatement.setString(2, caracteristique);
        preparedStatement.setInt(3, prix);
        preparedStatement.setInt(4, quantite);
        preparedStatement.setInt(5, id);

        // Vous devriez définir les autres paramètres de la requête de la même manière

        // Exécuter la mise à jour
        preparedStatement.executeUpdate();
        
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
    	 // Fermer les ressources
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Traitement du Formulaire</title>
</head>
<body>
    <h1>Formulaire traité avec succès!</h1>
    <!-- Vous pouvez ajouter du contenu supplémentaire ici -->
</body>
</html>
