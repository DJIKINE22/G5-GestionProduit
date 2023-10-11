package com.G5GestionProduit.application;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

@WebServlet("/AuthentificationServlet")
public class UtilisateurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     * 
     */
	
	private ProduitDAO produitDAO;

    public void init() {
    	produitDAO = new ProduitDAO();
    	}
	
    public UtilisateurServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UtilisateurDAO utilisateurDAO = new UtilisateurDAO();
        Utilisateur utilisateur = utilisateurDAO.verifierUtilisateur(username, password);

        if (utilisateur != null) {
            HttpSession session = request.getSession();
            session.setAttribute("utilisateur", utilisateur);

            // Redirection en fonction du rôle
            if ("Admin".equals(utilisateur.getRole())) {
            	List < Produit > listProduit = produitDAO.selectAllProduits();
                request.setAttribute("listProduit", listProduit);
            	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/AfficherProduit.jsp");
                dispatcher.forward(request, response);
            } else if ("Manager".equals(utilisateur.getRole())) {
            	List < Produit > listProduit = produitDAO.selectAllProduits();
                request.setAttribute("listProduit", listProduit);
            	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/TableauManager.jsp");
                dispatcher.forward(request, response);
            } else if ("Final".equals(utilisateur.getRole())) {
            	List < Produit > listProduit = produitDAO.selectAllProduits();
                request.setAttribute("listProduit", listProduit);
            	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/TableauFinal.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            response.sendRedirect("Erreur.jsp");
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		this.getServletContext().getRequestDispatcher("/WEB-INF/Login.jsp").forward(request, response);}

}
