package com.beans;

import java.util.Date;

public class Formation {

	private String Libelle; 
	private String DateDebut;
	private String DateFin;
	private String NomP;
	private String PrenomP;
	private int idProf;
	private String idSalle;
	private String NomClasse;
	private int idSall;
	private int NomClass;
	private int NomPr;
	public Formation(){

	}

	public Formation(String lib, String DateD, String DateF, String nom, String prenom, String salle, String classe){
		this.Libelle=lib;
		this.DateDebut=DateD;
		this.DateFin=DateF;
		this.NomP=nom;
		this.PrenomP=prenom;
		this.idSalle=salle;
		this.NomClasse=classe;
	}
	
	public int getIdSall() {
		return idSall;
	}

	public void setIdSall(int idSall) {
		this.idSall = idSall;
	}

	public int getNomClas() {
		return NomClass;
	}

	public void setNomClass(int nomClass) {
		NomClass = nomClass;
	}

	public int getNomPr() {
		return NomPr;
	}

	public void setNomPr(int nomPr) {
		NomPr = nomPr;
	}

	public Formation(String lib, String DateD, String DateF, int nomp, int sall,int clas){
		this.Libelle=lib;
		this.DateDebut=DateD;
		this.DateFin=DateF;
		this.NomPr=nomp;
		this.idSall=sall;
		this.NomClass=clas;
	}
	public String getNomClasse() {
		return NomClasse;
	}

	public void setNomClasse(String nomClasse) {
		NomClasse = nomClasse;
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

	public String getIdSalle() {
		return idSalle;
	}
	public String getNomP() {
		return NomP;
	}

	public void setNomP(String nomP) {
		NomP = nomP;
	}

	public String getPrenomP() {
		return PrenomP;
	}

	public void setPrenomP(String prenomP) {
		PrenomP = prenomP;
	}

	public void setIdSalle(String idSalle) {
		this.idSalle = idSalle;
	}



}
