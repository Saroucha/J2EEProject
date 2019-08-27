package com.beans;

import java.util.Date;

public class Prof {

	private int idProf;
    private String NOMP; 
    private String PRENOMP;
    
    public Prof(){
    	
    }
    
    public Prof(int id,String nom, String prenom){
    	this.idProf=id;
    	this.NOMP=nom;
    	this.PRENOMP=prenom;
    }

	public int getIdProf() {
		return idProf;
	}

	public void setIdProf(int idProf) {
		this.idProf = idProf;
	}

	public String getNOMP() {
		return NOMP;
	}

	public void setNOMP(String nOMP) {
		NOMP = nOMP;
	}

	public String getPRENOMP() {
		return PRENOMP;
	}

	public void setPRENOMP(String pRENOMP) {
		PRENOMP = pRENOMP;
	}






}
