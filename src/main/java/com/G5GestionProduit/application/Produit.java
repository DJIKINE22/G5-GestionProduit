package com.G5GestionProduit.application;

public class Produit {
	private int id;
	private String nom;
	private String caracteristique;
	private int prix;
	private int quantite;
	public Produit() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Produit(String nom, String caracteristique, int prix, int quantite) {
		super();
		this.nom = nom;
		this.caracteristique = caracteristique;
		this.prix = prix;
		this.quantite = quantite;
	}
	public Produit(int id, String nom, String caracteristique, int prix, int quantite) {
		super();
		this.id = id;
		this.nom = nom;
		this.caracteristique = caracteristique;
		this.prix = prix;
		this.quantite = quantite;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getCaracteristique() {
		return caracteristique;
	}
	public void setCaracteristique(String caracteristique) {
		this.caracteristique = caracteristique;
	}
	public int getPrix() {
		return prix;
	}
	public void setPrix(int prix) {
		this.prix = prix;
	}
	public int getQuantite() {
		return quantite;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
	
	
	
	
	

}
