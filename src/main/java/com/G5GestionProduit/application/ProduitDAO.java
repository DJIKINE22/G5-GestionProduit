package com.G5GestionProduit.application;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class ProduitDAO {

	private static String jdbcurl="jdbc:mysql://localhost:3306/g5productstock?useSSL=false&useGmtMillisForDatetimes=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&useTimezone=true&serverTimezone=UTC";
	private static String user="root";
	private static String password="";
	
	private static  String sql_insert = "INSERT INTO produits (nom, caracteristique, prix, quantite) VALUES (?, ?, ?, ?)";
										
	private static  String sql_select = "SELECT * FROM produits";
	private static  String sql_selectById = "SELECT * FROM produits Where id = ? ";
	private static  String sql_update = " UPDATE produits set nom = ?,  caracteristique = ?, prix = ?, quantite = ? WHERE id = ?";
	private static  String sql_delete = " DELETE From produits WHERE id = ?";
	
	
	
	public ProduitDAO() {}

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

    //INSERT ETUDIANT
    public void insertProduit(Produit p) throws SQLException {
        System.out.println(sql_insert);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql_insert)) {
            preparedStatement.setString(1, p.getNom());
            preparedStatement.setString(2, p.getCaracteristique());
            preparedStatement.setInt(3, p.getPrix());
            preparedStatement.setInt(4, p.getQuantite());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Produit selectProduit(int id) {
        Produit p = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(sql_selectById)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
            	
            	
                String nom = rs.getString("nom");
                String caracteristique = rs.getString("caracteristique");
                int prix = rs.getInt("prix");
                int quantite = rs.getInt("quantite");
               
                p = new Produit(id, nom, caracteristique, prix, quantite);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return p;
    }

    public List < Produit > selectAllProduits() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List < Produit > p = new ArrayList < > ();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(sql_select);
        		) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
          
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String nom = rs.getString("nom");
                String caracteristique = rs.getString("caracteristique");
                int prix = rs.getInt("prix");
                int quantite = rs.getInt("quantite");
                p.add(new Produit(id,nom, caracteristique, prix, quantite));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return p;
    }

    public boolean deleteProduits(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql_delete);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateProduits(Produit p) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(sql_update);) {
            statement.setString(1, p.getNom());
            statement.setString(2, p.getCaracteristique());
            statement.setInt(3, p.getPrix());
            statement.setInt(4, p.getQuantite());
            statement.setInt(5, p.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
