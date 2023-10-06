package com.G5GestionProduit.application;

public class Produit {
	private int id;
	private String nom;
	private String caracterisque;
	private int prix;
	private int quantite;
	
	public Produit() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Produit(String nom, String caracterisque, int prix, int quantite) {
		super();
		this.nom = nom;
		this.caracterisque = caracterisque;
		this.prix = prix;
		this.quantite = quantite;
	}

	public Produit(int id, String nom, String caracterisque, int prix, int quantite) {
		super();
		this.id = id;
		this.nom = nom;
		this.caracterisque = caracterisque;
		this.prix = prix;
		this.quantite = quantite;
	}
	
	

}
