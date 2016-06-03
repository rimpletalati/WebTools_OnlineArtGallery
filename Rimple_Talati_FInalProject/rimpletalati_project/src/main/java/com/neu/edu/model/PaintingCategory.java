package com.neu.edu.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="PaintingCategory")
public class PaintingCategory implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="PaintingCategory_Id", unique=true, nullable=false)
	private long PaintingCategoryId;
	
	@Column(name="PaintingCategory", nullable=false, unique=true, length=100)
	private String name;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="paintingCategory", cascade=CascadeType.ALL)
	private List<Painting> painting = new ArrayList<Painting>();


	public long getPaintingCategoryId() {
		return PaintingCategoryId;
	}

	public void setPaintingCategoryId(long paintingCategoryId) {
		PaintingCategoryId = paintingCategoryId;
	}

	public List<Painting> getProduct() {
		return painting;
	}

	public void setProduct(List<Painting> product) {
		this.painting = product;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return name;
	}
	
	
}
