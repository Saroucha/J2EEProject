package com.beans;

import java.util.Date;

public class Prof {

	private int idProf;
    private String NOMP; 
   
    
    public Prof(){
    	
    }
    
    public Prof(int id,String nom){
    	this.idProf=id;
    	this.NOMP=nom;
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

	





}
