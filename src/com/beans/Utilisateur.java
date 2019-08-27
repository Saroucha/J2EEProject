package com.beans;

public class Utilisateur {

    private String email;
    private String motDePasse;
    private String Nom;
    private String Prenom;
    private String Role;
    private int id;
    
    
   public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


public Utilisateur(String nom, String prenom, String email,String password, String role) {
        this.Nom = nom;
        this.Prenom = prenom;
        this.email=email;
        this.motDePasse=password;
        this.Role=role;
    }

  
	public Utilisateur() {
	// TODO Auto-generated constructor stub
}
	public String getPrenom() {
		return Prenom;
	}
	public void setPrenom(String prenom) {
		this.Prenom = prenom;
	}
	public String getRole() {
		return Role;
	}
	public void setRole(String role) {
		this.Role = role;
	}
	public void setEmail(String email) {
	this.email = email;
    }
    public String getEmail() {
	return email;
    }

    public void setMotDePasse(String motDePasse) {
	this.motDePasse = motDePasse;
    }
    public String getMotDePasse() {
	return motDePasse;
    }

    public void setNom(String nom) {
	this.Nom = nom;
    }
    public String getNom() {
	return Nom;
    }
}
