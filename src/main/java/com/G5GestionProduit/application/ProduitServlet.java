package com.G5GestionProduit.application;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;








/**
 * Servlet implementation class ProduitServlet
 */
public class ProduitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ProduitDAO produitDAO;

    public void init() {
    	produitDAO = new ProduitDAO();
    	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProduitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		

		
		String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    ValeurProduit(request, response);
                    break;
                case "/delete":
                    deleteEtudiant(request, response);
                    break;
				
				  case "/modif": showEditForm(request, response); break;
				  case "/detail": showEditForm(request, response); break;
				 
                case "/update":
                    updateProduit(request, response);
                    break;
                default:
                    listProduit(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listProduit(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
        List < Produit > listProduit = produitDAO.selectAllProduits();
        request.setAttribute("listProduit", listProduit);
        
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/AfficherProduit.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/ProduitCreate.jsp");
        dispatcher.forward(request, response);
    }
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));		 
        Produit existingUser = produitDAO.selectProduit(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/produitEdit.jsp");
        request.setAttribute("produit", existingUser);
        dispatcher.forward(request, response);

    }



    private void ValeurProduit(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
    	
        String nom = request.getParameter("nom");
        String caracteristique = request.getParameter("caracteristique");
        int prix = Integer.parseInt(request.getParameter("prix"));
        int quantite = Integer.parseInt(request.getParameter("quantite"));
        Produit p = new Produit(nom,caracteristique,prix,quantite );
        produitDAO.insertProduit(p);
        response.sendRedirect("list");
    }

    private void updateProduit(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String caracteristique = request.getParameter("caracteristique");
        int prix = Integer.parseInt(request.getParameter("prix"));
        int quantite = Integer.parseInt(request.getParameter("quantite"));

        Produit p = new Produit( id,nom,caracteristique, prix, quantite);
        produitDAO.updateProduits(p);
        response.sendRedirect("list");
    }

    private void deleteEtudiant(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        produitDAO.deleteProduits(id);
        response.sendRedirect("list");

    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
