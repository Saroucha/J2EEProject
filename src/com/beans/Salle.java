package com.beans;

public class Salle {

	private int No;
	private String NOM;
	private int place;
	private String idT;
	private String type;
	
	
	public Salle(){
		
	}
	public Salle(int id, String nom){
		this.No=id;
		this.NOM=nom;
	}
	public int getNo() {
		return No;
	}
	public void setNo(int no) {
		No = no;
	}
	public Salle(String Nom,int places, String type){
		this.NOM=Nom;
		this.idT=type;
		this.place=places;
	}
	
	
	public String getNOM() {
		return NOM;
	}

	public void setNOM(String nOM) {
		NOM = nOM;
	}

	public int getPlace() {
		return place;
	}
	public void setPlace(int place) {
		this.place = place;
	}
	public String getIdT() {
		return idT;
	}
	public void setIdT(String idT) {
		this.idT = idT;
	}
}
