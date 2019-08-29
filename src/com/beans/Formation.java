package com.beans;

import java.util.Date;

public class Formation {

	private String Libelle; 
	private String DateDebut;
	private String DateFin;
	private String NomP;
	private int idProf;
	private String Salle;
	public int idSalle;
	private String NomClasse;
	private int idClasse;
	
	
	
	public Formation(){

	}

	public Formation(String lib, String DateD, String DateF, String nom, String salle, String classe){
		this.Libelle=lib;
		this.DateDebut=DateD;
		this.DateFin=DateF;
		this.NomP=nom;
		this.Salle=salle;
		this.NomClasse=classe;
	}
	
	public Formation(String lib, String DateD, String DateF, int idProf, int idSalle, int idClasse){
		this.Libelle=lib;
		this.DateDebut=DateD;
		this.DateFin=DateF;
		this.idProf=idProf;
		this.idSalle=idSalle;
		this.idClasse=idClasse;
	}

	public String getLibelle() {
		return Libelle;
	}

	public void setLibelle(String libelle) {
		Libelle = libelle;
	}

	public String getDateDebut() {
		return DateDebut;
	}

	public void setDateDebut(String dateDebut) {
		DateDebut = dateDebut;
	}

	public String getDateFin() {
		return DateFin;
	}

	public void setDateFin(String dateFin) {
		DateFin = dateFin;
	}

	public String getNomP() {
		return NomP;
	}

	public void setNomP(String nomP) {
		NomP = nomP;
	}

	public int getIdProf() {
		return idProf;
	}

	public void setIdProf(int idProf) {
		this.idProf = idProf;
	}

	public String getSalle() {
		return Salle;
	}

	public void setSalle(String salle) {
		Salle = salle;
	}

	public int getIdSalle() {
		return idSalle;
	}

	public void setIdSalle(int idSalle) {
		this.idSalle = idSalle;
	}

	public String getNomClasse() {
		return NomClasse;
	}

	public void setNomClasse(String nomClasse) {
		NomClasse = nomClasse;
	}

	public int getIdClasse() {
		return idClasse;
	}

	public void setIdClasse(int idClasse) {
		this.idClasse = idClasse;
	}
	
	
	



}
