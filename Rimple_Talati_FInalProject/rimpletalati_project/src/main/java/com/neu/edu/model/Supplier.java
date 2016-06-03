package com.neu.edu.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="Supplier")
@PrimaryKeyJoinColumn(name="PersonId")
public class Supplier extends Person implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	@Column(name="Supplier_Name", nullable=false, unique=true, length=100)
	private String supplierName;
	
//	@ManyToOne(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
//	@JoinColumn(name="Admin_Id", nullable=true)
//	private Admin admin;
	
//	@OneToOne(fetch=FetchType.LAZY)
//	@PrimaryKeyJoinColumn
//	private User user;
	
	@ManyToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	@JoinTable(name="Supplier_Product",
	   joinColumns={@JoinColumn(name="PersonId", nullable=false, updatable=false)},
	   inverseJoinColumns={@JoinColumn(name="Painting_ID", nullable=false, updatable=false)})
	private List<Painting> painting = new ArrayList<Painting>();

//	public long getSupplierId() {
//		return supplierId;
//	}
//
//	public void setSupplierId(long supplierId) {
//		this.supplierId = supplierId;
//	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public List<Painting> getPainting() {
		return painting;
	}

	public void setPainting(List<Painting> painting) {
		this.painting = painting;
	}

//	public Admin getAdmin() {
//		return admin;
//	}
//
//	public void setAdmin(Admin admin) {
//		this.admin = admin;
//	}

//	public User getUser() {
//		return user;
//	}
//
//	public void setUser(User user) {
//		this.user = user;
//	}

	
	
	
}