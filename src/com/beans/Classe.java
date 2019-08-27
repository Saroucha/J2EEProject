package com.beans;

public class Classe {
	
	private int idClasse;
	private String NOMClasse;
	
	public Classe(){
		
	}
public Classe(int id, String name){
	this.idClasse=id;
	this.NOMClasse=name;
}
public int getIdClasse() {
	return idClasse;
}
public void setIdClasse(int idClasse) {
	this.idClasse = idClasse;
}
public String getNOMClasse() {
	return NOMClasse;
}
public void setNOMClasse(String nOMClasse) {
	NOMClasse = nOMClasse;
}
}
